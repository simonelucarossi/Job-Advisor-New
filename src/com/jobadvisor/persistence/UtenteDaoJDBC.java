package com.jobadvisor.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.LinkedList;
import java.util.List;
import java.util.TimeZone;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.model.Recensione;
import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.dao.AnnuncioDao;
import com.jobadvisor.persistence.dao.RecensioneDao;
import com.jobadvisor.persistence.dao.UtenteDao;

public class UtenteDaoJDBC implements UtenteDao {

	private DataSource dataSource;

	public UtenteDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(Utente utente) {
		Connection connection = this.dataSource.getConnection();
		DateFormat df=new SimpleDateFormat();
		try {
			String insert = "insert into utente(username, nome, cognome , sesso, data_nascita, tipo, email, telefono, fineBan) values (?,?,?,?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, utente.getUsername());
			statement.setString(2, utente.getNome());
			statement.setString(3, utente.getCognome());
			statement.setString(4, utente.getSesso());
			long secs = utente.getDataNascita().getTime();
			statement.setDate(5, new java.sql.Date(secs));
			statement.setString(6, utente.getTipo());
			statement.setString(7, utente.getEmail());
			statement.setString(8, utente.getTelefono());
			df.setTimeZone(TimeZone.getTimeZone("GMT"));
			statement.setDate(9, new java.sql.Date(0));
			statement.executeUpdate();
			updateReferences(utente, connection);

		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException excep) {
					throw new PersistenceException(e.getMessage());
				}
			}
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	private void updateReferences(Utente utente, Connection connection) throws SQLException {
		RecensioneDao recensioneDao = new RecensioneDaoJDBC(dataSource);
		AnnuncioDao annuncioDao = new AnnuncioDaoJDBC(dataSource);

		for (Annuncio annuncio : utente.getAnnunci()) {
			if (annuncioDao.findByPrimaryKey(annuncio.getId()) == null) {
				annuncioDao.save(annuncio);
			}

			String update = "update annuncio SET creatore = ? WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, utente.getUsername());
			statement.setLong(2, annuncio.getId());
			statement.executeUpdate();
		}

		for (Recensione recensione : utente.getRecensioniScritte()) {
			if (recensioneDao.findByPrimaryKey(recensione.getId()) == null) {
				recensioneDao.save(recensione);
			}

			String update = "update recensione SET creatore = ? WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, utente.getUsername());
			statement.setLong(2, recensione.getId());
			statement.executeUpdate();
		}
	}

	@Override
	public Utente findByPrimaryKey(String username) {
		Connection connection = this.dataSource.getConnection();
		Utente utente = null;
		try {
			PreparedStatement statement;
			String query = "select * from utente where username = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, username);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				utente = new UtenteProxy(dataSource);
				utente.setUsername(result.getString("username"));
				utente.setNome(result.getString("nome"));
				utente.setCognome(result.getString("cognome"));
				utente.setSesso(result.getString("sesso"));
				long secs = result.getDate("data_nascita").getTime();
				utente.setDataNascita(new java.util.Date(secs));
				utente.setTipo(result.getString("tipo"));
				utente.setEmail(result.getString("email"));
				utente.setTelefono(result.getString("telefono"));
				utente.setPassword(result.getString("password"));
				if(!utente.getTipo().equals("Amministratore")) {
					long end = result.getDate("fineBan").getTime();
					utente.setFineBan(new java.util.Date(end));
				}
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return utente;
	}

	@Override
	public List<Utente> findAll() {
		Connection connection = this.dataSource.getConnection();
		List<Utente> utenti = new LinkedList<>();
		try {
			Utente utente;
			PreparedStatement statement;
			String query = "select * from utente";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				utente = new UtenteProxy(dataSource);
				utente.setUsername(result.getString("username"));
				utente.setNome(result.getString("nome"));
				utente.setCognome(result.getString("cognome"));
				utente.setSesso(result.getString("sesso"));
				long secs = result.getDate("data_nascita").getTime();
				utente.setDataNascita(new java.util.Date(secs));
				utente.setTipo(result.getString("tipo"));
				utente.setEmail(result.getString("email"));
				utente.setTelefono(result.getString("telefono"));
				utenti.add(utente);
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return utenti;
	}

	@Override
	public void update(Utente utente) {
		Connection connection = this.dataSource.getConnection();
		try {
			String update = "update utente SET nome = ?, cognome = ?, sesso = ?, "
					+ " data_nascita = ?, tipo = ?, email = ?, telefono = ? WHERE username=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, utente.getNome());
			statement.setString(2, utente.getCognome());
			statement.setString(3, utente.getSesso());
			long secs = utente.getDataNascita().getTime();
			statement.setDate(4, new java.sql.Date(secs));
			statement.setString(5, utente.getTipo());
			statement.setString(6, utente.getEmail());
			statement.setString(7, utente.getTelefono());
			statement.setString(8, utente.getUsername());
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public void delete(Utente utente) {
		Connection connection = this.dataSource.getConnection();
		try {
			AnnuncioDao annuncioDao = new AnnuncioDaoJDBC(dataSource);
			RecensioneDao recensioneDao = new RecensioneDaoJDBC(dataSource);

			for (Annuncio annuncio : utente.getAnnunci()) {
				annuncioDao.delete(annuncio);
			}
			for (Recensione recensione : utente.getRecensioniScritte()) {
				recensioneDao.delete(recensione);
			}

			String delete = "delete FROM utente WHERE username = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setString(1, utente.getUsername());

			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public void setPassword(Utente utente, String password) {
		Connection connection = this.dataSource.getConnection();
		try {
			String update = "update utente SET password = ? WHERE username=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, password);
			statement.setString(2, utente.getUsername());
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public void setBan(Utente utente, Date date) {
		Connection connection = this.dataSource.getConnection();
		try {
			String update = "update utente SET fineBan = ? WHERE username=?";
			PreparedStatement statement = connection.prepareStatement(update);
			long secs = utente.getFineBan().getTime();
			statement.setDate(1, new java.sql.Date(secs));
			statement.setString(2, utente.getUsername());
			statement.executeUpdate();
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
	}

	@Override
	public UtenteCredenziali findByPrimaryKeyCredential(String username) {
		Utente utente = findByPrimaryKey(username);
		UtenteCredenziali utenteCred = null;
		if (utente != null) {
			utenteCred = new UtenteCredenziali(dataSource);
			utenteCred.setUsername(utente.getUsername());
			utenteCred.setNome(utente.getNome());
			utenteCred.setCognome(utente.getCognome());
			utenteCred.setSesso(utente.getSesso());
			utenteCred.setDataNascita(utente.getDataNascita());
			utenteCred.setTipo(utente.getTipo());
			utenteCred.setEmail(utente.getEmail());
			utenteCred.setTelefono(utente.getTelefono());
			utenteCred.setFineBan(utente.getFineBan());
		}
		return utenteCred;
	}

	@Override
	public List<Utente> findAllByBan() {
		Connection connection = this.dataSource.getConnection();
		List<Utente> utenti = new LinkedList<>();
		try {
			Utente utente;
			PreparedStatement statement;
			String query = "select * from utente WHERE fineBan > '1970-01-01'";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				utente = new UtenteProxy(dataSource);
				utente.setUsername(result.getString("username"));
				utente.setNome(result.getString("nome"));
				utente.setCognome(result.getString("cognome"));
				utente.setSesso(result.getString("sesso"));
				long secs = result.getDate("data_nascita").getTime();
				utente.setDataNascita(new java.util.Date(secs));
				utente.setTipo(result.getString("tipo"));
				utente.setEmail(result.getString("email"));
				utente.setTelefono(result.getString("telefono"));
				utente.setFineBan(result.getDate("fineBan"));
				utenti.add(utente);
			}
		} catch (SQLException e) {
			throw new PersistenceException(e.getMessage());
		} finally {
			try {
				connection.close();
			} catch (SQLException e) {
				throw new PersistenceException(e.getMessage());
			}
		}
		return utenti;
	}

}

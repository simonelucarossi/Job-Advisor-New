package com.jobadvisor.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DecimalFormat;
import java.util.LinkedList;
import java.util.List;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.model.Recensione;
import com.jobadvisor.persistence.dao.RecensioneDao;


public class RecensioneDaoJDBC implements RecensioneDao {

	private DataSource dataSource;

	public RecensioneDaoJDBC(DataSource dataSource) {
		this.dataSource=dataSource;
	}

	@Override
	public void save(Recensione recensione) {
		Connection connection = this.dataSource.getConnection();
		try {
			String insert = "insert into recensione(id , data_creazione , titolo, testo, creatore , annuncio, valutazione) values (?,?,?,?,?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setLong(1, recensione.getId());
			long secs = recensione.getData().getTime();
			statement.setDate(2, new java.sql.Date(secs));
			statement.setString(3,recensione.getTitolo());
			statement.setString(4,recensione.getTesto());
			statement.setString(5,recensione.getCreatore());
			statement.setLong(6, recensione.getAnnuncio());
			statement.setString(7, recensione.getValutazione());
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
	public Recensione findByPrimaryKey(Long id) {
		Connection connection = this.dataSource.getConnection();
		Recensione recensione= null;
		try {
			PreparedStatement statement;
			String query = "select * from recensione where id = ?";
			statement = connection.prepareStatement(query);
			statement.setLong(1,id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				recensione= new Recensione();
				recensione.setId(result.getLong("id"));
				long secs = result.getDate("data_creazione").getTime();
				recensione.setData(new java.util.Date(secs));
				recensione.setTitolo(result.getString("titolo"));
				recensione.setTesto(result.getString("testo"));
				recensione.setCreatore(result.getString("creatore"));
				recensione.setAnnuncio(result.getLong("annuncio"));
				recensione.setValutazione(result.getString("valutazione"));
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
		return recensione;
	}
	
	@Override
	public List<Recensione> findAllByAdsPrimaryKey(Long id) {
		Connection connection = this.dataSource.getConnection();
		List<Recensione> recensioni = new LinkedList<>();
		try {
			Recensione recensione = null;
			PreparedStatement statement;
			String query = "select * from recensione where annuncio = ?";
			statement = connection.prepareStatement(query);
			statement.setLong(1,id);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				recensione= new Recensione();
				recensione.setId(result.getLong("id"));
				long secs = result.getDate("data_creazione").getTime();
				recensione.setData(new java.util.Date(secs));
				recensione.setTitolo(result.getString("titolo"));
				recensione.setTesto(result.getString("testo"));
				recensione.setCreatore(result.getString("creatore"));
				recensione.setAnnuncio(result.getLong("annuncio"));
				recensione.setValutazione(result.getString("valutazione"));
				recensioni.add(recensione);
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
		return recensioni;
	}
	
	@Override
	public double StatsByAdsPrimaryKey(Long id) {
		Connection connection = this.dataSource.getConnection();
		List<Recensione> recensioni = new LinkedList<>();
		try {
			Recensione recensione = null;
			PreparedStatement statement;
			String query = "select * from recensione where annuncio = ?";
			statement = connection.prepareStatement(query);
			statement.setLong(1,id);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				recensione= new Recensione();
				recensione.setId(result.getLong("id"));
				long secs = result.getDate("data_creazione").getTime();
				recensione.setData(new java.util.Date(secs));
				recensione.setTitolo(result.getString("titolo"));
				recensione.setTesto(result.getString("testo"));
				recensione.setCreatore(result.getString("creatore"));
				recensione.setAnnuncio(result.getLong("annuncio"));
				recensione.setValutazione(result.getString("valutazione"));
				recensioni.add(recensione);
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
		double numberOfReview = 0, stats = 0;
		for(int i = 0; i < recensioni.size(); i++) {
			String valTmp = (recensioni.get(i).getValutazione());
			stats += Integer.parseInt(valTmp);
			numberOfReview++;
		}
		
		
		
		
		if(stats != 0 && numberOfReview != 0) {
			double value = stats/numberOfReview;
			value = Double.parseDouble(new DecimalFormat("##.##").format(value));
			return value;
		}
		return 0;
	}
	

	@Override
	public List<Recensione> findAll() {
		Connection connection = this.dataSource.getConnection();
		List<Recensione> recensioni = new LinkedList<>();
		try {
			Recensione recensione;
			PreparedStatement statement;
			String query = "select * from recensione";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				recensione = new Recensione();
				recensione.setId(result.getLong("id"));
				long secs= result.getDate("data_creazione").getTime();
				recensione.setData(new java.util.Date(secs));
				recensione.setTitolo(result.getString("titolo"));
				recensione.setTesto(result.getString("testo"));
				recensione.setCreatore(result.getString("creatore"));
				recensione.setAnnuncio(result.getLong("annuncio"));
				recensione.setValutazione(result.getString("valutazione"));
				
				recensioni.add(recensione);
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
		return recensioni;
	}

	@Override
	public void update(Recensione recensione) {
		Connection connection = this.dataSource.getConnection();
		try {
			String update = "update recensione SET data_creazione= ?,titolo = ?, testo = ?, creatore = ?,annuncio = ?,valutazione = ? WHERE id = ?";
			PreparedStatement statement = connection.prepareStatement(update);
			long secs= recensione.getData().getTime();
			statement.setDate(1, new java.sql.Date(secs));
			statement.setString(2,recensione.getTitolo());
			statement.setString(3,recensione.getTesto());
			statement.setString(4,recensione.getCreatore());
			statement.setLong(5, recensione.getAnnuncio());
			statement.setString(6, recensione.getValutazione());
			statement.setLong(7, recensione.getId());
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
	public void delete(Recensione recensione) {
		Connection connection = this.dataSource.getConnection();
		try {
			String delete = "delete FROM recensione WHERE id = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setLong(1, recensione.getId());
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

}

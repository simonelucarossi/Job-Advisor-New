package com.jobadvisor.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

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
			String insert = "insert into recensione(id , data_creazione) values (?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, recensione.getId());
			long secs = recensione.getData().getTime();
			statement.setDate(2, new java.sql.Date(secs));
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
	public Recensione findByPrimaryKey(String id) {
		Connection connection = this.dataSource.getConnection();
		Recensione recensione= null;
		try {
			PreparedStatement statement;
			String query = "select * from recensione where id = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1,id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				recensione= new Recensione();
				recensione.setId(result.getString("id"));
				long secs = result.getDate("data_creazione").getTime();
				recensione.setData(new java.util.Date(secs));
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
				recensione.setId(result.getString("id"));
				long secs= result.getDate("data_creazione").getTime();
				recensione.setData(new java.util.Date(secs));
				
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
			String update = "update annuncio SET data_creazione= ? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			long secs= recensione.getData().getTime();
			statement.setDate(1, new java.sql.Date(secs));
			statement.setString(2, recensione.getId());
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
			statement.setString(1, recensione.getId());
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

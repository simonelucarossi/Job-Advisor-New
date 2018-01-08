package com.jobadvisor.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import java.util.List;

import com.jobadvisor.persistence.dao.AnnuncioDao;

import com.jobadvisor.model.Annuncio;

public class AnnuncioDaoJDBC implements AnnuncioDao {

	private DataSource dataSource;

	public AnnuncioDaoJDBC(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	@Override
	public void save(Annuncio annuncio) {
		Connection connection = this.dataSource.getConnection();
		try {
			String insert = "insert into annuncio(id, categoria , data_pubblicazione ) values (?,?,?)";
			PreparedStatement statement = connection.prepareStatement(insert);
			statement.setString(1, annuncio.getId());
			statement.setString(2, annuncio.getCategoria());
			long secs = annuncio.getData().getTime();
			statement.setDate(3, new java.sql.Date(secs));
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
	public Annuncio findByPrimaryKey(String id) {
		Connection connection = this.dataSource.getConnection();
		Annuncio annuncio= null;
		try {
			PreparedStatement statement;
			String query = "select * from annuncio where id = ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, id);
			ResultSet result = statement.executeQuery();
			if (result.next()) {
				annuncio= new Annuncio();
				annuncio.setId(result.getString("id"));
				annuncio.setCategoria(result.getString("categoria"));
				long secs = result.getDate("data_pubblicazione").getTime();
				annuncio.setData(new java.util.Date(secs));
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
		return annuncio;
	}

	@Override
	public List<Annuncio> findAll() {
		Connection connection = this.dataSource.getConnection();
		List<Annuncio> annunci = new LinkedList<>();
		try {
			Annuncio annuncio;
			PreparedStatement statement;
			String query = "select * from annuncio";
			statement = connection.prepareStatement(query);
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				annuncio = new Annuncio();
				annuncio.setId(result.getString("id"));
				annuncio.setCategoria(result.getString("categoria"));
				long secs= result.getDate("data_pubblicazione").getTime();
				annuncio.setData(new java.util.Date(secs));
				
				annunci.add(annuncio);
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
		return annunci;
	}

	@Override
	public void update(Annuncio annuncio) {
		Connection connection = this.dataSource.getConnection();
		try {
			String update = "update annuncio SET categoria = ?, data_pubblicazione  = ? WHERE id=?";
			PreparedStatement statement = connection.prepareStatement(update);
			statement.setString(1, annuncio.getCategoria());
			long secs= annuncio.getData().getTime();
			statement.setDate(2, new java.sql.Date(secs));
			statement.setString(3, annuncio.getId());
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
	public void delete(Annuncio annuncio) {
		Connection connection = this.dataSource.getConnection();
		try {
			String delete = "delete FROM annuncio WHERE id = ? ";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.setString(1, annuncio.getId());
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

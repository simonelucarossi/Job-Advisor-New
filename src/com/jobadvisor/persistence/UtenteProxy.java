package com.jobadvisor.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashSet;
import java.util.Set;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.model.Recensione;
import com.jobadvisor.model.Utente;


public class UtenteProxy extends Utente {
	private DataSource dataSource;

	public UtenteProxy(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public Set<Annuncio> getAnnunci() {
		Set<Annuncio> annunci = new HashSet<>();
		Connection connection = this.dataSource.getConnection();
		try {
			PreparedStatement statement;
			String query = "select * from annuncio where creatore= ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, this.getUsername());
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				Annuncio annuncio = new Annuncio();
				annuncio.setId(result.getLong("id"));
				long secs1 = result.getDate("data").getTime();
				annuncio.setData(new java.util.Date(secs1));
				long secs2 = result.getDate("ora").getTime();
				annuncio.setData(new java.util.Date(secs2));

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
		this.setAnnunci(annunci);
		return super.getAnnunci();
	}
	
	public Set<Recensione> getRecensioniScritte() {
		Set<Recensione> recensioni = new HashSet<>();
		Connection connection = this.dataSource.getConnection();
		try {
			PreparedStatement statement;
			String query = "select * from recensione where creatore= ?";
			statement = connection.prepareStatement(query);
			statement.setString(1, this.getUsername());
			ResultSet result = statement.executeQuery();
			while (result.next()) {
				Recensione recensione= new Recensione();
				recensione.setId(result.getLong("id"));
				long secs = result.getDate("data").getTime();
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
		this.setRecensioniScritte(recensioni);
		return super.getRecensioniScritte();
	}
}

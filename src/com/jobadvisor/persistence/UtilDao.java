package com.jobadvisor.persistence;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UtilDao {

	private DataSource dataSource;

	public UtilDao(DataSource dataSource) {
		this.dataSource = dataSource;
	}

	public void dropDatabase() {

		Connection connection = dataSource.getConnection();
		try {
			String delete = "drop SEQUENCE if EXISTS sequenza_id;" 
					+ "drop table if exists recensione;"
					+ "drop table if exists annuncio;"
					+ "drop table if exists utente;";
			PreparedStatement statement = connection.prepareStatement(delete);
			statement.executeUpdate();
			System.out.println("Executed drop database");

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

	public void createDatabase() {

		Connection connection = dataSource.getConnection();
		try {
			String create = "create SEQUENCE sequenza_id;"
					+ "create table utente(\"username\" VARCHAR(255) primary key,nome VARCHAR(255),cognome VARCHAR(255),"
					+ "sesso VARCHAR(1),data_nascita DATE,tipo VARCHAR(255),email VARCHAR(255),telefono VARCHAR(255)"
					+ ",password VARCHAR(255));"
					
					+ "create table annuncio(\"id\" bigint primary key,categoria VARCHAR(255),data_pubblicazione DATE,"
					+ "descrizione VARCHAR(500),prezzo DECIMAL,"
					+ "latitudine DECIMAL,longitudine DECIMAL,creatore VARCHAR(255) REFERENCES utente(\"username\"));"
					
					+ "create table recensione(\"id\" bigint primary key,data_creazione DATE,"
					+ " creatore VARCHAR(255) REFERENCES utente(\"username\"),annuncio bigint REFERENCES annuncio(\"id\"));";

			PreparedStatement statement = connection.prepareStatement(create);
			statement.executeUpdate();

			System.out.println("Executed create database");

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

	public void resetDatabase() {

		Connection connection = dataSource.getConnection();
		try {
			String delete = "delete FROM utente" 
					+ "delete FROM annuncio"
					+ "delete FROM recensione";
			PreparedStatement statement = connection.prepareStatement(delete);

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

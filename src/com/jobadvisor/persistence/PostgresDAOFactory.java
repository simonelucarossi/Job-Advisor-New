package com.jobadvisor.persistence;

import com.jobadvisor.persistence.dao.AnnuncioDao;
import com.jobadvisor.persistence.dao.RecensioneDao;
import com.jobadvisor.persistence.dao.UtenteDao;

class PostgresDAOFactory extends DAOFactory {

	private static DataSource dataSource;

	static {
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			// DataSource("jdbc:postgresql://52.39.164.176:5432/xx","xx","p@xx");
			// dataSource = new DataSource("jdbc:postgresql://localhost:5432/JobAdvisor", "postgres", "postgres");
			dataSource = new DataSource("jdbc:postgresql://horton.elephantsql.com:5432/aqdvooyg", "aqdvooyg", "Jy42xKF8E0FYImE397QIcRvRovRTaiVZ");
		} catch (Exception e) {
			System.err.println("PostgresDAOFactory.class: failed to load MySQL JDBC driver\n" + e);
			e.printStackTrace();
		}
	}

	@Override
	public UtenteDao getUtenteDAO() {
		return new UtenteDaoJDBC(dataSource);
	}

	@Override
	public UtilDao getUtilDAO() {
		return new UtilDao(dataSource);
	}

	@Override
	public AnnuncioDao getAnnuncioDAO() {
		return new AnnuncioDaoJDBC(dataSource);
	}

	@Override
	public RecensioneDao getRecensioneDAO() {
		return new RecensioneDaoJDBC(dataSource);
	}
}

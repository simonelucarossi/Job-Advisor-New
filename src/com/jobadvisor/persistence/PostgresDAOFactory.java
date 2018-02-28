package com.jobadvisor.persistence;

import com.jobadvisor.persistence.dao.AnnuncioDao;
import com.jobadvisor.persistence.dao.RecensioneDao;
import com.jobadvisor.persistence.dao.UtenteDao;

class PostgresDAOFactory extends DAOFactory {

	private static DataSource dataSource;

	static {
		try {
			Class.forName("org.postgresql.Driver").newInstance();
			// dataSource = new DataSource("jdbc:postgresql://localhost:5432/JobAdvisor", "postgres", "postgres");
			dataSource = new DataSource("jdbc:postgresql://packy.db.elephantsql.com:5432/yngodzsw", "yngodzsw", "Fw2oRqoy64F6yGaoGxCJLQ7deYGrUrVY");
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

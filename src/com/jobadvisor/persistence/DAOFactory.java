package com.jobadvisor.persistence;

import com.jobadvisor.persistence.dao.AnnuncioDao;
import com.jobadvisor.persistence.dao.RecensioneDao;
import com.jobadvisor.persistence.dao.UtenteDao;

public abstract class DAOFactory {

	public static final int HSQLDB = 1;

	public static final int POSTGRESQL = 2;

	public static DAOFactory getDAOFactory(int whichFactory) {
		switch (whichFactory) {

		case HSQLDB:
			return null;// new HsqldbDAOFactory();
		case POSTGRESQL:
			return new PostgresDAOFactory();
		default:
			return null;
		}
	}

	public abstract UtenteDao getUtenteDAO();

	public abstract AnnuncioDao getAnnuncioDAO();
	
	public abstract RecensioneDao getRecensioneDAO();

	public abstract UtilDao getUtilDAO();

}

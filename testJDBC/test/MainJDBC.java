package test;


import java.util.Calendar;
import java.util.Date;

import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DAOFactory;
import com.jobadvisor.persistence.UtenteDaoJDBC;
import com.jobadvisor.persistence.UtilDao;
import com.jobadvisor.persistence.dao.UtenteDao;

public class MainJDBC {

	public static void main(String args[]) {
		Calendar cal = Calendar.getInstance();
		cal.set(1995, Calendar.MARCH, 21); // // 21 marzo 1995
		Date date1 = cal.getTime();
		cal.set(1996, Calendar.MAY, 21); // 12 aprile 1996
		Date date2 = cal.getTime();
		cal.set(1998, Calendar.OCTOBER, 1);  // 1 ottobre 1998
		Date date3 = cal.getTime();
		
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtilDao util = factory.getUtilDAO();

		util.dropDatabase();
		util.createDatabase();
	
		Utente utente =new Utente("admin","Angelo","Pollinzi","M",date2,"Amministratore","a.pollinzi96@gmail.com","3295719062");
		UtenteDao utenteDao=factory.getUtenteDAO();
		utenteDao.save(utente);
		utenteDao.setPassword(utente, "admin");
		
	}
}

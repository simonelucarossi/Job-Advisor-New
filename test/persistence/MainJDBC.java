package persistence;

import java.util.Calendar;
import java.util.Date;

import com.jobadvisor.persistence.DAOFactory;
import com.jobadvisor.persistence.UtilDao;


public class MainJDBC {

	public static void main(String args[]) {
		Calendar cal = Calendar.getInstance();
		cal.set(1995, Calendar.MARCH, 21); // // 21 marzo 1995
		Date date1 = cal.getTime();
		cal.set(1996, Calendar.APRIL, 12); // 12 aprile 1996
		Date date2 = cal.getTime();
		cal.set(1998, Calendar.OCTOBER, 1);  // 1 ottobre 1998
		Date date3 = cal.getTime();
		
		DAOFactory factory = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL);
		UtilDao util = factory.getUtilDAO();

		util.dropDatabase();
		util.createDatabase();
		
		/*
		UtenteDao utenteDao=factory.getUtenteDAO();
		RecensioneDao recensioneDao=factory.getRecensioneDAO();
		
		Utente u1= new Utente ("SLRSS","Simone Luca","Rossi","F",date1,"Cliente");
		Utente u2= new Utente ("A.pollinzi","Angelo","Pollinzi","M",date2,"Cliente");
		Utente u3= new Utente ("PippoX","Giuseppe","Bilotta","M",date3,"Cliente");
		Utente u4= new Utente ("francesca341","Francesca","Cutuli","F",date3,"Cliente");
		Utente u5= new Utente ("LucaFRS","Luca","Frisi","M",date1,"Professionista");
		Utente u6= new Utente ("Fallen333","Salvatore","Diaci","M",date2,"Professionista");
		Utente u7= new Utente ("killer666","Marco","Viona","M",date2,"Amministratore");
		
		Recensione r1=new Recensione("37ca6",date1);
		Recensione r2=new Recensione("6374v",date2);
		Recensione r3=new Recensione("1n5hd",date3);
		

		u5.addAnnuncio(a1);
		u5.addAnnuncio(a2);
		u6.addAnnuncio(a3);
		u4.addRecensioneScritta(r1);
		u5.addRecensioneRelativa(r1);
		u1.addRecensioneScritta(r2);
		u6.addRecensioneRelativa(r2);
		u3.addRecensioneScritta(r3);
		u6.addRecensioneRelativa(r3);

		
		
		//CREATE

		recensioneDao.save(r1);
		recensioneDao.save(r2);
		recensioneDao.save(r3);
		
		
		utenteDao.save(u1);
		utenteDao.save(u2);
		utenteDao.save(u3);
		utenteDao.save(u4);
		utenteDao.save(u5);
		utenteDao.save(u6);
		utenteDao.save(u7);
*/		
//		AnnuncioDao annuncioDao=factory.getAnnuncioDAO();
//		
//		Annuncio a1=new Annuncio("xxcvr","idraulica",date1,39.1223386,16.7949374);
//		Annuncio a2=new Annuncio("bbbgr","meccanica",date2,39.142778,16.9162806);
//		Annuncio a3=new Annuncio("acxro","idraulica",date3,39.0881709,16.8308361);
//		Annuncio a4=new Annuncio("fff43","idraulica",date1,38.9531759,16.902716);
//		Annuncio a5=new Annuncio("cc531","meccanica",date2,38.9531759,16.902716);
//		
//		annuncioDao.save(a1);
//		annuncioDao.save(a2);
//		annuncioDao.save(a3);
//		annuncioDao.save(a4);
//		annuncioDao.save(a5);
	}
}

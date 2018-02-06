package com.jobadvisor.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.model.Recensione;
import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DAOFactory;
import com.jobadvisor.persistence.DatabaseManager;
import com.jobadvisor.persistence.dao.AnnuncioDao;
import com.jobadvisor.persistence.dao.RecensioneDao;
import com.jobadvisor.persistence.dao.UtenteDao;

/**
 * Servlet implementation class DammiAd
 */

public class DammiAd extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DammiAd() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String id = (request.getPathInfo().replace("/", ""));
		if(!id.equals("ads")) {
			Long newID = Long.parseLong(id);	
			Utente creatoreAnnuncio = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getAnnuncioDAO().findByPrimaryKey(newID).getCreator();
			String email = creatoreAnnuncio.getEmail();
			String number = creatoreAnnuncio.getTelefono();
			request.setAttribute("email", email);
			request.setAttribute("number", number);
		}
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/views/annuncio.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		UtenteDao creatoreDAO = DatabaseManager.getInstance().getDaoFactory().getUtenteDAO();
		Utente creatore = creatoreDAO.findByPrimaryKey(request.getParameter("creator"));
		
		String id = (request.getPathInfo().replace("/", ""));
		Long idAds = Long.parseLong(id);
		String stars = request.getParameter("input-1");
		String titolo = request.getParameter("title");
		String testo = request.getParameter("testo");
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ITALIAN);
		Date date = new Date();
		long idReview = 0;
		RecensioneDao recensioneDao = DatabaseManager.getInstance().getDaoFactory().getRecensioneDAO();
		Recensione tmp = recensioneDao.findByPrimaryKey(idReview);
		while(tmp != null) {
			idReview++;
			tmp = null;
			tmp = recensioneDao.findByPrimaryKey(idReview);
		}
		
		
		try { 
			Recensione recensione = new Recensione(idReview,date,titolo, testo,creatore.getUsername(), idAds, stars);
			recensioneDao.save(recensione);
			response.sendRedirect("/JobAdvisorNew/annuncio/" + idAds);

		} 
			finally {
		}
		
	}

}

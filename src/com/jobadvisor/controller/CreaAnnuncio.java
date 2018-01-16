package com.jobadvisor.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DatabaseManager;
import com.jobadvisor.persistence.UtenteDaoJDBC;
import com.jobadvisor.persistence.dao.AnnuncioDao;
import com.jobadvisor.persistence.dao.UtenteDao;

@WebServlet("/views/createAd")
public class CreaAnnuncio extends HttpServlet{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public CreaAnnuncio() {
		super();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		UtenteDao creatoreDAO = DatabaseManager.getInstance().getDaoFactory().getUtenteDAO();
		Utente creatore = creatoreDAO.findByPrimaryKey(request.getParameter("creator")); 

		String categoria = request.getParameter("category");
		String descrizione = request.getParameter("description");
		Double prezzo= Double.parseDouble(request.getParameter("price"));
		String data= request.getParameter("date");
		Double latitudine= Double.parseDouble(request.getParameter("lat"));
		Double longitudine= Double.parseDouble(request.getParameter("lon"));
		DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ITALIAN);
		Date date;
		try {
			date = format.parse(data);
			Annuncio annuncio= new Annuncio(categoria,date,descrizione,prezzo,latitudine,longitudine,creatore);

			AnnuncioDao annuncioDao = DatabaseManager.getInstance().getDaoFactory().getAnnuncioDAO();
			annuncioDao.save(annuncio);
			
			RequestDispatcher dispacher = request.getRequestDispatcher("/views/creaAnnuncio.jsp");
			dispacher.forward(request, response);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

}

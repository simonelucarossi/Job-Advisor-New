package com.jobadvisor.controller;

import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.model.Recensione;
import com.jobadvisor.persistence.DAOFactory;

/**
 * Servlet implementation class UpdateReview
 */
@WebServlet("/UpdateReview")
public class UpdateReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long id	=	Long.parseLong(request.getParameter("id"));
		String titolo = request.getParameter("title");
		String testo = request.getParameter("text");
		String stars = (request.getParameter("stars"));
		String creatore = (request.getParameter("creator"));
		Long annuncio = Long.parseLong(request.getParameter("idAds"));
		Date data = new Date();
		
		System.out.println("TITOLOOOOO -> " + titolo);
		
		Recensione recensione = new Recensione(id, data, titolo, testo,creatore,annuncio, stars);
		recensione.setId(id);
		DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getRecensioneDAO().update(recensione);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

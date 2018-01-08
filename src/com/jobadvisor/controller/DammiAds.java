package com.jobadvisor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.persistence.DAOFactory;
import com.jobadvisor.persistence.UtilDao;

/**
 * Servlet implementation class DammiAds
 */
@WebServlet("/ads")
public class DammiAds extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DammiAds() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		List<Annuncio> annunci = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getAnnuncioDAO().findAll();
		request.setAttribute("annunci", annunci);
		
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/views/ads.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

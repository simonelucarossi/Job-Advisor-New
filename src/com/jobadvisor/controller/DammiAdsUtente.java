package com.jobadvisor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.persistence.DAOFactory;
import com.jobadvisor.persistence.UtilDao;

@WebServlet("/adsPanel")
public class DammiAdsUtente extends HttpServlet{
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public DammiAdsUtente() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username=request.getParameter("username");
		List<Annuncio> annunci = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getAnnuncioDAO().findAllByUtente(username);
		request.setAttribute("annunci", annunci);
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/views/userAdsPanel.jsp");
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

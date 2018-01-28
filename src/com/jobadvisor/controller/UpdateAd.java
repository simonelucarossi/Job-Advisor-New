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

@WebServlet("/updateAd")
public class UpdateAd extends HttpServlet{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateAd() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Long id=Long.parseLong(request.getParameter("id"));
		String category = request.getParameter("category");
		String description = request.getParameter("description");
		Double price= Double.parseDouble(request.getParameter("price"));
		
		Annuncio annuncio= new Annuncio(category, description,price);
		annuncio.setId(id);
		DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getAnnuncioDAO().update(annuncio);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

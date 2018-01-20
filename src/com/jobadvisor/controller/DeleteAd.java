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

@WebServlet("/deleteAd")
public class DeleteAd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteAd() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String[]selectedItems=request.getParameterValues("options[]");
		for(String item : selectedItems) {
			System.out.println(item);
		}
		/*Long id=Long.parseLong(request.getParameter("id"));
		Annuncio annuncio=new Annuncio();
		annuncio.setId(id);
		System.out.println(id);
		DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getAnnuncioDAO().delete(annuncio);
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/views/panel.jsp");
		dispatcher.forward(request, response);*/

	}
}

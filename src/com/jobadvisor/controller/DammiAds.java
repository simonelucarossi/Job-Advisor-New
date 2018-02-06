package com.jobadvisor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.jobadvisor.persistence.dao.AnnuncioDao;
import com.jobadvisor.model.Annuncio;
import com.jobadvisor.persistence.DatabaseManager;

@WebServlet("/allAds")
public class DammiAds extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		AnnuncioDao dao = DatabaseManager.getInstance().getDaoFactory().getAnnuncioDAO();
		List<Annuncio> annunci= dao.findAll();
		req.getSession().setAttribute("annunci", annunci);
		RequestDispatcher dispatcher = req.getServletContext().getRequestDispatcher("/views/adsPanel.jsp");
		dispatcher.forward(req, resp);
	}

}

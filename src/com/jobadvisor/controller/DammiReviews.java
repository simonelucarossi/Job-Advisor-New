package com.jobadvisor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.model.Recensione;
import com.jobadvisor.persistence.DatabaseManager;
import com.jobadvisor.persistence.dao.RecensioneDao;

/**
 * Servlet implementation class DammiReviews
 */
@WebServlet("/allReviews")
public class DammiReviews extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public DammiReviews() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RecensioneDao dao = DatabaseManager.getInstance().getDaoFactory().getRecensioneDAO();
		List<Recensione> recensioni= dao.findAll();
		request.getSession().setAttribute("recensioni", recensioni);
		RequestDispatcher dispatcher = request.getServletContext().getRequestDispatcher("/views/reviewsPanel.jsp");
		dispatcher.forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

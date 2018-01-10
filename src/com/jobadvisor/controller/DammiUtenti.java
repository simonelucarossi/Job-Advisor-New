package com.jobadvisor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.persistence.dao.UtenteDao;

import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DatabaseManager;

@WebServlet("/users")
public class DammiUtenti extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		UtenteDao dao = DatabaseManager.getInstance().getDaoFactory().getUtenteDAO();
		List<Utente> utenti= dao.findAll();
		req.setAttribute("utenti", utenti);

		RequestDispatcher dispacher = req.getRequestDispatcher("report/studenti.jsp");
		dispacher.forward(req, resp);
	}

}

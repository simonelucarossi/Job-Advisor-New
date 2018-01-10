package com.jobadvisor.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.persistence.dao.UtenteDao;

import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DatabaseManager;

@WebServlet("/views/subscribe")
public class IscriviUtente extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispacher = req.getRequestDispatcher("subscribe.jsp");
		dispacher.forward(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String sesso = req.getParameter("sesso");
		String dataNascita = req.getParameter("dataNascita");
		String password = req.getParameter("password");
		String tipo = req.getParameter("tipo");

		DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ITALIAN);
		Date date;
		try {
			date = format.parse(dataNascita);
			Utente utente= new Utente(username,nome, cognome,sesso,date,tipo);

			UtenteDao utenteDao = DatabaseManager.getInstance().getDaoFactory().getUtenteDAO();
			utenteDao.save(utente);
			utenteDao.setPassword(utente, password);

			req.setAttribute("utente", utente);

			RequestDispatcher dispacher = req.getRequestDispatcher("subscribe.jsp");
			dispacher.forward(req, resp);

		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}

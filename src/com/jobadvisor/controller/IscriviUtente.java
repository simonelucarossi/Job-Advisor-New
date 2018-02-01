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

@WebServlet("/subscribe")
public class IscriviUtente extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doPost(req, resp);
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String username = req.getParameter("username");
		String nome = req.getParameter("nome");
		String cognome = req.getParameter("cognome");
		String sesso = req.getParameter("sesso");
		String dataNascita = req.getParameter("dataNascita");
		String tipo = req.getParameter("tipo");
		String email = req.getParameter("email");
		String telefono= req.getParameter("telefono");
		String password = req.getParameter("password");

		DateFormat format = new SimpleDateFormat("yyyy-MM-dd", Locale.ITALIAN);
		Date date;
		try {
			date = format.parse(dataNascita);
			Utente utente= new Utente(username,nome, cognome,sesso,date,tipo,email,telefono);
			UtenteDao utenteDao = DatabaseManager.getInstance().getDaoFactory().getUtenteDAO();
			utenteDao.save(utente);
			utenteDao.setPassword(utente, password);
			req.setAttribute("utente", utente);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}

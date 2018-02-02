package com.jobadvisor.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DAOFactory;

@WebServlet("/updateUser")
public class UpdateUser extends HttpServlet{
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public UpdateUser() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = request.getParameter("username");
		String nome = request.getParameter("name");
		String cognome = request.getParameter("surname");
		String sesso = request.getParameter("gender");
		String dataNascita = request.getParameter("data");
		String tipo = request.getParameter("tipo");
		String email = request.getParameter("email");
		String telefono= request.getParameter("phone");
		String password = request.getParameter("password");
		DateFormat format = new SimpleDateFormat("EEE MMM dd HH:mm:ss zzz yyyy", Locale.US);
		Date date;
		try {
			date = format.parse(dataNascita);
			Utente utente= new Utente(username,nome, cognome,sesso,date,tipo,email,telefono);
			DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getUtenteDAO().update(utente);
			DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getUtenteDAO().setPassword(utente, password);
			
		}catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

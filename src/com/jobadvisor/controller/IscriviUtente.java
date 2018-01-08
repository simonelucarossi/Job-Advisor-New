package com.jobadvisor.controller;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Locale;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.persistence.dao.UtenteDao;

import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DatabaseManager;

public class IscriviUtente extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		RequestDispatcher dispacher = req.getRequestDispatcher("iscriviUtente.jsp");
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

		DateFormat format = new SimpleDateFormat("yyyy-mm-dd", Locale.ITALIAN);
		Date date;
		try {
			date = format.parse(dataNascita);
			Utente cliente= new Utente(username,nome, cognome,sesso,date,tipo);

			UtenteDao clienteDao = DatabaseManager.getInstance().getDaoFactory().getUtenteDAO();
			clienteDao.save(cliente);
			clienteDao.setPassword(cliente , password);

			req.setAttribute("cliente", cliente);

			RequestDispatcher dispacher = req.getRequestDispatcher("iscriviUtente.jsp");
			dispacher.forward(req, resp);

			// resp.setContentType("text/html");

			// PrintWriter out = resp.getWriter();
			// out.println("<html>");
			// out.println("<head><title>Iscrizione studente</title></head>");
			// out.println("<body>");
			// out.println("<h1>Abbiamo iscritto il seguente studente:</h1>");
			// out.println(matricola);
			// out.println(nome);
			// out.println(cognome);
			// out.println(dataNascita);
			// out.println(password);
			// out.println(indirizzo);
			// out.println("</body>");
			// out.println("</html>");
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}
}

package com.jobadvisor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jobadvisor.persistence.dao.UtenteDao;

import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DatabaseManager;

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

		// PrintWriter out = resp.getWriter();
		// out.println("<html>");
		// out.println("<table border = 1");
		// out.println("<tr>");
		// out.println("<th>Matricola</th>");
		// out.println("<th>Nome</th>");
		// out.println("<th>Cognome</th>");
		// out.println("<th>Data di Nascita</th>");
		// out.println("<th>Indirizzo</th>");
		// out.println("</tr>");
		// for (Studente s : dao.findAll()){
		// out.println("<tr>");
		// out.println("<td>");
		// out.println(s.getMatricola());
		// out.println("</td>");
		// out.println("<td>");
		// out.println(s.getNome());
		// out.println("</td>");
		// out.println("<td>");
		// out.println(s.getCognome());
		// out.println("</td>");
		// out.println("<td>");
		// out.println(s.getDataNascita());
		// out.println("</td>");
		// out.println("<td>");
		// out.println(s.getIndirizzo());
		// out.println("</td>");
		// out.println("</tr>");
		// }
		// out.println("</table>");
		// out.println("</html>");

	}

}

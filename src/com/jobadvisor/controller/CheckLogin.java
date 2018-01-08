package com.jobadvisor.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobadvisor.persistence.dao.UtenteDao;

import com.jobadvisor.persistence.DatabaseManager;
import com.jobadvisor.persistence.UtenteCredenziali;

public class CheckLogin extends HttpServlet {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		String username = (String) session.getAttribute("username");

		PrintWriter out = resp.getWriter();
		if (username != null) {
			out.println("<html>");
			out.println("<body>");
			out.println("<h1>Sei loggato come '" + username + "'</h1>");
			out.println("</body>");
			out.println("</html>");
		} else {
			out.println("<html>");
			out.println("<body>");
			out.println("<h1>Mi dispiace non sei loggato. " + "		Prego effettua il login</h1>");
			out.println("<form method=\"post\"" + "		action=\"checkLogin\">");
			out.println("Username");
			out.println("<input name=\"username\" " + "type=\"text\" />");
			out.println("Password");
			out.println("<input name=\"password\" " + "type=\"password\" />");
			out.println("<input type=\"Submit\" />");
			out.println("</form>");
			out.println("</body>");
			out.println("</html>");
		}
	}

	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		HttpSession session = req.getSession();
		String username = (String) req.getParameter("username");
		String password = (String) req.getParameter("password");
		
		UtenteDao dao = DatabaseManager.getInstance().getDaoFactory().getUtenteDAO();

		UtenteCredenziali cliente = dao.findByPrimaryKeyCredential(username);
		PrintWriter out = resp.getWriter();
		if (cliente != null) {
			if (password.equals(cliente.getPassword())) {
				session.setAttribute("username", username);
				out.println("<html>");
				out.println("<body>");
				out.println("<h1>Sei stato loggato come '" + username + "'con successo</h1>");
				out.println("</body>");
				out.println("</html>");
			}
		}
	}
}

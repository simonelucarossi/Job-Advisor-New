package com.jobadvisor.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jobadvisor.persistence.DatabaseManager;
import com.jobadvisor.persistence.UtenteCredenziali;
import com.jobadvisor.persistence.dao.UtenteDao;


@WebServlet("/login")
public class Login extends HttpServlet {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession(); 
		String username = (String) req.getParameter("username");
		String password = (String) req.getParameter("password");
		UtenteDao dao = DatabaseManager.getInstance().getDaoFactory().getUtenteDAO();
		UtenteCredenziali utente = dao.findByPrimaryKeyCredential(username);
		String text = "success_login";
		
		if (utente!= null) {
			if (password.equals(utente.getPassword())) {
				session.setAttribute("username", username);
				session.setAttribute("utente", utente);
			}
		}else {
			text="login_failed";
		} 
		resp.getWriter().print(text);
	}

}

package com.jobadvisor.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class Home extends HttpServlet {
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		HttpSession session = req.getSession();
		session.setAttribute("username", "mario");
		String username = (String) session.getAttribute("username");
		String messaggio;
		if (username == null) {
			messaggio = "Login";
			req.setAttribute("loggato", false);
		} else {
			messaggio = "Benvenuto Sig. " + username;
			req.setAttribute("loggato", true);
		}

		req.setAttribute("mex", messaggio);

		RequestDispatcher dispacher = req.getRequestDispatcher("index.jsp");
		dispacher.forward(req, resp);
	}

}

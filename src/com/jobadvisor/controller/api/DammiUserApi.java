package com.jobadvisor.controller.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DAOFactory;

/**
 * Servlet implementation class DammiAdApi
 */
public class DammiUserApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DammiUserApi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String username = (request.getPathInfo().replace("/", ""));
		Utente utente= DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getUtenteDAO().findByPrimaryKey(username);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.getWriter().write(makeUtenteJson(utente)); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	@SuppressWarnings("unchecked")
	protected String makeUtenteJson(Utente utente) {
		JSONObject obj = new JSONObject();
		obj.put("nome", utente.getNome());
		obj.put("cognome", utente.getCognome());
		obj.put("sesso", utente.getSesso());
		obj.put("data_nascita", utente.getDataNascita());
		obj.put("email", utente.getEmail());
		obj.put("telefono", utente.getTelefono());
		obj.put("tipo", utente.getTipo());
		obj.put("username", utente.getUsername());
		obj.put("password", utente.getPassword());
		return obj.toString();
	}

}

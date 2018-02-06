package com.jobadvisor.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jobadvisor.persistence.dao.UtenteDao;
import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DatabaseManager;

@WebServlet("/getBanned")
public class DammiUtentiBannati extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		UtenteDao dao = DatabaseManager.getInstance().getDaoFactory().getUtenteDAO();
		List<Utente> utenti= dao.findAllByBan();
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("application/json");
		resp.getWriter().write(makeUtentiJson(utenti)); 
	}
	
	@SuppressWarnings("unchecked")
	protected String makeUtentiJson(List<Utente> utenti) {

		JSONArray  list = new JSONArray();
		for (Utente utente : utenti) {
			JSONObject obj = new JSONObject();
			obj.put("nome", utente.getNome());
			obj.put("cognome", utente.getCognome());
			obj.put("sesso", utente.getSesso());
			obj.put("data_nascita", utente.getDataNascita().toString());
			obj.put("email", utente.getEmail());
			obj.put("telefono", utente.getTelefono());
			obj.put("tipo", utente.getTipo());
			obj.put("username", utente.getUsername());
			obj.put("password", utente.getPassword());
			obj.put("fineBan", utente.getFineBan().toString());
			list.add(obj);
		}
		return list.toString();
	}

}

package com.jobadvisor.controller;

import java.io.IOException;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jobadvisor.model.Annuncio;
import com.jobadvisor.persistence.DAOFactory;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONString;
import org.json.simple.JSONValue;

@WebServlet("/deleteAd")
public class DeleteAd extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DeleteAd() {
		super();
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if(request.getParameter("myCheckboxes")!=null) {
			String selectedBoxes=request.getParameter("myCheckboxes");

			JSONArray jsonArray = new JSONArray(selectedBoxes);

		    for (int i = 0; i < jsonArray.length(); i++) {
		        Long id=Long.parseLong(jsonArray.getString(i));
		        Annuncio annuncio=new Annuncio();
		        annuncio.setId(id);
		        DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getAnnuncioDAO().delete(annuncio);
		    } 
		}
	}
}

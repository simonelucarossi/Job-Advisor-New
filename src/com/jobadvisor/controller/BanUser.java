package com.jobadvisor.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.Enumeration;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jobadvisor.model.Annuncio;
import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DAOFactory;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;
import org.json.JSONString;
import org.json.simple.JSONValue;

@WebServlet("/banUser")
public class BanUser extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public BanUser() {
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
			String time=request.getParameter("time");
			String today=request.getParameter("date");
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Calendar c = Calendar.getInstance();
			try {
				c.setTime(sdf.parse(today));
				c.add(Calendar.DATE,Integer.parseInt(time));  
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			Date date=c.getTime();
			JSONArray jsonArray = new JSONArray(selectedBoxes);
		    for (int i = 0; i < jsonArray.length(); i++) {
		        String username=jsonArray.getString(i);
		        Utente utente=new Utente();
		        utente.setUsername(username);
		        utente.setFineBan(date);
		        DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getUtenteDAO().setBan(utente, date);
		    } 
		}
	}
}

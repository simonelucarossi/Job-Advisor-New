package com.jobadvisor.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.jobadvisor.model.Utente;
import com.jobadvisor.persistence.DAOFactory;

import org.json.JSONArray;

@WebServlet("/eraseBan")
public class EraseBan extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public EraseBan() {
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
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String erasingDate="1970-01-01";
			Calendar c = Calendar.getInstance();
			try {
				c.setTime(sdf.parse(erasingDate));
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

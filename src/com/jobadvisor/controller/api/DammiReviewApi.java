package com.jobadvisor.controller.api;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jobadvisor.model.Recensione;
import com.jobadvisor.persistence.DAOFactory;

public class DammiReviewApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DammiReviewApi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (request.getPathInfo().replace("/", ""));
		if(!id.equals("ads")) {
		Long newID= Long.parseLong(id);
		List<Recensione> recensioni = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getRecensioneDAO().findAllByAdsPrimaryKey(newID);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.getWriter().write(makeRecensioniJson(recensioni)); 
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	@SuppressWarnings("unchecked")
	protected String makeRecensioniJson(List<Recensione> recensioni) {
		JSONArray  list = new JSONArray();
		for (Recensione recensione : recensioni) {
			JSONObject obj = new JSONObject();
			obj.put("title", recensione.getTitolo());
			obj.put("testo", recensione.getTesto());
			obj.put("reviewer", recensione.getCreatore());
			obj.put("valutazione", recensione.getValutazione());
			list.add(obj);
		}
		return list.toString();
	}

}

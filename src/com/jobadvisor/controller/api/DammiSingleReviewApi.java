package com.jobadvisor.controller.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.model.Recensione;
import com.jobadvisor.persistence.DAOFactory;

/**
 * Servlet implementation class DammiSingleReviewApi
 */
@WebServlet("/DammiSingleReviewApi")
public class DammiSingleReviewApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
    public DammiSingleReviewApi() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (request.getPathInfo().replace("/", ""));
		if(!id.equals("singleReview")) {
		Long newID= Long.parseLong(id);
		Recensione recensione = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getRecensioneDAO().findByPrimaryKey(newID);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.getWriter().write(makeRecensioneJson(recensione)); 
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
	protected String makeRecensioneJson(Recensione recensione) {
		JSONObject obj = new JSONObject();
		obj.put("title", recensione.getTitolo());
		obj.put("testo", recensione.getTesto());
		obj.put("reviewer", recensione.getCreatore());
		obj.put("valutazione", recensione.getValutazione());
		return obj.toString();
	}

}

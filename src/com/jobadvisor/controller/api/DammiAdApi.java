package com.jobadvisor.controller.api;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.persistence.DAOFactory;

/**
 * Servlet implementation class DammiAdApi
 */
public class DammiAdApi extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DammiAdApi() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = (request.getPathInfo().replace("/", ""));
		Annuncio annuncio = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getAnnuncioDAO().findByPrimaryKey(id);
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.getWriter().write(makeAnnuncioJson(annuncio)); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	protected String makeAnnuncioJson(Annuncio annuncio) {
		JSONObject obj = new JSONObject();
		obj.put("id", annuncio.getId());
		obj.put("data", annuncio.getData().toString());
		obj.put("creatore", annuncio.getCreator().getNomeCompleto());
		obj.put("categoria", annuncio.getCategoria());
		obj.put("latitudine", annuncio.getLatitudine());
		obj.put("longitudine", annuncio.getLongitudine());
		return obj.toString();
	}

}

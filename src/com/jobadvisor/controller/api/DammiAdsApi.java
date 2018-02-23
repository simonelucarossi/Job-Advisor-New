package com.jobadvisor.controller.api;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.persistence.DAOFactory;

/**
 * Servlet implementation class DammiAdsApi
 */
@WebServlet("/api/ads")
public class DammiAdsApi extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DammiAdsApi() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String category = request.getParameter("category");
		String sorting = request.getParameter("sorting");
		String lat = request.getParameter("lat");
		String lon = request.getParameter("lon");
		String order = request.getParameter("order");
		List<Annuncio> annunci = null;
		
		
		System.out.println("CATEGORY -> " + category);
		if(sorting == null && order == null) {
			annunci = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getAnnuncioDAO().findAllByCategory(category);
			System.out.println(annunci.size());
		}
		else if(sorting != null && order == null) {
			annunci = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getAnnuncioDAO().findAllByCategoryAndPosition(category, lat, lon);
			System.out.println(annunci.size());
		}
		else {
			annunci = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getAnnuncioDAO().findAllByCategoryWithSorting(category,sorting,order);
			System.out.println(annunci.size());
		}
		response.setCharacterEncoding("UTF-8");
		response.setContentType("application/json");
		response.getWriter().write(makeAnnunciJson(annunci)); 
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	@SuppressWarnings("unchecked")
	protected String makeAnnunciJson(List<Annuncio> annunci) {

		JSONArray  list = new JSONArray();
		for (Annuncio annuncio : annunci) {
			JSONObject obj = new JSONObject();
			obj.put("id", annuncio.getId());	
			obj.put("categoria", annuncio.getCategoria());
			obj.put("data", annuncio.getData().toString());
			obj.put("prezzo", annuncio.getPrezzo());
			JSONObject creatore = new JSONObject();
			creatore.put("nomeCompleto", annuncio.getCreator().getNomeCompleto());
			creatore.put("username", annuncio.getCreator().getUsername());
			creatore.put("tipo", annuncio.getCreator().getTipo());
			obj.put("creatore", creatore);
			obj.put("latitudine", annuncio.getLatitudine());
			obj.put("longitudine", annuncio.getLongitudine());
			
			double stats = DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getRecensioneDAO().StatsByAdsPrimaryKey(annuncio.getId());
			obj.put("valutazione", stats);

			list.add(obj);
		}
		return list.toString();
	}

}

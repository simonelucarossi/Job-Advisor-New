package com.jobadvisor.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;

import com.jobadvisor.model.Annuncio;
import com.jobadvisor.model.Recensione;
import com.jobadvisor.persistence.DAOFactory;

/**
 * Servlet implementation class DeleteReview
 */
@WebServlet("/DeleteReview")
public class DeleteReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteReview() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
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
				        Long id = Long.parseLong(jsonArray.getString(i));
				        Recensione recensione	= new Recensione();
				        recensione.setId(id);
				        DAOFactory.getDAOFactory(DAOFactory.POSTGRESQL).getRecensioneDAO().delete(recensione);
				    } 
				}
	}

}

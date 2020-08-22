package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import model.*;
/**
 * Servlet implementation class RetrieveCategoriesServlet
 */
@WebServlet("/retrievecategories.action")
public class RetrieveCategoriesServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		CategoryFactory cFactory = new CategoryFactory();
		Category men = cFactory.getCategory("men");
		Category women = cFactory.getCategory("women");

		Category unisex = cFactory.getCategory("unisex");
		HashMap<String, String>categories = new HashMap<String, String>();
		categories.put(String.valueOf(men.getId()), men.getName());
		categories.put(String.valueOf(women.getId()), women.getName());
		categories.put(String.valueOf(unisex.getId()), unisex.getName());
		Gson gson = new Gson();
		String json = gson.toJson(categories);
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write(json);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

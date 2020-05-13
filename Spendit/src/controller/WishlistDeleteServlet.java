package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import model.Wishlist;
import model.User;
import utility.DBConnection;

/**
 * Servlet implementation class WishlistCreateServlet
 */
@WebServlet("/deletewish.action")
public class WishlistDeleteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		int wishID = Integer.parseInt(request.getParameter("wishID"));
		double amount = Double.parseDouble(request.getParameter("amount"));	
	
		String comment = request.getParameter("comment");
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		Connection connection = DBConnection.getConnection(getServletContext());
		if(StringUtils.isBlank(comment)) {
			response.sendRedirect("400.jsp");
			return;
		}
		
		WishlistOperations wishOps = new WishlistOperations();
		wishOps.deleteWishlist(connection, wishID);
		
//			ArrayList<Wishlist> wishlist = wishOps.getFullWishlist(connection, user.getUserID());
//			request.setAttribute("wishlist", wishlist);
//			request.getRequestDispatcher("retrievewishlist.action").forward(request, response);
		response.sendRedirect("retrievewishlist.action");
		
	}

}

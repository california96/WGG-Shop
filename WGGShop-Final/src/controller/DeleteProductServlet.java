package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import utility.AESHelper;
import utility.BCrypt;
import utility.CookieHelper;
import utility.SingletonDB;

/**
 * Servlet implementation class DeleteProductServlet
 */
@WebServlet("/deleteproduct.action")
public class DeleteProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		if((CookieHelper.getCookie(request.getCookies(), "user") != null) &&AESHelper.decrypt(CookieHelper.getCookie(request.getCookies(), "user").getValue()).equals(getServletContext().getInitParameter("adminUser"))) {
		int productID = Integer.parseInt(request.getParameter("id"));
		ProductController pc = new ProductController();
		Connection connection = SingletonDB.getConnection(getServletContext());
		pc.delete(connection, productID);
		response.sendRedirect("retrieveproducts.action");
		}else {
			request.getRequestDispatcher("403.jsp").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

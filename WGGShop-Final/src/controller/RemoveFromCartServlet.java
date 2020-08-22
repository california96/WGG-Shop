package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Product;

/**
 * Servlet implementation class RemoveFromCartServlet
 */
@WebServlet("/removefromcart.action")
public class RemoveFromCartServlet extends HttpServlet {

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int productID = Integer.parseInt(request.getParameter("id"));
		HttpSession session = request.getSession(false);
		ArrayList<Product> products = (ArrayList<Product>)session.getAttribute("products");
		for(int i = 0; i < products.size(); i++) {
			if(products.get(i).getProductID() == productID) {
				products.remove(products.get(i));
			}
		}
		PrintWriter out = response.getWriter();
		out.print("<script>alert('Item removed from cart!');</script>");
		response.sendRedirect("cart.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

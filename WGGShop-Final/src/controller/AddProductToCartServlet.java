package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Product;
import utility.SingletonDB;

/**
 * Servlet implementation class AddProductToCartServlet
 */
@WebServlet("/addtocart.action")
public class AddProductToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Connection connection = SingletonDB.getConnection(getServletContext());
		ProductController pc = new ProductController();
		
		int productID = Integer.parseInt(request.getParameter("productID"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int continueShopping = Integer.parseInt(request.getParameter("continueShopping"));
		Product product = pc.getProductByID(productID, connection);
		product.setQuantity(quantity);
		HttpSession session = request.getSession(true);
		if(session.getAttribute("products") == null) {
			session = request.getSession();
			ArrayList<Product> products = new ArrayList<Product>();
			products.add(product);
			session.setAttribute("products", products);
		}
		else {
			//User user = (User)session.getAttribute("user");
			ArrayList<Product> products = (ArrayList<Product>)session.getAttribute("products");
			products.add(product);
		}
		if(continueShopping == 0) {
			response.sendRedirect("cart.jsp");
		}else {
			response.sendRedirect("viewproduct.action?id="+productID);
		}
	}

}

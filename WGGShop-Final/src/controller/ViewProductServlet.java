package controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.Product;
import utility.SingletonDB;

/**
 * Servlet implementation class ViewProductServlet
 */
@WebServlet("/viewproduct.action")
public class ViewProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		int productID = Integer.parseInt(request.getParameter("id"));
		Connection connection = SingletonDB.getConnection(getServletContext());
		
		Product product = new ProductController().getProductByID(productID, connection);
		System.out.println(product.getCategory().getId());
		Iterator<Product> related = new ProductController().getProductByCategoryIterator(connection, product.getCategory().getId());
		
		request.setAttribute("product",product);
		request.setAttribute("related", related);
		request.getRequestDispatcher("product-details.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}

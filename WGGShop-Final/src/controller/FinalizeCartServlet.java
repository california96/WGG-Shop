package controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Product;
import model.Transaction;
import utility.SingletonDB;

/**
 * Servlet implementation class FinalizeCartServlet
 */
@WebServlet("/finalizecart.action")
public class FinalizeCartServlet extends HttpServlet {
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
		String[] quantities = request.getParameterValues("quantity");
		int[] parsedQuantity = new int[quantities.length];
		double totalBill = 0.0;
		ServletContext context = getServletContext();
		Connection connection = SingletonDB.getConnection(context);
		for(int i = 0; i < quantities.length; i++) {
			parsedQuantity[i] = Integer.parseInt(quantities[i]);
		}
		HttpSession session = request.getSession(false);
		ArrayList<Product> products = (ArrayList<Product>)session.getAttribute("products");
		for(int j = 0; j < parsedQuantity.length; j++) {
			products.get(j).setQuantity(parsedQuantity[j]);
		}
		Transaction transaction = new Transaction(0, "", "", "", "", totalBill, 0.0, products);
		TransactionController tc = new TransactionController(transaction);
		tc.computeBill(Double.parseDouble(context.getInitParameter("shippingFee")));
		request.setAttribute("transaction", transaction);
		request.getRequestDispatcher("checkout.jsp").forward(request, response);
	}

}

package controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashSet;

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
 * Servlet implementation class ComputeTransactionServlet
 */
@WebServlet("/computetransaction.action")
public class ComputeTransactionServlet extends HttpServlet {
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
		/*-------Input Variables------*/
		String customerName = request.getParameter("customerName");
		String email = request.getParameter("email");
		String contactNo = request.getParameter("contactNo");
		String shippingAddress = request.getParameter("shippingAddress");
		double amountPaid = Double.parseDouble(request.getParameter("amountPaid"));
		
		double totalBill = Double.parseDouble(request.getParameter("totalBill"));
		ServletContext context = getServletContext();
		Connection connection = SingletonDB.getConnection(context);
		
		/*-------End Input Variables------*/
		
		HttpSession session = request.getSession(false);
		ArrayList<Product> products = (ArrayList<Product>)session.getAttribute("products");
		
		
		
		Transaction transaction = new Transaction(0, customerName, email, contactNo, shippingAddress, totalBill, amountPaid, products);
		TransactionController tc = new TransactionController(transaction);
		tc.registerTransaction(connection, Double.parseDouble(context.getInitParameter("shippingFee")));
		session.invalidate();
		response.sendRedirect("success.jsp");
	}

}

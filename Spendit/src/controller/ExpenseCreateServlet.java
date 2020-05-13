package controller;

import java.io.IOException;
import java.sql.Connection;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Expense;
import model.User;
import utility.DBConnection;

/**
 * Servlet implementation class ExpenseCreateServlet
 */
@WebServlet("/createexpense.action")
public class ExpenseCreateServlet extends HttpServlet {
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
		int categoryID = Integer.parseInt(request.getParameter("categoryID"));
		double cost = Double.parseDouble(request.getParameter("cost"));	
		String date = request.getParameter("date");
		String comment = request.getParameter("comment");
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		Connection connection = DBConnection.getConnection(getServletContext());
		ExpenseOperations exOps = new ExpenseOperations();
		if(exOps.insert(connection, categoryID, user.getUserID(), cost, date, comment)) {
			ArrayList<Expense> expenses = exOps.getAllExpenses(connection, user.getUserID());
			request.setAttribute("expenses", expenses);
			request.getRequestDispatcher("expenseindex.jsp").forward(request, response);
		}
	}

}

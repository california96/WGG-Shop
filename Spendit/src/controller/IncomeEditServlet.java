package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;

import model.User;
import model.Expense;
import model.Income;

import java.util.ArrayList;
import utility.DBConnection;

/**
 * Servlet implementation class ExpenseEditServlet
 */
@WebServlet("/updateincome.action")
public class IncomeEditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int incomeID = Integer.parseInt(request.getParameter("incomeID"));
		int categoryID = Integer.parseInt(request.getParameter("categoryID"));
		double amount = Double.parseDouble(request.getParameter("amount"));	
		String date = request.getParameter("date");
		String comment = request.getParameter("comment");
		Connection connection = DBConnection.getConnection(getServletContext());
		IncomeOperations inOps = new IncomeOperations();
		if(StringUtils.isBlank(comment)) {
			response.sendRedirect("400.jsp");
			return;
		}
		inOps.editIncome(connection, incomeID, categoryID, amount, date, comment);
		
		HttpSession session = request.getSession(false);
		User user = (User)session.getAttribute("user");
		ArrayList<Income> income = inOps.getAllIncome(connection, user.getUserID());
		request.setAttribute("income", income);
		request.getRequestDispatcher("incomeindex.jsp").forward(request, response);
		
	

		
	}

}

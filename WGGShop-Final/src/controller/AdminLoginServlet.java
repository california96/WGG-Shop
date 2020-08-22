package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;

import utility.AESHelper;
import utility.BCrypt;

/**
 * Servlet implementation class AdminLoginServlet
 */
@WebServlet("/admin-login.action")
public class AdminLoginServlet extends HttpServlet {
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
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		ServletContext context = getServletContext();
		Gson gson = new Gson();
		HashMap<Object, Object> errorMsg = new HashMap<>();
		String json;
		
		if(username.equals(context.getInitParameter("adminUser")) && BCrypt.checkpw(password, context.getInitParameter("adminPass"))){
			
			Cookie userCookie = new Cookie("user", AESHelper.encrypt(username));
			userCookie.setMaxAge(-1);
			response.addCookie(userCookie);
		//	request.getRequestDispatcher("retrieveproducts.action").forward(request, response);
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			errorMsg.put("msg", "success");
			json = gson.toJson(errorMsg);
			response.getWriter().write(json);
				
		}
		else {
			response.setContentType("application/json");
			response.setCharacterEncoding("UTF-8");
			errorMsg.put("msg", "error");
			json = gson.toJson(errorMsg);
			response.getWriter().write(json);
		}
	}

}

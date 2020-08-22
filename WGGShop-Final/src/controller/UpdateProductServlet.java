package controller;

import java.io.IOException;
import java.sql.Connection;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import model.Category;
import model.CategoryFactory;
import model.Product;
import model.SubCategory;
import model.SubCategoryFactory;
import utility.AESHelper;
import utility.CookieHelper;
import utility.SingletonDB;

/**
 * Servlet implementation class CreateProductServlet
 */
@WebServlet("/updateproduct.action")
@MultipartConfig
public class UpdateProductServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request,response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		/*input values*/
		if((CookieHelper.getCookie(request.getCookies(), "user") != null) &&AESHelper.decrypt(CookieHelper.getCookie(request.getCookies(), "user").getValue()).equals(getServletContext().getInitParameter("adminUser"))) {
		int productID = Integer.parseInt(request.getParameter("productID"));
		String name = request.getParameter("name");
		String description = request.getParameter("description");
		Category category = new CategoryFactory().getCategory(request.getParameter("category"));
		SubCategory subcategory = new SubCategoryFactory().getSubCategory(request.getParameter("subcategory"));
		double price = Double.parseDouble(request.getParameter("price"));
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		String image = "";
		/*end input values*/
		Part filePart = request.getPart("file");
		String uploadPath = getServletContext().getInitParameter("productStorage");
		Connection connection = SingletonDB.getConnection(getServletContext());
		
		Product product = new Product(productID, name, description, category, subcategory, price, quantity, image);
		ProductController pc = new ProductController(product);
		pc.getProductByID(productID, connection);
		if(filePart.getSize() > 0) {
			image = pc.uploadImage(uploadPath, filePart);
			}else {
				image = pc.getProductByID(productID, connection).getImage();
			}
		product.setImage(image);
		pc.edit(connection, product);
		response.sendRedirect("retrieveproducts.action");
		}else {
			request.getRequestDispatcher("403.jsp").forward(request, response);
		}
	}
}

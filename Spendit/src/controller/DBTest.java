package controller;
import utility.DBConnection;
import model.User;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import com.google.gson.Gson;
public class DBTest {
	public static void main(String args[])throws ParseException {
//		User user = new User("Doe", "John", "johndoe", "johndoe@email.com", "password", null);
	//	String sample = "2020-05-08T11:30";
	//	Date date = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm").parse(sample);
	//	System.out.println(new SimpleDateFormat("yyyy-MM-dd HH:mm:ss").format(date));
		ExpenseOperations exOps = new ExpenseOperations();
		ArrayList<Map<String, String>> cExps = exOps.getTopExpenseCategories(DBConnection.getConnection(), 1);
		Gson gson = new Gson();
		String json = gson.toJson(cExps);
//		for(Map<String, String> m : cExps) {
//		System.out.println(m);
//		}
		System.out.println(json);
	}
}

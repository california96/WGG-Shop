package utility;
import javax.servlet.http.Cookie;
public class CookieHelper {
	public static Cookie getCookie(Cookie cookies[], String name) {
		Cookie foundCookie = null;
		
		if(cookies != null)
		{
			for(Cookie cookie : cookies) {
				if(cookie.getName().equals(name))
				{
					foundCookie = cookie;
					break;
				}
			}
		}
		return foundCookie;
	}
}
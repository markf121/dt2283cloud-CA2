package ie.mydit.flanagan6.mark;

import java.io.IOException;
import java.security.Principal;
import javax.servlet.http.*;
import com.google.appengine.api.users.UserService;
import com.google.appengine.api.users.UserServiceFactory;

@SuppressWarnings("serial")
public class Login extends HttpServlet {
	public void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws IOException {
		
		resp.setContentType("text/plain");
		resp.getWriter().println("Hello, world");
		
		UserService userService = UserServiceFactory.getUserService();//Creates a UserService object
		String emailAddress = null;
		Principal  myPrincipal = req.getUserPrincipal();
		String thisURL = req.getRequestURI();
		String loginURL = userService.createLoginURL(thisURL);//returns a URL that can be used to display a login page to the user
		String logoutURL = userService.createLogoutURL(thisURL);//returns a URL that can be used to display a logout page to the user that is currently logged in
		
		resp.setContentType("text/html");//Sets the type of content being displayed to the user
		
		if(myPrincipal == null){
			resp.getWriter().println("<p>You are Not Logged In </p>");
			resp.getWriter().println("<p>You can <a href=\""+loginURL+"\">sign in here</a>.</p>");
			
		}//end if not logged in
		
		if(myPrincipal != null ){
			emailAddress = myPrincipal.getName();
			resp.getWriter().println("<p>You are Logged in as (email):"+emailAddress+"</p>");
			resp.getWriter().println("<p>You can <a href=\"" + logoutURL + "\">sign out </a>.</p>");
			
		}//end if logged in
	}
}






















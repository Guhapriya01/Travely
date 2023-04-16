import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/UpdateCar")
public class UpdateCar extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateCar() {
		super();
		// TODO Auto-generated constructor stub
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter out = response.getWriter();

		String number = request.getParameter("number");
		String location,s;
		double price;
		String locationS="", priceS="";

		if (request.getParameter("location") != "") {
			location = request.getParameter("location");
			try {
				CarDAO carDAO = new CarDAO();
				int i = carDAO.updateCarLocation(number, location);
				locationS = i == 1 ? "Updated" : "Not Updated";
			} catch (Exception e) {
				out.print(e);
			}
		}

		if (request.getParameter("price") != "") {
			price = Double.parseDouble(request.getParameter("price"));
			try {
				CarDAO carDAO = new CarDAO();
				int i = carDAO.updateCarPrice(number, price);
				priceS = i == 1 ? "Updated" : "Not Updated";
				
			} catch (Exception e) {
				out.print(e);
			}
		}
		
		if(priceS =="Updated" && locationS=="Updated") {
			s ="Sucessfully Updated";
		}
		else if(priceS =="Updated") {
			s ="Sucessfully Updated Price";
		}
		else if(locationS=="Updated") {
			s ="Sucessfully Updated Location";
		}
		else {
			s="Unable To Update";
		}
		
		HttpSession session = request.getSession();
		session.setAttribute("message", s);
		session.setAttribute("type", "Tab2");
		
		String referer = request.getHeader("referer");
		response.sendRedirect(referer);

		// out.println(number+" "+location+" "+price);
	}

}

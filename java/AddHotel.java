import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AddHotel")
public class AddHotel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddHotel() {
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
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String location = request.getParameter("location");

		int rooms = Integer.parseInt(request.getParameter("rooms"));
		
		double price = Double.parseDouble(request.getParameter("price"));
		
		try {
			HotelDAO hotelDAO = new HotelDAO();
			int i = hotelDAO.addHotel(name, location, rooms, price);
			
			// System.out.print(i);

			String s = i == 1 ? "Successfully Inserted" : "Not Inserted";
			
			HttpSession session = request.getSession();
			session.setAttribute("message", s);
			session.setAttribute("type", "Tab1");
			
			String referer = request.getHeader("referer");
			response.sendRedirect(referer);
			
		} catch (Exception e) {
			out.print(e);
		}

		// out.print(rooms+" "+location);
	}

}

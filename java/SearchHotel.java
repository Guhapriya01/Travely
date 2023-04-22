import java.io.IOException;
import java.io.PrintWriter;

import java.util.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.booking.Hotel;

@WebServlet("/SearchHotel")
public class SearchHotel extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchHotel() {
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

		String location = request.getParameter("location");

		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");

		int rooms = Integer.parseInt(request.getParameter("rooms"));

		try {
			HotelDAO hotelDAO = new HotelDAO();
			List<Hotel> results = hotelDAO.getHotels(location, checkin, checkout, rooms);

			request.setAttribute("hotels", results);
			
			RequestDispatcher rd = request.getRequestDispatcher("hotel.jsp");
			
			rd.forward(request, response);

		} catch (Exception e) {
			out.print(e);
		}

		// out.print(rooms+" "+location);
	}
}

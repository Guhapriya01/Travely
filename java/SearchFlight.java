import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.booking.Flight;
import com.booking.Hotel;

@WebServlet("/SearchFlight")
public class SearchFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SearchFlight() {
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

		String from = request.getParameter("from");
		String to = request.getParameter("to");
		String cabin = request.getParameter("cabin");
		String date = request.getParameter("date");
		
		System.out.print(from+" "+to+" "+cabin);

		try {
			FlightDAO flightDAO = new FlightDAO();
			List<Flight> results = flightDAO.getFlights(from, to, cabin, date);
			System.out.print(results);

			request.setAttribute("flights", results);

			request.setAttribute("cabin", cabin);
			RequestDispatcher rd = request.getRequestDispatcher("flight.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			out.print(e);
		}

		// out.print(rooms+" "+location);

	}
}

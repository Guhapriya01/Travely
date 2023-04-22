
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class UpdateFlight
 */
@WebServlet("/UpdateFlight")
public class UpdateFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public UpdateFlight() {
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

		// String departureDate = request.getParameter("departureDate");
		String departureTime = request.getParameter("departureTime");
		String arrivalTime = request.getParameter("arrivalTime");

		double EPrice = request.getParameter("EPrice") == "" ? 0 : Double.parseDouble(request.getParameter("EPrice"));
		double BPrice = request.getParameter("BPrice") == "" ? 0 : Double.parseDouble(request.getParameter("BPrice"));
		double PPrice = request.getParameter("PPrice") == "" ? 0 : Double.parseDouble(request.getParameter("PPrice"));
		double FPrice = request.getParameter("FPrice") == "" ? 0 : Double.parseDouble(request.getParameter("FPrice"));

		// out.println(name+" "+departureTime+" "+departureDate);
		// out.print(EPrice+" "+BPrice);

		try {
			FlightDAO flightDAO = new FlightDAO();
			String s = flightDAO.updateFlight(name, departureTime,arrivalTime, EPrice, BPrice, PPrice, FPrice);
			// System.out.print(i);

		   s += s != "" ? " Updated" : "Not Updated";

			HttpSession session = request.getSession();
			session.setAttribute("message", s);
			session.setAttribute("type", "Tab2");

			String referer = request.getHeader("referer");
			response.sendRedirect(referer);

		} catch (Exception e) {
			out.print(e);
		}
	}

}

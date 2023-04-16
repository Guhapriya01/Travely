
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		String departureDate = request.getParameter("departureDate");
		String departureTime = request.getParameter("departureTime");

		double EPrice = Double.parseDouble(request.getParameter("EPrice"));
		double BPrice = Double.parseDouble(request.getParameter("BPrice"));
		double PPrice = Double.parseDouble(request.getParameter("PPrice"));
		double FPrice = Double.parseDouble(request.getParameter("FPrice"));

		// out.println(name+" "+departureTime+" "+departureDate);
		// out.print(EPrice+" "+BPrice);
	}

}

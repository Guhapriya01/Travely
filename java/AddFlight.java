import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddFlight")
public class AddFlight extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AddFlight() {
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
		
		String name = request.getParameter("name");
		String from = request.getParameter("from");
		String to = request.getParameter("to");
		
		String departureDate = request.getParameter("departureDate");
		String departureTime = request.getParameter("departureTime");
		String arrivalTime = request.getParameter("arrivalTime");
		
		int Eseats = Integer.parseInt(request.getParameter("Eseats"));
		int Bseats = Integer.parseInt(request.getParameter("Bseats"));
		int Pseats = Integer.parseInt(request.getParameter("Pseats"));
		int Fseats = Integer.parseInt(request.getParameter("Fseats"));
		
		double EPrice = Double.parseDouble(request.getParameter("EPrice"));
		double BPrice = Double.parseDouble(request.getParameter("BPrice"));
		double PPrice = Double.parseDouble(request.getParameter("PPrice"));
		double FPrice = Double.parseDouble(request.getParameter("FPrice"));
		
		// out.println(name+" "+arrivalTime+" "+departureTime+" "+from+" "+to+" "+departureDate);
		// out.print(EPrice+" "+Eseats);
		
		try {
			FlightDAO flightDAO = new FlightDAO();
			flightDAO.addFlight(name, departureDate);
		}
		catch(Exception e) {
			out.print(e);
		}
	}

}

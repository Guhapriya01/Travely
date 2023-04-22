import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/FlightName")
public class FlightName extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public FlightName() {
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
		// PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		String cabin = request.getParameter("Gcabin");
		// out.print(name);

		request.setAttribute("name", name);
		request.setAttribute("cabin", cabin);

		RequestDispatcher rd = request.getRequestDispatcher("flightBooking.jsp");

		rd.forward(request, response);
	}

}

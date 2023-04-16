import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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

		// out.print(rooms+" "+location);
	}

}

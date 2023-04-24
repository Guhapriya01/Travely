import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import com.booking.Car;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.booking.Flight;

@WebServlet("/SearchCar")
public class SearchCar extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SearchCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();

		String location = request.getParameter("location");
		String date = request.getParameter("date");
		String pickup = request.getParameter("pickup");
		String drop = request.getParameter("drop");
		

		try {
			CarDAO carDAO = new CarDAO();
			List<Car> results = carDAO.getCars(location, date, pickup, drop);
			System.out.print(results);

			request.setAttribute("cars", results);

			RequestDispatcher rd = request.getRequestDispatcher("car.jsp");
			rd.forward(request, response);

		} catch (Exception e) {
			out.print(e);
		}

		// out.print(rooms+" "+location);
	}

}

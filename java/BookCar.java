import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/BookCar")
public class BookCar extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public BookCar() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
PrintWriter out = response.getWriter();
		
		String uname = request.getParameter("uname");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		
		String date = request.getParameter("date");
		
		String cin = request.getParameter("in");
		String cout = request.getParameter("out");
		
		String number = request.getParameter("number");
		System.out.print(number);
		
		try {
			CustomerDAO custDAO = new CustomerDAO();
			int customerId = custDAO.addCustomer(uname, email, phone);
			
			CarDAO carDAO = new CarDAO();
			String[] s = (carDAO.getCarIdPrice(number)).split("-");
			
			double totalcost = Double.parseDouble(s[1]);
			int carId = Integer.parseInt(s[0]);
			
			// HotelBooking insertion
			CarBookingDAO book = new CarBookingDAO();
			int i = book.addCarBooking(carId, customerId, date, cin, cout, totalcost);
			
			// completed
			String msg = i == 1 ? "Successfully Booked" : "Unable to book your hotel. Try again Later";
			
			HttpSession session = request.getSession();
			session.setAttribute("message", msg);
			response.sendRedirect("carBooking.jsp");
			

		} catch (Exception e) {
			out.print(e);
		}
	}

}

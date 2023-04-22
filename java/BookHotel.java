import java.io.*;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.booking.Hotel;

@WebServlet("/BookHotel")
public class BookHotel extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public BookHotel() {
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
		String checkin = request.getParameter("checkin");
		String checkout = request.getParameter("checkout");
		int rooms = Integer.parseInt(request.getParameter("rooms"));
		String hname = request.getParameter("hname");
		// out.print(name);
		
		try {
			CustomerDAO custDAO = new CustomerDAO();
			int customerId = custDAO.addCustomer(uname, email, phone);
			
			HotelDAO hotelDAO = new HotelDAO();
			String[] s = (hotelDAO.getHotelIdPrice(hname)).split("-");
			
			double totalcost = Double.parseDouble(s[1]);
			int hotelId = Integer.parseInt(s[0]);
			
			// HotelBooking insertion
			HotelBookingDAO book = new HotelBookingDAO();
			int i = book.addHotelBooking(customerId, hotelId, checkin, checkout, totalcost, rooms);
			
			// completed
			String msg = i == 1 ? "Successfully Booked" : "Unable to book your hotel. Try again Later";
			
			HttpSession session = request.getSession();
			session.setAttribute("message", msg);
			response.sendRedirect("hotelBooking.jsp");
			

		} catch (Exception e) {
			out.print(e);
		}
		
	}
}

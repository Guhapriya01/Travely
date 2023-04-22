import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/DeleteHotel")
public class DeleteHotel extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DeleteHotel() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();

		String name = request.getParameter("name");
		try {
			HotelDAO hotelDAO = new HotelDAO();
			int i = hotelDAO.deleteHotel(name);
			
			String s = i == 1 ? "Successfully Deleted" : "Not Deleted";
			
			HttpSession session = request.getSession();
			session.setAttribute("message", s);
			session.setAttribute("type", "Tab3");
			
			String referer = request.getHeader("referer");
			response.sendRedirect(referer);
		} catch (Exception e) {
			out.print(e);
		}
// out.print(name+" ");
	}

}

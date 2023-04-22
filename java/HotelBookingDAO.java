import java.sql.*;

public class HotelBookingDAO {

	String url = "jdbc:mysql://localhost:3306/Travel";
	String username = "root";
	String password = "vishva123";

	Connection connection;

	public HotelBookingDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, username, password);
	}

	public int addHotelBooking(int cid, int hid, String checkin, String checkout, double cost, int rooms)
			throws Exception {

		PreparedStatement myStmt = connection.prepareStatement(
				"insert into HotelBooking (hotel_id, customer_id, checkin, checkout, no_of_rooms, total_cost) "
						+ "values (?,?,?,?,?,?)");
		myStmt.setInt(1, hid);
		myStmt.setInt(2, cid);
		myStmt.setString(3, checkin);
		myStmt.setString(4, checkout);
		myStmt.setInt(5, rooms);
		myStmt.setDouble(6, cost);

		int i = myStmt.executeUpdate();
		System.out.println("Insert complete.");
		return i;
	}

	public void deleteHotelBooking() throws Exception {

	}

	public void updateHotelBooking() throws Exception {

	}
}

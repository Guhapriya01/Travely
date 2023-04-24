import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class CarBookingDAO {

	String url = "jdbc:mysql://localhost:3306/Travel";
	String username = "root";
	String password = "vishva123";

	Connection connection;

	public CarBookingDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, username, password);
	}

	public int addCarBooking(int carid, int cid, String date, String in,String out,  double cost) throws Exception {

		PreparedStatement myStmt = connection.prepareStatement(
				"insert into CarBooking (car_id, customer_id, date, checkin, checkout, total_cost) values (?,?,?,?,?,?)");
		myStmt.setInt(1, carid);
		myStmt.setInt(2, cid);
		myStmt.setString(3, date);
		myStmt.setString(4, in);
		myStmt.setString(5, out);
		myStmt.setDouble(6, cost);

		int i = myStmt.executeUpdate();
		System.out.println("Insert complete.");
		return i;
	}

	public void deleteCarBooking() throws Exception {

	}

	public void updateCarBooking() throws Exception {

	}
}
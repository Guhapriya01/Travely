import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import java.util.*;
import com.booking.Flight;
import com.booking.Hotel;

public class FlightDAO {

	// DB Connection
	// com.mysql.jdbc.Driver.class
	// com.mysql.jdbc.Driver

	// CREATE TABLE `Flight` (
	// `id` INT NOT NULL AUTO_INCREMENT ,
	// `name` VARCHAR(100) NOT NULL ,
	// `from` VARCHAR(100) NOT NULL , `to` VARCHAR(100) NOT NULL ,
	// `departure` TIME NOT NULL , `arrival` TIME NOT NULL ,
	// `economy_seats` INT NOT NULL , `economy_price` DOUBLE NOT NULL ,
	// `business_seats` INT NOT NULL , `business_price` DOUBLE NOT NULL ,
	// `premium_seats` INT NOT NULL , `premium_price` DOUBLE NOT NULL ,
	// `first_class_seats` INT NOT NULL , `first_class_price` DOUBLE NOT NULL ,
	// PRIMARY KEY (`id`))

	static String url = "jdbc:mysql://localhost:3306/Travel";
	static String username = "root";
	static String password = "vishva123";

	Connection connection;

	public FlightDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, username, password);

	}

	public int addFlight(String name, String from, String to, String departureTime, String arrivalTime, int Eseats,
			int Bseats, int Pseats, int Fseats, double EPrice, double BPrice, double PPrice, double FPrice)
			throws Exception {
		PreparedStatement myStmt = connection.prepareStatement(
				"insert into Flight (`name`, `from`, `to`,`departure` , `arrival`, `economy_seats`, `business_seats`, `premium_seats`, `first_class_seats`, `economy_price`, `business_price`, `premium_price`,`first_class_price`) values (?,?,?, ?, ?,?,?,?, ? ,? ,?, ?, ?)");
		myStmt.setString(1, name);
		myStmt.setString(2, from);
		myStmt.setString(3, to);
		myStmt.setString(4, departureTime + ":00");
		myStmt.setString(5, arrivalTime + ":00");
		myStmt.setInt(6, Eseats);
		myStmt.setInt(7, Bseats);
		myStmt.setInt(8, Pseats);
		myStmt.setInt(9, Fseats);
		myStmt.setDouble(10, EPrice);
		myStmt.setDouble(11, BPrice);
		myStmt.setDouble(12, PPrice);
		myStmt.setDouble(13, FPrice);

		// System.out.println(myStmt);

		int i = myStmt.executeUpdate();

		System.out.println("Insert complete.");

		return i;
	}

	public int deleteFlight(String name) throws Exception {
		PreparedStatement myStmt = connection.prepareStatement("delete from Flight where name = ?");
		myStmt.setString(1, name);
		int i = myStmt.executeUpdate();

		System.out.println("Delete complete.");

		return i;
	}

	public String updateFlight(String name, String departure, String arrival, double EPrice, double BPrice,
			double PPrice, double FPrice) throws Exception {
		String s = "";

		if (departure != "" && arrival != "") {
			PreparedStatement myStmt = connection
					.prepareStatement("update Flight set departure = ?, arrival = ? where name = ?");
			myStmt.setString(3, name);
			myStmt.setString(2, arrival);
			myStmt.setString(1, departure);
			int i = myStmt.executeUpdate();
			s += "Time ";

		}
		if (EPrice != 0) {
			PreparedStatement myStmt = connection
					.prepareStatement("update Flight set economy_price = ? where name = ?");
			myStmt.setString(2, name);
			myStmt.setDouble(1, EPrice);
			int i = myStmt.executeUpdate();
			s += "Economy Price ";
		}
		if (BPrice != 0) {
			PreparedStatement myStmt = connection
					.prepareStatement("update Flight set `business_price` = ? where name = ?");
			myStmt.setString(2, name);
			myStmt.setDouble(1, BPrice);
			int i = myStmt.executeUpdate();
			s += "Business Price ";
		}
		if (FPrice != 0) {
			PreparedStatement myStmt = connection
					.prepareStatement("update Flight set `first_class_price` = ? where `name` = ?");
			myStmt.setString(2, name);
			myStmt.setDouble(1, FPrice);
			int i = myStmt.executeUpdate();
			s += "First class Price ";
		}
		if (PPrice != 0) {
			PreparedStatement myStmt = connection
					.prepareStatement("update Flight set premium_price = ? where name = ?");
			myStmt.setString(2, name);
			myStmt.setDouble(1, PPrice);
			int i = myStmt.executeUpdate();
			s += "Premium Price ";
		}

		System.out.println("Update complete.");

		return s;
	}

	// get

	public List<Flight> getFlights(String from, String to, String cabin, String date) throws Exception {

		String classGiven = cabin;

		String cabinPrice = cabin + "_price";
		cabin = cabin + "_seats";

		// SELECT COUNT(*) FROM FlightBooking where `date` = ? and `class` = ?

		String query = "SELECT * FROM `Flight` WHERE `from` = ? and `to` = ?";

		List<Flight> availFlights = new ArrayList<>();
		PreparedStatement myStmt = connection.prepareStatement(query);
		myStmt.setString(1, from);
		myStmt.setString(2, to);

		ResultSet rs = myStmt.executeQuery();

		while (rs.next()) {
			int seats = rs.getInt(cabin), given = 0;
			int id = rs.getInt(1);

			PreparedStatement stmt = connection.prepareStatement(
					"SELECT COUNT(*) FROM `FlightBooking` WHERE `flight_id` = ? and  `date` = ? and `class` = ? ");
			stmt.setInt(1, id);
			stmt.setString(2, date);
			stmt.setString(3, classGiven);
			
			System.out.println(stmt);

			ResultSet rset = stmt.executeQuery();

			while (rset.next()) {
				System.out.println(rset.getInt(1));
				given = rset.getInt(1);
			}

			if (seats - given >= 1) {
				// room available
				// System.out.println(id+" "+givenRooms+" "+totalrooms);
				// String temp = rs.getString(2)+"-"+rs.getString(5)+"-"+(totalrooms -
				// givenRooms);
				String name = rs.getString(2);
				String departure = rs.getString(5);
				String arrival = rs.getString(6);
				double price = rs.getDouble(cabinPrice);

				System.out.println(name);

				Flight flight = new Flight();
				flight.setName(name);
				flight.setPrice(price);
				flight.setDeparture(departure);
				flight.setArrival(arrival);

				availFlights.add(flight);
			}
		}

		return availFlights;

	}

	public String getFlightIdPrice(String name, String cabin) throws Exception {

		String s = "", query = "SELECT id," + cabin + "_price FROM `Flight` WHERE `name` = ? ";

		PreparedStatement myStmt = connection.prepareStatement(query);
		myStmt.setString(1, name);
		System.out.print(myStmt);

		ResultSet rs = myStmt.executeQuery();

		while (rs.next()) {
			s += rs.getInt(1) + "-";
			s += rs.getDouble(2);
		}
		return s;
	}
}

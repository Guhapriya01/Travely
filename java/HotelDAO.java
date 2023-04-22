import java.sql.Connection;
import java.util.*;

import com.booking.Hotel;

import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class HotelDAO {

	// Table Creation

	// CREATE TABLE `Hotel` (
	// `id` INT NOT NULL AUTO_INCREMENT ,
	// `name` VARCHAR(100) NOT NULL ,
	// `location` VARCHAR(100) NOT NULL ,
	// `rooms` INT NOT NULL ,
	// `price_per_day` DOUBLE NOT NULL ,
	// PRIMARY KEY (`id`))

	String url = "jdbc:mysql://localhost:3306/Travel";
	String username = "root";
	String password = "vishva123";

	Connection connection;

	public HotelDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, username, password);
	}

	public int addHotel(String name, String location, int rooms, double price) throws Exception {
		PreparedStatement myStmt = connection
				.prepareStatement("insert into Hotel (name, location, rooms, price_per_day) " + "values (?,?,?,?)");
		myStmt.setString(1, name);
		myStmt.setString(2, location);
		myStmt.setInt(3, rooms);
		myStmt.setDouble(4, price);

		int i = myStmt.executeUpdate();

		System.out.println("Insert complete.");

		return i;
	}

	public int deleteHotel(String name) throws Exception {
		PreparedStatement myStmt = connection.prepareStatement("delete from Hotel where name = ?");
		myStmt.setString(1, name);
		int i = myStmt.executeUpdate();

		System.out.println("Delete complete.");

		return i;
	}

	public int updateHotel(String name, double price) throws Exception {
		PreparedStatement myStmt = connection.prepareStatement("update Hotel set price_per_day = ? where name = ?");
		myStmt.setString(2, name);
		myStmt.setDouble(1, price);
		int i = myStmt.executeUpdate();

		System.out.println("Price Update complete.");

		return i;
	}

	public List<Hotel> getHotels(String location, String checkin, String checkout, int rooms) throws Exception {

		List<Hotel> availHotels = new ArrayList<>();
		PreparedStatement myStmt = connection.prepareStatement("SELECT * FROM `Hotel` WHERE `location` = ?");
		myStmt.setString(1, location);

		ResultSet rs = myStmt.executeQuery();

		while (rs.next()) {
			int totalrooms = rs.getInt(4), givenRooms = 0;
			int id = rs.getInt(1);

			PreparedStatement stmt = connection.prepareStatement(
					"SELECT SUM(no_of_rooms) AS `given` FROM `HotelBooking` WHERE `hotel_id` = ? and `checkin`<= ? and `checkout`>= ? ");
			stmt.setInt(1, id);
			stmt.setString(3, checkin);
			stmt.setString(2, checkout);

			ResultSet rset = stmt.executeQuery();

			while (rset.next()) {
				// System.out.println(rset.getInt(1));
				givenRooms = rset.getInt(1);
			}

			if (totalrooms - givenRooms >= rooms) {
				// room available
				// System.out.println(id+" "+givenRooms+" "+totalrooms);
				// String temp = rs.getString(2)+"-"+rs.getString(5)+"-"+(totalrooms -
				// givenRooms);
				Hotel hotel = new Hotel();
				hotel.setName(rs.getString(2));
				hotel.setPrice(rs.getDouble(5));
				hotel.setRooms(rs.getInt(4));

				availHotels.add(hotel);
			}

		}

		return availHotels;
	}

	public String getHotelIdPrice(String name) throws Exception {
		String s = "";
		PreparedStatement myStmt = connection.prepareStatement("SELECT id,price_per_day FROM `Hotel` WHERE `name` = ? ");
		System.out.print(name);
		System.out.print(myStmt);
		myStmt.setString(1, name);
		System.out.print(myStmt);
		
		ResultSet rs = myStmt.executeQuery();

		while (rs.next()) {
			s+=rs.getInt(1)+"-";
			s+= rs.getInt(2);
		}
		return s;
	}
}

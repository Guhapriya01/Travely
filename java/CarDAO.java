import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.booking.Car;
import com.booking.Flight;

public class CarDAO {

	// Table Creation

	// CREATE TABLE`Travel`.`Car`(
	// `id` INT NOT NULL AUTO_INCREMENT,
	// `number` VARCHAR(100) NOT NULL ,
	// `location` VARCHAR(100) NOT NULL ,
	// `seats` INT NOT NULL ,
	// `price_per_day` DOUBLE NOT NULL ,
	// PRIMARY KEY (`id`))

	String url = "jdbc:mysql://localhost:3306/Travel";
	String username = "root";
	String password = "vishva123";

	Connection connection;

	public CarDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, username, password);
	}

	public int addCar(String name, String type, String location, int seats, double price) throws Exception {
		PreparedStatement myStmt = connection.prepareStatement(
				"insert into Car (number, location, type, seats, price_per_day) values (?,?,?, ?, ?)");
		myStmt.setString(1, name);
		myStmt.setString(2, location);
		myStmt.setString(3, type);
		myStmt.setInt(4, seats);
		myStmt.setDouble(5, price);

		int i = myStmt.executeUpdate();

		System.out.println("Insert complete.");

		return i;
	}

	public int deleteCar(String number) throws Exception {
		PreparedStatement myStmt = connection.prepareStatement("delete from Car where number = ?");
		myStmt.setString(1, number);
		int i = myStmt.executeUpdate();

		System.out.println("Delete complete.");

		return i;
	}

	public int updateCarPrice(String number, double price) throws Exception {
		PreparedStatement myStmt = connection.prepareStatement("update Car set price_per_day = ? where number = ?");
		myStmt.setString(2, number);
		myStmt.setDouble(1, price);
		int i = myStmt.executeUpdate();

		System.out.println("Price Update complete.");

		return i;
	}

	public int updateCarLocation(String number, String location) throws Exception {
		PreparedStatement myStmt = connection.prepareStatement("update Car set location = ? where number = ?");
		myStmt.setString(2, number);
		myStmt.setString(1, location);
		int i = myStmt.executeUpdate();

		System.out.println("Location Update complete.");

		return i;
	}

	public List<Car> getCars(String location, String date, String checkin, String checkout) throws Exception {

		String query = "SELECT * FROM `Car` c WHERE c.`location`= ? AND c.`id` NOT IN ("
				+ " SELECT 	car_id FROM `CarBooking` cb WHERE cb.date = ? AND " + "cb.checkin < ? OR cb.checkout > ?)";
		
		//System.out.print(query);

		List<Car> availCars = new ArrayList<>();
		PreparedStatement myStmt = connection.prepareStatement(query);
		myStmt.setString(1, location);
		myStmt.setString(2, date);
		myStmt.setString(3, checkout+":00");
		myStmt.setString(4, checkin+":00");
		
		System.out.print(myStmt);


		ResultSet rs = myStmt.executeQuery();

		while (rs.next()) {
			String type = rs.getString(3);
			int seats = rs.getInt(5);
			int id = rs.getInt(1);
			
			Car car = new Car();
			car.setPrice(rs.getDouble(6));
			car.setSeats(seats);
			car.setType(type);
			car.setNumber(rs.getString(2));
			availCars.add(car);

			System.out.println(type + " " + seats+" "+rs.getString(2));
		}
		return availCars;
	}
	
	public String getCarIdPrice(String number) throws Exception {

		String s = "", query = "SELECT id, price_per_day FROM `Car` WHERE `number` = ? ";

		PreparedStatement myStmt = connection.prepareStatement(query);
		myStmt.setString(1, number);
		System.out.print(myStmt);

		ResultSet rs = myStmt.executeQuery();

		while (rs.next()) {
			s += rs.getInt(1) + "-";
			s += rs.getDouble(2);
		}
		return s;
	}
}
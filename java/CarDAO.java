import java.sql.*;

public class CarDAO {

	// Table Creation
	
	//	CREATE TABLE`Travel`.`Car`(
	//	`id` INT NOT NULL AUTO_INCREMENT,
	// `number` VARCHAR(100) NOT NULL , 
	// `location` VARCHAR(100) NOT NULL , 
	// `seats` INT NOT NULL , 
	// `price_per_day` DOUBLE NOT NULL ,
	//	PRIMARY KEY (`id`))

	 String url = "jdbc:mysql://localhost:3306/Travel";
	 String username = "root";
	 String password = "vishva123";

	 Connection connection;
	
	public CarDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, username, password);
	}

	public int addCar(String name, String type, String location, int seats, double price) throws Exception{
		PreparedStatement myStmt = connection.prepareStatement("insert into Car (number, location, type, seats, price_per_day) values (?,?,?, ?, ?)");
		myStmt.setString(1,name);
		myStmt.setString(2,location);
		myStmt.setString(3,type);
		myStmt.setInt(4,seats);
		myStmt.setDouble(5,price);
		
		int i = myStmt.executeUpdate();
		
		System.out.println("Insert complete.");
		
		return i;
	}

	public int deleteCar(String number) throws Exception{
		PreparedStatement myStmt = connection.prepareStatement("delete from Car where number = ?");
		myStmt.setString(1,number);
		int i = myStmt.executeUpdate();
		
		System.out.println("Delete complete.");
		
		return i;
	}

	public int updateCarPrice(String number, double price) throws Exception {
		PreparedStatement myStmt = connection.prepareStatement("update Car set price_per_day = ? where number = ?");
		myStmt.setString(2,number);
		myStmt.setDouble(1,price);
		int i = myStmt.executeUpdate();
		
		System.out.println("Price Update complete.");
		
		return i;
	}
	
	public int updateCarLocation(String number, String location) throws Exception {
		PreparedStatement myStmt = connection.prepareStatement("update Car set location = ? where number = ?");
		myStmt.setString(2,number);
		myStmt.setString(1,location);
		int i = myStmt.executeUpdate();
		
		System.out.println("Location Update complete.");
		
		return i;
	}
}
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class FlightDAO {

	// DB Connection
	// com.mysql.jdbc.Driver.class
	// com.mysql.jdbc.Driver
	
	static String url = "jdbc:mysql://localhost:3306/Travel";
	static String username = "root";
	static String password = "vishva123";

	Connection connection;
	
	public FlightDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");	
		connection = DriverManager.getConnection(url, username, password);
		
	}

	public void addFlight(String name, String date) throws Exception{
		Statement myStmt = connection.createStatement();
		
		String sql = "insert into fli "
				+"(name, departure)"
				+ " values ('Matt', '2023-08-04')";
		myStmt.executeUpdate(sql);
		System.out.println("Insert complete.");
	}

	public static void deleteFlight() {

	}

	public static void updateFlight() {

	}
}

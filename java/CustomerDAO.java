import java.sql.*;

public class CustomerDAO {

	String url = "jdbc:mysql://localhost:3306/Travel";
	String username = "root";
	String password = "vishva123";

	Connection connection;

	public CustomerDAO() throws Exception {
		Class.forName("com.mysql.jdbc.Driver");
		connection = DriverManager.getConnection(url, username, password);
	}

	public int addCustomer(String name, String email, String mobile) throws Exception {

		int lastInsertedId = -1;

		PreparedStatement myStmt = connection
				.prepareStatement("insert into Customer (name, email, mobile) " + "values (?,?,?)",Statement.RETURN_GENERATED_KEYS);
		myStmt.setString(1, name);
		myStmt.setString(2, email);
		myStmt.setString(3, mobile);

		int i = myStmt.executeUpdate();
		if (i == 1) {

			ResultSet rs = myStmt.getGeneratedKeys();
			if (rs.next()) {
				lastInsertedId = rs.getInt(1);
				System.out.println("Last inserted id: " + lastInsertedId);
			}

			System.out.println("Insert complete.");
		}

		return lastInsertedId;
	}

	public void deleteCustomer() throws Exception {

	}

	public void updateCustomer() throws Exception {

	}
}

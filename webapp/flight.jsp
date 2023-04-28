<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.booking.Flight"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Flights</title>
<style>
* {
	font-family: RelativeSet, "Skyscanner Relative", -apple-system,
		BlinkMacSystemFont, "Roboto", "Oxygen", "Ubuntu", "Cantarell",
		"Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif
}

#notAvail {
	padding: 24px;
	text-align: center;
	font-size: 23px;
	color: #3d2a40;
	font-variant: petite-caps;
	font-weight: bolder;
}

.number-input {
	display: flex;
	align-items: center;
}

.number-input input {
	width: 100px;
	height: 30px;
	padding-right: 30px;
	border: 1px solid #ccc;
	border-radius: 5px;
	font-size: 16px;
	text-align: center;
}

.number-input .increment-btn {
	position: absolute;
	right: 10px;
	cursor: pointer;
}

.myList {
	padding-left: 100px;
	padding-right: 80px;
	padding-bottom: 50px;
	padding-top: 10px;
}

.myList div select {
	width: 209px;
	height: 40px;
	border-radius: 10px;
	border: none;
}

.myList div input {
	width: 209px;
	height: 40px;
	border-radius: 10px;
	border: none;
}

.myList div button {
	width: 209px;
	height: 40px;
	border-radius: 20px;
	color: white;
	background: blue;
	font-size: 17px;
	border: none;
	cursor: pointer;
}

#val{
	padding: 23px;
	box-shadow: aquamarine;
	font-size: 24px;
	text-align: center;
	font-style: oblique;
	font-variant: petite-caps;
	font-weight: bold;
}

.back-img {
	background: url("https://wallpaperaccess.com/full/254361.jpg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
}

.myList .pad {
	font-weight: bolder;
	display: flex;
	justify-content: space-evenly;
	padding-left: 233px;
	padding-right: 233px;
	padding-top: 20px;
	color: white
}
</style>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
</head>
<body style="margin: 0px;">
	<%@include file="all_components/navbar.jsp"%>
	<div class="back-img">
		<div>
			<h1 align="center"
				style="padding-top: 30px; color: white; margin: 0px;">The best
				flight deals to everywhere, from anywhere</h1>
		</div>
		<div style="padding-top: 10px;">
			<div class="myList" align="center">
				<form action="SearchFlight" method="post">
					<div class="pad">
						<select id="fcity-select" name="from">
							<option value="">From</option>
							<option value="new-york">New York</option>
							<option value="los-angeles">Los Angeles</option>
							<option value="chicago">Chicago</option>
							<option value="houston">Houston</option>
							<option value="miami">Miami</option>
						</select> <select id="tcity-select" name="to">
							<option value="">To</option>
							<option value="new-york">New York</option>
							<option value="los-angeles">Los Angeles</option>
							<option value="chicago">Chicago</option>
							<option value="houston">Houston</option>
							<option value="miami">Miami</option>
						</select>
					</div>

					<div class="pad">
						<label>Date</label> <input class="form-control" required
							name="date" placeholder="date" id="InputIn" type="text"
							onfocus="(this.type='date')" />
					</div>


					<div class="pad">
						<select id="economy-select" name="cabin">
							<option value="">Select Cabin</option>
							<option value="economy">Economy</option>
							<option value="premium">Premium Economy</option>
							<option value="business">Business Class</option>
							<option value="first_class">First Class</option>
						</select>
					</div>
					<div style="padding-top: 30px;">
						<button type="submit">
							Search <i class="fa fa-arrow-right" aria-hidden="true"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
	String flightName = "", cabin = "";
	%>

	<table class="table table-bordered"
		style="width: 80%; margin-left: 10%; margin-top: 55px;">
		<tbody>
			<%
			if (request.getAttribute("flights") != null) {

				ArrayList<Flight> flights = (ArrayList<Flight>) request.getAttribute("flights");

				if (flights.size() == 0) {
			%>
			<div id="notAvail">No Flights Available !!</div>
			<%
			} else {
			cabin = (String) request.getAttribute("cabin");

			for (Flight flight : flights) {
				flightName = (String) flight.getName();
			%>
			<tr>
				<td id="val"><%=flight.getName()%></td>
				<td style="text-align: center; padding-top: 3%;">  <span>&#8377;</span>  <b>  <%=flight.getPrice()%> </b></td>
				<td style="text-align: center; padding-top: 3%;">Depart at <b><%=flight.getDeparture()%></b></td>
				<form action="FlightName" method="post">
					<input id="name" name="name" type="hidden"
						value="<%=flight.getName()%>"> <input id="Gcabin"
						name="Gcabin" type="hidden" value="<%=cabin%>">
					<td style="text-align: center; padding-top: 2%;"><button
							style="border: none; color: white; background-color: #17931e; width:90px;border-radius: 14px; padding: 10px;"
							type="submit">Book</button></td>
				</form>
			</tr>
			<%
			}
			}
			}
			%>
		</tbody>
	</table>
</body>
</html>
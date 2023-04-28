<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8" import="java.util.*"%>
<%@ page import="com.booking.Hotel"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotels</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ"
	crossorigin="anonymous">
<%@include file="all_components/all_css.jsp"%>
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

.back-img {
	background:
		url("https://www.pixelstalk.net/wp-content/uploads/images6/4K-Travel-HD-Wallpaper.jpg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
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

.myList .pad {
	display: flex;
	justify-content: space-evenly;
	padding-left: 233px;
	padding-right: 233px;
	padding-top: 20px;
	color: white
}
</style>
</head>
<body style="margin: 0px">
	<%@include file="all_components/navbar.jsp"%>
	<div class="back-img">
		<div>
			<h1 align="center"
				style="padding-top: 30px; color: white; margin: 0px;">Find the
				right hotel today</h1>
		</div>
		<div style="padding-top: 10px;">
			<div class="myList" align="center">
				<form action="SearchHotel" method="post">
					<div class="pad">
						<label>Destination</label> <select id="city-select"
							name="location">
							<option value="bengalore">Bangalore</option>
							<option value="new-york">New York</option>
							<option value="los-angeles">Los Angeles</option>
							<option value="chicago">Chicago</option>
							<option value="houston">Houston</option>
							<option value="miami">Miami</option>
						</select>
					</div>

					<div class="pad">
						<label>Check-in</label> <input class="form-control" required
							name="checkin" placeholder="Check In" id="InputIn" type="text"
							onfocus="(this.type='date')" />
					</div>
					<div class="pad">
						<label>Check-out</label> <input class="form-control" required
							name="checkout" id="InputOut" placeholder="Check Out" type="text"
							onfocus="(this.type='date')" />
					</div>

					<div class="pad">
						<label>Rooms</label> <input type="number" value="0" min="0"
							name="rooms" max="50" id="rooms">
					</div>

					<div style="padding-top: 30px;">
						<button type="submit">
							Search Hotels <i class="fa fa-arrow-right" aria-hidden="true"></i>
						</button>
					</div>
				</form>
			</div>
		</div>
	</div>
	<%
	String hotelName = "";
	%>

	<table class="table table-bordered" style="width: 80%;margin-left: 10%;margin-top: 55px;">
		<tbody>
			<%
			if (request.getAttribute("hotels") != null) {
				ArrayList<Hotel> hotels = (ArrayList<Hotel>) request.getAttribute("hotels");
				if (hotels.size() == 0) {
					%>
					<div id="notAvail">No Hotels Available !!</div>
					<%
					} else {
				for (Hotel hotel : hotels) {
					hotelName = (String) hotel.getName();
			%>
			<tr>
				<td id="val"><%=hotel.getName()%></td>
				<td style="text-align: center;padding-top: 4%;">  <span>&#8377;</span>  <%=hotel.getPrice()%></td>
				<td style="text-align: center;padding-top: 3%;"><b style="font-size: 26px;"> <%=hotel.getRooms()%> </b> Rooms Available</td>
				<form action="HotelName" method="post">
					<input id="name" name="name" type="hidden" value="<%=hotel.getName()%>">
				<td style="text-align: center;padding-top: 2%;"><button  style="border: none;color: white; background-color: #17931e; width:90px;border-radius: 14px;padding: 10px;" type="submit">Book</button></td>
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
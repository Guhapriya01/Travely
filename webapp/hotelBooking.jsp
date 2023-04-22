<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotel Booking</title>
<style>
.btn {
	padding: 4px;
	padding-top: 4px;
	width: 128px;
	padding-top: 5px;
	margin-top: 29px;
	margin-bottom: 22px;
	color: #fff;
	background: #079992;
	border: none;
	border-radius: 17px;
	height: 35px;
	font-size: 19px;
}

.form-group label {
	padding-right: 8px;
}

.form-group input {
	height: 27px;
}

* {
	font-family: RelativeSet, "Skyscanner Relative", -apple-system,
		BlinkMacSystemFont, "Roboto", "Oxygen", "Ubuntu", "Cantarell",
		"Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif
}

.form-group, .head {
	padding-top: 15px;
}

#message {
	text-align: center;
	font-size: x-large;
	padding-bottom: -3px;
	font-variant: small-caps;
	font-weight: bolder;
	margin-top: 43px;
	margin-bottom: -25px;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body style="margin: 0px">
	<%@include file="all_components/navbar.jsp"%>
	<div>
		<div id="message"></div>
		<div class="card" style="padding-left: 30%; padding-right: 30%;">
			<div
				style="border-style: groove; border-radius: 46px; border-color: beige; margin-bottom: 77px; margin-top: 78px;">
				<div class="head" align="center">
					<i class="fa fa-ticket" aria-hidden="true" style="font-size: 40px;"></i>
					<h5 style="font-size: 20px; margin-top: 4px; margin-bottom: 10px;">
						Hotel Booking</h5>
				</div>
				<div class="content" align="center">
					<form action="BookHotel" method="post">
						<div class="form-group">
							<label>Full Name</label> <input class="form-control" required
								type="text" name="uname" id="InputName">
						</div>

						<div class="form-group">
							<label>Email</label> <input class="form-control" required
								style="margin-left: 36px;" type="email" name="email"
								id="InputEmail">
						</div>
						<div class="form-group" style="margin-left: 36px;">
							<label>Mobile Number</label> <input class="form-control" required
								type="phone" name="phone" id="InputPhone">
						</div>

						<%
						String hotelName = "";
						if (request.getAttribute("name") != null) {
							hotelName = (String) request.getAttribute("name");
						}
						%>

						<div class="form-group">
							<label>Hotel Name</label> <input class="form-control" required
								style="padding-right: 20px;" name="hname" id="InputIn"
								type="text" value="<%=hotelName%>" />
						</div>

						<div class="form-group">
							<label>Check-in</label> <input class="form-control" required
								style="padding-right: 20px;" name="checkin"
								placeholder="Check In" id="InputIn" type="text"
								onfocus="(this.type='date')" />
						</div>

						<div class="form-group">
							<label>Check-out</label> <input class="form-control" required
								name="checkout" id="InputOut" placeholder="Check Out"
								type="text" onfocus="(this.type='date')" />
						</div>

						<div class="form-group">
							<label>Rooms</label> <input type="number" value="0" min="0"
								style="padding-right: 28px;" name="rooms" max="50" id="rooms">
						</div>

						<button type="submit" class="btn">Book</button>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%
	String message = (String) session.getAttribute("message");
	session.removeAttribute("message");
	%>


	<script>
	    var message = '<%=message%>';
		if (message != 'null') {
			document.getElementById("message").innerHTML = message + " !!";
			if (message == "Successfully Booked") {
				document.getElementById("message").style.color = "green";
			} else {
				document.getElementById("message").style.color = "red";
			}

		}
	</script>
	<%@include file="all_components/footer.jsp"%>
</body>
</html>
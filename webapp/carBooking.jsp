<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Car Booking</title>
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

.pad select {
	width: 209px;
	height: 40px;
	margin: 15px;
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
						Car Booking</h5>
				</div>
				<div class="content" align="center">
					<form action="BookCar" method="post">
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
						<div class="form-group">
							<label>Date</label> <input class="form-control" required
								name="date" placeholder="date" id="InputIn" type="text"
								onfocus="(this.type='date')" />
						</div>

						<div class="pad">
							<select id="time-select" name="in">
								<option value="">Select pick up time</option>
								<option value="01:00">00:00</option>
								<option value="01:30">00:30</option>
								<option value="01:00">01:00</option>
								<option value="01:30">01:30</option>
								<option value="02:00">02:00</option>
								<option value="02:30">02:30</option>
								<option value="03:00">03:00</option>
								<option value="03:30">03:30</option>
								<option value="01:00">04:00</option>
								<option value="01:30">04:30</option>
								<option value="02:00">05:00</option>
								<option value="02:30">05:30</option>
								<option value="03:00">06:00</option>
								<option value="03:30">06:30</option>
								<option value="01:00">07:00</option>
								<option value="01:30">07:30</option>
								<option value="02:00">08:00</option>
								<option value="02:30">08:30</option>
								<option value="03:00">09:00</option>
								<option value="03:30">09:30</option>
								<option value="01:00">10:00</option>
								<option value="01:30">10:30</option>
								<option value="02:00">11:00</option>
								<option value="02:30">11:30</option>
								<option value="03:00">12:00</option>
								<option value="03:30">12:30</option>
								<option value="01:00">13:00</option>
								<option value="01:30">13:30</option>
								<option value="02:00">14:00</option>
								<option value="02:30">14:30</option>
								<option value="03:00">15:00</option>
								<option value="03:30">15:30</option>
								<option value="01:00">16:00</option>
								<option value="01:30">16:30</option>
								<option value="02:00">17:00</option>
								<option value="02:30">17:30</option>
								<option value="03:00">18:00</option>
								<option value="03:30">18:30</option>
								<option value="01:00">19:00</option>
								<option value="01:30">19:30</option>
								<option value="02:00">20:00</option>
								<option value="02:30">20:30</option>
								<option value="03:00">21:00</option>
								<option value="03:30">21:30</option>
								<option value="01:00">22:00</option>
								<option value="01:30">22:30</option>
								<option value="23:00">23:00</option>
								<option value="23:30">23:30</option>
							</select> <select id="time-select" name="out">
								<option value="">Select drop out time</option>
								<option value="01:00">00:00</option>
								<option value="01:30">00:30</option>
								<option value="01:00">01:00</option>
								<option value="01:30">01:30</option>
								<option value="02:00">02:00</option>
								<option value="02:30">02:30</option>
								<option value="03:00">03:00</option>
								<option value="03:30">03:30</option>
								<option value="01:00">04:00</option>
								<option value="01:30">04:30</option>
								<option value="02:00">05:00</option>
								<option value="02:30">05:30</option>
								<option value="03:00">06:00</option>
								<option value="03:30">06:30</option>
								<option value="01:00">07:00</option>
								<option value="01:30">07:30</option>
								<option value="02:00">08:00</option>
								<option value="02:30">08:30</option>
								<option value="03:00">09:00</option>
								<option value="03:30">09:30</option>
								<option value="01:00">10:00</option>
								<option value="01:30">10:30</option>
								<option value="02:00">11:00</option>
								<option value="02:30">11:30</option>
								<option value="03:00">12:00</option>
								<option value="03:30">12:30</option>
								<option value="01:00">13:00</option>
								<option value="01:30">13:30</option>
								<option value="02:00">14:00</option>
								<option value="02:30">14:30</option>
								<option value="03:00">15:00</option>
								<option value="03:30">15:30</option>
								<option value="01:00">16:00</option>
								<option value="01:30">16:30</option>
								<option value="02:00">17:00</option>
								<option value="02:30">17:30</option>
								<option value="03:00">18:00</option>
								<option value="03:30">18:30</option>
								<option value="01:00">19:00</option>
								<option value="01:30">19:30</option>
								<option value="02:00">20:00</option>
								<option value="02:30">20:30</option>
								<option value="03:00">21:00</option>
								<option value="03:30">21:30</option>
								<option value="01:00">22:00</option>
								<option value="01:30">22:30</option>
								<option value="23:00">23:00</option>
								<option value="23:30">23:30</option>
							</select>
						</div>
						<%
						String carType = "", carNumber = "";
						if (request.getAttribute("name") != null) {
							carType = (String) request.getAttribute("name");
							carNumber = (String) request.getAttribute("number");
						}
						%>

						<div class="form-group">
							<label>Car Type</label> <input class="form-control"
								style="padding-right: 20px;" name="type" id="InputIn"
								type="text" value="<%=carType%>">
						</div>

						<div class="form-group">
							<label>Car Number</label> <input class="form-control"
								style="padding-right: 20px;" name="number" id="InputIn"
								type="text" value="<%=carNumber%>">
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
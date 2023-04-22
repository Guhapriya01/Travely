<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
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

.tab {
	padding: 20px;
	display: flex;
	justify-content: space-evenly;
}

.tab a {
	text-decoration: none;
	color: black;
	width: 350px;
	height: 16px;
	padding: 22px;
	border: 2px solid #ddd7d7;
}

.tab a.active {
	background-color: #ccc;
}

.tabcontent {
	display: none;
	/*padding: 6px 12px;
	border: 1px solid #ccc;
	border-top: none;*/
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

.myList .pad label {
	padding-right: 50px;
}

.myList .pad {
	font-weight: bolder;
	/*display: flex;
	justify-content: space-evenly;
	padding-left: 233px;
	padding-right: 233px;*/
	padding-bottom: 20px;
	padding-top: 20px;
	color: black
}

#message {
	text-align: center;
	color: #844444;
	font-size: x-large;
	padding-bottom: -3px;
	font-variant: small-caps;
	font-weight: bolder;
}
</style>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body style="margin: 0px">
	<%@include file="../all_components/navbar.jsp"%>

	<h1 align="center"
		style="padding-top: 40px; color: black; margin: 0px; padding-bottom: 25px">
		<i class="fa fa-plane" aria-hidden="true"></i> Flights
	</h1>

	<div class="tab" align="center">
		<a href="#" class="tablinks" onclick="openTab(event, 'Tab1')">Add</a>
		<a href="#" class="tablinks" onclick="openTab(event, 'Tab2')">Update</a>
		<a href="#" class="tablinks" onclick="openTab(event, 'Tab3')">Delete</a>
	</div>

	<div id="message"></div>

	<div id="Tab1" class="tabcontent">
		<div style="padding-left: 13%; padding-right: 13%;">
			<div
				style="border-style: groove; border-radius: 46px; border-color: beige; margin-bottom: 77px; margin-top: 70px;">
				<div class="content" align="center">
					<div>
						<div style="padding-top: 10px;">
							<div class="myList" align="center">
								<form action="AddFlight" method="post">
									<div class="pad">
										<label>Name of the flight </label> <input class="form-control"
											required name="name" id="InputName" placeholder="Name"
											type="text" />
									</div>

									<div class="pad">
										<label>From </label> <select id="fcity-select" name="from">
											<option value="new-york">New York</option>
											<option value="los-angeles">Los Angeles</option>
											<option value="chicago">Chicago</option>
											<option value="houston">Houston</option>
											<option value="miami">Miami</option>
										</select>
									</div>

									<div class="pad">
										<label>To </label> <select id="tcity-select" name="to">
											<option value="new-york">New York</option>
											<option value="los-angeles">Los Angeles</option>
											<option value="chicago">Chicago</option>
											<option value="houston">Houston</option>
											<option value="miami">Miami</option>
										</select>
									</div>

									<div class="pad">
										<label>Departure Time</label> <select id="time-select"
											name="departureTime">
											<option value="">Select departure time</option>
											<option value="00:00">00:00</option>
											<option value="00:30">00:30</option>
											<option value="01:00">01:00</option>
											<option value="01:30">01:30</option>
											<option value="02:00">02:00</option>
											<option value="02:30">02:30</option>
											<option value="03:00">03:00</option>
											<option value="03:30">03:30</option>
											<option value="04:00">04:00</option>
											<option value="04:30">04:30</option>
											<option value="05:00">05:00</option>
											<option value="05:30">05:30</option>
											<option value="06:00">06:00</option>
											<option value="06:30">06:30</option>
											<option value="07:00">07:00</option>
											<option value="07:30">07:30</option>
											<option value="08:00">08:00</option>
											<option value="08:30">08:30</option>
											<option value="09:00">09:00</option>
											<option value="09:30">09:30</option>
											<option value="10:00">10:00</option>
											<option value="10:30">10:30</option>
											<option value="11:00">11:00</option>
											<option value="11:30">11:30</option>
											<option value="12:00">12:00</option>
											<option value="12:30">12:30</option>
											<option value="13:00">13:00</option>
											<option value="13:30">13:30</option>
											<option value="14:00">14:00</option>
											<option value="14:30">14:30</option>
											<option value="15:00">15:00</option>
											<option value="15:30">15:30</option>
											<option value="16:00">16:00</option>
											<option value="16:30">16:30</option>
											<option value="17:00">17:00</option>
											<option value="17:30">17:30</option>
											<option value="18:00">18:00</option>
											<option value="18:30">18:30</option>
											<option value="19:00">19:00</option>
											<option value="19:30">19:30</option>
											<option value="20:00">20:00</option>
											<option value="20:30">20:30</option>
											<option value="21:00">21:00</option>
											<option value="21:30">21:30</option>
											<option value="22:00">22:00</option>
											<option value="22:30">22:30</option>
											<option value="23:00">23:00</option>
											<option value="23:30">23:30</option>
										</select>
									</div>

									<div class="pad">
										<label>Arrival Time</label> <select id="time-select"
											name="arrivalTime">
											<option value="">Select arrival time</option>
											<option value="00:00">00:00</option>
											<option value="00:30">00:30</option>
											<option value="01:00">01:00</option>
											<option value="01:30">01:30</option>
											<option value="02:00">02:00</option>
											<option value="02:30">02:30</option>
											<option value="03:00">03:00</option>
											<option value="03:30">03:30</option>
											<option value="04:00">04:00</option>
											<option value="04:30">04:30</option>
											<option value="05:00">05:00</option>
											<option value="05:30">05:30</option>
											<option value="06:00">06:00</option>
											<option value="06:30">06:30</option>
											<option value="07:00">07:00</option>
											<option value="07:30">07:30</option>
											<option value="08:00">08:00</option>
											<option value="08:30">08:30</option>
											<option value="09:00">09:00</option>
											<option value="09:30">09:30</option>
											<option value="10:00">10:00</option>
											<option value="10:30">10:30</option>
											<option value="11:00">11:00</option>
											<option value="11:30">11:30</option>
											<option value="12:00">12:00</option>
											<option value="12:30">12:30</option>
											<option value="13:00">13:00</option>
											<option value="13:30">13:30</option>
											<option value="14:00">14:00</option>
											<option value="14:30">14:30</option>
											<option value="15:00">15:00</option>
											<option value="15:30">15:30</option>
											<option value="16:00">16:00</option>
											<option value="16:30">16:30</option>
											<option value="17:00">17:00</option>
											<option value="17:30">17:30</option>
											<option value="18:00">18:00</option>
											<option value="18:30">18:30</option>
											<option value="19:00">19:00</option>
											<option value="19:30">19:30</option>
											<option value="20:00">20:00</option>
											<option value="20:30">20:30</option>
											<option value="21:00">21:00</option>
											<option value="21:30">21:30</option>
											<option value="22:00">22:00</option>
											<option value="22:30">22:30</option>
											<option value="23:00">23:00</option>
											<option value="23:30">23:30</option>
										</select>
									</div>

									<div class="pad">
										<label>Economy</label> <input type="number"
											placeholder="Seats" min="0" max="100" id="Eseats"
											name="Eseats"> <input type="number" step="0.50"
											min="0" placeholder="Price" id="EPrice" name="EPrice">
									</div>

									<div class="pad">
										<label> Business class </label> <input type="number" min="0"
											placeholder="Seats" max="100" id="Bseats" name="Bseats">
										<input type="number" step="0.50" min="0" placeholder="Price"
											id="BPrice" name="BPrice">
									</div>

									<div class="pad">
										<label>Premium</label> <input type="number" min="0" max="100"
											placeholder="Seats" id="Pseats" name="Pseats"><input
											type="number" step="0.50" min="0" placeholder="Price"
											id="PPrice" name="PPrice">
									</div>

									<div class="pad">
										<label>First class </label> <input type="number" min="0"
											max="100" placeholder="Seats" id="Fseats" name="Fseats">
										<input type="number" step="0.50" min="0" placeholder="Price"
											id="FPrice" name="FPrice">
									</div>


									<div style="padding-top: 30px;">
										<button type="submit">
											Add <i class="fa fa-plus-circle" aria-hidden="true"></i>
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="Tab2" class="tabcontent">

		<div style="padding-left: 13%; padding-right: 13%;">
			<div
				style="border-style: groove; border-radius: 46px; border-color: beige; margin-bottom: 77px; margin-top: 70px;">
				<div class="content" align="center">
					<div>
						<div style="padding-top: 10px;">
							<div class="myList" align="center">
								<form action="UpdateFlight" method="post">
									<div class="pad">
										<label>Name of the flight </label> <input class="form-control"
											required name="name" id="InputName" placeholder="Name"
											type="text" />
									</div>
								<!--  <div class="pad">
										<label>Departure Date</label><input class="form-control"
											required name="departureDate" placeholder="Depart"
											id="InputDepart" type="text" onfocus="(this.type='date')" />
									</div> 
									-->	
									<div class="pad">
										<label>Departure Time</label> <select id="time-select"
											name="departureTime">
											<option value="">Select departure time</option>
											<option value="00:00">00:00</option>
											<option value="00:30">00:30</option>
											<option value="01:00">01:00</option>
											<option value="01:30">01:30</option>
											<option value="02:00">02:00</option>
											<option value="02:30">02:30</option>
											<option value="03:00">03:00</option>
											<option value="03:30">03:30</option>
											<option value="04:00">04:00</option>
											<option value="04:30">04:30</option>
											<option value="05:00">05:00</option>
											<option value="05:30">05:30</option>
											<option value="06:00">06:00</option>
											<option value="06:30">06:30</option>
											<option value="07:00">07:00</option>
											<option value="07:30">07:30</option>
											<option value="08:00">08:00</option>
											<option value="08:30">08:30</option>
											<option value="09:00">09:00</option>
											<option value="09:30">09:30</option>
											<option value="10:00">10:00</option>
											<option value="10:30">10:30</option>
											<option value="11:00">11:00</option>
											<option value="11:30">11:30</option>
											<option value="12:00">12:00</option>
											<option value="12:30">12:30</option>
											<option value="13:00">13:00</option>
											<option value="13:30">13:30</option>
											<option value="14:00">14:00</option>
											<option value="14:30">14:30</option>
											<option value="15:00">15:00</option>
											<option value="15:30">15:30</option>
											<option value="16:00">16:00</option>
											<option value="16:30">16:30</option>
											<option value="17:00">17:00</option>
											<option value="17:30">17:30</option>
											<option value="18:00">18:00</option>
											<option value="18:30">18:30</option>
											<option value="19:00">19:00</option>
											<option value="19:30">19:30</option>
											<option value="20:00">20:00</option>
											<option value="20:30">20:30</option>
											<option value="21:00">21:00</option>
											<option value="21:30">21:30</option>
											<option value="22:00">22:00</option>
											<option value="22:30">22:30</option>
											<option value="23:00">23:00</option>
											<option value="23:30">23:30</option>
										</select>
									</div>
									<div class="pad">
										<label>Arrival Time</label> <select id="time-select"
											name="arrivalTime">
											<option value="">Select arrival time</option>
											<option value="00:00">00:00</option>
											<option value="00:30">00:30</option>
											<option value="01:00">01:00</option>
											<option value="01:30">01:30</option>
											<option value="02:00">02:00</option>
											<option value="02:30">02:30</option>
											<option value="03:00">03:00</option>
											<option value="03:30">03:30</option>
											<option value="04:00">04:00</option>
											<option value="04:30">04:30</option>
											<option value="05:00">05:00</option>
											<option value="05:30">05:30</option>
											<option value="06:00">06:00</option>
											<option value="06:30">06:30</option>
											<option value="07:00">07:00</option>
											<option value="07:30">07:30</option>
											<option value="08:00">08:00</option>
											<option value="08:30">08:30</option>
											<option value="09:00">09:00</option>
											<option value="09:30">09:30</option>
											<option value="10:00">10:00</option>
											<option value="10:30">10:30</option>
											<option value="11:00">11:00</option>
											<option value="11:30">11:30</option>
											<option value="12:00">12:00</option>
											<option value="12:30">12:30</option>
											<option value="13:00">13:00</option>
											<option value="13:30">13:30</option>
											<option value="14:00">14:00</option>
											<option value="14:30">14:30</option>
											<option value="15:00">15:00</option>
											<option value="15:30">15:30</option>
											<option value="16:00">16:00</option>
											<option value="16:30">16:30</option>
											<option value="17:00">17:00</option>
											<option value="17:30">17:30</option>
											<option value="18:00">18:00</option>
											<option value="18:30">18:30</option>
											<option value="19:00">19:00</option>
											<option value="19:30">19:30</option>
											<option value="20:00">20:00</option>
											<option value="20:30">20:30</option>
											<option value="21:00">21:00</option>
											<option value="21:30">21:30</option>
											<option value="22:00">22:00</option>
											<option value="22:30">22:30</option>
											<option value="23:00">23:00</option>
											<option value="23:30">23:30</option>
										</select>
									</div>

									<div class="pad">
										<label>Economy</label> <input type="number" step="0.50"
											min="0" placeholder="Price" id="EPrice" name="EPrice">
									</div>

									<div class="pad">
										<label> Business class </label> <input type="number"
											step="0.50" min="0" placeholder="Price" id="BPrice"
											name="BPrice">
									</div>

									<div class="pad">
										<label>Premium</label><input type="number" step="0.50" min="0"
											placeholder="Price" id="PPrice" name="PPrice">
									</div>

									<div class="pad">
										<label>First class </label> <input type="number" step="0.50"
											min="0" placeholder="Price" id="FPrice" name="FPrice">
									</div>


									<div style="padding-top: 30px;">
										<button type="submit">
											Update <i class="fa fa-refresh" aria-hidden="true"></i>
										</button>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="Tab3" class="tabcontent">
		<div style="padding-left: 13%; padding-right: 13%;">
			<div
				style="border-style: groove; border-radius: 46px; border-color: beige; margin-bottom: 77px; margin-top: 70px;">
				<div class="content" align="center">
					<div>
						<div style="padding-top: 10px;">
							<div class="myList" align="center">
								<form action="DeleteFlight" method="post">
									<div class="pad">
										<label>Name of the flight </label> <input class="form-control"
											required name="name" id="InputName" placeholder="Name"
											type="text" />
									</div>

								<!--  	<div class="pad">
										<label>Departure Date</label><input class="form-control"
											required name="departureDate" placeholder="Depart"
											id="InputDepart" type="text" onfocus="(this.type='date')" />
									</div>

									<div class="pad">
										<label>Departure Time</label> <select id="time-select"
											name="departureTime">
											<option value="00:00">00:00</option>
											<option value="00:30">00:30</option>
											<option value="01:00">01:00</option>
											<option value="01:30">01:30</option>
											<option value="02:00">02:00</option>
											<option value="02:30">02:30</option>
											<option value="03:00">03:00</option>
											<option value="03:30">03:30</option>
											<option value="04:00">04:00</option>
											<option value="04:30">04:30</option>
											<option value="05:00">05:00</option>
											<option value="05:30">05:30</option>
											<option value="06:00">06:00</option>
											<option value="06:30">06:30</option>
											<option value="07:00">07:00</option>
											<option value="07:30">07:30</option>
											<option value="08:00">08:00</option>
											<option value="08:30">08:30</option>
											<option value="09:00">09:00</option>
											<option value="09:30">09:30</option>
											<option value="10:00">10:00</option>
											<option value="10:30">10:30</option>
											<option value="11:00">11:00</option>
											<option value="11:30">11:30</option>
											<option value="12:00">12:00</option>
											<option value="12:30">12:30</option>
											<option value="13:00">13:00</option>
											<option value="13:30">13:30</option>
											<option value="14:00">14:00</option>
											<option value="14:30">14:30</option>
											<option value="15:00">15:00</option>
											<option value="15:30">15:30</option>
											<option value="16:00">16:00</option>
											<option value="16:30">16:30</option>
											<option value="17:00">17:00</option>
											<option value="17:30">17:30</option>
											<option value="18:00">18:00</option>
											<option value="18:30">18:30</option>
											<option value="19:00">19:00</option>
											<option value="19:30">19:30</option>
											<option value="20:00">20:00</option>
											<option value="20:30">20:30</option>
											<option value="21:00">21:00</option>
											<option value="21:30">21:30</option>
											<option value="22:00">22:00</option>
											<option value="22:30">22:30</option>
											<option value="23:00">23:00</option>
											<option value="23:30">23:30</option>
										</select>
									</div> -->

									<div style="padding-top: 30px;">
										<button type="submit">
											Delete <i class="fa fa-minus-circle" aria-hidden="true"></i>
										</button>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<%
	String message = (String) session.getAttribute("message");
	String type = (String) session.getAttribute("type");

	session.removeAttribute("type");
	session.removeAttribute("message");
	%>
	<script>
	
        var message = '<%=message%>';
        var type = '<%=type%>';

		if (type == "Tab1" || type == "Tab2" || type == "Tab3") {
			document.getElementById(type).style.display = "block";
			//
		}

		if (message != 'null') {
			document.getElementById("message").innerHTML = message + " !!";
			//
		}
		// window.history.replaceState({}, document.title, window.location.pathname);

		console.log(type);

		function openTab(evt, tabName) {
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) {
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) {
				tablinks[i].className = tablinks[i].className.replace(
						" active", "");
			}
			document.getElementById(tabName).style.display = "block";
			evt.currentTarget.className += " active";
			
			document.getElementById("message").style.display="none";
		}
	</script>
</body>
</html>
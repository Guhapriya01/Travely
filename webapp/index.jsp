<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Travely</title>
<%@include file="all_components/all_css.jsp"%>
<style>
.back-img {
	background: url("img/index2.jpg");
	width: 100%;
	height: 65vh;
	background-repeat: no-repeat;
	background-size: cover;
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
}

.myButtons {
	display: flex;
	margin: 0 auto;
	justify-content: space-evenly;
}

.myButtons .item {
	width: 224px;
	height: 56px;
	text-align: center;
	padding: 22px;
	border: 2px solid #ddd7d7;
	border-radius: 21px;
}

.myButtons .item a {
	text-decoration: none;
	color: black;
}

.myButtons .item:hover {
	box-shadow: 0 1px 3px 0 rgba(37, 32, 31, .3);
}

.footer {
	background: #c8d6e5
}
</style>
</head>
<body style="margin: 0px">
	<%@include file="all_components/navbar.jsp"%>
	<div class="back-img">
		<div style="opacity: 1;">
			<h1 align="center"
				style="padding-top: 30px; color: white; margin: 0px;">
				<i class="fa fa-globe" aria-hidden="true"></i> Travely
			</h1>
		</div>

		<div style="padding-top: 10px;">
			<p align="center" style="color: white">Scan your favorite
				sites...</p>

			<div class="myList" align="center">
                            <form name="form" action="Filter" method="POST">
				<div class="pad">
					<!--  <input class="form-control" required type="text" placeholder="From"
						name="from" id="InputFrom"> -->
					<select id="city-select">
						<option value="">From</option>
						<option value="new-york">New York</option>
						<option value="los-angeles">Los Angeles</option>
						<option value="chicago">Chicago</option>
						<option value="houston">Houston</option>
						<option value="miami">Miami</option>
					</select>

					<!--  <input class="form-control"
						required type="text" placeholder="To" name="em" id="InputTo" /> -->
					<select id="city-select">
						<option value="">To</option>
						<option value="new-york">New York</option>
						<option value="los-angeles">Los Angeles</option>
						<option value="chicago">Chicago</option>
						<option value="houston">Houston</option>
						<option value="miami">Miami</option>
					</select>


				</div>
				<div class="pad">
					<input class="form-control" required name="em" placeholder="Depart"
						id="InputDepart" type="text" onfocus="(this.type='date')" /> <input
						class="form-control" required name="em" id="InputReturn"
						placeholder="Return" type="text" onfocus="(this.type='date')" />
				</div>
				
				<div style="padding-top: 30px;">
					<button type="submit">
						Search <i class="fa fa-arrow-right" aria-hidden="true"></i>
					</button>
				</div>
			</div>
		</div>
           </form>
	</div>

	<div style="padding-top: 30px;">
		<div class="myButtons">
			<div class="item">
				<a href="flight.jsp"><i class="fa fa-plane" aria-hidden="true"></i><br>
					Flights</a>
			</div>
			<div class="item">
				<a href="hotel.jsp"><i class="fa fa-building" aria-hidden="true"></i><br>
					Hotels</a>
			</div>
			<div class="item">
				<a href="car.jsp"><i class="fa fa-car" aria-hidden="true"></i><br>
					Cars</a>
			</div>
		</div>
	</div>

	<script>
		var citySelect = document.getElementById("city-select");

		citySelect.addEventListener("change", function() {
			var selectedCity = this.value;
			if (selectedCity) {
				// alert("You selected " + selectedCity + ".");
			} else {
				alert("Please select a city.");
			}
		});
	</script>


	<%@include file="all_components/footer.jsp"%>
</body>
</html>

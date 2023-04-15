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
<%@include file="all_components/all_css.jsp"%>
</head>
<body style="margin: 0px">
	<%@include file="all_components/navbar.jsp"%>
	<div class="back-img">
		<div>
			<h1 align="center"
				style="padding-top: 30px; color: white; margin: 0px;">The best
				flight deals to everywhere, from anywhere</h1>
		</div>
		<div style="padding-top: 10px;">
			<div class="myList" align="center">
				<div class="pad">
					<select id="fcity-select">
						<option value="">From</option>
						<option value="new-york">New York</option>
						<option value="los-angeles">Los Angeles</option>
						<option value="chicago">Chicago</option>
						<option value="houston">Houston</option>
						<option value="miami">Miami</option>
					</select> <select id="tcity-select">
						<option value="">To</option>
						<option value="new-york">New York</option>
						<option value="los-angeles">Los Angeles</option>
						<option value="chicago">Chicago</option>
						<option value="houston">Houston</option>
						<option value="miami">Miami</option>
					</select> <input class="form-control" required name="em"
						placeholder="Depart" id="InputDepart" type="text"
						onfocus="(this.type='date')" />
				</div>

				<div class="pad">
					<select id="city-select">
						<option value="">From</option>
						<option value="new-york">New York</option>
						<option value="los-angeles">Los Angeles</option>
						<option value="chicago">Chicago</option>
						<option value="houston">Houston</option>
						<option value="miami">Miami</option>
					</select> <select id="city-select">
						<option value="">To</option>
						<option value="new-york">New York</option>
						<option value="los-angeles">Los Angeles</option>
						<option value="chicago">Chicago</option>
						<option value="houston">Houston</option>
						<option value="miami">Miami</option>
					</select> <input class="form-control" required name="em" id="InputReturn"
						placeholder="Return" type="text" onfocus="(this.type='date')" />


				</div>

				<div class="pad">
					<label>Cabin</label> <select id="economy-select">
						<option value="econmy">Economy</option>
						<option value="premium">Premium Economy</option>
						<option value="business">Business Class</option>
						<option value="first">First Class</option>
					</select>
				</div>

				<div class="pad">
					<label>Members</label> <input type="number" value="0" min="0"
						max="100" id="members">

				</div>

				<div style="padding-top: 30px;">
					<button type="submit">
						Search <i class="fa fa-arrow-right" aria-hidden="true"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
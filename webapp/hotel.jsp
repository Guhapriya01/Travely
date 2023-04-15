<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotels</title>
<%@include file="all_components/all_css.jsp"%>
<style>
* {
	font-family: RelativeSet, "Skyscanner Relative", -apple-system,
		BlinkMacSystemFont, "Roboto", "Oxygen", "Ubuntu", "Cantarell",
		"Fira Sans", "Droid Sans", "Helvetica Neue", sans-serif
}

.back-img {
	background: url("https://www.pixelstalk.net/wp-content/uploads/images6/4K-Travel-HD-Wallpaper.jpg");
	width: 100%;
	height: 80vh;
	background-repeat: no-repeat;
	background-size: cover;
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
	color:white
}
</style>
</head>
<body style="margin: 0px">
	<%@include file="all_components/navbar.jsp"%>
	<div class="back-img">
		<div>
			<h1 align="center"
				style="padding-top: 30px; color: white; margin: 0px;">Find the right hotel today</h1>
		</div>
		<div style="padding-top: 10px;">

			<div class="myList" align="center">
				<div class="pad">
					<label>Destination</label> <select id="city-select">
						<option value="bengalore">Bangalore</option>
						<option value="new-york">New York</option>
						<option value="los-angeles">Los Angeles</option>
						<option value="chennai">Chennai</option>
						<option value="houston">Houston</option>
						<option value="miami">Miami</option>
					</select>
				</div>

				<div class="pad">
					<label>Check-in</label> <input class="form-control" required
						name="in" placeholder="Check In" id="InputIn" type="text"
						onfocus="(this.type='date')" />
				</div>
				<div class="pad">
					<label>Check-out</label> <input class="form-control" required
						name="out" id="InputOut" placeholder="Check Out" type="text"
						onfocus="(this.type='date')" />
				</div>

				<div class="pad">
					<label>Rooms</label> <input type="number" value="0" min="0"
						max="50" id="rooms">
				</div>

				<div style="padding-top: 30px;">
					<button type="submit">
						Search Hotels <i class="fa fa-arrow-right" aria-hidden="true"></i>
					</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>
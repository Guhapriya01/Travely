<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotels</title>
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
		<i class="fa fa-building" aria-hidden="true"></i> Hotels
	</h1>

	<div class="tab" align="center">
		<a href="#" class="tablinks" onclick="openTab(event, 'Tab1')">Add</a>
		<a href="#" class="tablinks" onclick="openTab(event, 'Tab2')">Update</a>
		<a href="#" class="tablinks" onclick="openTab(event, 'Tab3')">Delete</a>
	</div>

	<div id="Tab1" class="tabcontent">
		<div style="padding-left: 13%; padding-right: 13%;">
			<div
				style="border-style: groove; border-radius: 46px; border-color: beige; margin-bottom: 77px; margin-top: 70px;">
				<div class="content" align="center">
					<div>
						<div style="padding-top: 10px;">
							<div class="myList" align="center">
								<form action="AddHotel" method="post">
									<div class="pad">
										<label>Name of the Hotel </label> <input class="form-control"
											required name="name" id="InputName" placeholder="Name"
											type="text" />
									</div>

									<div class="pad">
										<label>Location </label> <select id="city-select" name="location">
											<option value="new-york">New York</option>
											<option value="los-angeles">Los Angeles</option>
											<option value="chicago">Chicago</option>
											<option value="houston">Houston</option>
											<option value="miami">Miami</option>
										</select>
									</div>

									<div class="pad">
										<label>Rooms</label> <input type="number" placeholder="Rooms" name="rooms"
											min="0" max="100" id="rooms">
									</div>

									<div class="pad">
										<label>Price per day</label> <input type="number" step="0.01" name="price"
											min="0" placeholder="Price" id="Price">
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
								<form action="UpdateHotel" method="post">
									<div class="pad">
										<label>Name of the Hotel </label> <input class="form-control"
											required name="name" id="InputName" placeholder="Name"
											type="text" />
									</div>
									<div class="pad">
										<label>Price per day</label> <input type="number" name="price"
											min="0" placeholder="Price" id="Price" step="0.01">
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
								<form action="DeleteHotel" method="post">
									<div class="pad">
										<label>Name of the Hotel </label> <input class="form-control"
											required name="name" id="InputName" placeholder="Name"
											type="text" />
									</div>
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

	<script>
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
		}
	</script>
</body>
</html>
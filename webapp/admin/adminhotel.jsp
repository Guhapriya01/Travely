<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hotels</title>
<%@include file="../all_components/all_css.jsp"%>
<style>
*{
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
</style>
<%@include file="../all_components/all_css.jsp"%>
</head>
<body style="margin: 0px">
	<%@include file="../all_components/navbar.jsp"%>

	<div class="tab" align="center">
		<a href="#" class="tablinks" onclick="openTab(event, 'Tab1')">Add</a>
		<a href="#" class="tablinks" onclick="openTab(event, 'Tab2')">Update</a>
		<a href="#" class="tablinks" onclick="openTab(event, 'Tab3')">Delete</a>
	</div>

	<div id="Tab1" class="tabcontent">
		<object type="text/html" data="hotel/addhotel.html"
			style="width: 100%; height: 574px;"></object>
	</div>

	<div id="Tab2" class="tabcontent">
		<object type="text/html" data="hotel/updatehotel.html"
			style="width: 100%; height: 100%;"></object>
	</div>

	<div id="Tab3" class="tabcontent">
		<object type="text/html" data="hotel/deletehotel.html"
			style="width: 100%; height: 100%;"></object>
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
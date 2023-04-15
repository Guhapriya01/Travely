<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@include file="all_components/all_css.jsp"%>
<title>Login</title>
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
</style>
</head>
<body style="margin: 0px">
	<%@include file="all_components/navbar.jsp"%>
	<div>
		<div style="padding-left: 30%; padding-right: 30%;">
			<div
				style="border-style: groove; border-radius: 46px; border-color: beige; margin-bottom: 77px; margin-top: 78px;">
				<div class="head" align="center">
					<i class="fa fa-user-circle" aria-hidden="true"
						style="font-size: 40px;"></i>
					<h5 style="font-size: 20px; margin-top: 4px; margin-bottom: 010px;">Login</h5>
				</div>
				<div class="content" align="center">
					<form action="login" method="post">
						<div class="form-group">
							<label>Enter Email </label> <input required type="email"
								name="em" id="InputEmail">
						</div>
						<div class="form-group">
							<label>Enter Password </label> <input required type="password"
								name="ps" id="InputPassword">
						</div>
						<button type="submit" class="btn">Login</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_components/footer.jsp"%>
</body>
</html>
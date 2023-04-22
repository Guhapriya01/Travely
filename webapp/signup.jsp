<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<%@include file="all_components/all_css.jsp"%>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css"
	integrity="sha512-iecdLmaskl7CVkqkXNQ/ZH/XLlvWZOJyj7Yy7tcenmpD1ypASozpmT/E0iPtmFIB46ZmdtAc9eNBvH0H/ZpiBw=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body style="margin: 0px">
	<%@include file="all_components/navbar.jsp"%>
	<div>
		<div class="card" style="padding-left: 30%; padding-right: 30%;">
			<div class="card-body"
				style="border-style: groove; border-radius: 46px; border-color: beige; margin-bottom: 77px; margin-top: 78px;">
				<div class="head" align="center">
					<i class="fa fa-user-plus" aria-hidden="true"
						style="font-size: 40px;"></i>
					<h5 style="font-size: 20px; margin-top: 4px; margin-bottom: 10px;">Registration</h5>
				</div>
				<div class="content" align="center">
					<form action="register" method="post">
						<div class="form-group">
							<label>Full Name</label> <input class="form-control" required
								type="text" name="name" id="InputName">
						</div>

						<div class="form-group">
							<label>Email</label> <input class="form-control" required style="margin-left: 36px;"
								type="email" name="em" id="InputEmail">
						</div>
						<div class="form-group" style="margin-left: -36px;">
							<label>Mobile Number</label> <input class="form-control" required
								type="phone" name="phone" id="InputPhone">
						</div>
						<div class="form-group" style="margin-left: 5px;">
							<label>Password</label> <input class="form-control"
								required type="password" name="ps" id="InputPassword">
						</div>
						<button type="submit" class="btn">Register</button>
					</form>
				</div>
			</div>
		</div>
	</div>

	<%@include file="all_components/footer.jsp"%>
</body>
</html>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="assets/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/all.min.css">
<link rel="stylesheet" href="assets/css/fontawesome.min.css">
<link rel="stylesheet" href="assets/css/register.css">
<link rel="shortcut icon" href="assets/img/favicon.ico"
	type="image/x-icon">
<script src="assets/js/jquery.min.js"></script>
<script src="assets/js/bootstrap.min.js"></script>
<script src="assets/js/all.min.js"></script>

<script>
	function fun1() {

		var img = document.getElementById("scrl");
		console.log(img.scrollTop);

		img.style.backgroundColor = "none";

		img.style.backgroundColor = "white";

		img.style.boxShadow = "0px 0px 10px 0px #ccc";

	}
</script>
<title>Login/Register</title>
</head>
<body onscroll="fun1()">
	<%
		if (!(session.getAttribute("uname") == null)) {
		response.sendRedirect("assets/index.jsp");
	}
	%>
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="scrl">
		<div class="container">
			<a class="navbar-brand" href="assets/index.jsp"><img
				src="assets/img/Logo (1).png" height="70px" width="150px" alt=""
				srcset=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav ml-auto">
					<a class="nav-text ml-3" class="active" href="assets/index.jsp">Home
						<span class="sr-only">(current)</span>
					</a> <a class="nav-text" class="nav-link nav-text" href="about.jsp">About</a>
					<a class="nav-text" class="nav-link" href="contact.jsp">Contact
						Us</a> <a class="nav-text" class="nav-link" href="chooseUser.jsp">Login/Register</a>
				</div>
			</div>
		</div>
	</nav>
	<div class="row">
		<div class="col-sm-4">
			<h1 class="head">
				Placement <br>Helper
			</h1>
			<p class="text-left mt-4" id="about">
				Tired of working "inside the box"? <br> Come join us , Our team
				of Placement Helper provides you ample opportunities to Work on the
				leading edge of knowledge and plan your placement journey in a very
				effective manner.
			</p>

			<img class="gif main" src="../assets/img/animation_640_kf9m9dbn.gif"
				alt="">
		</div>
		<div class="col-sm-7">
			<div class="container">
				<div class="body">
					<div class="row">
						<div class="col-md-6 mx-auto p-0">
							<div class="card box">
								<div class="login-box">
									<div class="login-snip">
										<input id="tab-1" type="radio" name="tab" class="sign-in"
											checked><label for="tab-1" class="tab">Login</label>
										<input id="tab-2" type="radio" name="tab" class="sign-up"><label
											for="tab-2" class="tab">Sign Up</label>
										<div class="login-space">
											<div class="login">
												<div id="fogot">
													<a href="#">Forgot Password?</a>
												</div>
												<%
													String loginAs = request.getParameter("loginAs");
												session.setAttribute("loginAs", loginAs);
												%>
												<form action="LoginServlet" method="post">
													<div class="group mt-4">
														<label for="uname" class="label">Username</label> <input
															id="uname" name="uname" type="text" class="input"
															placeholder="Enter your username">
													</div>
													<div class="group">
														<label for="pass" class="label">Password</label> <input
															id="pass" type="password" name="pass" class="input"
															data-type="password" placeholder="Enter your password">
													</div>
													<p style="color: pink; font-weight: bold;"><%=(request.getAttribute("alreadyReg") == null) ? "" : request.getAttribute("alreadyReg")%></p>
													<p style="color: pink; font-weight: bold;"><%=(request.getParameter("loginFirst") == null) ? "" : request.getParameter("loginFirst")%></p>
													<p style="color: pink; font-weight: bold;"><%=(request.getAttribute("registered") == null) ? "" : request.getAttribute("registered")%></p>
													<p style="color: pink; font-weight: bold;"><%=(request.getAttribute("error") == null) ? "" : request.getAttribute("error")%></p>
													<p style="color: pink; font-weight: bold;"><%=(request.getAttribute("details_filled") == null) ? "" : request.getAttribute("details_filled")%></p>

													<div class="group">
														<input id="check" type="checkbox" class="check"
															name="check" checked> <label for="check"><span
															class="icon"></span> Keep me Signed in</label>
													</div>
													<div class="group">
														<input type="submit" class="button" value="Sign In">
													</div>
												</form>
											</div>
											<div class="sign-up-form">
												<form action="RegisterServlet" method="post">
													<div class="foot">
														<label for="tab-1">Already Member?</label>
													</div>
													<div class="group">
														<label for="user" class="label">Username</label> <input
															id="user" name="uname" type="text" class="input"
															placeholder="Create your Username">
													</div>
													<div class="group">
														<label for="pass" class="label">Password</label> <input
															id="pass" name="pass" type="password" class="input"
															data-type="password" placeholder="Create your password">
													</div>
													<div class="group">
														<label for="repeatPass" class="label">Repeat
															Password</label> <input id="repeatPass" name="repeatPass"
															type="password" class="input" data-type="password"
															placeholder="Repeat your password">
													</div>
													<div class="group">
														<label for="pass" class="label">Email Address</label> <input
															id="pass" name="email" type="text" class="input"
															placeholder="Enter your email address">
													</div>
													<p style="color: pink; font-weight: bold;"><%=request.getAttribute("passMismatch") == null ? "" : request.getAttribute("passMismatch")%></p>

													<div class="group">
														<input type="submit" class="button" value="Sign Up">
													</div>
												</form>

											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-3"></div>
	</div>
	<!----footer---->
	<div class="footer mt-5">
		<div class="row foot">
			<div class="col-sm-3">
				<div class="d-flex justify-content-center logo-foot">
					<img src="assets/img/Logo (1).png" height="120px" width="250px"
						alt="">
				</div>
				<div class="para-foot ml-4">
					<p>Our team of Placement Helper provides you ample
						opportunities to Work on the leading edge of knowledge and plan
						your placement journey in a very effective manner.</p>
				</div>

			</div>
			<div class="col-sm-6 content">
				<div class="container">
					<a href="chooseUser.jsp"><h6 class="text-center mt-3" id="h6">Log-in</h6></a>
					<a href="chooseUser.jsp"><h5 class="text-center" id="h5">Register</h5></a>
					<a href="about.jsp"><h4 class="text-center" id="h4">About-Us</h4></a>
					<a href="contact.jsp"><h3 class="text-center" id="h3">Contact-Us</h3></a>

					<hr class="above-hr">
					<div class="text-center text-md-center">
						<ul class="list-unstyled list-inline">
							<li class="list-inline-item"><a
								class="btn-floating btn-sm rgba-white-slight mx-1"> <i
									style="color: white;" class="fab fa-facebook-f social"></i>
							</a></li>
							<li class="list-inline-item"><a
								class="btn-floating btn-sm rgba-white-slight mx-1"> <i
									style="color: white;" class="fab fa-twitter social"></i>
							</a></li>
							<li class="list-inline-item"><a
								class="btn-floating btn-sm rgba-white-slight mx-1"> <i
									style="color: white;" class="fab fa-google-plus-g social"></i>
							</a></li>
							<li class="list-inline-item"><a
								class="btn-floating btn-sm rgba-white-slight mx-1"> <i
									style="color: white;" class="fab fa-linkedin-in social"></i>
							</a></li>
						</ul>
					</div>
					<hr class="below-hr">
					<div class="copyright">
						<p class="text-center ml-3 text-md-center"
							style="color: white; font-size: small;">
							© 2020 Copyright: <a href="https://mdbootstrap.com/">
								E-Placement Helper.com </a>
						</p>
					</div>

				</div>
			</div>
			<div class="col-sm-3">
				<div class="pr-5 gif">
					<img src="assets/img/animation_640_kg1adc77.gif" height="300px"
						alt="">

				</div>

			</div>
		</div>

	</div>
</body>
</body>
</html>
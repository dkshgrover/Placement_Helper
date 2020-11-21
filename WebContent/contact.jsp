<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=, initial-scale=1.0">
<link rel="stylesheet" href="./assets/css/contact1.css">
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/fontawesome.min.css">
<link rel="shortcut icon" href="./assets/img/favicon.ico"
	type="image/x-icon">
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/all.min.js"></script>

<title>Contact Us</title>
<script>
     
         function fun1()
    {

        var img = document.getElementById("scrl");
        console.log(img.scrollTop);
      
         img.style.backgroundColor="none";
      
          img.style.backgroundColor="white";
        
          img.style.boxShadow="0px 0px 10px 0px #ccc";
    
    }
    </script>
<!-- <img src="./assets/img/Desktop - 2imgbg.svg" alt="" srcset=""> -->
<!-- <img src="./assets/img/Group 12left.svg" alt="" srcset=""> -->
</head>
<body onscroll="fun1()">
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="scrl">
		<div class="container">
			<a class="navbar-brand" href="assets/index.jsp"><img
				src="./assets/img/Logo (1).png" height="70px" width="150px" alt=""
				srcset=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav ml-auto">
					<a class="nav-text ml-3" class="active" href="assets/index.jsp" style="text-decoration:none;">Home
						<span class="sr-only">(current)</span>
					</a> <a class="nav-text" class="nav-link nav-text" href="about.jsp" style="text-decoration:none;">About</a>
					<a class="nav-text" class="nav-link" href="contact.jsp" style="text-decoration:none;">Contact
						Us</a>
					<%
						if (session.getAttribute("uname") != null) {
						ResultSet rs = (ResultSet) session.getAttribute("resultSet");
						out.print("<div class='dropdown'>");
						out.print(
						"<button class='btn btn-primary dropdown-toggle mt' style='margin-left:4%;' type='button' id='dropdownMenuButton' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
								+ rs.getString(2) + "</button>");
						out.print("<div class='dropdown-menu' aria-labelledby='dropdownMenuButton'>");
						out.print("<a class='dropdown-item' href='iPortfolio/index.jsp'>Dashboard</a>");
						out.print("<a class='dropdown-item' href='logoutServlet?as=student'>Log-Out</a>");
						out.print("</div>");
						out.print("</div>");
					} else {
						out.print("<a class='nav-text' class='nav-link' href='chooseUser.jsp' style='text-decoration:none;'>Login/Register</a>");
					}
					%>
				</div>
			</div>
		</div>
	</nav>
	<div class="contact-full">
		<div class="container">
			<div class="contact-full-inner">

				<div class="row">
					<div class="col-sm-4 col-lg-4 col-md-4" class="left-box">

						<img src="./assets/img/Group 12left.svg" id="left" alt=""
							srcset="">
						<div class="text">CONTACT US</div>
						<div class="border"></div>
						<div class="social-icons">
							<img src="./assets/img/Vectorfb.svg" id="icon1" alt="" srcset="">
							<img src="./assets/img/Vectorinsta.svg" id="icon2" alt=""
								srcset=""> <img src="./assets/img/Vectortweet.svg"
								id="icon3" alt="" srcset=""> <img
								src="./assets/img/Vectorlinkedin.svg" id="icon4" alt=""
								srcset="">
						</div>
					</div>
					<div class="col-sm-8 col-lg-8 col-md-8">

						<h1 id="heading" class="text-center mt-5">Get in touch!</h1>
						<div class="container mt-5">
							<div class="row">
								<div class="col-sm-4">
									<div class="d-flex justify-content-center">
										<img src="./assets/img/Grouplocation.svg" height="50px" alt="">

									</div>
									<!-- <img src="./assets/img/Grouplocation.svg" id="location" alt="" srcset=""> -->

									<p class="text-center mt-3">
										Mohali-160343<br>Punjab
									</p>
								</div>
								<div class="col-sm-4 col-lg-4 col-md-4">
									<div class="d-flex justify-content-center">
										<img src="./assets/img/Group 6call.svg" height="50px" alt="">

									</div>
									<!-- <img src="./assets/img/Group 6call.svg" id="call" alt="" srcset=""> -->
									<p class="text-center mt-3">+91-89682-83580</p>
								</div>
								<div class="col-sm-4 col-lg-4 col-md-4">
									<div class="d-flex justify-content-center">
										<img src="./assets/img/clarity_envelope-linemsg.svg"
											height="50px" alt="">

									</div>
									<!-- <img src="./assets/img/clarity_envelope-linemsg.svg" id="msg" alt="" srcset=""> -->
									<p class="text-center mt-3">arsharora5@gmail.com</p>
								</div>
							</div>
						</div>
						<div class="container">
							<div class="input-box">
								<div class="row">
									<div class="col-sm-6 col-lg-6 col-md-6">
										<div class="container">
											<form action="contactUs" method="post">
												<input class="ml-5" id="name" type="text" name="name"
													placeholder="Name"> <input class="ml-5 pt-5"
													id="subject" type="text" name="subject"
													placeholder="Subject">
										</div>
									</div>
									<div class="col-sm-6 col-lg-6 col-md-6">
										<div class="container">

											<input class="ml-5" id="email" type="text" name="email"
												placeholder="Email"> <input class="ml-5 pt-5"
												id="msg1" type="text" name="descr" placeholder="Message">

										</div>
									</div>
								</div>
								<div class="d-flex justify-content-center">
									<input type="submit" class="cont btn1" value="Send">
								</div>
								<p class="text-center" style="color: red;"><%=(request.getAttribute("saved") == null)?"":request.getAttribute("saved") %></p>

								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<footer>
		<div class="footer mt-5">
			<div class="row foot">
				<div class="col-sm-3">
					<div class="d-flex justify-content-center logo-foot">
						<img src="./assets/img/Logo (1).png" height="120px" width="250px"
							alt="">
					</div>
					<div class="para-foot ml-4">
						<h6>Our team of Placement Helper provides you ample
							opportunities to Work on the leading edge of knowledge and plan
							your placement journey in a very effective manner.</h6>
					</div>

				</div>
				<div class="col-sm-6 content">
					<div class="container">
						<a href="chooseUser.jsp" style="text-decoration:none;"><h6 class="text-center mt-3" id="h6">Log-in</h6></a>
						<a href="chooseUser.jsp" style="text-decoration:none;"><h5 class="text-center" id="h5">Register</h5></a>
						<a href="about.jsp" style="text-decoration:none;"><h4 class="text-center" id="h4">About-Us</h4></a>
						<a href="contact.jsp" style="text-decoration:none;"><h3 class="text-center" id="h3">Contact-Us</h3></a>
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
						<img src="./assets/img/animation_640_kg1adc77.gif" height="300px"
							alt="">

					</div>

				</div>
			</div>

		</div>
	</footer>
</body>
</html>
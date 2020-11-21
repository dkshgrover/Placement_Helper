<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.PrintWriter"%>
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
<link rel="stylesheet" href="./css/main.css">
<link rel="stylesheet" href="./css/all.min.css">
<link rel="stylesheet" href="./css/bootstrap.min.css">
<link rel="shortcut icon" href="./img/favicon.ico" type="image/x-icon">
<script src="./js/jquery.min.js"></script>
<script src="./js/bootstrap.min.js"></script>
<script src="./js/all.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/waypoints/4.0.1/jquery.waypoints.min.js"
	integrity="sha512-CEiA+78TpP9KAIPzqBvxUv8hy41jyI3f2uHi7DGp/Y/Ka973qgSdybNegWFciqh6GrN2UePx2KkflnQUbUhNIA=="
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Counter-Up/1.0.0/jquery.counterup.min.js"
	integrity="sha512-d8F1J2kyiRowBB/8/pAWsqUl0wSEOkG5KATkVV4slfblq9VRQ6MyDZVxWl2tWd+mPhuCbpTB4M7uU/x9FlgQ9Q=="
	crossorigin="anonymous"></script>
<script type="text/javascript">
	jQuery(document).ready(function($) {
		$('.counter').counterUp({
			delay : 1,
			time : 5000
		});
	});
</script>

<script>
	function fun1() {

		var img = document.getElementById("scrl");

		img.style.backgroundColor = "none";

		img.style.backgroundColor = "white";

		img.style.boxShadow = "0px 0px 10px 0px #ccc";

	}
</script>
<title>Placement Helper</title>

</head>
<body onscroll="fun1()">
	<nav class="navbar navbar-expand-lg navbar-dark fixed-top" id="scrl">
		<div class="container">
			<a class="navbar-brand" href="index.jsp"><img
				src="img/Logo (1).png" height="70px" width="150px" alt="" srcset=""></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNavAltMarkup" aria-controls="navbarNavAltMarkup"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavAltMarkup">
				<div class="navbar-nav ml-auto">
					<a class="nav-text ml-3" class="active" href="./index.jsp" style="text-decoration:none;">Home
						<span class="sr-only">(current)</span>
					</a> <a class="nav-text" class="nav-link nav-text" href="../about.jsp" style="text-decoration:none;">About</a>
					<a class="nav-text" class="nav-link" href="../contact.jsp" style="text-decoration:none;">Contact
						Us</a>
					<%
						if ((session.getAttribute("uname") == null)) {
							out.print("<a class='nav-text' class='nav-link' href='../chooseUser.jsp' style='text-decoration:none;'>Login/Register</a>");
						} else {
							ResultSet rs = (ResultSet) session.getAttribute("resultSet");
							if (rs.getString(33).equals("pending")) {
								session.removeAttribute("uname");
								session.removeAttribute("resultSet");
								response.sendRedirect("../register.jsp?loginAs=student&status=Request not accepted yet**");
							}else if(rs.getString(33).equals("accepted") && rs.getString(2) == null){
								response.sendRedirect("../iPortfolio/form.jsp");
							} else {
								out.print("<div class='dropdown'>");
								out.print(
								"<button class='btn btn-primary dropdown-toggle' type='button' id='dropdownMenuButton' data-toggle='dropdown' aria-haspopup='true' aria-expanded='false'>"
										+ rs.getString(2) + "</button>");
								out.print("<div class='dropdown-menu' aria-labelledby='dropdownMenuButton'>");
								out.print("<a class='dropdown-item' href='../iPortfolio/index.jsp'>Dashboard</a>");
								out.print("<a style='cursor: pointer;' class='dropdown-item' data-toggle='modal' data-target='#exampleModal'>Change Password</a>");
								out.print("<a class='dropdown-item' href='../logoutServlet?as=student'>Log-Out</a>");
								out.print("</div>");
								out.print("</div>");
							}
					}
					%>
				</div>
			</div>
		</div>
		<div id="alert" style="width: 100%;position: fixed;margin-top: 150px;"> </div>
	</nav>
	<!-- Modal -->
	<div class="modal fade" id="exampleModal" tabindex="-1"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">Change Password</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">
					<div class="container formChange">
						<form action="../changePass?as=student" method="post">
							<div class="input-group mb-3">

								<input type="password" required class="form-control"
									placeholder="Password" name="oldP" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>
							<div class="input-group mb-3">

								<input type="password" required class="form-control"
									id="newPass" placeholder="New Password" name="newP"
									aria-label="Username" aria-describedby="basic-addon1">
							</div>
							<div class="input-group mb-3">

								<input type="password" required class="form-control"
									id="confirmPass" name="repeatPass"
									placeholder="Confirm Password" aria-label="Username"
									aria-describedby="basic-addon1">
							</div>
							<div class="modal-footer">

								<input type="submit" id="sub" value="Save changes"
									class="btn btn-primary">
							</div>
						</form>
					</div>
					<div id="succes"></div>
				</div>

			</div>
		</div>
	</div>
	<h1 class="tagline">
		Open Minds, <br> Creating <br> Future
	</h1>
	<p class="about">
		Tired of working "inside the box"? <br> Come join us , Our team
		of Placement Helper provides you ample opportunities to Work on the
		leading edge of knowledge and plan your placement journey in a very
		effective manner.
	</p>
	<button onclick="document.location='../chooseUser.jsp';"
		class="register-btn">Register Now</button>
	<div class="row scnd">
		<div class="col-sm-5">
			<div class="container">
				<img src="./Group 174.svg" width="500px" height="500px" alt="">
			</div>
		</div>
		<div class="col-sm-7">
			<div class="container">
				<h2 class="text-center motto-tag">OUR MOTTO</h2>
				<hr>
				<p class="text-center mt-5">
					Our motto for this app is quality and assured placement help to the
					students of a college.<br>We provide students a better vision
					of journey to there placement by providing them with the latest
					stuff asked by a company in their recent years. Placement helper
					also provides you all details of projects that was selected by top
					mnc's in previous years. <br>Is that all??<br> No , we
					have also provided a fun way to check your skills as well , a
					college authority can upload a game quiz through which one student
					can check themselves. <br> Hence this app is all in one portal
					for a student to get placement in there dream companies.
				</p>
			</div>
		</div>
	</div>
	<!--------------------------------------->

	<div class="version1" id="top">
		<section class="wexp relative" id="resume">
			<div class="container">
				<h1 class="heading text-right">
					TOP <br>PROJECTS
				</h1>
				<div class="row wexp-angle">
					<div class="col-lg-4 col-md-6">
						<div class="single-block">
							<div class="single-block-outer">
								<div class="single-block-inner">
									<img class="e-img"
										src="http://www.codepixar.com/html/sciome/landing/img/experience/e2.png"
										alt="">
									<h4 class="e-head text-center">Airline reservation system</h4>
									<p class="e-sub-head">Er. Harsh Arora (L&T Infotech)</p>
									<div class="e-para wow fadeIn" data-wow-duration="1s">
										<p>It is a comprehensive passenger processing system that
											includes inventory, fares, e-ticket operations, and online
											transactions.</p>
									</div>
									<%
										if (!(session.getAttribute("uname") == null)) {
										out.print("<a class='genric-btn2' href='../getProjectDetails?p_id=4'>More Details</a>");
									} else {
										out.print(
										"<a class='genric-btn2' href='../register.jsp?loginAs=student&loginFirst=Please Login First**'>More Details</a>");
									}
									%>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6">
						<div class="single-block">
							<div class="single-block-outer">
								<div class="single-block-inner">
									<img class="e-img"
										src="http://www.codepixar.com/html/sciome/landing/img/experience/e2.png"
										alt="">
									<h4 class="e-head">Data Analyzer</h4>
									<p class="e-sub-head">Er. Anish Raheja (TCS)</p>
									<div class="e-para wow fadeIn" data-wow-duration="1s"
										data-wow-delay=".4s">
										<p>Data Analysis is an application used to convert the
											tabular data to its Graphical Representation. It firstly
											converts the big tabular data to comprised data using the
											concept of Averages and other mathematical concepts.</p>
									</div>
									<%
										if (!(session.getAttribute("uname") == null)) {
										out.print("<a class='genric-btn2' href='../getProjectDetails?p_id=3'>More Details</a>");
									} else {
										out.print(
										"<a class='genric-btn2' href='../register.jsp?loginAs=student&loginFirst=Please Login First**'>More Details</a>");
									}
									%>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6">
						<div class="single-block">
							<div class="single-block-outer">
								<div class="single-block-inner">
									<img class="e-img"
										src="http://www.codepixar.com/html/sciome/landing/img/experience/e2.png"
										alt="">
									<h4 class="e-head">Placement Helper</h4>
									<p class="e-sub-head">Er. Ashish Sethi (Seasia Infotech)</p>
									<div class="e-para wow fadeIn" data-wow-duration="1s"
										data-wow-delay=".8s">
										<p>Placement Helper is basically a web app which is
											developed to help the students of colleges to plan journey of
											their placement.</p>
									</div>
									<%
										if (!(session.getAttribute("uname") == null)) {
										out.print("<a class='genric-btn2' href='../getProjectDetails?p_id=1'>More Details</a>");
									} else {
										out.print(
										"<a class='genric-btn2' href='../register.jsp?loginAs=student&loginFirst=Please Login First**'>More Details</a>");
									}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>



				<div class="row wexp-angle wexp-angle2">
					<div class="col-lg-4 col-md-6">
						<div class="single-block">
							<div class="single-block-outer">
								<div class="single-block-inner">
									<img class="e-img"
										src="http://www.codepixar.com/html/sciome/landing/img/experience/e2.png"
										alt="">
									<h4 class="e-head">Bank management system</h4>
									<p class="e-sub-head">Er. Ankush Grover (Alert Enterprises)</p>
									<div class="e-para wow fadeIn" data-wow-duration="1s">
										<p>The main aim is to create an online banking platform
											that is accessible from any location, so customers need not
											go to the bank branches for routine banking operations like
											money withdrawal, money transfer, balance inquiry, etc.</p>
									</div>
									<%
										if (!(session.getAttribute("uname") == null)) {
										out.print("<a class='genric-btn2' href='../getProjectDetails?p_id=2'>More Details</a>");
									} else {
										out.print(
										"<a class='genric-btn2' href='../register.jsp?loginAs=student&loginFirst=Please Login First**'>More Details</a>");
									}
									%>
								</div>
							</div>
						</div>
					</div>

					<div class="col-lg-4 col-md-6">
						<div class="single-block">
							<div class="single-block-outer">
								<div class="single-block-inner">
									<img class="e-img"
										src="http://www.codepixar.com/html/sciome/landing/img/experience/e2.png"
										alt="">
									<h4 class="e-head">Bookshop Management</h4>
									<p class="e-sub-head">Er. Vishal Grover (DAMCO Solutions)</p>
									<div class="e-para wow fadeIn" data-wow-duration="1s"
										data-wow-delay=".4s">
										<p>This is a simple Bookshop Management System using the
											C++ programming language, the program provide the following
											options: add book, show book, modify book, delete book, check
											availability of the particular book to buy.</p>
									</div>
									<%
										if (!(session.getAttribute("uname") == null)) {
										out.print("<a class='genric-btn2' href='../getProjectDetails?p_id=6'>More Details</a>");
									} else {
										out.print(
										"<a class='genric-btn2' href='../register.jsp?loginAs=student&loginFirst=Please Login First**'>More Details</a>");
									}
									%>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-4 col-md-6">
						<div class="single-block">
							<div class="single-block-outer">
								<div class="single-block-inner">
									<img class="e-img"
										src="http://www.codepixar.com/html/sciome/landing/img/experience/e2.png"
										alt="">
									<h4 class="e-head">College Portal</h4>
									<p class="e-sub-head">Er. Janak Sharma (WIPRO)</p>
									<div class="e-para wow fadeIn" data-wow-duration="1s"
										data-wow-delay=".4s">
										<p>It is a basic view of college portal. It has different
											roles assigned for administrator, payroll/HR , teachers and
											students. All of them can login at there respective desktops
											and perform there functionalities.</p>
									</div>
									<%
										if (!(session.getAttribute("uname") == null)) {
										out.print("<a class='genric-btn2' href='../getProjectDetails?p_id=5'>More Details</a>");
									} else {
										out.print(
										"<a class='genric-btn2' href='../register.jsp?loginAs=student&loginFirst=Please Login First**'>More Details</a>");
									}
									%>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</section>
	</div>

	<!--================ Start Events Area =================-->
	<div class="events_area mt-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-5">
					<div class="main_title">
						<h2 class="mb-3 text-white text-center">Upcoming Events</h2>
						<p class="text-white pb-4">Let's have a look at events!! Come
							and participate as well ;)</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-6 col-md-6">
					<div class="single_event position-relative">
						<div class="event_thumb">
							<img src="../assets/img/e1.jpg" alt="" />
						</div>
						<div class="event_details">
							<div class="d-flex mb-4">
								<div class="date">
									<span>15</span> Nov
								</div>

								<div class="time-location">
									<h4>
										<span class="ti-time mr-2"></span> Smart Hacks
									</h4>
									<p>
										<span class="ti-time mr-2"></span> 12:00 PM - 06:30 PM
									</p>
									<p>
										<span class="ti-location-pin mr-2"></span> Wilson Block
									</p>
								</div>
							</div>
							<p>It is a online coding competition based on Data
								Structures.</p>
						</div>
					</div>
				</div>
				<div class="col-lg-6 col-md-6">
					<div class="single_event position-relative">
						<div class="event_thumb">
							<img src="../assets/img/e2.1.png" alt="" />
						</div>
						<div class="event_details">
							<div class="d-flex mb-4">
								<div class="date">
									<span>10</span> Nov
								</div>

								<div class="time-location">
									<h4>
										<span class="ti-time mr-2"></span> Talent Hunt
									</h4>
									<p>
										<span class="ti-time mr-2"></span> 10:00 AM - 05:30 PM
									</p>
									<p>
										<span class="ti-location-pin mr-2"></span> Business Block
									</p>
								</div>
							</div>
							<p>Different competitions to check talents of different
								students in different fields.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!--================ End Events Area =================-->
	<h1 class="text-center mt-5 recruit">TOP RECRUITERS</h1>
	<hr>

	<!-- end cont stats -->
	<div class="container">
		<div class="row first-row">
			<div class="col-sm-3">
				<!-- Card -->
				<div class="card" id="card8">
					<div class="side card-back">
						<div class="card-body">

							<!-- Title -->
							<h4 class="card-title">Google</h4>
							<!-- Text -->
							<p class="card-text">Google, LLC is an American multinational
								technology company that specializes in Internet-related services
								and products.</p>

						</div>
					</div>
					<div class="side card-front">
						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top" src="./img/1 . GOOGLE.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="card-body">

							<!-- Title -->
							<h4 class="card-title  text-center">Google</h4>

						</div>
					</div>



				</div>
				<!-- Card -->
			</div>
			<div class="col-sm-3">
				<!-- Card -->
				<div class="card" id="card7">
					<div class="side card-back">
						<div class="card-body">


							<p class="card-text">Amazon.com, Inc is an American
								multinational technology company based in Seattle, Washington.
								Amazon focuses on e-commerce, cloud computing, digital
								streaming, and artificial intelligence.</p>


						</div>
					</div>
					<div class="side card-front">
						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top" src="./img/2 . AMAZON.png"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="card-body">

							<!-- Title -->
							<h4 class="card-title  text-center">Amazon</h4>

						</div>
					</div>



				</div>
				<!-- Card -->
			</div>
			<div class="col-sm-3">
				<!-- Card -->
				<div class="card" id="card6">
					<div class="side card-back">
						<div class="card-body">
							<p class="card-text">Microsoft Corporation is an American
								multinational technology company with headquarters in Redmond,
								Washington. It develops, manufactures, licenses, supports, and
								sells computer software, etc.</p>


						</div>
					</div>
					<div class="side card-front">
						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top" src="./img/3 . MICROSOFT.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="card-body">

							<!-- Title -->
							<h4 class="card-title  text-center">Microsoft</h4>

						</div>
					</div>



				</div>
				<!-- Card -->
			</div>
			<div class="col-sm-3">
				<!-- Card -->
				<div class="card" id="card5">
					<div class="side card-back">
						<div class="card-body">


							<p class="card-text">Larsen & Toubro InfoTech Limited is a
								global IT solutions and services company based in Mumbai, India.
								In 2017, NASSCOM ranked LTI as the sixth-largest Indian IT
								services company in terms of export revenues.</p>


						</div>
					</div>
					<div class="side card-front">
						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top" src="./img/4 . L&T.jpg" height="145px"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="card-body">

							<!-- Title -->
							<h4 class="card-title  text-center">L&T InfoTech.</h4>

						</div>
					</div>



				</div>
				<!-- Card -->
			</div>
		</div>
	</div>
	<div class="container">
		<div class="row mt-5 second-row">
			<div class="col-sm-3">
				<!-- Card -->
				<div class="card" id="card1">
					<div class="side card-back">
						<div class="card-body">


							<p class="card-text">Deloitte is a multinational professional
								services network. Deloitte is one of the Big Four accounting
								organizations and the largest professional services network in
								the world.</p>


						</div>
					</div>
					<div class="side card-front">
						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top" src="./img/5 . DELOITTE.png"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="card-body">

							<!-- Title -->
							<h4 class="card-title  text-center">Deloitte</h4>

						</div>
					</div>



				</div>
				<!-- Card -->
			</div>
			<div class="col-sm-3">
				<!-- Card -->
				<div class="card" id="card2">
					<div class="side card-back">
						<div class="card-body">


							<p class="card-text">Mindtree Limited is an Indian
								multinational information technology and outsourcing company
								headquartered in Bangalore, India and New Jersey, USA. It is
								part of the Larsen & Toubro group.</p>
						</div>
					</div>
					<div class="side card-front">
						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top" src="./img/6 . MINDTREE.png"
								height="145px" alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="card-body">

							<!-- Title -->
							<h4 class="card-title  text-center">Mind Tree</h4>

						</div>
					</div>



				</div>
				<!-- Card -->
			</div>
			<div class="col-sm-3">
				<!-- Card -->
				<div class="card" id="card3">
					<div class="side card-back">
						<div class="card-body">


							<p class="card-text">HCL Technologies Ltd was founded in the
								year 1976 by Shiv Nadar, and it is headquartered in Noida,
								India. It is an Indian Multinational IT service company.</p>
						</div>
					</div>
					<div class="side card-front">
						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top" src="./img/7 . HCL.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="card-body">

							<!-- Title -->
							<h4 class="card-title  text-center">HCL</h4>

						</div>
					</div>



				</div>
				<!-- Card -->
			</div>
			<div class="col-sm-3">
				<!-- Card -->
				<div class="card" id="card4">
					<div class="side card-back">
						<div class="card-body">


							<p class="card-text">Infosys Ltd was founded in the year 1981
								by N.R. Narayana Murthy. The Indian MNC company is offering
								Information Technology, Outsourcing Services, and Business
								Consulting.</p>
						</div>
					</div>
					<div class="side card-front">
						<!-- Card image -->
						<div class="view overlay">
							<img class="card-img-top" src="./img/8 . INFOSYS.jpg"
								alt="Card image cap"> <a href="#!">
								<div class="mask rgba-white-slight"></div>
							</a>
						</div>
						<div class="card-body">

							<!-- Title -->
							<h4 class="card-title  text-center">Infosys</h4>

						</div>
					</div>



				</div>
				<!-- Card -->
			</div>
		</div>
	</div>

	<!-- Footer -->
	<div class="footer mt-5">
		<div class="row foot">
			<div class="col-sm-3">
				<div class="d-flex justify-content-center logo-foot">
					<img src="./img/Logo (1).png" height="120px" width="250px" alt="">
				</div>
				<div class="para-foot ml-4">
					<p>Our team of Placement Helper provides you ample
						opportunities to Work on the leading edge of knowledge and plan
						your placement journey in a very effective manner.</p>
				</div>

			</div>
			<div class="col-sm-6 content">
				<div class="container">
					<a href="../chooseUser.jsp" style="text-decoration:none;"><h6 class="text-center mt-3"
							id="h6">Log-in</h6></a> <a href="../chooseUser.jsp" style="text-decoration:none;"><h5
							class="text-center" id="h5">Register</h5></a> <a href="../about.jsp" style="text-decoration:none;"><h4
							class="text-center" id="h4">About-Us</h4></a> <a
						href="../contact.jsp" style="text-decoration:none;"><h3 class="text-center" id="h3">Contact-Us</h3></a>
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
					<img src="./img/animation_640_kg1adc77.gif" height="300px" alt="">

				</div>

			</div>
		</div>

	</div>
</body>
<script>
  var alert = document.getElementById('alert');
  var submit = document.getElementById('sub');
  console.log(submit);
  
  submit.addEventListener('click',(e)=>{
    alert.innerHTML=`<div class="alert alert-success" role="alert">
        Password Changed!
      </div>`;
      setTimeout(() => {
        console.log('done');

        alert.innerHTML=``;
      }, 300000);
  })
</script>
<script>
  var passwordBtn = document.getElementById('passwordBtn');
  var modalBody = document.getElementsByClassName('modal-body');
  var formChange = document.getElementsByClassName('formChange');
  var sucess = document.getElementById('succes');
  var newPass = document.getElementById('newPass');
  var confirmPass = document.getElementById('confirmPass');
  passwordBtn.addEventListener('click',()=>{
    if(newPass.value!=confirmPass.value&&newPass.value!='')
    {
      
    	 modalBody[0].removeChild(formChange[0]);
    	    
         sucess.innerHTML=`
         </div>
         <div class="d-flex justify-content-center"> <img src="./img/22893-error-animation.gif" height="300px" width="300px" alt=""></div>
         <h3 class="text-center">Passwords didn't matched</h3>
        
         `;
         passwordBtn.remove();
    
    }
  })
 
 
</script>
</html>
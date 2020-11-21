<%@page import="java.sql.ResultSet"%>
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
<link rel="stylesheet" href="./assets/css/bootstrap.min.css">
<link rel="stylesheet" href="./assets/css/all.min.css">
<link rel="stylesheet" href="./assets/css/fontawesome.min.css">
<link rel="stylesheet" href="./assets/css/style1.css">
<link rel="shortcut icon" href="assets/img/favicon.ico"
	type="image/x-icon">
<script src="./assets/js/jquery.min.js"></script>
<script src="./assets/js/bootstrap.min.js"></script>
<script src="./assets/js/all.min.js"></script>
<script src="./assets/js/about1.js"></script>
<title>About Us</title>
<script>
	function fun1() {

		var img = document.getElementById("scrl");
		console.log(img.scrollTop);

		img.style.backgroundColor = "none";

		img.style.backgroundColor = "white";

		img.style.boxShadow = "0px 0px 10px 0px #ccc";

	}
</script>
<style>
.btn-primary {
	color: #fff;
	background-color: #007bff;
	border-color: #007bff;
	background-color: coral !important;
	border-color: coral !important;
}
</style>
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


	<!--================ Start About Area =================-->
	<section class="about_area section_gap">
		<div class="container">
			<div class="row h_blog_item">
				<div class="col-lg-6">
					<div class="h_blog_img">
						<img class="img-fluid" src="./assets/img/about1.jpg" alt="" />
					</div>
				</div>
				<div class="col-lg-6">
					<div class="h_blog_text">
						<div class="h_blog_text_inner left right">
							<h4 id="heading">Welcome to Placement Helper</h4>
							<p>We, the team of placement helper provides you the best
								platform to get placed in your dream company and provide
								worthiest help to the students of a college.</p>
							<p>We provide students a better vision of journey to there
								placement by providing them with the latest stuff asked by a
								company and projects selected by them in their recent years.</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================ End About Area =================-->


	<h1 class="text-center services mt-5">OUR SERVICES</h1>
	<section class="iq-features">
		<div class="container">
			<div class="row align-items-center">
				<div class="col-lg-3 col-md-12"></div>
				<div class="col-lg-6 col-md-12">
					<div class="holderCircle">
						<div class="round"></div>
						<div class="dotCircle">
							<span class="itemDot active itemDot1" data-tab="1"> <i
								class="fa fa-clock-o"></i> <span class="forActive"></span>
							</span> <span class="itemDot itemDot2" data-tab="2"> <i
								class="fa fa-comments"></i> <span class="forActive"></span>
							</span> <span class="itemDot itemDot3" data-tab="3"> <i
								class="fa fa-user"></i> <span class="forActive"></span>
							</span> <span class="itemDot itemDot4" data-tab="4"> <i
								class="fa fa-tags"></i> <span class="forActive"></span>
							</span> <span class="itemDot itemDot5" data-tab="5"> <i
								class="fa fa-upload"></i> <span class="forActive"></span>
							</span> <span class="itemDot itemDot6" data-tab="6"> <i
								class="fa fa-briefcase"></i> <span class="forActive"></span>
							</span>
						</div>
						<div class="contentCircle">
							<div class="CirItem title-box active CirItem1">
								<h2 class="title">
									<span>Companies</span>
								</h2>
								<p>We are providing complete information about a company
									from it's founder to previous years asked questions to projects
									selected.</p>
								<!-- <i class="fa fa-clock-o"></i> -->
							</div>
							<div class="CirItem title-box CirItem2">
								<h2 class="title">
									<span>Support </span>
								</h2>
								<p>24x7 supporting system is there, one can contact us at
									any time and their query will be answered within a very short
									span of time.</p>
								<!-- <i class="fa fa-comments"></i> -->
							</div>
							<div class="CirItem title-box CirItem3">
								<h2 class="title">
									<span>Admin</span>
								</h2>
								<p>Special portal for college administrator, who can add
									different companies and projects selected by top notch
									companies.</p>
								<!-- <i class="fa fa-user"></i> -->
							</div>
							<div class="CirItem title-box CirItem4">
								<h2 class="title">
									<span>Mock Tests</span>
								</h2>
								<p>College admins can upload mock tests, which students can
									perform to check their ability to solve different problems.</p>
								<!-- <i class="fa fa-tags"></i> -->
							</div>
							<div class="CirItem title-box CirItem5">
								<h2 class="title">
									<span>Projects</span>
								</h2>
								<p>Providing students with best ever projects made by their
									seniors for which they are being selected in top notch
									companies.</p>
								<!-- <i class="fa fa-upload"></i> -->
							</div>
							<div class="CirItem title-box CirItem6">
								<h2 class="title">
									<span>Resume</span>
								</h2>
								<p>Students can build their resume, they just have to upload
									their details and their automatic resume and profile will be
									created.</p>
								<!-- <i class="fa fa-briefcase"></i> -->
							</div>
						</div>
					</div>
				</div>
				<div class="col-lg-3 col-md-12"></div>
			</div>
		</div>
	</section>
	<!---------------------------------->
	<link
		href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css"
		rel="stylesheet" id="bootstrap-css">
	<script
		src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script
		src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!------ Include the above in your HEAD tag ---------->

	<section class="section-ptb bg-white bg-5">
		<div class="container">
			<div class="row text-center">
				<div class="col-12">
					<div class="heading mb-80">
						<h2>Testimonials</h2>
						<p class="mb-20">
							Have a look at some of our gems, who got placed and <br
								class="d-none d-md-block"> you are the one who is going to
							be one among them
						</p>
						<hr class="line bw-2 mx-auto line-sm mb-5">
						<hr class="line bw-2 mx-auto">
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-12">
					<div class="client-testimonial position-relative">
						<div class="client-nav">
							<ul class="nav nav-tabs">
								<li class="nav-item"><a class="nav-link active"
									href="#client1" data-toggle="tab"> <img class="drop-shadow"
										src="assets/img/testimonials/1st.png" alt="Client Image">
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#client2"
									data-toggle="tab"> <img class="drop-shadow"
										src="assets/img/testimonials/2nd.png" alt="Client Image">
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#client3"
									data-toggle="tab"> <img class="drop-shadow"
										src="assets/img/testimonials/3rd.png" alt="Client Image">
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#client4"
									data-toggle="tab"> <img class="drop-shadow"
										src="assets/img/testimonials/4th.png" alt="Client Image">
								</a></li>
								<li class="nav-item"><a class="nav-link" href="#client5"
									data-toggle="tab"> <img class="drop-shadow"
										src="assets/img/testimonials/5th.png" alt="Client Image">
								</a></li>
								
							</ul>
						</div>
						<div class="row text-center">
							<div class="col-10 col-md-8 col-lg-6 mx-auto">
								<div class="tab-content">
									<div class="tab-pane fade show active" id="client1">
										<div class="client-thumb mx-auto mb-25">
											<img class="drop-shadow"
												src="assets/img/testimonials/1st.png" alt="Client Image">
										</div>
										<div class="client-desc bg-white d-flex align-items-center">
											<div class="text mx-auto">
												<h4 class="mb-10">Ashish Sethi</h4>
												<h6>Software Engineer</h6>
												<p>
													Ashish Sethi, Sr. software engineer at seasia infotech <br
														class="d-none d-lg-block">He is having experience of
													more then 5 years.
												</p>
											</div>
										</div>
									</div>
									<!-- Single Client End -->
									<div class="tab-pane fade" id="client2">
										<div class="client-thumb mx-auto mb-25">
											<img class="drop-shadow"
												src="assets/img/testimonials/2nd.png" alt="Client Image">
										</div>
										<div class="client-desc bg-white d-flex align-items-center">
											<div class="text mx-auto">
												<h4 class="mb-10">Vishal Grover</h4>
												<h6>Android Developer</h6>
												<p>
													Vishal Grover, Level 3 Android Developer at Damco Solutions
													<br class="d-none d-lg-block">He is having experience
													of more then 6 years
												</p>
											</div>
										</div>
									</div>
									<!-- Single Client End -->
									<div class="tab-pane fade" id="client3">
										<div class="client-thumb mx-auto mb-25">
											<img class="drop-shadow"
												src="assets/img/testimonials/3rd.png" alt="Client Image">
										</div>
										<div class="client-desc bg-white d-flex align-items-center">
											<div class="text mx-auto">
												<h4 class="mb-10">Ankush Grover</h4>
												<h6>Tester</h6>
												<p>
													Ankush Grover, Level 2 Automation Tester at Alert
													Enterprises <br class="d-none d-lg-block">He is having
													experience of more then 3 years
												</p>
											</div>
										</div>
									</div>
									<!-- Single Client End -->
									<div class="tab-pane fade" id="client4">
										<div class="client-thumb mx-auto mb-25">
											<img class="drop-shadow"
												src="assets/img/testimonials/4th.png" alt="Client Image">
										</div>
										<div class="client-desc bg-white d-flex align-items-center">
											<div class="text mx-auto">
												<h4 class="mb-10">Reetika Mahajan</h4>
												<h6>Team Lead</h6>
												<p>
													Reetika Mahajan, Product manager and team lead at Bazware
													Technologies <br class="d-none d-lg-block">She is
													having experience of more then 8 years
												</p>
											</div>
										</div>
									</div>
									<!-- Single Client End -->
									<div class="tab-pane fade" id="client5">
										<div class="client-thumb mx-auto mb-25">
											<img class="drop-shadow"
												src="assets/img/testimonials/5th.png" alt="Client Image">
										</div>
										<div class="client-desc bg-white d-flex align-items-center">
											<div class="text mx-auto">
												<h4 class="mb-10">Richa Arora</h4>
												<h6>Software Developer</h6>
												<p>
													Richa Arora, Software developer at Tech Mahindra <br
														class="d-none d-lg-block">She is having experience of
													more then 5 years
												</p>
											</div>
										</div>
									</div>
									<!-- Single Client End -->
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<footer>
		<div class="footer mt-5">
			<div class="row foot">
				<div class="col-sm-3">
					<div class="d-flex justify-content-center logo-foot">
						<img src="./assets/img/Logo (1).png" height="120px" width="250px"
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
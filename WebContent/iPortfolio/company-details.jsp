<%@page import="java.sql.ResultSet"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
	response.setHeader("Cache-Control", "no-cache,no-store,must-revalidate");//HTTP 1.1
response.setHeader("Pragma", "no-cache"); //HTTP 1.0
response.setDateHeader("Expires", 0); //prevents caching at the proxy server
%>
<%
	if (session.getAttribute("uname") == null) {
	response.sendRedirect("../register.jsp?loginAs=student&loginFirst=Please Login First**");
}
%>
<%
	ResultSet rs = (ResultSet) session.getAttribute("resultSet");
ResultSet rs2 = (ResultSet) session.getAttribute("resultSet2");
ResultSet rs3 = (ResultSet) session.getAttribute("resultSet3");
String cdesc = rs2.getString(14);
String[] cdescr = cdesc.split("\\r?\\n");
String process = rs2.getString(7);
String[] rProcess = process.split(",");
%>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
table th {
	background-color: rgb(53, 58, 64);
	color: white;
}

th {
	width: 30%;
}
</style>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>Company Details</title>
<meta content="" name="description">
<meta content="" name="keywords">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css"
	integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2"
	crossorigin="anonymous">

<!-- Favicons -->
<link rel="shortcut icon" href="../assets/img/favicon.ico"
	type="image/x-icon">
<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="assets/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
<link href="assets/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="assets/vendor/venobox/venobox.css" rel="stylesheet">
<link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css"
	rel="stylesheet">
<link href="assets/vendor/aos/aos.css" rel="stylesheet">
<!-- Template Main CSS File -->
<link href="assets/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: iPortfolio - v1.4.0
  * Template URL: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>
	<p class="up" id="up"></p>
	<!-- ======= Mobile nav toggle button ======= -->
	<button type="button" class="mobile-nav-toggle d-xl-none">
		<i class="icofont-navigation-menu"></i>
	</button>

	<!-- ======= Header ======= -->
	<header id="header">
		<div class="d-flex flex-column">

			<div class="profile">
				<img src="../getImage?email=<%=rs.getString(9)%>" alt=""
					height=130px width=100px class="rounded-circle">
				<h1 class="text-light">
					<a href="index.jsp"><%=rs.getString(2)%></a>
				</h1>
				<div class="social-links mt-3 text-center">
					<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
						href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
						href="#" class="instagram"><i class="bx bxl-instagram"></i></a> <a
						href="#" class="google-plus"><i class="bx bxl-skype"></i></a> <a
						href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
				</div>
			</div>

			<nav class="nav-menu">
				<ul>
					<li class="active"><a href="#up"><i class="bx bx-home"></i>
							<span>Home</span></a></li>
					<li><a href="#about"><i class="bx bx-user"></i> <span>About</span></a></li>
					<li><a href="index.jsp"><i class="bx bx-book-content"></i>My
							Portfolio</a></li>
					<li><a href="#material"><i class="bx bx-server"></i>
							Material</a></li>
					<li><a href="#contact"><i class="bx bx-envelope"></i>
							Contact</a></li>

				</ul>
			</nav>
			<!-- .nav-menu -->
			<button type="button" class="mobile-nav-toggle d-xl-none">
				<i class="icofont-navigation-menu"></i>
			</button>

		</div>
	</header>
	<!-- End Header -->

	<main id="main">

		<!-- ======= Breadcrumbs ======= -->
		<section id="breadcrumbs" class="breadcrumbs">
			<div class="container">

				<div class="d-flex justify-content-between align-items-center">
					<h2>
						<b><b><%=rs2.getString(2)%></b></b>
					</h2>
					<ol>
						<li><a href="../assets/index.jsp">Home</a></li>
						<li><%=rs2.getString(2)%> Details</li>
					</ol>
				</div>

			</div>
		</section>
		<!-- End Breadcrumbs -->

		<!-- ======= Portfolio Details Section ======= -->
		<section id="portfolio-details" class="portfolio-details">
			<div class="container">

				<div class="portfolio-details-container">

					<div class="owl-carousel portfolio-details-carousel">
						<%
							out.print("<img src='assets/img/Companies/" + rs2.getString(16) + "' class='img-fluid' alt=''>");
						out.print("<img src='assets/img/Companies/" + rs2.getString(17) + "' class='img-fluid' alt=''>");
						out.print("<img src='assets/img/Companies/" + rs2.getString(18) + "' class='img-fluid' alt=''>");
						%>
					</div>

					<div class="portfolio-info">
						<h3>
							<b>Company information</b>
						</h3>
						<ul>
							<li><strong>Category</strong>: <%=rs2.getString(3)%></li>
							<li><strong>Founder</strong>: Mr. <%=rs2.getString(4)%></li>
							<li><strong>Package offered</strong>: <%=rs2.getString(11)%></li>
							<%
								out.print("<li><strong>Website</strong>: <a href='" + rs2.getString(6) + "' target='_blank'>" + rs2.getString(6)
									+ "</a></li>");
							%>
						</ul>
					</div>

				</div>

				<div class="portfolio-description" id="about">
					<h2>
						<b>Company Description</b>
					</h2>
					<p>
						<%
							for (int i = 0; i < cdescr.length; i++) {
							out.println(cdescr[i]);
							out.println("<br>");
						}
						%>
					</p>
				</div>
				<div class="portfolio-description">
					<table class="table table-hover">
						<tbody>
							<tr>
								<th scope="row">Number of requirement</th>
								<td><%=rs2.getInt(8)%></td>
							</tr>
							<tr>
								<th scope="row">Batch</th>
								<td><%=rs2.getInt(9)%></td>
							</tr>
							<tr>
								<th scope="row">Test Platform</th>
								<td><%=rs2.getString(10)%></td>
							</tr>
							<tr>
								<th scope="row">Visiting Date</th>
								<td>10-July-2022</td>
							</tr>
							<tr>
								<th scope="row">Company type</th>
								<td><%=rs3.getString(2)%></td>
							</tr>
							<tr>
								<th scope="row">Courses</th>
								<td><%=rs3.getString(3)%></td>
							</tr>
							<tr>
								<th scope="row">Streams</th>
								<td><%=rs3.getString(4)%></td>
							</tr>
						</tbody>
					</table>
					<br>
					<h4>
						<b>Recruitment process</b>
					</h4>
					<p>The following is eligibility criteria and rounds that are
						being conducted:</p>
					<ul>
						<%
							for (int i = 0; i < rProcess.length; i++) {
							out.print("<li>" + rProcess[i] + "</li>");
						}
						%>
					</ul>
				</div>
				<div class="portfolio-description" id="material">
					<h2>
						<b>Material for study</b>
					</h2>
					<h4 class="text-center" style="margin-left: -14%;">Aptitude</h4>
					<br>
					<div class="row">
						<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
							<h4 class="title">
								<a href="#">2015 Questions</a>
							</h4>
						</div>
						<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
							<h4 class="title">
								<a href="#">2016 Questions</a>
							</h4>
						</div>
						<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
							<h4 class="title">
								<a href="#">2017 Questions</a>
							</h4>
						</div>
					</div>
				</div>
				<br>
				<br>
				<div class="row">
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<h4 class="title">
							<a href="#">2018 Questions</a>
						</h4>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<h4 class="title">
							<a href="#">2019 Questions</a>
						</h4>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<h4 class="title">
							<a href="#">2020 Questions</a>
						</h4>
					</div>
				</div>
				<div class="portfolio-description" id="material">
					<h4 class="text-center" style="margin-left: -14%;">Verbal</h4>
					<br>
					<div class="row">
						<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
							<h4 class="title">
								<a href="#">2015 Questions</a>
							</h4>
						</div>
						<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
							<h4 class="title">
								<a href="#">2016 Questions</a>
							</h4>
						</div>
						<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
							<h4 class="title">
								<a href="#">2017 Questions</a>
							</h4>
						</div>
					</div>
				</div>
				<br>
				<br>
				<div class="row">
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<h4 class="title">
							<a href="#">2018 Questions</a>
						</h4>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<h4 class="title">
							<a href="#">2019 Questions</a>
						</h4>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<h4 class="title">
							<a href="#">2020 Questions</a>
						</h4>
					</div>
				</div>
				<div class="portfolio-description" id="material">
					<h4 class="text-center" style="margin-left: -14%;">Technical</h4>
					<br>
					<div class="row">
						<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
							<h4 class="title">
								<a href="#">2015 Questions</a>
							</h4>
						</div>
						<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
							<h4 class="title">
								<a href="#">2016 Questions</a>
							</h4>
						</div>
						<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
							<h4 class="title">
								<a href="#">2017 Questions</a>
							</h4>
						</div>
					</div>
				</div>
				<br>
				<br>
				<div class="row">
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<h4 class="title">
							<a href="#">2018 Questions</a>
						</h4>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<h4 class="title">
							<a href="#">2019 Questions</a>
						</h4>
					</div>
					<div class="col-lg-4 col-md-6 icon-box" data-aos="fade-up">
						<h4 class="title">
							<a href="#">2020 Questions</a>
						</h4>
					</div>
				</div>
				<div class="portfolio-description" id="contact">
					<h2>
						<b> Contact <%=rs2.getString(2)%></b>
					</h2>
					<div class="container mt-5" style="margin-left: -8%; width: 120%;">
						<div class="row">
							<div class="col-sm-4">
								<div class="d-flex justify-content-center">
									<img src="../assets/img/Grouplocation.svg" height="50px" alt="">

								</div>
								<p class="text-center mt-3">
									<%=rs2.getString(19)%>
								</p>
							</div>
							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="d-flex justify-content-center">
									<img src="../assets/img/Group 6call.svg" height="50px" alt="">

								</div>
								<!-- <img src="./assets/img/Group 6call.svg" id="call" alt="" srcset=""> -->
								<p class="text-center mt-3"><%=rs2.getString(12)%></p>
							</div>
							<div class="col-sm-4 col-lg-4 col-md-4">
								<div class="d-flex justify-content-center">
									<img src="../assets/img/clarity_envelope-linemsg.svg"
										height="50px" alt="">

								</div>
								<!-- <img src="./assets/img/clarity_envelope-linemsg.svg" id="msg" alt="" srcset=""> -->
								<p class="text-center mt-3"><%=rs2.getString(13)%></p>
							</div>
						</div>
					</div>
				</div>
			</div>
			</div>
		</section>
		<!-- End Portfolio Details Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<!-- <footer id="footer">
    <div class="container">
      <div class="copyright">
        &copy; Copyright <strong><span>iPortfolio</span></strong>
      </div>
      <div class="credits">
        <!-- All the links in the footer should remain intact. -->
	<!-- You can delete the links only if you purchased the pro version. -->
	<!-- Licensing information: https://bootstrapmade.com/license/ -->
	<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/iportfolio-bootstrap-portfolio-websites-template/ -->
	<!-- Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
      </div>
    </div>
  </footer>End  Footer -->
	-->

	<a href="#" class="back-to-top"><i class="icofont-simple-up"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/jquery/jquery.min.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/jquery.easing/jquery.easing.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>
	<script src="assets/vendor/waypoints/jquery.waypoints.min.js"></script>
	<script src="assets/vendor/counterup/counterup.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/venobox/venobox.min.js"></script>
	<script src="assets/vendor/owl.carousel/owl.carousel.min.js"></script>
	<script src="assets/vendor/typed.js/typed.min.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>
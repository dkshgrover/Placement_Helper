<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page isErrorPage="true"%>
<%
	response.setHeader("Cache-control", "no-cache,no-store,must-revalidate");
%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/css/bootstrap.min.css" integrity="sha384-TX8t27EcRE3e/ihU7zmQxVncDAy5uIKz4rEkgIXeMed4M0jlfIDPvg6uqKI2xXr2" crossorigin="anonymous">
<link rel="shortcut icon" href="./assets/img/favicon.ico"
	type="image/x-icon">
<style>
body {
 background-color: rgb(39,32,65);
}
#width{
	width:26%;
	margin-left:35%;
}
</style>
<meta charset="ISO-8859-1">
<title>ERROR 404 NOT FOUND</title>
</head>
<body>
	<img src="../../Placement_Helper_Project/assets/img/error404.jpg" style="margin-left:22%;width:50%;" class="img-fluid "><br>
	<a href="../../Placement_Helper_Project/assets/index.jsp" id="width" class="btn btn-outline-primary">Click Here to go back</a>
</body>
</html>

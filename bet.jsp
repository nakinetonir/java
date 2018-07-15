<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.util.ArrayList" %> 
<%@ page import= "java.util.List" %> 
<%@ page import= "bean.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="./css/stadistics.css" type="text/css"></link>
 <script
		src="https://code.jquery.com/jquery-3.2.1.js">
	</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script> -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<title>Stadistics</title>
<style>
#button {
 padding: 0;
 }
 #button li {
 display: inline;
 }
#button li a {
 font-family: Arial;
 font-size: 11px;
 text-decoration: none;
 float: left;
 padding: 10px;
 background-color: #004531;
 color: #fff;
 }
</style>
</head>
<body class="body">
	<div class="container">
	<div class="row">
		<a href="inicio.jsp" id="logo"><img src=".\imagenes\logo.png" alt="Logo empresa"></a>
	</div>
	</div>
	<div class="row">
	<%
		List<apuesta> listadoapuestas = new ArrayList<apuesta>();
		%>
		<div class="col-md-2">
		</div>
		<div class="col-md-8 centro">
			<table class="table table-dark">
			    <thead>
			      <tr>
			        <th>Evento</th>
			        <th>Ganador</th>
			        <th>Apostado</th>
			        <th>Resultado</th>
			      </tr>
			    </thead>
			    <tbody>
			<%listadoapuestas = (List<apuesta>)session.getAttribute("apuestasjugador");
			if(listadoapuestas!=null)
			{
			for (apuesta apus:listadoapuestas)
			{
				
			%>
				<tr>
        			<td><%=apus.getContricantes() %></td>
       				<td><%=apus.getGanador() %></td>
        			<td><%=apus.getApostado()%></td>
        			<td><%=apus.getResultado() %></td>
        		</tr>
     		<%
			}
		}
		%>
	</tbody>
  </table>
  </div>
  <div class="col-md-2">
		</div>
  </div>
 
  <script>
  	$("#logo").click(function()
  		{
  			window.location="inicio.jsp"
  		}	
  	)
  </script>
  <div style="background-color:#004531;">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<img src="./imagenes/pie1.png">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<img src="./imagenes/pie2.png">
				</div>
			</div>
			<div class="row">
			<div class="col-md-2">
			</div>
				<div class="col-md-6">
				<ul id="button">
					<li><a href="#" id="contact">Contact Us</a></li>
					<li><a href="#" id="terms">Terms and Conditions</a></li>
					<li><a href="#" id="privacy">Privacy Policy</a></li>
					<li><a href="#" id="cookies">Cookies Policy</a></li>
				</ul>
				</div>
				<div class="col-md-2">
				</div>
			</div>
		</div>
	</div>
	<script>
		$("#contact").click(function()
		 {
		window.open("Contactus.jsp",null,
		"height=600,width=400,status=yes,toolbar=no,menubar=no,location=no");
		 }		
	)
	$("#terms").click(function()
		 {
		window.open("TermsandConditions.jsp",null,
		"height=600,width=400,status=yes,toolbar=no,menubar=no,location=no");
		 }		
	)
	$("#privacy").click(function()
		 {
		window.open("Polityprivaty.jsp",null,
		"height=600,width=400,status=yes,toolbar=no,menubar=no,location=no");
		 }		
	)
	$("#cookies").click(function()
		 {
		window.open("cookiespilicy.jsp",null,
		"height=600,width=400,status=yes,toolbar=no,menubar=no,location=no");
		 }		
	)</script>
 </body>
</html>
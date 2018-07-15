<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<%@ page import= "java.util.ArrayList" %> 
<%@ page import= "java.util.List" %> 
<%@ page import= "bean.*" %> 
<%@ page import= "java.util.HashMap" %> 
    <%@ page  import="java.awt.*" %>
    <%@ page  import="java.io.*" %>
    <%@ page  import="org.jfree.chart.*" %>
    <%@ page  import="org.jfree.chart.entity.*" %>
    <%@ page  import ="org.jfree.data.general.*"%>
    <%
      int contador=0;
      String png="";
      List<String> img = new ArrayList<String>();
      HashMap<String,estadisiticas> estadisticas = new HashMap<String,estadisiticas>();
      double[] cuentas = new double[estadisticas.keySet().size()];
      cuentas = (double[])session.getAttribute("cuentas");
      double totaldetodo = (double)session.getAttribute("totaldetodo");
      if((HashMap<String,estadisiticas>)session.getAttribute("estadisticas")!=null)
      {
    	  final DefaultPieDataset data = new DefaultPieDataset();
    	  final DefaultPieDataset data2 = new DefaultPieDataset();
    	  estadisticas = (HashMap<String,estadisiticas>)session.getAttribute("estadisticas");
    	  for(estadisiticas esta:estadisticas.values())
    	  {
    		  png="/esta"+contador+".png";
    		  img.add(png);
    		  data.setValue("Winner", esta.getGanados());
    		  data.setValue("Lost", esta.getPerdidos());
    		  data2.setValue(esta.getTipo(), (cuentas[contador]/totaldetodo)*100);
    		  JFreeChart chart = ChartFactory.createPieChart (esta.getTipo(), data, true, true, false);
			  chart.setBackgroundPaint(Color.darkGray);
     	      chart.setBorderPaint(Color.cyan);
     	      contador=contador+1;
     	      try {
     	         final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
     	         final File file1 = new File(getServletContext().getRealPath(".") + png);
     	         ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
     	         } catch (Exception e) {
     	            out.println(e);
     	         }
    	  }
    	  JFreeChart chart = ChartFactory.createPieChart ("Total", data2, true, true, false);
		  chart.setBackgroundPaint(Color.darkGray);
 	      chart.setBorderPaint(Color.cyan);
 	      try {
 	         final ChartRenderingInfo info = new ChartRenderingInfo(new StandardEntityCollection());
 	         final File file1 = new File(getServletContext().getRealPath(".") + "/total.png");
 	         ChartUtilities.saveChartAsPNG(file1, chart, 600, 400, info);
 	         } catch (Exception e) {
 	            out.println(e);
 	         }
    	     
      }%>
      <html>
      <head>
      	<script
		src="https://code.jquery.com/jquery-3.2.1.js">
	</script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.8.3.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/jquery.validate.min.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.js"></script>
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/jquery-validation@1.17.0/dist/additional-methods.min.js"></script>
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
      <body style="background-color:#212529">
      <div class="container">
      		<div class="row">
      			<div class="col-md-3">
      				<a href="inicio.jsp" id="logo"><img  id="logo" src="./imagenes/logo.png" alt="bet Dublin"></a>
      			</div>
      		</div>	
      	<%for(String i:img)
      	{
      		i = i.replace("/", "");
      	%>
      		<div class="row">
      				<div class="col-md-3"></div>
      				<div class="col-md-6"><img src="<%=i %>" WIDTH="600" HEIGHT="400" BORDER="0" class="rounded mx-auto d-block"></div>
      				<div class="col-md-3"></div>
      			</div>
      		
      		</br>
      	<%}
      		%>
      		<div class="row">
      				<div class="col-md-3"></div>
      				<div class="col-md-6"><img src="total.png" WIDTH="600" HEIGHT="400" BORDER="0"></div>
      				<div class="col-md-3"></div>
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



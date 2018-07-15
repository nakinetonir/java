<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.util.ArrayList" %> 
<%@ page import= "java.util.List" %> 
<%@ page import= "bean.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

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
			session.setAttribute("apuestasjugador",null);
		}
		%>
	</tbody>
  </table>
  </div>
  <div class="col-md-2">
		</div>
  </div>
 
</body>
</html>
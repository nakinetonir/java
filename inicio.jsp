jkp
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<%@ page import= "java.util.ArrayList" %> 
<%@ page import= "java.util.List" %> 
<%@ page import= "java.util.HashMap" %> 
<%@ page import= "bean.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <link rel="stylesheet" href="./css/inicio.css" type="text/css"></link>
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
<title>BetDublin</title>
<style>
	a:visited
	{
		color:#808000;
	}
	.table tr:hover {
  		background:#e0a800;
}
.table {
    margin: 0 auto;
    width: 80%;
}
td{
	text-align:center;
}
.bt
{
	color: #e0a800;
font-size: 20px;
padding: 20px;
text-shadow: 0px -1px 17px rgba(30, 30, 30, 0.8);
-webkit-border-radius: 30px;
-moz-border-radius: 30px;
border-radius: 30px;
background: #e0a800;
background-color:black;
-webkit-box-shadow: 0px 2px 1px rgba(50, 50, 50, 0.75);
-moz-box-shadow:    0px 2px 1px rgba(50, 50, 50, 0.75);
box-shadow:         0px 2px 1px rgba(50, 50, 50, 0.75);

		
}
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
<body class="body" >
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img src="./imagenes/logo.png" alt="bet Dublin">
				<div id="saldo" style="background-color:black;border: 2px solid white;border-radius: 12px;">
				
				</div>
			</div>
			<% if((registro)session.getAttribute("logeado")!=null) 
			{%>
				<div class="col-md-6">
			<div class="btn-group col-md-6" role="group" aria-label="Basic example">
				<% 
					registro reg = new registro();
					reg = (registro)session.getAttribute("logeado");
				if(reg.getEmail().contains("proyectobetdublin@gmail.com"))
				{%> 
					<button id="user" class="btn btn-warning">User</button>
					<button id="account" class="btn btn-warning">Account</button>
					<button id="statisticsuper" class="btn btn-warning">Stadisitcs</button>
					<button id="historicsuper" class="btn btn-warning">Historic</button>
					<button id="life"  class="btn btn-warning">Life</button>
					<button id ="terminar" class="btn btn-warning">La Banca</button>
					<button id ="logout" style="backgound-color:#212529;" class="btn btn-warning">Logout</button>
					
				<%}
				else
				{%>
					
					<button id="account" class="btn btn-warning">Account</button>
					<button id="bet" class="btn btn-warning">Bet</button>
					<button id="statistics" class="btn btn-warning">Stadisitcs</button>
					<button id="life"  class="btn btn-warning">Life</button>
					<button id="historic" class="btn btn-warning">Historic</button>
					<button id="pay" class="btn btn-btn-primary">Make Deposit</button>
					<button id ="logout" style="backgound-color:#212529;" class="btn btn-warning">Logout</button>
				<%}
				%>	
			</div>
			<div class="col-md-2">
				<%if(session.getAttribute("eventos")!=null)
				{
				%>
				<div style="display:table-cell;vertical-align:middle;width:5%;">
				<div id="eventos" ></div>
				<%
				}
				%>
				</div>
			</div>
			</div>
			<%}%>
		</div>
	</div>	
	
	<div style="text-align:center;" ><img src="./imagenes/cabecera.jpg" alt="estadio"></div>
	<div class="container" style="text-align:center;">
		<div class="row">
		<div class="col-md-12">
		<div class="btn-group" role="group" aria-label="Basic example">
		<button id="f" class="bt">Futbol</button>
		<button id="b" class="bt">Baloncesto</button>
		<button id="c" class="bt">Ciclismo</button>
		<button id="t" class="bt">Tenis</button>
	</div>
	</div>
</div>
</div>


<div class="row" id="tabla">
        			<%List<evento> deporte = new ArrayList<evento>(); 
        			deporte = (List<evento>)session.getAttribute("deporte");
        			String imagen ="";
        			if((String)session.getAttribute("imagen")!=null)
        			{
        				imagen = (String)session.getAttribute("imagen");
        			}
        			if(deporte!=null)
        			{
        				String clave = (String)session.getAttribute("deporteclicado");
        			%>
        				<table class="table table-dark">
        					<%
        						for(evento even:deporte)
        						{%><tr><%
        							if(clave.equals("Ciclismo"))
								{
        								String evento = even.getEvento();
        								String ganador1 = "inicio.jsp?ganador=Ciclismo&apuesta="+even.getGanador1()+"&id="+even.getIdevento()+"&hora="+even.getHora()+"&tipo="+even.getTipo();
								%>
									<td><%=evento%></td><td><a data-toggle="popover" title="Popover Header" data-content="Some content inside the popover" id="tabla" class="apuestalink" href="<%=ganador1%>">Ganador</a></td>
								<%}
								else if(clave.equals("Tenis"))
								{
									String evento = even.getEvento();
									String ganador1 = "inicio.jsp?ganador=Tenis&apuesta="+even.getGanador1()+"&id="+even.getIdevento()+"&hora="+even.getHora()+"&tipo="+even.getTipo();
									
								%>
								
									<td><%=evento%></td><td><a data-toggle="popover" title="Popover Header" data-content="Some content inside the popover" id="tabla" class="apuestalink" href="<%=ganador1%>">Ganador</a></td></td>
								<%}
								else if(clave.equals("Rally"))
								{%>
									<td><%even.getEvento();%>Ganador</td>
								<%}
								else if(clave.equals("Nieve"))
								{%>
									<td><%even.getEvento();%>Ganador</td>
								<%}
								else
								{
									if(!even.getJugador1().contains("marca.js"))
									{
										if(clave.equals("Baloncesto"))
										{
											String evento = even.getEvento() + " | "+ even.getJugador1() + " vs " + even.getJugador2();
											String ganador1 = "inicio.jsp?ganador="+even.getJugador1()+"&apuesta="+even.getGanador1()+"&contrincantes="+even.getJugador1()+"-"+even.getJugador2()+"&id="+even.getIdevento()+"&hora="+even.getHora()+"&tipo="+even.getTipo();
											String ganador2 = "inicio.jsp?ganador="+even.getJugador2()+"&apuesta="+even.getGanador2()+"&contrincantes="+even.getJugador1()+"-"+even.getJugador2()+"&id="+even.getIdevento()+"&hora="+even.getHora()+"&tipo="+even.getTipo();
											String apuesta1 = even.getJugador1() +  "    "+even.getGanador1();
											String apuesta2 = even.getJugador2() + "    "+even.getGanador2();
										%>
											<td><%=evento %></td>
											<td>
												<a data-toggle="popover" title="Popover Header" data-content="Some content inside the popover" id="tabla" class="apuestalink" href="<%=ganador1%>"><%=apuesta1%></a></td>
												<td class="tdfinalevento"><a data-toggle="popover" title="Popover Header" data-content="Some content inside the popover" id="tabla" class="apuestalink" href="<%=ganador2%>"><%=apuesta2 %></a>
												</td>
										<%}
										else
										{
											String evento = even.getEvento() + " | "+ even.getJugador1() + " vs " + even.getJugador2();
											String ganador1 = "inicio.jsp?ganador="+even.getJugador1()+"&apuesta="+even.getGanador1()+"&contrincantes="+even.getJugador1()+"-"+even.getJugador2()+"&id="+even.getIdevento()+"&hora="+even.getHora()+"&tipo="+even.getTipo();
											String ganador2 = "inicio.jsp?ganador="+even.getJugador2()+"&apuesta="+even.getGanador2()+"&contrincantes="+even.getJugador1()+"-"+even.getJugador2()+"&id="+even.getIdevento()+"&hora="+even.getHora()+"&tipo="+even.getTipo();
											String empate="inicio.jsp?ganador="+even.getJugador1()+"-"+even.getJugador2()+"&apuesta="+even.getEmpate()+"&contrincantes="+even.getJugador1()+"-"+even.getJugador2()+"&id="+even.getIdevento()+"&hora="+even.getHora()+"&tipo="+even.getTipo();
											String apuesta1 = even.getJugador1() +  "    "+even.getGanador1();
											String apuesta2 = even.getJugador2() + "    "+even.getGanador2();
											String apuesta3 = "Empate    " + even.getEmpate();
										%>
											<td><%=evento %></td>
											<td >
												<a data-toggle="popover" title="Popover Header" data-content="Some content inside the popover" id="tabla" class="apuestalink" href="<%=ganador1%>"><%=apuesta1%></a></td>
												<td><a data-toggle="popover" title="Popover Header" data-content="Some content inside the popover" id="tabla" class="apuestalink" href="<%=ganador2%>"><%=apuesta2 %></a></td>
												<td ><a data-toggle="popover" title="Popover Header" data-content="Some content inside the popover" id="tabla" class="apuestalink" href="<%=empate%>"><%=apuesta3 %></a></td>
											<%}
									}
									
								}%>
								</tr>
        					<%}		
        					%>
        				</table>
        			<%} 
        			%>
        	
	</div>

<div class="row">
<div class="col-md-5">
</div>
<div class="col-md-6">
<div id="sopa">

</div>
</div>
<div class="col-md-1">
</div>
</div>

	<div class="modal fade body" id="modalBetForm"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="background-color:#e0a800" role="document">
        <div class="modal-content" style="background-color:#e0a800">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Apuesta</h4>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body mx-3">
                <div class="md-form mb-5">
                    <%List<tagevento> listado = new ArrayList<tagevento>();
		listado = (List<tagevento>)session.getAttribute("tagapuesta");
		ciclismo ci = new ciclismo();
		tenis te = new tenis();
		ci = (ciclismo)session.getAttribute("ciclismo");
		te = (tenis)session.getAttribute("tenis");
		int contador = 1;
		if(listado!=null)
		{%>
			<form action="controlador?hilo=hilo" method="Post" id="importe">
			<p style="visibility:hidden;color:red;">No tienes saldo</p>
			<div class="form-group">
			<%for(tagevento tag:listado)
			{
				
				if(tag.getTipo().contains("Ciclismo"))
				{%>
					<label style="color:#212529;">Ciclismo: <%=(((HashMap<String,evento>)session.getAttribute("listadoe")).get(tag.getIdEvento())).getEvento() %></label>
					<select id="ciclismo" name="ciclismo" class="custom-select" >
						<option>Froome Chistopher <%=ci.getFroome() %></option>
						<option>Sagan Peter <%=ci.getSagan() %></option>
						<option>Kristoff Alexander <%=ci.getKristoff() %></option>
						<option>Matthews Michael <%=ci.getMatthews()%></option>
						<option>Wellens Tim <%=ci.getWellens()%></option>
						<option>Alejandro Valverde <%=ci.getValverde() %></option>
					</select>
					<label name="labelimporte" style="color:#212529;">Importe: </label><input type="hidden" name="idusuario" value="<%=tag.getIdUsuario()%>"><input type="hidden" name="evento" value="<%=(((HashMap<String,evento>)session.getAttribute("listadoe")).get(tag.getIdEvento())).getEvento() %>"><input type="text" class="input form-control" name="importe<%=Integer.toString(contador)%>" number><br/>
					<%}
					
				else if(tag.getTipo().contains("Tenis"))
				{%>
					<label style="color:#212529;">Tenis:  <%=(((HashMap<String,evento>)session.getAttribute("listadoe")).get(tag.getIdEvento())).getEvento() %></label>
					<select id="tenis" name="tenis" class="custom-select" >
						<option>Rafa Nadal <%=te.getNadal() %></option>
						<option>Roger Fededer <%=te.getFederer() %></option>
						<option>Alexander Zverev <%=te.getZverev() %></option>
						<option>Marin Cilic <%=te.getCiclic() %></option>
						<option>Grigor Dimitrov <%=te.getDimitrov() %></option>
						<option>Juan Marin del Potro <%=te.getPotro() %></option>
					</select>
					<label name="labelimporte" style="color:#212529;">Importe: </label><input type="hidden" name="idusuario" value="<%=tag.getIdUsuario()%>"><input type="hidden" name="evento" value="<%=(((HashMap<String,evento>)session.getAttribute("listadoe")).get(tag.getIdEvento())).getEvento() %>"><input type="text" class="input form-control" name="importe<%=Integer.toString(contador)%>" number><br/>
					
				<%}
				else
				{
				%>
					<label style="color:#212529;"><%=tag.getJugadorapostado() %>  <%=tag.getLaapuesta() %></label><br/>
					<label style="color:#212529;"><%=tag.getContricantes() %></label><br/>
					<label name="labelimporte" style="color:#212529;">Importe: </label><input type="hidden" name="idusuario" value="<%=tag.getIdUsuario()%>"><input type="text" class="input form-control" name="importe<%=Integer.toString(contador)%>" number><br/>
					<%
				}
				contador=contador+1;
			}
			if(listado.size()>0) 
			{%>
			<div class="modal-footer d-flex justify-content-center">
                <button  style="backgorund-color:#212529;"class="btn btn-indigo"> <i style="color:#212529;" class="fa fa-paper-plane-o ml-1">Send</i></button>
            </div>
			<%}
		}
		%>	</div></form>
                </div>
            </div>
            
        </div>
    </div>
</div>

<%
if(session.getAttribute("mostrar")!=null)
{
	if((boolean)session.getAttribute("mostrar"))
	{
		session.setAttribute("mostrar", false);
	%>
		<script>
			$('#modalBetForm').modal('show'); 
		</script>
	<%} 
	}
%>	<div style="background-color:#004531;">
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
<!--  -->
		

<%for(int i=1;i<contador;i++)
{%>
<script>
	$("input[name$=<%=i%>]").keyup(function(){
		if($(this).val() > <%=(double)session.getAttribute("saldoactual")%>){
			alert("Has pasado el limite de saldo");
		} 
	});	
</script>
<%}	
%>
<script>
	$( document ).ready(function() {
		$("body").css("background-image" ,"<%=imagen%>");
		ajax("hacercontro");
		ajaxsaldo("hacercontro");
		ajaxsopa("sopa");
	});
	$("#account").click(function()
		{
			window.location ="controlador?accion=account";
		}		
	)
	$("#user").click(function()
		{
			window.location ="controlador?accion=user";
		}		
	)
	$("#historic").click(function()
		{
			window.location ="controlador?accion=historic";
		}		
	)
	$("#historicsuper").click(function()
			{
				window.location ="controlador?accion=historicsuper";
			}		
		)
	$("#bet").click(function()
		{
			window.location ="controlador?accion=bet";
		}		
	)
	$("#pay").click(function()
		{
		window.location ="tarjeta.jsp";
		}		
	)
   $("#life").click(function()
    	{
    		window.location ="http://localhost:3000";
    	}		
    )
   $("#statistics").click(function()
    	{
	   		window.location ="controlador?accion=grafica";
    	}		
    )
    $("#statisticsuper").click(function()
    	{
	   		window.location ="controlador?accion=graficasuper";
    	}		
    )
     $("#terminar").click(function()
    	{
    		window.location ="controlador?accion=terminar";
    	}		
    )
	$("#f").click(function()
		{
			window.location="controlador?deporte=Futbol"
		}		
	)
	$("#b").click(function()
		{
			window.location="controlador?deporte=Baloncesto"
		}		
	)
	$("#c").click(function()
		{
			window.location="controlador?deporte=Ciclismo"
		}		
	)
	$("#t").click(function()
		{
			window.location="controlador?deporte=Tenis"
		}		
	)
	function ajax(hacercontro)
	{
		$.get('controla', {ajax:hacercontro}
		, function(responseText) {
			$('#eventos').html(responseText);
		});	
	}
	function ajaxsopa(hacercontro)
	{
		$.get('controla', {ajaxsopa:hacercontro}
		, function(responseText) {
			$('#sopa').html(responseText);
		});	
	}
	function ajaxsaldo(hacercontro)
	{
		$.get('controla', {ajaxsaldo:hacercontro}
		, function(responseText) {
			$('#saldo').html(responseText);
		});	
	}
	function ajaxsopa()
	{
		$.get('controla', {ajaxsopa:'hacer'}
		, function(responseText) {
			$('#sopa').html(responseText);
		});	
	}
	$("#rally").click(function()
			{
		$("#te").attr("src", "./imagenes/tenis.png")
		$("#ba").attr("src", "./imagenes/baloncesto.png")
		$("#rug").attr("src", "./imagenes/rugby.png")
		$("#rall").attr("src", "./imagenes/rallyin.png")
		$("#fut").attr("src", "./imagenes/futbol.png")
		}		
	)
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
	)
	$("#sacadas").click(function()
	{
		window.location ="controlador?accion=con";
	});
	$("#logout").click(function()
	{
		window.location="controlador?logout=true"
	});
function ajaxdeporte(deporte)
{
		$.get('controla', {hacer:deporte}
		, function(responseText) {
			$('#eventos').html(responseText);
		});	
};

</script>
</body>
</html>
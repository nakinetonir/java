<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import= "java.util.ArrayList" %> 
<%@ page import= "java.util.List" %> 
<%@ page import= "java.util.HashMap" %> 
<%@ page import= "bean.*" %> 
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet" href="./css/register.css" type="text/css"></link>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.10.2.js"></script>  
  <link href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css" rel="stylesheet">
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.min.js"></script>  
  <link rel="stylesheet" href="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/css/bootstrapValidator.min.css"/>
  <script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/jquery.bootstrapvalidator/0.5.3/js/bootstrapValidator.min.js"> </script>
<title>Register</title>
</head>

<body class="body">
	<%
	registro reg = new registro();
	reg = (registro)session.getAttribute("logeado");
	List<pais> paises = new ArrayList<pais>();
	paises=(List<pais>)session.getAttribute("paises"); 
	int contador=0;%>
	<div class="row">
	<div class="col-md-3">
	
	</div>
	<div class="col-md-9">
		<form id="contactForm"  action="controlador?registrar=registro"method="post" class="form-horizontal">
    <div class="form-group">
        <div class="col-md-6">
        <label for="paises" style="color:#e0a800;">Select country</label>
            <select class="form-control" id="paises" name="paises" placeholder="Pais" required>
   <%
   		for(pais pa:paises)
   		{%>
   			<option id="<%=pa.getCode()%>" name="country" value="<%=pa.getPais()%>"><%=pa.getPais() %></option>
   		<%
   		contador=contador+1;}
   %>
  </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-6">
        <label for="title" style="color:#e0a800;">Select tittle</label>
        <select class="form-control " id="title" name="title" placeholder="Title" required>
  	<option name="title" id="Mr" value="Mr">Mr</option>
  	<option name="title" id="Mrs" value="Mrs">Mrs</option>
  	<option name="title" id="Ms" value="Ms">Ms</option>
  	<option name="title" id="Miss" value="Miss">Miss</option>
  </select>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-6">
        <label for="FirstName" style="color:#e0a800;">First Name</label>
           <input name="name" type="text" class="form-control" id="FirstName"  required >
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-6">
        <label for="Surname" style="color:#e0a800;">SureName</label>
           <input type="text" name="surename" class="form-control" id="Surname" required>
        </div>
    </div>
     <div class="form-group">
       <div class="col-md-6">
         <label for="day" style="color:#e0a800;">Date of Birth</label>
            <select class="form-control" id="Day" name="day"  required>
  <option>--Day--</option>
  </select>
  <select class="form-control" id="Month" name="month"  required>
  <option>--Month--</option>
  </select>
  <select class="form-control" id="Year" name="year"  required>
  <option>--Year--</option>
  </select>
        </div>
    </div>
     <div class="form-group">
       <div class="col-md-6">
        <label for="address" style="color:#e0a800;">Address</label>
        <input type="text" class="form-control" name="address" id="EmailAddress" aria-describedby="emailHelp"  required>
        </div>
    </div>
     <div class="form-group">
       <div class="col-md-6">
       <label for="movile Number" style="color:#e0a800;">Contact Number</label>label>
        <input type="number" class="form-control" name="movile" id="ContactNumber" required minlength="2" number>
        </div>
    </div>
     <div class="form-group">
    	<div class="col-md-6">
        <label for="email" style="color:#e0a800;">Email</label>
    <input type="email" class="form-control" name="email" id="email" required>
        </div>
    </div>
     <div class="form-group">
    	<div class="col-md-6">
        <label for="password" style="color:#e0a800;">Password</label>
    <input type="password" class="form-control" name="password" id="exampleInputPassword1" required>
        </div>
    </div>
    
    <!-- #messages is where the messages are placed inside -->
    <div class="form-group">
        <div class="col-md-12 col-md-offset-3">
            <div id="messages"></div>
        </div>
    </div>
    <div class="form-group">
        <div class="col-md-9 col-md-offset-3">
  <button type="submit" class="btn btn-primary">Submit</button>
 </div>
    </div>
</form>
	</div>
</div>
<script>
(function()
		{
		window.addEventListener('load', function()
		{
			cargarfecha();
			$('#contactForm').bootstrapValidator({
		        container: '#messages',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		            name: {
		                validators: {
		                    notEmpty: {
		                        message: 'The full name is required and cannot be empty'
		                    }
		                }
		            },
		            surname: {
		                validators: {
		                    notEmpty: {
		                        message: 'The surename address is required and cannot be empty'
		                    }
		                   }
		            },
		            day: {
		                validators: {
		                    notEmpty: {
		                        message: 'The day address is required and cannot be empty'
		                    }
		            	}
		            },
		            month: {
		                validators: {
		                    notEmpty: {
		                        message: 'The month address is required and cannot be empty'
		                    }
		                }
		            },
		            year: {
		                validators: {
		                    notEmpty: {
		                        message: 'The year address is required and cannot be empty'
		                    }
		                }
		            },
		            address: {
		                validators: {
		                    notEmpty: {
		                        message: 'The address is required and cannot be empty'
		                    }
		                }
		            },
		            movile: {
		                validators: {
		                    notEmpty: {
		                        message: 'The movile is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 14,
		                        max: 14,
		                        message: 'The movile must be less than 10 characters long'
		                    }
		                }
		            },
		            email: {
		                validators: {
		                    notEmpty: {
		                        message: 'The email is required and cannot be empty'
		                    }
		                }
		            },
		            password: {
		                validators: {
		                    notEmpty: {
		                        message: 'The password is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min : 8,
		                        message: 'The password must be more than 8 characters long'
		                    }
		                }
		            }
		        }
		    });
		}
		);
		})
function cargardia(mes)
{
	desplegabledia=document.getElementById('Day');
	for(var x=1; x<=mes; x++)
	{
		var opcion=document.createElement('option');
		opcion.setAttribute('value',x);
		opcion.appendChild(document.createTextNode(x));
		desplegabledia.appendChild(opcion);
	}
}
function cargarfecha()
{
	var meses=["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];
	var diasmes=[31,28,31,30,31,31,30,31,30,31,30,31];
	var desplegablemes=document.getElementById("Month");
	meses.forEach(function(el,pos,arr)
	{
		if(el!=null)
		{
				var Option=document.createElement('option');
				Option.setAttribute('value',el);
				Option.appendChild(document.createTextNode(el));
				desplegablemes.appendChild(Option);
		}
	});
	desplegablemes.addEventListener('click',function()
	{
		var mes = desplegablemes.options[desplegablemes.selectedIndex].value;
		meses.forEach(function(el,pos,arr){ 
			if(mes==el)
			{
				cargardia(diasmes[pos]);
			}
		});
	});
	var desplegableaño=document.getElementById("Year");
	for(var y=1920;y<(new Date()).getFullYear();y++)
	{
		if(y!=null)
		{
			var Option=document.createElement('option');
			Option.setAttribute('value',y);
			Option.appendChild(document.createTextNode(y));
			desplegableaño.appendChild(Option);
		}
	}
}   
$('#paises').change(function()
		{
			var id = $(this).find('option:selected').attr('id');
			$('#ContactNumber').val(id);
		}
)
$( document ).ready(function() {
		inicializar();
	});
function inicializar()
{
	$( "#paises option:checked" ).val("<%=reg.getPaises()%>");
	$( "#title option:checked" ).val("<%=reg.getTitle()%>");
	$("#FirstName").val("<%=reg.getName()%>");
	$("#Surname").val("<%=reg.getSurename()%>");
	$( "#Day option:checked" ).val("<%=reg.getDay()%>");
	$( "#Month option:checked" ).val("<%=reg.getMonth()%>");
	$( "#Year option:checked" ).val("<%=reg.getYear()%>");
	$("#EmailAddress").val("<%=reg.getAddress()%>");
	$("#ContactNumber").val("<%=reg.getMovile()%>");
	$("#exampleInputEmail1").val("<%=reg.getEmail()%>");
	$("#exampleInputPassword1").val("<%=reg.getPassword()%>");
}
</script>
</body>
</html>
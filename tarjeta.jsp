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
<title>Tarjeta</title>
</head>

<body class="body">
	<div class="contenedor">
		<div class="row">
		<div class="col-lg-3">
			
			</div>
			<div class="col-lg-6">
					<form id="formulario" action="controlador?pay=registro" method="Post">
	<div class="form-group col-lg-6">
	 <label for="Payment Method" style="color:#e0a800;">Pay Method:</label>
  <select class="form-control" id="metodo" name="metodo">
   		<option>Credit/Debit Card</option>
   		<option>PayPal</option>
   		<option>Skrill</option>
   		<option>Skrill 1-Tap</option>
   		<option>Paysafecard</option>
   		<option>Apple pay</option>
   		<option>Neteller </option>
   		<option>Entropay</option>
   		<option>Fast Bank Tranfer</option>
   		<option>Wire transfer</option>
   		<option>Cheque</option>
  </select>
</div>
<div class="form-group col-lg-6">
	<label for="Betting" style="color:#e0a800;">Betting Currency:</label>
	<select class="form-control" id="currency" name="currency">
   		<option>Pesos (ARL)</option>
   		<option>Brazilia (BRL)</option>
   		<option>Leva (BLR)</option>
   		<option>Koruny (CZK)</option>
   		<option>Kroner (DKK)</option>
   		<option>Euros (EUR)</option>
   		<option>Yen (JPN)</option>
   		<option>Pounds (GBP)</option>
   		<option>Dollars (USD)</option>
  </select>
</div>
<div class="form-group col-lg-6">
	<label for="Cardnumber" style="color:#e0a800;">Card Number</label>
  	<input name="cardnumber" type="number" class="form-control" id="Cardnumber" aria-describedby="emailHelp">
</div>
<div class="form-group col-lg-6">
   <label for="CardName" style="color:#e0a800;">Cardholder Name</label>
    <input name="cardname" type="text" class="form-control" id="name" aria-describedby="emailHelp" pattern="[a-zA-Z]">
    </div>
 <div class="form-group col-lg-6">
	<label for="StartDate" style="color:#e0a800;">Start Date</label>
  <select class="form-control" class="month" id ="Smonth" name="Smonth">
  <option>--Select--</option>
  </select>
  <select class="form-control" class="year" id ="Syear" name="Syear">
  <option>--Select--</option>
  </select>
 </div>
 
<div class="form-group col-lg-6">
	<label for="issue" style="color:#e0a800;">Issue Number</label>
    <input type="number" class="form-control " name="issue" id="issue">
    </div>
 <div class="form-group col-lg-6">
   <label for="deposit" style="color:#e0a800;">Deposit Amount EUR</label>
    <input type="number" class="form-control" name="deposit" id="deposit">
   </div>
 <div class="form-group col-lg-6">
	<label for="Deposit Limit Period" style="color:#e0a800;">Deposit Limit Period</label>
  <select class="form-control" id="limitdate" name="limitdate">
  <option>--Select--</option>
  <option>24 Hours</option>
  <option>7 Days</option>
  <option>1 Mount</option>
  </select>
  </div>
  <div class="form-group col-lg-6">
	<label for="Deposit Limit EUR" style="color:#e0a800;">Deposit Limit EUR</label>
  <select class="form-control" id="limitmoney" name="limitmoney">
  <option>--Select--</option>
  <option>Unlimited</option>
  <option>5</option>
  <option>100</option>
  <option>1000</option>
  <option>10000</option>
  <option>100000</option>
  <option>1000000</option>
  <option>10000000</option>
  </select>
  </div>
  <div class="form-group">
        <div class="col-md-9 col-md-offset-3">
            <div id="messages"></div>
        </div>
    </div> 
    <div class="form-group col-lg-12">
  <button type="submit" class="btn btn-primary">Make Deposit</button><button id="return" class="btn btn-primary">Return</button>
</div>
</form>

			</div>
			<div class="col-lg-3">
			
			</div>
		</div>
	</div>

<script>

(function()
		{
		window.addEventListener('load', function()
		{
			cargarfecha("Smonth","Syear");
			$('#formulario').bootstrapValidator({
		        container: '#messages',
		        feedbackIcons: {
		            valid: 'glyphicon glyphicon-ok',
		            invalid: 'glyphicon glyphicon-remove',
		            validating: 'glyphicon glyphicon-refresh'
		        },
		        fields: {
		        	cardnumber: {
		                validators: {
		                    notEmpty: {
		                        message: 'The card number is required and cannot be empty'
		                    },
		                    stringLength: {
		                        min: 16,
		                        max: 16,
		                        message: 'The card number must be 16 characters long'
		                    }
		                }
		            },
		            deposit: {
		                validators: {
		                    notEmpty: {
		                        message: 'The deposit is required and cannot be empty'
		                    }
		                }
		            },
		            issue: {
		                validators: {
		                    notEmpty: {
		                        message: 'The issue is required and cannot be empty'
		                    },
		                    stringLength: {
		                    	min: 3,
		                        max: 3,
		                        message: 'The issue must be 3 characters long'
		                    }
		                }
		            }
		        }
		    });
		}
		);
	})()

function cargarfecha(mont,year)
{
	var meses=["Enero","Febrero","Marzo","Abril","Mayo","Junio","Julio","Agosto","Septiembre","Octubre","Noviembre","Diciembre"];
	var desplegablemes=document.getElementById(mont);

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
	var desplegableaño=document.getElementById(year);

	for(var y=2018;y<(new Date()).getFullYear()+10;y++)
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
function espacioscard(){
    var flag1 = true;
    var contador = 0;
    var hacer= false;
    $('#Cardnumber').keydown(function()
    	{
    		contador=contador+1;
	    	if(contador==5 && hacer==false)
	    	{
	    		$(this).val($(this).val()+" ");
	    		hacer=true;
	    		contador = contador-1;
	    	}
   			if(contador % 4 ===0  && hacer==true)
  			{
   				$(this).val($(this).val()+" ");
  			}
   		}		
    )
}
$("#return").click(function()
	{
		window.location="inicio.jsp";
	}		
)
</script>
</body>
</html>
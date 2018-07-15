<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
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
<title>Login</title>
<style>

.body
{
	background-image: url("./imagenes/todos.jpg");
	background-color:#212529;
}
</style>
</head>
<body class="body">
	<div class="modal fade body" id="modalBetForm"  tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog" style="background-color:#e0a800" role="document">
        <div class="modal-content" style="background-color:#e0a800">
            <div class="modal-header text-center">
                <h4 class="modal-title w-100 font-weight-bold">Registro</h4>
              </div>
            <div class="modal-body mx-3">
                <div class="md-form mb-5">
                  	<form id="formulario" action="controlador?logear=true" method="POST">
                  	 <div class="row">
		       <div class="col-md-12">
		        	
		       <input type="email" class="form-control" id="alias" name="Alias" placeholder="Email" required>
		       </div>
		       </div>
		       <div class="row">
		       <div class="col-md-12">
		            <input type="password" class="form-control" id="password" name="Password" placeholder="Password" required>
		            <input type="submit" value="Logear" class="btn btn-warning btn-lg btn-block">
		            <button id="registrar" class="btn btn-warning btn-lg btn-block">Register</button>
		            <%if(session.getAttribute("nologin")!=null)
		            {
		            	if((boolean)session.getAttribute("nologin")==true)
			        	{
			        	%>
			        		<p style="color:black;">Login incorrecto</p>
			        	<%}
			        		
		            }%>
		            
		            </div>
		            </div>
		          </form>
                </div>
            </div>
            
        </div>
    </div>
</div>
		  
</body>


<script>
$('#modalBetForm').modal('show'); 
$("#registrar").click(function()	{
	window.location ="register.jsp";
});
</script>
</html>
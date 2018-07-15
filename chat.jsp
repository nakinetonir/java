<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Chat</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/css/bootstrap.min.css" integrity="sha384-9gVQ4dYFwwWSjIDZnLEWnxCjeSWFphJiwGPXr1jddIhOegiu1FwO5qRGvFXOdJZ4" crossorigin="anonymous">
<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.0/umd/popper.min.js" integrity="sha384-cs/chFZiN24E4KMATLdqdvsezGxaGsi4hLGOzlXwp5UZB1LY//20VyM2taTB4QvJ" crossorigin="anonymous"></script> -->
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.0/js/bootstrap.min.js" integrity="sha384-uefMccjFJAIv6A+rW+L4AHf99KvxDjWSu1z9VI8SKNVmz4sk7buKt/6v9KI65qnm" crossorigin="anonymous"></script>
<script src="/socket.io/socket.io.js"></script>
    <script src="https://code.jquery.com/jquery-1.11.1.js"></script>
    <script>
        $(function () {
          var socket = io();
          $('form').submit(function(){
            socket.emit('chat message', $('#m').val(),$('#name').val());
            $('#m').val('');
            return false;
          });
          socket.on('chat message', function(msg){
            $('#messages').append($('<li style="color:#e0a800">').text(msg));
          });
        });
      </script>
</head>
<body style="background-color:#212529;">
<div>
	<video  src="<%=(String)session.getAttribute("videodeporte") %>" autoplay muted loop></video>
</div>
<h3 style="color:#20B2AA" id="nameparrafo" class="rounded-circle"></h3>
<ul id="messages" class="messages" style="list-style:none;"></ul>
    <form action="">
    <div class="form-group">
      <div class="form-control" style="position:absolute;button:0%;">
      <input id="name" type="text" class="form-control"/>
      <input id="m" autocomplete="off" class="form-control"/><button class="btb btn-warning">Send</button>
      </div>
      </div>
    </form>
    <input type="button" id="close" class="btb btn-warning" value="Close">
    <script>
        $('#name').focusout(function()
        {
            $('#nameparrafo').text($('#name').val());
            $("name").attr('disabled','disabled');
        }
        )
        $('#close').click(function()
        {
        	window.close();
        });
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
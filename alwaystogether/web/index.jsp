<%-- 
    Document   : Always_Login
    Created on : 17/06/2018, 15:55:59
    Author     : thiag
--%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%> 
<!DOCTYPE html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Login</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
	<br>
	<br>
	<div class="container" id="container-login">
		<div class="row">
                    <div class="col-sm-4"><h4><a href="/always"><img id="foto-login" src="./imagens/user.jpg" width="100" height="50"></a></h4></div>
		</div>
		<div class="row">
			<form action="login" method="post">
	    		<div class="input-group">
	      			<span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
	      			<input id="email" type="text" class="form-control" name="email" placeholder="Email"/>
	    		</div>
	    		<br>
	    		<div class="input-group">
	      			<span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
	      			<input id="password" type="password" class="form-control" name="password" placeholder="Senha">
	    		</div>
	    		<br>
	 	 	
		</div>	
		<div class="row" id="glypicon-login">
		    <div class="col-sm-4"></div>
		    <div class="col-sm-2">	
		      	<button type="submit" class="btn btn-info btn-lg">
		      		<span class="glyphicon glyphicon-play-circle"></span> Entrar
		      	</button>
                        </form>
		    </div>
	     </div>
	     <br>
	     <div class="row" id="glypicon-login">
		    <div class="col-sm-6"></div>
		    	<div class="col-sm-6">
					<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal">
						<span class="glyphicon glyphicon-wrench"></span> Esqueci minha Senha
					</button>
					<!-- Modal -->
	  				<div class="modal fade" id="myModal" role="dialog">
	    				<div class="modal-dialog">
	      			<!-- Modal content-->
	      					<div class="modal-content">
	        					<div class="modal-header">
	          						<button type="button" class="close" data-dismiss="modal">&times;</button>
	          						<h4 class="modal-title">Recuperação de Senha</h4>
	        					</div>
	        					<div class="modal-body">
	         						<form>
	         							<div class="row">
		         							<div class="col-sm-12">
												<input name="email-senha" id=" " type="text" class="form-control" placeholder="Email">
											</div>
										</div>
										<br>
										<div class="row">
											<div class="col-sm-4"></div>
		         							<div class="col-sm-4">
												<a href="#" class="btn btn-info btn-lg">
	      											<span class="glyphicon glyphicon-send"></span> Enviar 
	      										</a>
											</div>
											<div class="col-sm-4"></div>
										</div>
	         						</form>
	        					</div>
	      					</div>
	    				</div>
	  				</div>
				</div>
	     </div>
	</div>				
</body>
</html>
	
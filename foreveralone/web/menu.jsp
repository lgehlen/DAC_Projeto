<%-- 
    Document   : menu
    Created on : 16/06/2018, 14:00:05
    Author     : luis_
--%>

<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Gerencia</title>
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
        <header class="home">

		<div class="bg-img" >
			<div class="overlay"></div>
		</div>
		<!-- Nav -->
		<nav id="nav" class="navbar nav-transparent">
	  		<br>
	  		<div id="cabe">
	  			<!--LOGO -->
	  			<div class="col-sm-1"> <a href="/foreveralone/login"><img id="logo" src="logo-forever.png" alt="logo"></a></div>
		  		<div class="container">
					<div class="row">
		  				<div class="col-sm-1">
		  					<a href="index.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-home"></span> Home
		  					</a>
		  				</div>
		  				<div class="col-sm-3" id="correcao-menu">
		  					<a href="gestao_relatoriosA" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-open"></span> Gerenciar Relatórios
		  					</a>
		  				</div>
		  				<div class="col-sm-3" id="correcao-menu">
		  					<a href="#" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-user"></span> Gerenciar Clientes
		  					</a>
		  				</div>
		  				<div class="col-sm-3" id="correcao-menu">
		  					<a href="gestaofuncionarios.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-link"></span> Gerenciar Funcionários
		  					</a>
		  				</div>
		  				<div class="col-sm-1" id="dropdown-menu"> 
	    					<div class="dropdown">
	    						<button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
	    						<span class="caret"></span></button>
	   							<ul class="dropdown-menu">
	   								<li><a> <span class="glyphicon glyphicon-user"></span>   ${loginBean.nome}   </a></li>
	   								<li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo: ${loginBean.tipo} </a></li>
		      						<li><a href="#">Home</a></li>
		      						<li class="divider"></li>
		      						<li><a href="logout"><span class="glyphicon glyphicon-share"></span> Sair</a></li> 
	    						</ul>
	  						</div>
    					</div>
		  			</div>
		  		</div>
		  	</div>
		</nav>
	</header>
    </body>
</html>

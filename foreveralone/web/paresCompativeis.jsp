<%-- 
    Document   : paresCompativeis
    Created on : 10/06/2018, 16:56:18
    Author     : gqueiroz
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
	<title>Pares Compativeis</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body >
	<!-- Header -->
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
		  				<div class="col-sm-2">
		  					<a href="/" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-home"></span> Home
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="festas.jsp" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-fire"></span> Festas
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="encontros.jsp" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-heart"></span> Encontros
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="casamento.jsp" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-gift"></span> Casamento
		  					</a>
		  				</div>
		  				<div class="col-sm-2" >
		  					<a href="preferencias.jsp" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-filter"></span> Preferências
		  					</a>
		  				</div>
		  				<div class="col-sm-1"> 
	    					<div class="dropdown">
	    						<button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
	    						<span class="caret"></span></button>
	   							<ul class="dropdown-menu">
	   								<li><a> <span class="glyphicon glyphicon-user"></span>   ${loginBean.nome}   </a></li>
	   								<li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo: ${loginBean.tipo}   </a></li>
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
	<!--Corpo da página-->
	<div class="container" id="container-pesquisa-pares">
		<div class="row">
			<div class="col-sm-4"><h4>Pares Compativeis</h4></div>
		</div>
		<br>
		<div class="row">
			<div class="col-sm-3">
				<img class="foto-perfil" src="imagens/user.jpg" alt="" />
			</div>
			<!--Nome do usuário que deu match-->
			<div class="col-sm-9">
				<!--Nome do usuário que deu match-->
				<strong>Primeiro Nome:</strong><h4>Ana</h4>
				<p>  Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dignissim mattis consequat. Phasellus sit amet enim vitae est consectetur tincidunt quis et diam. Nam et dolor est. Aenean magna nunc, vulputate vel dapibus sed, laoreet et lacus. Phasellus sed urna non dui euismod volutpat quis id leo. Fusce dolor nulla, cursus id massa tempus, volutpat luctus ipsum. Cras in nulla sed augue rhoncus convallis. Donec a rutrum lorem, nec posuere neque. Aenean dui nunc, tempor et porta nec, condimentum eu lacus. Aliquam vitae maximus dui, at interdum tellus. Nulla eleifend faucibus venenatis. Mauris egestas consectetur sapien, et porttitor est ornare id. Aliquam eu lectus eget nulla efficitur tincidunt eu vel ante.
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dignissim mattis consequat. Phasellus sit amet enim vitae est consectetur tincidunt quis et diam. Nam et dolor est. Aenean magna nunc, vulputate vel dapibus sed, laoreet et lacus. Phasellus sed urna non dui euismod volutpat quis id leo. Fusce dolor nulla, cursus id massa tempus, volutpat luctus ipsum. Cras in nulla sed augue rhoncus convallis. Donec a rutrum lorem, nec posuere neque. Aenean dui nunc, tempor et porta nec, condimentum eu lacus. Aliquam vitae maximus dui, at interdum tellus. Nulla eleifend faucibus venenatis. Mauris egestas consectetur sapien, et porttitor est ornare id. Aliquam eu lectus eget nulla efficitur tincidunt eu vel ante.
				um dolor sit amet, consectetur adipiscing elit. Pellentesque dignissim mattis consequat. Phasellus sit amet enim vitae est consectetur tincidunt quis et diam. Nam et dolor est. Aenean magna nunc, vulputate vel dapibus sed, laoreet et lacus. Phasellus sed urna non dui euismod volutpat quis id leo. Fusce dolor nulla, cursus id massa tempus, volutpat luctus ipsum. Cras in nulla sed augue rhoncus convallis. Donec a rutrum lorem, nec posuere neque. Aenean dui nunc, tempor et porta nec, condimentum eu lacus. Aliquam vitae maximus dui, at interdum tellus. Nulla eleifend faucibus venenatis. Mauris egestas consectetur sapien, et porttitor est ornare id. Aliquam eu lectus eget nulla efficitur tincidunt eu vel ante.
				Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque dignissim mattis consequat. Phasellus sit amet enim vitae est consectetur tincidunt quis e

				</p>
			</div>
		</div>
		<div class="row" id="glypicon-pares-compativeis">
	      	<div class="col-sm-10"></div>
	      	<div class="col-sm-1">	
	      		<a href="#" class="btn btn-default btn-lg">
         		 <span class="glyphicon glyphicon-heart-empty"></span>Chamar
        		</a>
	      	</div>
	      	<div class="col-sm-1">	
	      		<a href="encontros.html" class="btn btn-default btn-lg">
	      			<span class="glyphicon glyphicon-chevron-left"></span> Voltar 
	      		</a>
	      	</div>
	    </div>
	</div>
	<br>
	<footer class="container-fluid text-center">
        <jsp:useBean id="configuracao" scope="application" class="br.ufpr.tads.foreveralone.beans.ConfigBean" />
        <p>Em caso de problemas contactar o administrador: 
            <jsp:getProperty name="configuracao" property="adminEmail" /> </p>
	</footer>
</body>
</html>
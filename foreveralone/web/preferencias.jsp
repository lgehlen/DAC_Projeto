<%-- 
    Document   : preferencias
    Created on : 10/06/2018, 16:58:39
    Author     : gqueiroz
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<!DOCTYPE html>

<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Preferências</title>
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
	  			<div class="col-sm-1" > <a href="/foreveralone/login"><img id="logo" src="logo-forever.png" alt="logo"></a></div>
		  		<div class="container">

					<div class="row">
		  				<div class="col-sm-2">
		  					<a href="/" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-home"></span> Home
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="festas.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-fire"></span> Festas
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="#" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-heart"></span> Encontros
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="casamento.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-gift"></span> Casamento
		  					</a>
		  				</div>
		  				<div class="col-sm-2" >
		  					<a href="preferencias.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-filter"></span> Preferências
		  					</a>
		  				</div>
		  				<div class="col-sm-1"> 
	    					<div class="dropdown">
	    						<button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
	    						<span class="caret"></span></button>
	   							<ul class="dropdown-menu">
	   								<li><a> <span class="glyphicon glyphicon-user"></span>   User   </a></li>
	   								<li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo:Gabriel   </a></li>
		      						<li><a href="/">Home</a></li>
		      						<li class="divider"></li>
		      						<li><a href="#"><span class="glyphicon glyphicon-share"></span> Sair</a></li> 
	    						</ul>
	  						</div>
    					</div>
		  			</div>
		  		</div>
		  	</div>
		</nav>
	</header>
	<!--Corpo da página-->
	<div class="container" id="container-manter-preferencias">
		<div class="row">
			<div class="col-sm-4"><h4> Lista de Preferências</h4></div>
		</div>
		<div class="row">
			<!--SEXO-->
			<div class="col-sm-1"><h4> <label >Sexo:</label> </h4></div>
			<div class="col-sm-5">
				<div id="radios">
					<label class="radio-inline" id="radio">
	     				<h4><input type="radio" name="optradio" value="">Masculino</h4>
	   				</label>
	    			<label class="radio-inline" id="radio1">
	      				<h4><input type="radio" name="optradio" value="">Feminino</h4>
	   	 			</label> 
   	 			</div>
   	 		</div>
		</div>
		<br>
		<!--FAIXA DE IDADE -->
		<div class="row">
			<form name="dadospreferencias" action="coleta_preferencias" onsubmit="" method= "post" >
				<div class="col-sm-4">
					<label for="sel1">Faixa de Idade:</label>
		      		<select class="form-control" id="faixa-de-idade" size="1"> 
			        	<option value="*">Escolha uma Opção</option>
			        	<option value=" ">18-28</option>
			        	<option value=" ">28-38</option>
			        	<option value=" ">38-48</option>
			        	<option value=" ">48-58</option>
		      		</select>
		      	</div>
		      	<!--COR DO CABELO -->
		      	<div class="col-sm-4">
					<label for="sel1">Cor do Cabelo:</label>
		      		<select class="form-control" id="faixa-de-idade" size="1"> 
			        	<option value="*">Escolha uma Opção</option>
			        	<option value=" ">Loiro</option>
			        	<option value=" ">Castanho</option>
			        	<option value=" ">Ruivo</option>
			        	<option value=" ">Branco</option>
		      		</select>
		      	</div>
		      	<!--COR DA PELE -->
		      	<div class="col-sm-4">
					<label for="sel1">Cor da Pele:</label>
		      		<select class="form-control" id="faixa-de-idade" size="1"> 
			        	<option value="*">Escolha uma Opção</option>
			        	<option value=" ">Negro</option>
			        	<option value=" ">Amarelo</option>
			        	<option value=" ">Branco</option>
			        	<option value=" ">Pardo</option>
		      		</select>
		      	</div>
		     </form>
	    </div>
	      	<br>
	      	<br>
	      	<!--INPUTS -->
	      	<div class="row" id="glypicon-preferencia">
	      		<div class="col-sm-8"></div>
	      		<div class="col-sm-2">	
	      			<a href="#" class="btn btn-default btn-lg">
	      				<span class="glyphicon glyphicon-chevron-left"></span> Voltar 
	      			</a>
	      		</div>
	      		<div class="col-sm-2">	
	      			<a href="#" class="btn btn-default btn-lg">
	      				<span class="glyphicon glyphicon-plus-sign"></span> Inserir
	      			</a>
	      		</div>
	      	</div>
	      	<br>
		</div>
		<br>
	</div>
	<br>
	<footer class="container-fluid text-center">
        <jsp:useBean id="configuracao" scope="application" class="br.ufpr.tads.foreveralone.beans.ConfigBean" />
        <p>Em caso de problemas contactar o administrador: 
            <jsp:getProperty name="configuracao" property="adminEmail" /> </p>
	</footer>
</body>
</html>

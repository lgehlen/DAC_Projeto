<%-- 
    Document   : pesquisaPares
    Created on : 10/06/2018, 16:57:58
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
	<title>Pesquisa-Pares</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
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
	  			<div class="col-sm-1" id="logo"> <a href="/"><img id="logo" src="logo-forever.png" alt="logo" width="120" height="100"></a></div>
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
	<div class="container" id="container-pesquisa-pares">
		<div class="row">
			<div class="col-sm-4"><h4>Pares Compativeis</h4></div>
		</div>
		<table class="table table-striped" style="text-align:center;">
			<thead>
   				<tr>
			      <th id="colunas-pesquisa" scope="col">Primeiro Nome</th>
			      <th id="colunas-pesquisa" scope="col">Sexo</th>
			      <th id="colunas-pesquisa" scope="col">Escolaridade</th>
			      <th id="colunas-pesquisa" scope="col">Cor do Cabelo</th>
			      <th id="colunas-pesquisa" scope="col">Cor da Pele</th>
			      <th id="colunas-pesquisa" scope="col">Opções</th>
    			</tr>
  			</thead>
		  <tbody>
		    <tr>
		      <th id="colunas-pesquisa" scope="row">Thiago Drulla</th>
		      <td><h5> F</h5></td>
		      <td><h5> Ensino Fundamental</h5></td>
		      <td><h5> Loiro</h5></td>
		      <td><h5> Branco</h5></td>
		      <td>
		      	<h4>
			      	<a href="pares-compativeis.html"><span class="glyphicon glyphicon-eye-open"></span></a>
			      	<a href="#"><span class="glyphicon glyphicon-send"></span></a>
		      	</h4>
		      	</h4>
		      </td>
		     
		    </tr>
		   <tr>
		      <th id="colunas-pesquisa" scope="row">Thiago Drulla</th>
		      <td><h5> F</h5></td>
		      <td><h5> Ensino Fundamental</h5></td>
		      <td><h5> Loiro</h5></td>
		      <td><h5> Branco</h5></td>
		      <td>
		      	<h4>
			      	<a href="pares-compativeis.html"><span class="glyphicon glyphicon-eye-open"></span></a>
			       	<a href="#"><span class="glyphicon glyphicon-send"></span></a>
		      	</h4>
		      </td>
		     
		    </tr>
		   <tr>
		      <th id="colunas-pesquisa" scope="row">Thiago Drulla</th>
		      <td><h5> F</h5></td>
		      <td><h5> Ensino Fundamental</h5></td>
		      <td><h5> Loiro</h5></td>
		      <td><h5> Branco</h5></td>
		      <td>
		      	<h4>
			      <a href="pares-compativeis.html"><span class="glyphicon glyphicon-eye-open"></span></a>
			      <a href="#"> <span class="glyphicon glyphicon-send"></span></a>
		      	</h4>
		      	</h4>
		      </td>
		     
		    </tr>
		  </tbody>
		</table>
		<div class="row" id="glypicon-encontro">
	      	<div class="col-sm-11"></div>
	      	<div class="col-sm-1">	
	      		<a href="encontros.html" class="btn btn-info btn-lg">
	      			<span class="glyphicon glyphicon-chevron-left"></span> Voltar 
	      		</a>
	      	</div>
	    </div>
	</div>
	

	<br>
	<footer id="footer">
		<div id="estilorodape">
	
			<div class="row">
				<div class="col-sm-6" id="controdape"><h5 >Conteudo X </h5>
					<h5><a id="linksrodape" href="#"> Rasckspace</a></h5>
					<h5><a id="linksrodape" href="#"> Rasckspace</a></h5>
				</div>
				<div class="col-sm-6" id="controdape"><h5 >EMPRESA</h5>
					<h5> <a id="linksrodape" href="https://www.liguesite.com.br/sobre-nos/">Sobre</a></h5>
					<h5> <a id="linksrodape" href="https://www.liguesite.com.br/blog/">Blog</a></h5>
				</div>
			</div>
			<div class="rodapef">
				<div class="row">
					<div class="col-sm-2" ></div>
					<div class="col-sm-2" >
						<h4> 2018 © ForeverAlone Inc.</h4>
					</div>
					<div class="col-sm-2" >
						<h5> <a id="linksrodape" href="#">Termos de Compromisso</a></h5>
					</div>
					<div class="col-sm-2" >
						<h5>SAC:sac@forever.com.br</h5>
					</div>
				</div>
				<br>
			</div>
		</div>
	</footer>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
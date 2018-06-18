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
<!DOCTYPE html>

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
	   								<li><a> <span class="glyphicon glyphicon-user"></span>   ${loginBean.nome}   </a></li>
	   								<li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo: ${loginBean.tipo}  </a></li>
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
		      	<a href="pares-compativeis.html" type="button" class="btn btn-default btn-sm">
	          		<span class="glyphicon glyphicon-eye-open"></span></a>
	        	</a>
			    <button  type="button" class="btn btn-default btn-sm">
	          		<span class="glyphicon glyphicon-send"></span>
	        	</button>
		      </td>
		    </tr>
		   <tr>
		      <th id="colunas-pesquisa" scope="row">Thiago Drulla</th>
		      <td><h5> F</h5></td>
		      <td><h5> Ensino Fundamental</h5></td>
		      <td><h5> Loiro</h5></td>
		      <td><h5> Branco</h5></td>
		      <td>
		      	<a href="pares-compativeis.html" type="button" class="btn btn-default btn-sm">
	          		<span class="glyphicon glyphicon-eye-open"></span></a>
	        	</a>
			    <button  type="button" class="btn btn-default btn-sm">
	          		<span class="glyphicon glyphicon-send"></span>
	        	</button>
		      </td>
		     
		    </tr>
		   <tr>
		      <th id="colunas-pesquisa" scope="row">Thiago Drulla</th>
		      <td><h5> F</h5></td>
		      <td><h5> Ensino Fundamental</h5></td>
		      <td><h5> Loiro</h5></td>
		      <td><h5> Branco</h5></td>
		      <td>
		      	<a href="pares-compativeis.html" type="button" class="btn btn-default btn-sm">
	          		<span class="glyphicon glyphicon-eye-open"></span></a>
	        	</a>
			    <button  type="button" class="btn btn-default btn-sm">
	          		<span class="glyphicon glyphicon-send"></span>
	        	</button>
		      	</h4>
		      </td>
		     
		    </tr>
		  </tbody>
		</table>
		<div class="row" id="glypicon-encontro">
	      	<div class="col-sm-11"></div>
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
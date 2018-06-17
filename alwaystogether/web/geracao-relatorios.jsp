<%-- 
    Document   : geracao-relatorios
    Created on : 17/06/2018, 17:06:45
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
	<title>geracao-relatorios</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="CSS/style.css" />
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
	  		<!--LOGO -->
	  		<div class="col-sm-1"> <a href="/"><img id="logo" src="logo-always.png" alt="logo"></a></div>
		  	<div class="container">
				<div class="row">
		  			<div class="col-sm-2">
		  				<a href="index.html" class="btn btn-primary btn-lg">
		  					<span class="glyphicon glyphicon-home"></span> Home
		  				</a>
		  			</div>
		  			<div class="col-sm-3" id="correcao-menu">
		  				<a href="manter-pedidos.jsp" class="btn btn-primary btn-lg">
		  					<span class="glyphicon glyphicon-paperclip"></span> Relatórios
		  				</a>
		  			</div>
		  			<div class="col-sm-3" id="correcao-menu">
		  				<a href="deleta-conta.jsp" class="btn btn-primary btn-lg">
		  					<span class="glyphicon glyphicon-user"></span>Funcionários
		  				</a>
		  			</div>
		  			<div class="col-sm-1" id="dropdown-menu"> 
                                            <div class="dropdown">
                                                    <button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
                                                    <span class="caret"></span></button>
                                                            <ul class="dropdown-menu">
                                                                    <li><a> <span class="glyphicon glyphicon-user"></span>   User   </a></li>
                                                                    <li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo:Administrador</a></li>
                                                            <li><a href="/">Home</a></li>
                                                            <li class="divider"></li>
                                                            <li><a href="#"><span class="glyphicon glyphicon-share"></span> Sair</a></li> 
                                                    </ul>
                                            </div>
                                        </div>
		  		</div>
		  	</div>
		</nav>
	</header>
	<div class="container" id="container-detalhe-orcamento">
		<div class="row">
			<div class="col-sm-4"><h3>Gestão de Relatórios</h3></div>
			<div class="col-sm-7"></div>
		</div>
		<table class="table table-striped" style="text-align:center;">
			<thead>
   				<tr>
			      <th scope="col">Relatórios</th>
			      <th id="colunas-pesquisa" scope="col"></th>
			      <th id="colunas-pesquisa" scope="col"></th>
			       <th id="colunas-pesquisa" scope="col">Opções</th>

    			</tr>
  			</thead>
		  <tbody>
		    <tr>
		      <th scope="row"><h4>Relatório Sintético</h4></th>
		      <td></td>
		      <td></td> 	
		      <td>
	        	<button  type="button" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-cloud-download"></span>
	        	</button>
		      </td>
		    </tr>
		   <tr>
		      <th  scope="row"><h4>Relatório Financeiro</h4></th>
		      <td> </td>
		      <td> </td> 	
		      <td>
	        	<button  type="button" class="btn btn-default btn-lg">
	          		<span class="glyphicon glyphicon-cloud-download"></span>
	        	</button>
		      </td>
		    </tr>
		  </tbody>
		</table>
		<div class="row" id="glypicon-evento">
	      	<div class="col-sm-10"></div>
	      	<div class="col-sm-2">	
	      		<a href="#" class="btn btn-default btn-lg">
	      			<span class="glyphicon glyphicon-chevron-left"></span> Voltar 
	      		</a>
	      	</div>
	     </div>
	</div>
	<br>
	<footer class="container-fluid text-center">
       <p>Em caso de problemas contactar o administrador: 
	</footer>
</body>

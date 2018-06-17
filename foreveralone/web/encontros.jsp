<%-- 
    Document   : encontros
    Created on : 10/06/2018, 16:48:43
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
	<title>Encontros</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />
	<link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<!--<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
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
	  			<div class="col-sm-1"> <a href="/"><img id="logo" src="logo-forever.png" alt="logo"></a></div>
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
	<div class="container" id="container-encontros">
		<div class="row">
			<div class="col-sm-4"><h4> Encontros Pendentes</h4></div>
		</div>
		<br>
		<div class="panel-group" id="accordion">
			<div class="panel panel-default">
			    <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse1">Luiza Storrer</a>
			        </h4>
			      </div>
			      <div id="collapse1" class="panel-collapse collapse in">
			        <div class="panel-body">
			        	Nome:<p>Luiza Storrer</p>   Data:<p>10/06/2018</p>   Local:<p>Na casa dela</p>
			        </div>
			      </div>
			    </div>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			          <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Juliana Vieira</a>
			        </h4>
			      </div>
			      <div id="collapse2" class="panel-collapse collapse">
			        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
			        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
			        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
			      </div>
			    </div>
			    <div class="panel panel-default">
			      <div class="panel-heading">
			        <h4 class="panel-title">
			         <a data-toggle="collapse" data-parent="#accordion" href="#collapse2">Juliana Vieira</a>
			        </h4>
			      </div>
			      <div id="collapse3" class="panel-collapse collapse">
			        <div class="panel-body">Lorem ipsum dolor sit amet, consectetur adipisicing elit,
			        sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam,
			        quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</div>
			      </div>
			    </div>
  		</div> 
	</div>
	<div class="container" id="container-encontros">
		<div class="row">
			<div class="col-sm-4"><h4> Solicitações Recebidas</h4></div>
		</div>
		<br>
		<form>
			<table class="table table-striped">
			  <tbody>
			    <tr>
			      <th scope="row">Thiago Drulla</th>
			      <td><h5><span class="glyphicon glyphicon-calendar"> 09/06/2018</span></h5></td>
			      <td><h5><span class="glyphicon glyphicon-time"> 17:27</span></h5></td>
			      <td>
				  	<button type="button" class="btn btn-default btn-sm">
	          			<span class="glyphicon glyphicon-ok"></span> 
	        		</button>
				    <button type="button" class="btn btn-default btn-sm">
	         	 		<span class="glyphicon glyphicon-remove"></span>
	        		</button>
				    <button type="button" class="btn btn-default btn-sm">
	          			<span class="glyphicon glyphicon-plus"></span>
	        		</button>
			      </td>
			    </tr>
			    <tr>
			      <th scope="row">Thiago Drulla</th>
			      <td><h5><span class="glyphicon glyphicon-calendar"> 09/06/2018</span></h5></td>
			      <td><h5><span class="glyphicon glyphicon-time"> 17:27</span></h5></td>
			      <td>
			      	<button type="button" class="btn btn-default btn-sm">
	          			<span class="glyphicon glyphicon-ok"></span> 
	        		</button>
				    <button type="button" class="btn btn-default btn-sm">
	         	 		<span class="glyphicon glyphicon-remove"></span>
	        		</button>
				    <button type="button" class="btn btn-default btn-sm">
	          			<span class="glyphicon glyphicon-plus"></span>
	        		</button>
			      </td>
			    </tr>
			    </tr>
			    <tr>
			      <th scope="row">Thiago Drulla</th>
			      <td><h5><span class="glyphicon glyphicon-calendar"> 09/06/2018</span></h5></td>
			      <td><h5><span class="glyphicon glyphicon-time"> 17:27</span></h5></td>
			      <td>
			      	<button type="button" class="btn btn-default btn-sm">
	          			<span class="glyphicon glyphicon-ok"></span> 
	        		</button>
				    <button type="button" class="btn btn-default btn-sm">
	         	 		<span class="glyphicon glyphicon-remove"></span>
	        		</button>
				    <button type="button" class="btn btn-default btn-sm">
	          			<span class="glyphicon glyphicon-plus"></span>
	        		</button>
			      </td>
			    </tr>
			  </tbody>
			</table>
		</form>
		<div class="row" id="glypicon-encontro">
	      	<div class="col-sm-9"></div>
	      	<div class="col-sm-1">	
	      		<a href="#" class="btn btn-default btn-sm">
	      			<span class="glyphicon glyphicon-chevron-left"></span> Voltar 
	      		</a>
	      	</div>
	      	<div class="col-sm-2">	
	      		<a href="pesquisa-pares.html" class="btn btn-default btn-sm">
	      			<span class="glyphicon glyphicon-plus-sign"></span> Procurar Novos Pares
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
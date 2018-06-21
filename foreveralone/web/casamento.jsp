<%-- 
    Document   : casamento
    Created on : 10/06/2018, 16:47:54
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
	<title>Casamento</title>
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
	  			<div class="col-sm-1"><img id="logo" src="logo-forever.png" alt="logo"></div>
		  		<div class="container">
					<div class="row">
		  				<div class="col-sm-2">
		  					<a href="/" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-home"></span> Home
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="encontros.jsp" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-fire"></span> Festas
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="encontros.jsp" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-heart"></span> Encontros
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="CasamentoServlet" class="btn btn-primary btn-lg">
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
	   								<li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo: ${loginBean.tipo}  </a></li>
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
	<div class="container" id="container-casamento">
		<ul class="nav nav-tabs">
    		<li class="active"><a href="#first-tab" data-toggle="tab">Orçamentos</a></li>
    		<li><a href="#second-tab" data-toggle="tab">Solicitar</a></li>
    	</ul>
    	<!--Aba Orçamento-->
    	<div class="tab-content">
    		<div class="tab-pane active in" id="first-tab">
                                <c:forEach items="${orcamentos}" var="x" varStatus="i">
                                <div class="panel-group" id="accordion">
					<div class="panel panel-default">
					    <div class="panel-heading">
					        <h4 class="panel-title">
					          <a data-toggle="collapse" data-parent="#accordion" href="#collapse${i}">Orçamento ${i}</a>
					        </h4>
					    </div>
					      <div id="collapse${i}" class="panel-collapse collapse in">
					        <div class="panel-body">${x.detalhamentoStandard}</div>
					      </div>
				    </div>
  				</div>
                                </c:forEach>
                                <c:if test="${empty orcamentos}">
                                    <h5>Você não possui pedidos de casamento</h5>
                                </c:if>
    		</div>
    		<!--Aba solicitar-->
    		<div class="tab-pane" id="second-tab">
    			<div class="row">
    				<div class="col-sm-6">
    					<form name="dadospessoais" action="coleta_casamento" onsubmit="" method= "post" >
							<div class="row">
								<div class="col-sm-12"> <h4>Dados Pessoais</h4></div>
				  			</div>
				  			<br>
				  			<!--Coleta o nome do Conjugue -->
							<div class="row">
								<div class="col-sm-12">
									<input name="Email" id=" " type="text" class="form-control" placeholder="Nome do Conjuguê">
								</div>
							</div> 
							<br>
							<div class="row">
								<!--Coleta a Data e Hora -->
								<div class='col-sm-5'>
           							<h5>Data:<input type="date"><span class="glyphicon glyphicon-calendar"></span></h5>
          						</div>
          						<div class='col-sm-5'>
           							<h5>Hora:<input type="time" ><span class="glyphicon glyphicon-time"></span></h5>
          						</div>
							</div> 
							<br>
							<div class="row">
								<!--Coleta o numero de Convidados  -->
								<div class="col-sm-3"> <h4>Convidados:</h4></div>
								<div class="col-sm-5">
                                                                    <input class="form-control" name="numero" type="text"  id="input_numero" placeholder="Numero" required>
								</div>
							</div> 
							<br>
							<!--Coleta o nome do Local -->
							<div class="row">
								<div class="col-sm-12">
									<input name="Local" id=" " type="text" class="form-control" placeholder="Nome do local">
								</div>
							</div> 
							<br>
							<!--Coleta o nome do Padre -->
							<div class="row">
								<div class="col-sm-12">
									<input name="Padre" id=" " type="text" class="form-control" placeholder="Nome do Padre">
								</div>
							</div> 
							<br>
							<div class="row">
								<div class="col-sm-12">
									<input name="luademel" id=" " type="text" class="form-control" placeholder="Local da Lua De Mel">
								</div>
							</div> 
		  				</form>
		  				<br>
    				</div>
    			</div>
    			<div class="row" id="glypicon-casamento">
		      		<div class="col-sm-8"></div>
		      		<div class="col-sm-2">	
		      			<a href="index.html" class="btn btn-default btn-sm">
		      				<span class="glyphicon glyphicon-remove"></span> Cancelar 
		      			</a>
		      		</div>
		      		<div class="col-sm-2">	
		      			<a href="#" class="btn btn-default btn-sm">
		      				<span class="glyphicon glyphicon-send"></span> Enviar
		      			</a>
		      		</div>
	      		</div>
   		    </div>
		</div>
	</div>
	<br>
	<footer class="container-fluid text-center">
        <jsp:useBean id="configuracao" scope="application" class="br.ufpr.tads.foreveralone.beans.ConfigBean" />
        <p>Em caso de problemas contactar o administrador: 
            <jsp:getProperty name="configuracao" property="adminEmail" /> </p>
	</footer>

		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
		<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
<html>
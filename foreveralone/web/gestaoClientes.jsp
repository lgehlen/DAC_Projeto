<%-- 
    Document   : gestaoClientes
    Created on : 10/06/2018, 16:54:40
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
	<title>gerencia_usuarios</title>
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
		  				<div class="col-sm-1">
		  					<a href="clientes" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-home"></span> Home
		  					</a>
		  				</div>
		  				<div class="col-sm-3" id="correcao-menu">
		  					<a onclick="popupfuncionario()" href="#" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-open"></span> Gerenciar Relatórios
		  					</a>
		  				</div>
		  				<div class="col-sm-3" id="correcao-menu">
		  					<a href="clientes" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-user"></span> Gerenciar Clientes
		  					</a>
		  				</div>
		  				<div class="col-sm-3" id="correcao-menu">
		  					<a onclick="popupfuncionario()" href="#" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-link"></span> Gerenciar Funcionários
		  					</a>
		  				</div>
		  				<div class="col-sm-1" id="dropdown-menu"> 
	    					<div class="dropdown">
	    						<button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
	    						<span class="caret"></span></button>
	   							<ul class="dropdown-menu">
	   								<li><a> <span class="glyphicon glyphicon-user"></span>   ${loginBean.nome}   </a></li>

	   								<li><a> <span class=" glyphicon glyphicon-flag"></span>  ${loginBean.tipo} </a></li>
                                                                        <li><a href="clientes">Home</a></li>


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
		<form>
			<div class="row">
				<div id="titleclientes" class="col-sm-2"><h4> Lista de Clientes</h4></div>
			
                            <div id="btnadcionar" class="col-sm-4">
				<a href="clientes?action=formNew" class="btn btn-success btn-lg">
                                    <span class="glyphicon glyphicon-plus">Adicionar</span>
                                </a>
                            </div>
                        </div>
                                <br>
                        <c:forEach items="${clientes}" var="x">
			<div class="row" id="relatorios">
                            <div class="col-sm-1"><h4><c:out value="${x.id}"/></h4></div>
				<div class="col-sm-8"><h4><c:out value="${x.nome}"/></h4></div>
				<!--Modal-->
				<div class="col-sm-1">
					<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#excluifunc${x.id}">
                                            <span class="glyphicon glyphicon-trash"></span>
                                        </button>
                        
					<!-- Modal -->
	  				<div class="modal fade" id="excluifunc${x.id}" role="dialog">
	    				<div class="modal-dialog">
	      			<!-- Modal content-->
	      					<div class="modal-content">
	        					<div class="modal-header">
	          						<button type="button" class="close" data-dismiss="modal">&times;</button>
	          						<h4 class="modal-title">Aviso do Sistema!</h4>
	        					</div>
	        					<div class="modal-body">
	        						<div class="row">
		        						<div class="col-sm-1"></div>
		        						<div class="col-sm-9" style="text-align: center;">
		         							<h3><span class="glyphicon glyphicon-alert"> Excluir Cliente?</span></h3>
		         						</div>
		         						<div class="col-sm-2"></div>
		         					</div>
		         					<div class="row">
		        						<div class="col-sm-3"></div>
		        						<div class="col-sm-2" id="popup-gerenciausuarios">
		         							<a  href="clientes?action=remove&id=${x.id}" class="btn btn-default btn-sm">
	          									<span class="glyphicon glyphicon-ok"></span>
	        								</a>
		         						</div>
		         						<div class="col-sm-2"></div>
		        						<div class="col-sm-2" id="popup-gerenciausuarios">
		         							<button  type="button" class="btn btn-default btn-sm">
	          									<span class="glyphicon glyphicon-remove"></span>
	        								</button>
		         						</div>
		         					</div>
	        					</div>
	        					<div class="modal-footer">
	          						<button type="button" class="btn btn-default" data-dismiss="modal">Voltar</button>
	        					</div>
	      					</div>
	    				</div>
	  				</div>
			</div>
                                <div class="col-sm-1">
					<a href="clientes?action=formUpdate&id=${x.id}" class="btn btn-default btn-lg">
						<span class="glyphicon glyphicon-pencil"></span>
					</a>
                                </div>
				<div class="col-sm-1">
					<button type="button" class="btn btn-default btn-lg" data-toggle="modal" data-target="#myModal${x.id}   ">
						<span class="glyphicon glyphicon-info-sign"></span>
					</button>
                            
                                    
                                    
					<!-- Modal -->
	  				<div class="modal fade" id="myModal${x.id}" role="dialog">
	    				<div class="modal-dialog">
	      			<!-- Modal content-->
	      					<div class="modal-content">
	        					<div class="modal-header">
	          						<button type="button" class="close" data-dismiss="modal">&times;</button>
	          						<h4 class="modal-title">Detalhes</h4>
	        					</div>
	        					<div class="modal-body">
	         						<div class="row">
										<div class="col-sm-5">
											ID:<h4><c:out value="${x.id}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Email:<h4><c:out value="${x.email}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Nome:<h4><c:out value="${x.nome}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											CPF:<h4><c:out value="${x.cpf}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
                                                                                    Aniversário:<h4><fmt:formatDate value="${x.dataNasc}" pattern="dd/MM/yy"/></h4>
										</div>
                                                                                
                                                                                <div class="col-sm-5">
											Escolaridade:<h4><c:out value="${x.escolaridade}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Data de Cadastro<h4><fmt:formatDate value="${x.dataCad}" pattern="dd/MM/yy"/></h4>
										</div>
                                                                                <div class="col-sm-10">
                                                                                    <br>
                                                                                    <strong> Características </strong>
                                                                                    <br>
                                                                                    <br>
										</div>
                                                                                <div class="col-sm-5">
											Cor de Cabelo<h4><c:out value="${x.caracteristicas.corDeCabelo}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Cor de Pele<h4><c:out value="${x.caracteristicas.corDePele}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Descrição<h4><c:out value="${x.caracteristicas.descricao}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Sexo<h4><c:out value="${x.caracteristicas.sexo}"/></h4>
										</div>
                                                                                <div class="col-sm-10">
                                                                                    <br>
                                                                                    <strong> Preferências </strong>
                                                                                    <br>
                                                                                    <br>
										</div>
                                                                                <div class="col-sm-5">
											Cor de Cabelo<h4><c:out value="${x.preferencias.corDeCabelo}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Cor de Pele<h4><c:out value="${x.preferencias.corDePele}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Faixa de Idade<h4><c:out value="${x.preferencias.descricao}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Sexo<h4><c:out value="${x.preferencias.sexo}"/></h4>
										</div>
                                                                                <div class="col-sm-10">
                                                                                    <br>
                                                                                    <strong> Endereço </strong>
                                                                                    <br>
                                                                                    <br>
										</div>
                                                                                <div class="col-sm-5">
											Rua<h4><c:out value="${x.endereço.rua}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Numero<h4><c:out value="${x.endereço.logradouro}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Cidade<h4><c:out value="${x.endereço.cidade.nome}"/></h4>
										</div>
                                                                                <div class="col-sm-5">
											Estado<h4><c:out value="${x.endereço.cidade.estado.nome}"/></h4>
										</div>
                                                                                
                                                                                
									</div>
	        					</div>
	        					<div class="modal-footer">
	          						<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
	        					</div>
	      					</div>
	    				</div>
	  				</div>
				</div>
                                                                               	
			</div>
                                                                               
			<br>
                          </c:forEach>
                                    
		 
		<br>
		<div class="row" id="glypicon-gerencia-usuarios">
		    <div class="col-sm-9"></div>
		    <div class="col-sm-2">	
		      	<a href="index.html" class="btn btn-default btn-lg">
		      		<span class="glyphicon glyphicon-chevron-left"></span> Voltar 
		      	</a>
		    </div>	
		</div>
	</div>
	<br>
	<br>
	<footer class="container-fluid text-center">
        <jsp:useBean id="configuracao" scope="application" class="br.ufpr.tads.foreveralone.beans.ConfigBean" />
        <p>Em caso de problemas contactar o administrador: 
            <jsp:getProperty name="configuracao" property="adminEmail" /> </p>
	</footer>
         <script src="js/custom.js"></script>
</body>
</html>
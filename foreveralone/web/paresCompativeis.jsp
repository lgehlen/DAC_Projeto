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
        <script src="js/custom2.js"> </script>
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
		  					<a href="clientes" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-home"></span> Home
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="festas.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-fire"></span> Festas
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="clientes?action=listEncontros" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-heart"></span> Encontros
		  					</a>
		  				</div>
		  				<div class="col-sm-2">
		  					<a href="casamento.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-gift"></span> Casamento
		  					</a>
		  				</div>
		  				<div class="col-sm-2" >
		  					<a href="clientes?action=formUpdate&id=${loginBean.id}" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-filter"></span> Preferências
		  					</a>
		  				</div>
		  				<div class="col-sm-1"> 
	    					<div class="dropdown">
	    						<button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
	    						<span class="caret"></span></button>
	   							<ul class="dropdown-menu">

                                                                   <li><a href="clientes?action=formNew&id=${loginBean.id}"> <span class="glyphicon glyphicon-user"></span>   ${loginBean.nome}   </a></li>
                                                                   <li><a> <span class="glyphicon glyphicon-flag"> </span>  Tipo: <c:out value="${loginBean.tipo}"/></a></li>
                                                                        <li><a href="logout"><span class="glyphicon glyphicon-share"></span> Sair</a></li> 
		      						<li><a href="#">Home</a></li>
		      						
	    						</ul>
	  						</div>
    					</div>
		  			</div>
		  		</div>
		  	</div>
		</nav>
	</header>
	<!--Corpo da página-->
        <div class="container">
            <div class="row">
                <div class="col-sm-12 text-center">
                    <h1> Pares Compatíveis</h1>
                </div>
            </div>
        </div>
	<div class="container" id="container-pesquisa-pares">
		<div class="row">
		</div>
		<br><br>
                
                <c:forEach items="${clientes}" var="x">
		<div class="row">
			<div class="col-sm-3">
				<img class="foto-perfil" src="imagens/user.jpg" alt="" />
			</div>
			<!--Nome do usuário que deu match-->
			<div class="col-sm-9">
				<!--Nome do usuário que deu match-->
                                <div class="col-sm-4">
                                    <strong><h2>${x.nome}</h2></strong>
                                    <h4>Idade: </h4>
                                    <h4>Escolaridade: </h4>${x.escolaridade}
                                    <h4>Sexo: </h4>${x.caracteristicas.sexo}
                                </div>
				
                                <div class="col-sm-4">
                                    <h4><strong>Preferências</strong></h4>
                                    <h4>Cor de Cabelo: </h4>${x.preferencias.corDeCabelo}
                                    <h4>Cor de Pele: </h4>${x.preferencias.corDePele}
                                    <h4>Sexo: </h4>${x.preferencias.sexo}
                                    <h4>Faixa de Idade: </h4>${x.preferencias.descricao}
                                </div>
                                <div class="col-sm-4">
                                    <h4><strong>Descrição</strong></h4>
                                    
                                    <p>${x.caracteristicas.descricao}</p>
                                </div>

			</div>
		</div>
		<div class="row" id="glypicon-pares-compativeis">
	      	<div class="col-sm-11"></div>
	      	<div class="col-sm-1">	
                    <button class="btn btn-default btn-lg" onclick="getCidades2(${x.id})" data-toggle="modal" data-target="#myModal${x.id}">
         		 <span class="glyphicon glyphicon-heart-empty"></span> Chamar
        		</button>
                         <br>
                        <br>
                         <div class="modal fade" id="myModal${x.id}" role="dialog">
	    				<div class="modal-dialog">
	      			<!-- Modal content-->
	      					<div class="modal-content">
                                                    
	        					<div class="modal-header">
	          						<button type="button" class="close" data-dismiss="modal">&times;</button>
	          						<h4 class="modal-title">Detalhes</h4>
	        					</div>
	        					<div class="modal-body">
                                                            <form action="clientes?action=newEncontro&idusuario=${loginBean.id}&idcrush=${x.id}" method="post">
	         						<div class="row">     
                                                                        <div class="col-sm-8">
                                                                            <select class="form-control" name="cidade" id="cidade" required>
                                                                                <option value="${usuario.endereço.cidade.id}">Sua cidade: ${usuario.endereço.cidade.nome}</option>
                                                                                <option value="${x.endereço.cidade.id}">Cidade del@: ${x.endereço.cidade.nome}</option>
                                                                            </select>
                                                                        </div>
                                                                         <div class="col-sm-4">
                                                                             <input class="form-control" name="cep" type="text" required placeholder="CEP">
                                                                         </div>
                                                                    </div>
                                                                    <br>
                                                                    <div class="row">
                                                                        <div class="col-sm-8">
                                                                            <input class="form-control" name="rua" type="text"  id="rua" placeholder="Rua" required>
                                                                        </div>
                                                                        <div class="col-sm-4">
                                                                            <input class="form-control" name="numero" type="text"  id="numero" placeholder="Número" required>
                                                                        </div>
                                                                    </div>
                                                                    <br>
                                                                    <div class="row"> 
                                                                        <div class="col-sm-1">
                                                                            <label>Data</label>
                                                                        </div>
                                                                        <div class="col-sm-5">
                                                                             <input class="form-control" name="data" type="date" required>
                                                                        </div>
                                                                        <div class="col-sm-6">
                                                                            <input class="form-control" name="horario" type="text" placeholder="Horário 00:00" required>
                                                                        </div>
                                                                    </div>
                                                                    <br>
                                                                      
                                                                    
                                                                                
                                                                                
									
	        					</div>
	        					<div class="modal-footer">
                                                            <button type="submit" class="btn btn-success">Confirmar</button>
                                                            </form>  
	          						<button type="button" class="btn btn-default" data-dismiss="modal">Fechar</button>
	        					</div>
                                                        
	      					</div>
	    				</div>
	  				</div>
	      	</div>
                        
                
                </div>
                                                                <br>
                                                                <br>
                </c:forEach>
            
	</div>
        
	<br>
	<footer class="container-fluid text-center">
        <jsp:useBean id="configuracao" scope="application" class="br.ufpr.tads.foreveralone.beans.ConfigBean" />
        <p>Em caso de problemas contactar o administrador: 
            <jsp:getProperty name="configuracao" property="adminEmail" /> </p>
	</footer>
</body>
</html>
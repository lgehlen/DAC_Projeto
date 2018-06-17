<%-- 
    Document   : cadastrausuario
    Created on : 10/06/2018, 16:42:47
    Author     : gqueiroz
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>cadastra_usuario</title>
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
	  			<div class="col-sm-1" id="logo"> <a href="/foreveralone/login"><img id="logo" src="logo-forever.png" alt="logo" width="120" height="100"></a></div>
		  		<div class="container">
					<div class="row">
		  				<div class="col-sm-2">
		  					<a href="/" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-home"></span> Home
		  					</a>
		  				</div>
		  				<div class="col-sm-3">
		  					<a href="#" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-pencil"></span> Cadastrar Usuário
		  					</a>
		  				</div>
		  				<div class="col-sm-3">
		  					<a href="atualiza-dados.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-refresh"></span> Atualizar Dados
		  					</a>
		  				</div>
		  				<div class="col-sm-3">
		  					<a href="gerenciar-perfis.html" class="btn btn-primary btn-lg">
		  						<span class="glyphicon glyphicon-wrench"></span> Gerenciar Perfis
		  					</a>
		  				</div>
		  				<div class="col-sm-1"> 
	    					<div class="dropdown">
	    						<button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
	    						<span class="caret"></span></button>
	   							<ul class="dropdown-menu">
	   								<li><a> <span class="glyphicon glyphicon-user"></span>   User   </a></li>
	   								<li><a> <span class=" glyphicon glyphicon-flag"></span>  Tipo:Funcionário </a></li>
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
			<div class="col-sm-4"><h4> Cadastro de Cliente</h4></div>
		</div>
		<form name="dadoscliente" action="cadastra_cliente" onsubmit="" method= "post" >
			<div class="row">
				<div class="col-sm-5">
					<input class="form-control" name="nome" type="text"  id="input_nome" placeholder="Nome">
                                </div>
				<div class="col-sm-5">
					<input class="form-control" name="cpf" type="text"  id="input_cpf" placeholder="CPF">
				</div>
				<div class="col-sm-2">
		      		<select class="form-control" id="sexo" size="1"> 
			        	<option value="*">Sexo</option>
			        	<option value=" ">Masculino</option>
			        	<option value=" ">Feminino</option>
		      		</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-5">
					<input class="form-control" name="email" type="text"  id="input_email" placeholder="Email">
				</div>
				<div class="col-sm-2">
					<select class="form-control" id="ensino" size="1"> 
						<option value="*">Escolaridade</option>
			        	<option value="*">Médio</option>
			        	<option value=" ">Fundamental</option>
			        	<option value=" ">Superior</option>
		      		</select>
				</div>
			</div>
			<br>
			<div class="row">
                            	<div class="col-sm-4">
                                </div>
                                <div class="col-sm-4">
                                </div>
				<div class="col-sm-4">
					Data de Nascimento <span class="glyphicon glyphicon-calendar"></span><input type="date">
				</div>
			</div>
                        <br>
			<div class="row">

                                <c:if test="${loginBean.tipo != 'funcionario'}">
				<div class="col-sm-1"></div>
				<div class="col-sm-2">
			      	<select class="form-control" id="cor_cabelo" size="1"> 
				        <option value="*">Cor do Cabelo</option>
				        <option value=" ">Loiro</option>
				        <option value=" ">Ruivo</option>
			      	</select>
				</div>
				<div class="col-sm-1"></div>
				<div class="col-sm-2">
			      	<select class="form-control" id="cor_cabelo" size="1"> 
				        <option value="*">Cor da Pele</option>
				        <option value=" ">Branco</option>
				        <option value=" ">Preto</option>
			      	</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col-sm-12">
					<form>
    					<div class="form-group">
      						<label for="comment">Breve Descrição:</label>
      						<textarea class="form-control" rows="5" id="comment"></textarea>
    					</div>
  					</form>
				</div>
			</div>
                                </c:if>
			<div class="row" id="glypicon-cadastra-funcionario">
		      		<div class="col-sm-7"></div>
		      		<div class="col-sm-2">	
		      			<a href="index.html" class="btn btn-info btn-lg">
		      				<span class="glyphicon glyphicon-remove"></span> Cancelar 
		      			</a>
		      		</div><div class="col-sm-1"></div>
		      		<div class="col-sm-2">	
		      			<a href="#" class="btn btn-info btn-lg">
		      				<span class="glyphicon glyphicon-paperclip"></span> Cadastrar
		      			</a>
		      		</div>
	      		</div>
		</form>
		
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
</html>
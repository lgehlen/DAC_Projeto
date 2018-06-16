<%-- 
    Document   : cadastraDadosPessoais
    Created on : 10/06/2018, 16:44:38
    Author     : gqueiroz
--%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Cadastro de dados pessoais</title>
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
	<link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
	<link type="text/css" rel="stylesheet" href="css/style.css" />	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>

<body>
	<br>
	<br>
	<div class="container" id="Cadastro">
		<!--"lado Reservado ao cadastro do usuário" -->
		<div class="row">
		  	<div class="col-sm-6"> 
		  		<form name="dadospessoais" action="coleta_dados" onsubmit="" method= "post" >
					<div class="row">
						<div class="col-sm-12"> <h4>Dados Pessoais</h4></div>
		  			</div>
		  			<div class="row">
						<div class="col-sm-10">
							<input name="Nome" id="name" type="text" class="form-control" placeholder="Nome Completo">
						</div>
					</div> 
					<br>
					<div class="row">
						<!--Coleta o CPF do usuário -->
						<div class="col-sm-7">
							<input name="CPF" id="cpf" type="text" class="form-control" placeholder="CPF">
						</div>
					</div> 
					<br>
					<div class="row">
						<!--Coleta a data de nascimento do usuário -->
						<div class="col-sm-7">
							<h5>Data de Nascimento:<input type="date"><span class="glyphicon glyphicon-calendar"></span></h5>
						</div>
					</div> 
					<div class="row">
						<!--Coleta o endereço do usuário -->
						<div class="col-sm-10">
							<input name="endereco" id="endereco" type="text" class="form-control" placeholder="Endereço">
						</div>
					</div> 
					<div class="row">
						<!--Coleta o email do usuário -->
						<div class="col-sm-8">
							<input name="Email" id="email" type="text" class="form-control" placeholder="E-mail">
						</div>
					</div> 
					<div class="row">
						<!--Coleta a escolaridade do usuário -->
						<div class="col-sm-4" id="titleescolaridade"> <h4>Escolaridade:</h4></div>
						<div class="col-sm-5">
							<select name="teste"  class="form-control" id="escolaridade"  size="1"  onchange="" >
		    				<option value="*">Escolha uma Opção</option>
	    					<option value="EF">Ensino-Fundamental</option>
	    					<option value="EM">Ensino-Médio</option>
	   						<option value="SP">Superior Completo</option>
						</select>
						</div>
					</div> 
					<br>
					<div class="row">
						<div class="col-sm-7">
							<h5>Data de Cadastro:<input type="date"><span class="glyphicon glyphicon-calendar"></span></h5>
						</div>
					</div> 
		  		</form>
			</div> 
			<!--"lado Reservado a coleta de caracteristicas do usuário" -->
			<div class="col-sm-6"> 
		  		<form name="caracteristicas" action="coleta_caracteristica" onsubmit="" method= "post" >
		  			<div class="row">
						<div class="col-sm-12"> <h4>Características</h4></div>
		  			</div>
		  			<div class="row">
		  				<!--"Coleta Sexo" -->
						<div class="col-sm-2"> <h3>Sexo</h3></div>
						<div class="col-sm-5"> 
   								<form action="">
 									<input type="radio" name="gender" value="male" checked> Masculino<br>
  									<input type="radio" name="gender" value="female"> Feminino<br>
  									<input type="radio" name="gender" value="other"> Gabriel<br><br>
  								</form> 
						</div>
		  			</div>
		  			<div class="row">
		  				<!--"Coleta cor da pele" -->
		  				<div class="col-sm-1"></div>
						<div class="col-sm-5"> 
   							<select name="teste"  class="form-control" id="escolaridade"  size="1"  onchange="" >
		    				<option value="*">Cor da Pele</option>
	    					<option value="EF">Branco</option>
	    					<option value="EM">Negro</option>
	   						<option value="SP">Amarelo</option>
						</select>
						</div>
						<!--"Coleta cor do cabelo" -->
						<div class="col-sm-5"> 
   							<select name="teste"  class="form-control" id="escolaridade"  size="1"  onchange="" >
			    				<option value="*">Cor do Cabelo</option>
		    					<option value="EF">Preto</option>
		    					<option value="EM">Castanho</option>
		   						<option value="SP">Loiro</option>
							</select>		
						</div>
					</div>
					<div class="row">
					<!--"Coleta Descrição" -->
						<div class="col-sm-12"> 
   							<div class="form-group">
   								<br>
			  					<label for="comment">Breve Descrição:</label>
			  					<textarea name= "descricao" class="form-control" rows="5" id="comment"></textarea>
							</div> 
						</div>
		  			</div>
		  			<!--Coleta de Senha -->
		  			<div class="row">
						<div class="col-sm-12"> <h4>Acesso</h4></div>
		  			</div>
		  			<div class="row">
						<div class="col-sm-6"> 
							<input name="Email" id="Senha" type="text" class="form-control" placeholder="Senha">
						</div>
		  			</div>
		  			<div class="row">
						<div class="col-sm-6"> 
							<input name="Email" id="RepSenha" type="text" class="form-control" placeholder="Repita a Senha">
						</div>
		  			</div>
		  		</form>
		  	</div>
		</div>
		<!--Inputs -->
		<div class="row">
			<br>
		  	<div class="col-sm-5"></div>
			<div class="col-sm-1"> 
				<button type="submit" class="btn btn-primary" ><a href="#">Cadastrar</a></button>
			</div>
			<div class="col-sm-5"> 
				<button type="submit" class="btn btn-primary" ><a href="#">Voltar</a></button>
			</div>
			<div class="col-sm-5"></div>
		</div>
		<br>
</div>
</body>
</html>
<%-- 
    Document   : cadastraEvento
    Created on : 10/06/2018, 16:46:53
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
        <title>Cadastro de Evento</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700%7CVarela+Round" rel="stylesheet">
        <link type="text/css" rel="stylesheet" href="css/bootstrap.min.css" />
        <link type="text/css" rel="stylesheet" href="css/style.css" />
        <link href="https://fonts.googleapis.com/css?family=Montserrat:100" rel="stylesheet">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
        <script src="js/custom.js"></script>

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
                            <div class="col-sm-3">
                                <a href="/" class="btn btn-primary btn-lg">
                                    <span class="glyphicon glyphicon-home"></span> Home
                                </a>
                            </div>
                            <div class="col-sm-4">
                                <a href="festas.html" class="btn btn-primary btn-lg">
                                    <span class="glyphicon glyphicon-user"></span> Gerenciar Usuários
                                </a>
                            </div>
                            <div class="col-sm-3">
                                <a href="#" class="btn btn-primary btn-lg">
                                    <span class="glyphicon glyphicon-fire"></span> Criar Evento/Festas
                                </a>
                            </div>
                            <div class="col-sm-1"> 
                                <div class="dropdown">
                                    <button id="dropdown" class="btn btn-primary dropdown-toggle" type="button" data-toggle="dropdown"><span class="glyphicon glyphicon-th-list"></span>
                                        <span class="caret"></span></button>
                                    <ul class="dropdown-menu">
                                        <li><a> <span class="glyphicon glyphicon-user"></span>   ${loginBean.nome}  </a></li>
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

        <c:choose>
            <c:when test="${formType == 1}">
                <!--Corpo da página-->
                <div class="container" id="container-cadastra-evento">
                    <div class="row">
                        <div class="col-sm-4"><h4> Criação de Festas/Eventos</h4></div>
                    </div>
                    <br>
                    <form action="eventos?action=new" method="post">
                        <div class="row">

                            <div class="col-sm-5">
                                <input name="tema" id="tema" type="text" class="form-control" placeholder="Tema do Evento" required>
                            </div>
                            <div class="col-sm-4">
                                <input name="data" id="data" type="date" class="form-control" required>
                            </div>
                            <div class="col-sm-3">
                                <input name="horario" id="horario" type="text" class="form-control" placeholder="Horário 00:00" required> 
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-2">
                                <select class="form-control" name="estado" id="estado" name="estado" required>
                                    <c:forEach items="${estados}" var="x">
                                        <option value="${x.id}">${x.uf}</option>
                                    </c:forEach>
                                </select>
                            </div>
                            <div class="col-sm-3">
                                <select class="form-control" name="cidade" id="cidade" name="cidade" required>

                                </select>
                            </div>
                            <div class="col-sm-4">
                                <input name="rua" id="rua" type="text" class="form-control" placeholder="Rua do evento" required> 
                            </div>
                            <div class="col-sm-1">
                                <input name="numero" id="numero" type="text" class="form-control" placeholder="Nº" required> 
                            </div>
                            <div class="col-sm-2">
                                <input name="cep" id="cep" type="text" class="form-control" placeholder="CEP" required> 
                            </div>
                        </div>

                        <br>
                        <br>
                        <br>
                        <!--INPUTS -->
                        <div class="row" id="glypicon-evento">
                            <div class="col-sm-8"></div>
                            <div class="col-sm-2">	
                                <a href="eventos" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-chevron-left"></span> Voltar 
                                </a>
                            </div>
                            <div class="col-sm-2">	
                                <button type="submit" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-plus-sign"></span> Criar
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <br>
            </c:when>
            <c:otherwise>
                <!--Corpo da página-->
                <div class="container" id="container-cadastra-evento">
                    <div class="row">
                        <div class="col-sm-4"><h4> Criação de Festas/Eventos</h4></div>
                    </div>
                    <br>
                    <form action="eventos?action=update&id=<c:out value="${evento.id}"/>" method="post">
                        <div class="row">

                            <div class="col-sm-5">
                                <input name="tema" value="<c:out value="${evento.tema}"/>" id="tema" type="text" class="form-control" placeholder="Tema do Evento" required>
                            </div>
                            <div class="col-sm-4">
                                <input name="data" id="data" type="date" class="form-control" required value=<fmt:formatDate value="${evento.data}" pattern="yyyy-MM-dd"/>>
                            </div>
                            <div class="col-sm-3">
                                <input name="horario" value="<c:out value="${evento.horario}"/>" id="horario" type="text" class="form-control" placeholder="Horário 00:00" required> 
                            </div>
                        </div>
                        <br>
                        <div class="row">
                            <div class="col-sm-2">
                                        <select class="form-control" id="estado" name="estado" required>
                                          
                                         <c:forEach items="${estados}" var="x">
                                             <c:if test = "${x.id == evento.local.cidade.estado.id}">
                                                 <option value="${x.id}" selected>${x.uf}</option>
                                                 getCidades();                                                 
                                             </c:if>
                                             <c:if test = "${x.id != evento.local.cidade.estado.id}">
                                                 <option value="${x.id}">${x.uf}</option>
                                             </c:if>
                                        </c:forEach>
                                                 
                                    </select>
                                    </div>
                                    <div class="col-sm-3">
                                        <select class="form-control" id="cidade" name="cidade" required>
                                            <c:forEach items="${cidades}" var="x">
                                             <c:if test = "${x.id == evento.local.cidade.id}">
                                                 <option value="${x.id}" selected>${x.nome}</option>
                                                 getCidades();                                                 
                                             </c:if>
                                             <c:if test = "${x.id != evento.local.cidade.id}">
                                                 <option value="${x.id}">${x.nome}</option>
                                             </c:if>
                                            </c:forEach>
                                        </select>
                                    </div>
                            <div class="col-sm-4">
                                <input name="rua" id="rua" type="text" class="form-control" placeholder="Rua do evento" required value="<c:out value="${evento.local.rua}"/>" > 
                            </div>
                            <div class="col-sm-1">
                                <input name="numero" id="numero" type="text" class="form-control" placeholder="Nº" required value="<c:out value="${evento.local.logradouro}"/>" > 
                            </div>
                            <div class="col-sm-2">
                                <input name="cep" id="cep" type="text" class="form-control" placeholder="CEP" required value="<c:out value="${evento.local.cep}"/>" > 
                            </div>
                        </div>

                        <br>
                        <br>
                        <br>
                        <!--INPUTS -->
                        <div class="row" id="glypicon-evento">
                            <div class="col-sm-8"></div>
                            <div class="col-sm-2">	
                                <a href="eventos" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-chevron-left"></span> Voltar 
                                </a>
                            </div>
                            <div class="col-sm-2">	
                                <button type="submit" class="btn btn-default btn-sm">
                                    <span class="glyphicon glyphicon-plus-sign"></span> Atualizar
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
                <br>
            </c:otherwise>
        </c:choose>
        <footer class="container-fluid text-center">
            <jsp:useBean id="configuracao" scope="application" class="br.ufpr.tads.foreveralone.beans.ConfigBean" />
            <p>Em caso de problemas contactar o administrador: 
                <jsp:getProperty name="configuracao" property="adminEmail" /> </p>
        </footer>
    </body>
</html>
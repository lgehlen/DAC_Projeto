function popupfuncionario() {
     alert("Você não tem privilégios de administrador para acessar esta página");
     }
  
$(document).ready(function() {
                getCidades();
                $( "#estado" ).change(function() {
                  getCidades();
                   
                });
            });

            function getCidades(){
                var estadoId = $("#estado").val();
                console.log(estadoId)
                var url = "AJAXServlet";
                $.ajax({
                        url : url, // URL da sua Servlet
                        data : {
                            estadoId : estadoId
                        }, // Parâmetro passado para a Servlet
                        dataType : 'json',
                        success : function(data) {
                            // Se sucesso, limpa e preenche a combo de cidade
                            // alert(JSON.stringify(data));
                            $("#cidade").empty();
                            $.each(data, function(i, obj) {
                                $("#cidade").append('<option value=' + obj.id + '>' + obj.nome + '</option>');
                            });
                        },
                        error : function(request, textStatus, errorThrown) {
                            //alert(request.status + ', Error: ' + request.statusText);
                             // Erro
                        }
                    });
            }

function getCidades2(id){
                var estadoId = $("#estado" + id).val();
                console.log(estadoId);
                var url = "AJAXServlet";
                $.ajax({
                        url : url, // URL da sua Servlet
                        data : {
                            estadoId : estadoId
                        }, // Parâmetro passado para a Servlet
                        dataType : 'json',
                        success : function(data) {
                            // Se sucesso, limpa e preenche a combo de cidade
                            // alert(JSON.stringify(data));
                            $("#cidade" + id).empty();
                            $.each(data, function(i, obj) {
                                $("#cidade" + id).append('<option value=' + obj.id + '>' + obj.nome + '</option>');
                            });
                        },
                        error : function(request, textStatus, errorThrown) {
                            //alert(request.status + ', Error: ' + request.statusText);
                             // Erro
                        }
                    });
            }



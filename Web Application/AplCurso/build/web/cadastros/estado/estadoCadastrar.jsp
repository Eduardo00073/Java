<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Estados</title>
    <!-- Adicione os links para os arquivos CSS e JavaScript do Bootstrap aqui -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLR9D3H+oG5D6j5MI4lp2x9Qk5CtFkTgny5g3a5zT5B" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-4GT1Z2F5zn6fZLzz5x1f1s5/I5I5M6f5B5F5B5F5B5J5Sryd/T5xljh2KtuT5Ktu6B5" crossorigin="anonymous"></script>
    <!-- Adicione o link para o arquivo jQuery aqui -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLR9D3H+oG5D6j5MI4lp2x9Qk5CtFkTgny5g3a5zT5B" crossorigin="anonymous"></script>
    <!-- Adicione o link para o arquivo SweetAlert CSS aqui -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
    <!-- Adicione o link para o arquivo SweetAlert JavaScript aqui -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.js"></script>
</head>
<body>
<jsp:include page="/header.jsp"/>
<jsp:include page = "/menu.jsp"/>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Estados</h1>
    <p class="mb-4">Formulário de Cadastro</p>
    
    <a class="btn btn-success mb-4" href="${pageContext.request.contextPath}/EstadoListar">
        <i class="fas fa-sticky-note"></i>
        <strong>Voltar</strong>
    </a>
    <div class="row">
        <div class="col-lg-9">
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="form-group">
                        <label>Id</label>
                        <input class="form-control" type="text" name="idEstado" id="idEstado" value="${estado.idEstado}" readonly="readonly"/>
                    </div>
                    <div class="form-group">
                        <label>Nome</label>
                        <input class="form-control" type="text" name="nomeEstado" id="nomeEstado" value="${estado.nomeEstado}" size="50" maxlength="50"/>
                    </div>
                    <div class="form-group">
                        <label>Sigla</label>
                        <input class="form-control" type="text" name="siglaEstado" id="siglaEstado" value="${estado.siglaEstado}" size="2" maxlength="2"/>
                    </div>
                    <div class="form-group">
                        <button class="btn btn-success" type="submit" id="submit" onclick="validarCampos()">
                            Salvar Documento
                        </button>
                    </div>        
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    function validarCampos(){
        console.log("entrei na validação de campos");
        if(document.getElementById("nomeEstado").value == ''){
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o nome do Estado',
                showConfirmButton: false,
                timer: 1000
            })
            $("#nomeEstado").focus();
        }else if(document.getElementById("siglaEstado").value == ''){
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique a sigla do Estado',
                showConfirmButton: false,
                timer: 1000
            })
            $("#siglaEstado").focus();
        }else{
            gravarDados();
        }
    }
    
    function gravarDados(){
        console.log("Gravando Dados...");
        $.ajax({
            type: 'post',
            url: 'EstadoCadastrar',
            data: {
                idEstado: $('#idEstado').val(),
                nomeEstado: $('#nomeEstado').val(),
                siglaEstado: $('#siglaEstado').val()
            },
            success:
                function(data){
                    console.log("resposta servlet->");
                    console.log(data);
                    if(data==1){
                        Swal.fire({
                            position: 'center',
                            icon: 'success',
                            title: 'Sucesso',
                            text: 'Estado gravado com Sucesso',
                            showConfirmButton: true
                        }).then(()=>{
                                    window.location.href="${pageContext.request.contextPath}/EstadoListar";
                                })
                    }else{
                        Swal.fire({
                            position: 'center',
                            icon: 'error',
                            title: 'Erro',
                            text: 'Não foi possível gravar Estado',
                            showConfirmButton: true
                        }).then(()=>{
                                    window.location.href="${pageContext.request.contextPath}/EstadoListar";
                                })
                    }
                },
            error:
                function (data){
                    console.log("deu erro");
                    window.location.href = "${pageContext.request.contextPath}/EstadoListar";
                }
        });
    }
</script>


<%@include file="/footer.jsp" %>
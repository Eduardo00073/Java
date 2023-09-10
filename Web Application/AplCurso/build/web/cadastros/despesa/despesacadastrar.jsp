<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Despesas</title>
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
<jsp:include page="/menu.jsp"/>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Despesas</h1>
    <p class="mb-4">Formulário de Cadastro</p>
    
    <a class="btn btn-success mb-4" href="${pageContext.request.contextPath}/DespesaListar">
        <i class="fas fa-sticky-note"></i>
        <strong>Voltar</strong>
    </a>
    <div class="row">
        <div class="col">
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="form-group">
                        <center>
                            <img alt="imagem" class="img-thumbnail" src="${despesa.imagemdocumento}" name="target" id="target" width="170" height="200">
                            <br/><br/>
                            <input type="file" id="gallery-photo-add" class="inputfile" onchange="uploadFile();"/>
                            <label for="gallery-photo-add" class="btn btn-success">
                                <i class="fas fa-file-upload"></i>
                                Selecionar Capa
                            </label>
                        </center>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-lg-9">
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="form-group">
                        <label>Id</label>
                        <input class="form-control" type="text" name="iddespesa" id="iddespesa" value="${despesa.iddespesa}" readonly="readonly"/>
                    </div>
                    <div class="form-group">
                        <label>Descrição da Despesa</label>
                        <input class="form-control" type="text" name="descricao" id="descricao" value="${despesa.descricao}" size="100" maxlength="100"/>
                    </div>
                    <div class="form-group">
                        <div class="form-line row">
                            <div class="col-sm">
                                <label>Data da Despesa</label>
                                <input class="form-control" type="date" name="datadocumento" id="datadocumento" value="${despesa.datadocumento}"/>
                            </div>
                            <div class="col-sm">
                                <label>Valor da Despesa</label>
                                <input class="form-control" type="text" style="text-align: right;" name="valordespesa" id="valordespesa" 
                                       value="<fmt:formatNumber value='${despesa.valordespesa}' type='currency'/>"/>
                            </div>
                            <div class="col-sm">
                                <label>Valor Pago</label>
                                <input class="form-control" type="text" style="text-align: right;" name="valorpago" id="valorpago" 
                                       value="<fmt:formatNumber value='${despesa.valorpago}' type='currency'/>"/>
                            </div>
                        </div>
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
</div>

<style type="text/css">
    .inputfile{
        width: 0.1px;
        height: 0.1px;
        opacity: 0;
        overflow: hidden;
        position: absolute;
        z-index: -1;
    }
    .inputfile:focus + label{
        outline: 1px dotted #000;
        outline: -webkit-focus-ring-color auto 5px;
    }
    .inputfile + label * {
        pointer-events: none;
    }
    .borda{
        position: relative;
        margin: 0 20px 30px 0;
        padding: 10px;
        border: 1px solid #e1e1e1;
        border-radius: 3px;
        background: #fff;
        -webkit-box-shadow: 0px 0px 3px rgba(0,0,0,0,06);
        -moz-box-shadow: 0px 0px 3px rgba(0,0,0,0,06);
        box-shadow: 0px 0px 3px rgba(0,0,0,0,06);
    }
</style>

<script>
    $(document).ready(function (){
        console.log("entrei no ready do documento");
        $("#valordespesa").maskMoney({
            prefix: 'R$',
            suffix: '',
            allowZero: false,
            allowNegative: true,
            allowEmpty: false,
            doubleClickSelection: true,
            selectAllOnFocus: true,
            thousands: '.',
            decimal: ',',
            precision: 2,
            affixesStay: true,
            bringCareAtEndOnFocus: true
        })
        $("#valorpago").maskMoney({
            prefix: 'R$',
            suffix: '',
            allowZero: false,
            allowNegative: true,
            allowEmpty: false,
            doubleClickSelection: true,
            selectAllOnFocus: true,
            thousands: '.',
            decimal: ',',
            precision: 2,
            affixesStay: true,
            bringCareAtEndOnFocus: true
        })
    })
    
    function validarCampos(){
        console.log("entrei na validação de campos");
        if(document.getElementById("descricao").value == ''){
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique a descrição da despesa',
                showConfimButton: false,
                timer: 1000
            })
            $("#descricao").focus();
        }else if(document.getElementById("datadocumento").value == ''){
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique a Data da despesa',
                showConfimButton: false,
                timer: 1000
            })
            $("#datadocumento").focus();
        }else if(document.getElementById("valordespesa").value == ''){
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o Valor da despesa',
                showConfimButton: false,
                timer: 1000
            })
            $("#valordespesa").focus();
        }else{
            gravarDados();
        }
    }
    
    function gravarDados(){
        console.log("Gravando Dados...");
        var target = document.getElementById("target").src;
        $.ajax({
            type: 'post',
            url: 'DespesaCadastrar',
            data: {
                iddespesa: $('#iddespesa').val(),
                descricao: $('#descricao').val(),
                datadocumento: $('#datadocumento').val(),
                valordespesa: $('#valordespesa').val(),
                valorpago: $('#valorpago').val(),
                imagempagamento: target
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
                                text: 'Despesa gravada com Sucesso',
                                showConfimButton: false,
                                timer: 1000
                            }).then(()=>{
                                        window.location.href="${pageContext.request.contextPath}/DespesaListar";
                                    })
                        }else{
                            Swal.fire({
                                position: 'center',
                                icon: 'error',
                                title: 'Erro',
                                text: 'Não foi possível gravar a Despesa',
                                showConfimButton: false,
                                timer: 1000
                            }).then(()=>{
                                        window.location.href="${pageContext.request.contextPath}/DespesaListar";
                                    })
                        }
                        
                    },
            error:
                function (data){
                    console.log("deu bosta");
                    window.location.href = "${pageContext.request.contextPath}/DespesaListar";
                }
        });
    }
    
    function uploadFile(){
        var target = document.getElementById("target");
        target.src="";
        var file = document.querySelector("input[type='file']").files[0];
        if(file){
            var reader = new FileReader();
            reader.readAsDataURL(file);
            reader.onloadend = function (){
                target.src = reader.result;
            }
        }else{
            target.src="";
        }
    }
</script>


<%@include file ="/footer.jsp" %>                           
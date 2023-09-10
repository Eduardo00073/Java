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
    <p class="mb-4">Planilha de Registros</p>
    
    <a class="btn btn-success mb-4" href="${pageContext.request.contextPath}/Despesanovo">
        <i class="fas fa-sticky-note"></i>
        <strong>Novo</strong>
    </a>
    
    <div class="card shadow">
        <div class="card-body">
            <table id="datatable" class="table table-striped">
                <thead>
                    <tr>
                        <th align="right">ID</th>
                        <th align="left">Descrição</th>
                        <th align="center">Data</th>
                        <th align="right">ValorDespesa</th>
                        <th align="right">ValorPago</th>
                        <th align="center">Excluir</th>
                        <th align="center">Alterar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="despesa" items="${despesas}">
                        <tr>
                        <td align="right">${despesa.iddespesa}</td>
                        <td align="left">${despesa.descricao}</td>
                        <td align="center"><fmt:formatDate pattern="dd/MM/yyyy" value="${despesa.datadocumento}"/></td>
                        <td align="right"><fmt:formatNumber value="${despesa.valordespesa}" type="currency"/></td>
                        <td align="right"><fmt:formatNumber value="${despesa.valorpago}" type="currency"/></td>
                        <td align="center">
                            <a href="#" id="deletar" title="Excluir" onclick="deletar(${despesa.iddespesa})" class="btn btn-danger">
                                Excluir
                            </a>
                        </td>
                        <td align="center">
                            <a href="${pageContext.request.contextPath}/DespesaCarregar?iddespesa=${despesa.iddespesa}" class="btn btn-warning">
                                Alterar
                            </a>
                        </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
            console.log('entrei ready');
            //carregamos a datable
            //$("#datable").DataTable({});
            $('#datatable').DataTable({
                "oLanguage":{
                    "sProcessing": "Processando...",
                    "sLengthMenu": "Mostrar _MENU_ registros",
                    "sZeroRecords": "Nenhum registro encontrado.",
                    "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                    "sInfoEmpty": "Mostrando de 0 ate 0 de 0 registros",
                    "sInfoFiltered": "",
                    "sInfoPostFix": "",
                    "sSearch": "Buscar:",
                    "sUrl": "",
                    "oPaginate": {
                        "sFirst": "Primerio",
                        "sPrevious": "Anterior",
                        "sNext": "Seguinte",
                        "sLast": "Último"
                    }
                }
            });
        });
        
        function deletar(codigo){
            var id = codigo;
            console.log(codigo);
            Swal.fire({
              title: 'Você tem certeza?',
              text: "Você não poderá recuperar os dados após essa operação",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Sim, apague a despesa',
              cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed){
                    $.ajax({
                        type: 'post',
                        url: '${pageContext.request.contextPath}/DespesaExcluir',
                        data:{
                            iddespesa: id
                        },
                        success:
                            function(data){
                                if(data==1){
                                    Swal.fire({
                                        position: 'top-end',
                                        icon: 'success',
                                        title: 'Sucesso',
                                        text: 'Despesa excluída com sucesso',
                                        showConfirmButton: false,
                                        timer: 2000
                                    }).then(()=>{
                                        
                                        window.location.href="${pageContext.request.contextPath}/DespesaListar";
                                    })
                                }else{
                                    Swal.fire({
                                        position: 'top-end',
                                        icon: 'error',
                                        title: 'Erro',
                                        text: 'Não foi possível excluir a Despesa',
                                        showConfirmButton: false,
                                        timer: 2000
                                    }).then(()=>{
                                        
                                        window.location.href="${pageContext.request.contextPath}/DespesaListar";
                                    })
                                }
                                
                            },
                          error:
                            function(data){
                                window.location.href="${pageContext.request.contextPath}/DespesaListar";
                            }
                    });
                };
            });
        }
</script>
<%@include file ="/footer.jsp" %>
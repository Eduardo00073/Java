<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1" %>
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
    <!-- Adicione o link para o arquivo DataTables CSS aqui -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.6/css/jquery.dataTables.min.css">
    <!-- Adicione o link para o arquivo DataTables JavaScript aqui -->
    <script src="https://cdn.datatables.net/1.11.6/js/jquery.dataTables.min.js"></script>
    <!-- Adicione o link para o arquivo DataTables Bootstrap CSS aqui -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.11.6/css/dataTables.bootstrap5.min.css">
    <!-- Adicione o link para o arquivo Swal (SweetAlert) CSS aqui -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.css">
    <!-- Adicione o link para o arquivo Swal (SweetAlert) JavaScript aqui -->
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10.16.6/dist/sweetalert2.min.js"></script>
</head>
<body>
<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div class="container">
    <h2>Estados</h2>

    <a class="btn btn-success mb-4" href="${pageContext.request.contextPath}/EstadoNovo">
        <i class="fas fa-sticky-note"></i>
        <strong>Novo</strong>
    </a>

    <table id="datatable" class="table table-striped">
        <thead>
        <tr>
            <th>ID</th>
            <th>Nome</th>
            <th>Sigla</th>
            <th></th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="estado" items="${estados}">
            <tr>
                <td>${estado.idEstado}</td>
                <td>${estado.nomeEstado}</td>
                <td>${estado.siglaEstado}</td>
                <td>
                    <a href="#" id="deletar" title="Excluir" onclick="deletar(${estado.idEstado})">
                        <button class="btn btn-danger">Excluir</button>
                    </a>
                </td>
                <td>
                    <a href="${pageContext.request.contextPath}/EstadoCarregar?idEstado=${estado.idEstado}">
                        <button class="btn btn-warning">Alterar</button>
                    </a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <div align="center">
        <a href="index.jsp">Voltar à Página Inicial</a>
    </div>
</div>

<script>
    $(document).ready(function () {
        $('#datatable').DataTable({
            "oLanguage": {
                "sProcessing": "Processando...",
                "sLengthMenu": "Mostrar _MENU_ registros",
                "sZeroRecords": "Nenhum registro encontrado.",
                "sInfo": "Mostrando de _START_ até _END_ de _TOTAL_ registros",
                "sInfoEmpty": "Mostrando de 0 até 0 de 0 registros",
                "sInfoFiltered": "",
                "sInfoPostFix": "",
                "sSearch": "Buscar:",
                "sUrl": "",
                "oPaginate": {
                    "sFirst": "Primeiro",
                    "sPrevious": "Anterior",
                    "sNext": "Seguinte",
                    "sLast": "Último"
                }
            }
        });
    });

    function deletar(codigo) {
        var id = codigo;
        Swal.fire({
            title: 'Você tem certeza?',
            text: "Você não conseguirá recuperar os dados depois da operação",
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sim, apague o Estado',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/EstadoExcluir',
                    data: {
                        idEstado: id
                    },
                    success:
                        function (data) {
                            if (data == 1) {
                                Swal.fire({
                                    icon: 'success',
                                    title: 'Sucesso',
                                    text: 'Estado Excluído com sucesso',
                                    showConfirmButton: true
                                }).then(() => {
                                    window.location.href = "${pageContext.request.contextPath}/EstadoListar";
                                })
                            } else if (data == 2) {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Erro',
                                    text: 'Não foi possível excluir o Estado pois há cidades dependentes dele',
                                    showCancelButton: false,
                                    showConfirmButton: true
                                }).then(() => {
                                    window.location.href = "${pageContext.request.contextPath}/EstadoListar";
                                })
                            } else {
                                Swal.fire({
                                    icon: 'error',
                                    title: 'Erro',
                                    text: 'Não foi possível excluir o Estado',
                                    showCancelButton: false,
                                    showConfirmButton: true
                                }).then(() => {
                                    window.location.href = "${pageContext.request.contextPath}/EstadoListar";
                                })
                            }
                        },
                    error:
                        function (data) {
                            window.location.href = "${pageContext.request.contextPath}/EstadoListar";
                        }
                });
            }
        });
    }
</script>


        
        <%@include file ="/footer.jsp" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="utf-8" %>
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
            <table id="datatable" class="table display">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Descrição</th>
                        <th>Data</th>
                        <th>ValorDespesa</th>
                        <th>ValorPago</th>
                        <th>Excluir</th>
                        <th>Alterar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="despesa" items="${despesas}">
                        <tr>
                            <td>${despesa.iddespesa}</td>
                            <td>${despesa.descricao}</td>
                            <td><fmt:formatDate pattern="dd/MM/yyyy" value="${despesa.datadocumento}"/></td>
                            <td><fmt:formatNumber value="${despesa.valordespesa}" type="currency"/></td>
                            <td><fmt:formatNumber value="${despesa.valorpago}" type="currency"/></td>
                            <td>
                                <a href="#" id="deletar" title="Excluir" onclick="deletar(${despesa.iddespesa})">
                                    <button class="btn btn-danger">Excluir</button>
                                </a>
                            </td>
                            <td>
                                <a href="${pageContext.request.contextPath}/DespesaCarregar?iddespesa=${despesa.iddespesa}">
                                    <button class="btn btn-warning">Alterar</button>
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
        $('#datatable').DataTable({
            "language": {
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
                    success: function(data){
                        if(data==1){
                            Swal.fire({
                                position: 'top-end',
                                icon: 'success',
                                title: 'Sucesso',
                                text: 'Despesa excluída com sucesso',
                                showConfirmButton: false,
                                timer: 2000
                            })
                        }else{
                            Swal.fire({
                                position: 'top-end',
                                icon: 'error',
                                title: 'Erro',
                                text: 'Não foi possível excluir a despesa',
                                showConfirmButton: false,
                                timer: 2000
                            })
                        }
                        window.location.href="${pageContext.request.contextPath}/DespesaListar";
                    },
                    error: function(data){
                        window.location.href="${pageContext.request.contextPath}/DespesaListar";
                    }
                });
            }
        });
    }
</script>
<%@include file="/footer.jsp" %>

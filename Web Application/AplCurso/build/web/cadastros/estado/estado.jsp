<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

        <!-- Page Heading -->
        <div class="row">
            <div class="col-12">
                <div class="page-title-box">
                    <h4 class="page-title float-left">Estado</h4>

                    <ol class="breadcrumb float-right">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/">Home</a></li>
                        <li class="breadcrumb-item"><a href="#">Cadastros</a></li>
                        <!--<li class="breadcrumb-item">
                    <a href="${pageContext.request.contextPath}/EstadoListar">Estados</a></li>-->
                        <li class="breadcrumb-item active">Estados</li>
                    </ol>

                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- DataTales Example -->
        <div class="card shadow mb-4">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Estados</h6>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-striped table-bordered basic-datatable" id="datatable" width="98%" cellspacing="0">
                        <thead>                        
                            <tr>
                                <th align="left">ID</th>                    
                                <th align="left">Nome</th>
                                <th align="left">Sigla</th>
                                <th align="right"></th>
                                <th align="right"></th>
                            </tr>
                        </thead>                                 
                        <tbody>
                            <c:forEach var="estado" items="${estados}">                    
                                <tr>
                                    <td align="left">${estado.idEstado}</td>                    
                                    <td align="left">${estado.nomeEstado}</td>
                                    <td align="left">${estado.siglaEstado}</td>
                                    <td align="center">
                                     <a href=
                       "${pageContext.request.contextPath}/EstadoExcluir?idEstado=${estado.idEstado}">
                                         <button class="btn btn-danger">Excluir</button></a>
                                    </td>
                                    <td align="center">
                                        <a href=
                      "${pageContext.request.contextPath}/EstadoCarregar?idEstado=${estado.idEstado}">
                                            <button class="btn btn-warning">Alterar</button></a>
                                    </td>
                                </tr>                
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>    
        </div>        
        
        <div align="center">        
            <a href="${pageContext.request.contextPath}/EstadoNovo">Novo</a>
            <a href="index.jsp">Voltar à Página Inicial</a>
        </div>        

<script>
        $(document).ready(function() {
            console.log('entrei ready');
            //Carregamos a datatable
            //$("#datatable").DataTable({});
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
</script>
            
<%@ include file="/footer.jsp" %>        


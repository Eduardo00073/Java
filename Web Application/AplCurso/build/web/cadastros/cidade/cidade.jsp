<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1" %>
<jsp:include page="/header.jsp"/>
<jsp:include page="/menu.jsp"/>

<div  align="center">
<h2 >Cidades</h2>
<div class="col-8 panel-body">
    <table id="datatable" class="table table-striped table-vordered basic-datatable">
        <thead>
            
            <tr>
                <th align="left">ID</th>
                <th align="left">Cidade</th>
                <th align="left">Estado</th>
                <th align="right"></th>
                <th align="right"></th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="cidade" items="${cidades}">
                <tr>
                    <td align="left">${cidade.idCidade}</td>
                    <td align="left">${cidade.nomeCidade}</td>
                    <td align="left">${cidade.estado.siglaEstado}</td>
                    <td align="center">
                        <a href="#" id="deletar" title="Excluir" onclick="deletar(${cidade.idCidade})">
                            <button class="btn btn-group-lg <c:out value="${cidade.situacao == 'A' ?'btn-danger': 'btn-success'}"/>">
                                <c:out value="${cidade.situacao == 'A' ? 'Inativar':'Ativar'}"/>
                            </button>
                        </a>
                    </td>
                    <td align="left">
                        <a href="${pageContext.request.contextPath}/CidadeCarregar?idCidade=${cidade.idCidade}">
                            <button class="btn btn-group-lg btn-success"/>Alterar</button>
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</div>

<div align="center">
    <a href="${pageContext.request.contextPath}/CidadeNovo">Novo</a>
    <a href="index.jsp">Voltar à página inicial</a>
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
                    "sLengthMenu": "Mostrar _MENU_registros",
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
              text: "Você pode ativar ou desativar a cidade depois",
              icon: 'warning',
              showCancelButton: true,
              confirmButtonColor: '#3085d6',
              cancelButtonColor: '#d33',
              confirmButtonText: 'Sim',
              cancelButtonText: 'Cancelar'
            }).then((result) => {
                if (result.isConfirmed){
                    $.ajax({
                        type: 'post',
                        url: '${pageContext.request.contextPath}/CidadeExcluir',
                        data:{
                            idCidade: id
                        },
                        success:
                            function(data){
                                if(data==1){
                                    Swal.fire({
                                        position: 'top-end',
                                        icon: 'success',
                                        title: 'Sucesso',
                                        text: 'situação de cidade modificada com sucesso',
                                        showConfirmButton: false,
                                        timer: 10000
                                    }).then(()=>{
                                        window.location.href="${pageContext.request.contextPath}/CidadeListar";
                                    })
                                }else{
                                    Swal.fire({
                                        position: 'top-end',
                                        icon: 'error',
                                        title: 'Erro',
                                        text: 'Não foi possível modificar a situação Cidade',
                                        showConfirmButton: false,
                                        timer: 10000
                                    }).then(()=>{
                                        window.location.href="${pageContext.request.contextPath}/CidadeListar";
                                    })
                                }
                            },
                          error:
                            function(data){
                                window.location.href="${pageContext.request.contextPath}/CidadeListar";
                            }
                    });
                };
            });
        }
</script>
        
<%@include file ="/footer.jsp" %>
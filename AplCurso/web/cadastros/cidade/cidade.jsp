<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<jsp:include page="/cadastros/menuLogado.jsp"/>

<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Cidades</h1>
    <p class="mb-4">Planilha de Registros</p>
    
    <a class="btn btn-success mb-4" href="${pageContext.request.contextPath}/CidadeNovo">
        <i class="fas fa-sticky-note"></i>
        <strong>Novo</strong>
    </a>
    
    <div class="card shadow">
        <div class="card-body">
            <table id="datatable" class="display">
                <thead>
                   <tr>
                        <th align="center">ID</th>
                        <th align="center">Cidade</th>
                        <th align="center">Estado</th>
                        <th align="center">Inativar</th>
                        <th align="center">Ativar</th>
                        
                  </tr>
                </thead>
                <tbody>
                    <c:forEach var="cidade" items="${cidades}"> 
                        <tr>
                <td align="center">${cidade.idCidade}</td>
                <td align="center">${cidade.nomeCidade}</td>
                <td align="center">${cidade.estado.siglaEstado}</td>
                <td align="center">
                    <a href="#" onclick="deletar(${cidade.idCidade})">
                                    <button class="btn 
                                          <c:out value="${cidade.situacao == 'A' ? 'btn-danger': 'btn-success'}"/>">
                                        <i class="fas fa-fw 
                                           <c:out value="${cidade.situacao == 'A' ? 'fa-times' : ' fa-plus'}"/>"></i>
                                        <Strong>
                                            <c:out value="${cidade.situacao == 'A' ? 'Inativar': 'Ativar'}"/>
                                        </Strong>
                                    </button></a>
                </td>
                <td align="center">
                    <a href="${pageContext.request.contextPath}/CidadeCarregar?idCidade=${cidade.idCidade}">
                        <button class="btn btn-group-lg btn-success"/>Alterar</button>
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
    
    function deletar(codigo){
        var id = codigo;
        console.log(codigo);
        Swal.fire({
            title: 'Você tem certeza?',
            icon: 'warning',
            showCancelButton: true,
            confirmButtonColor: '#3085d6',
            cancelButtonColor: '#d33',
            confirmButtonText: 'Sim, altere a situação!',
            cancelButtonText: 'Cancelar'
        }).then((result) => {
            if (result.isConfirmed) {
                $.ajax({
                    type: 'post',
                    url: '${pageContext.request.contextPath}/CidadeExcluir',
                    data:{
                        idCidade: id
                    },
                    success:
                        function(data){
                            if(data == 1){
                                Swal.fire({
                                    position: 'center',
                                    icon: 'success',
                                    title: 'Sucesso',
                                    text: 'Situação Alterada com sucesso!',
                                    showConfirmButton: false,
                                    timer: 2000
                                    }).then(function(){
                                    window.location.href = "${pageContext.request.contextPath}/CidadeListar";
                                })
                            } else {
                                Swal.fire({
                                    position: 'center',
                                    icon: 'error',
                                    title: 'Erro',
                                    text: 'Não foi possível alterar a cidade!',
                                    showConfirmButton: false,
                                    timer: 2000
                                    }).then(function(){
                                    window.location.href = "${pageContext.request.contextPath}/CidadeListar";
                                })
                            }
                            
                        },
                    error:
                       function(data){
                            Swal.fire({
                                    position: 'top-end',
                                    icon: 'error',
                                    title: 'Erro',
                                    text: 'Não foi possível excluir a estado!Verifique se alguma cidade está vincula ao Estado',
                                    showConfirmButton: false,
                                    timer: 2000
                                }).then(function(){
                                    window.location.href = "${pageContext.request.contextPath}/CidadeListar";
                                })
                        }
                });
            };
        });
    }
 function BuscarCidadePorEstado(){
     $('#idcidade').empty();
     idEst = $('#idestado').val();
     console.log("entrou buscar estado");
     if(idEst != 'null')
     {
         console.log("estado = " + idEst);
         url = "CidadeBuscarPorEstado?idestado=" + idEst;
         //console.log(url);
         $.getJSON(url, function (result) {
             //alert(result);
             $.each(result, function (index, value) {
                 $('#idcidade').append('<option id="cidade_' + value.idCidade + '"value="' + value.idCidade + '">' +
                         value.nomeCidade + '</option>');
                 if (cidade !== '') {
                     $('#cidade_' + cidade).prop({selected: true});
                 } else {
                     $('#cidade_').prop({selected: true});
                 }
             });
         }).fail(function (obj, textStatus, error){
             alert('Error do servidor: ' + textStatus + ', ' + error);
         });
     }
 }
         
     
    
    
</script>
 <%@include file="/footer.jsp"%>
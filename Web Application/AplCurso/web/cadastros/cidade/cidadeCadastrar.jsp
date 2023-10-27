<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<jsp:include page="/cadastros/menuLogado.jsp"/>

<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Cidades</h1>
    <p class="mb-4">Formulário de Cadastro</p>

    <a class="btn btn-secondary mb-4" href="${pageContext.request.contextPath}/CidadeListar">
        <i class="fas fa-undo-alt"></i>
        <strong>Voltar</strong>
    </a>
    <div class="row">
        <!-- Campos de cadastramento -->        
        <div class="col-lg-9">
            <div class="card shadow mb-4">
                <div class="card-body">
                    <div class="form-group">
                        <label>Id</label>
                        <input class="form-control" type="text" name="idCidade" id="idcidade" 
                               value="${cidade.idCidade}" readonly="readonly"/>
                    </div>
                    <div class="form-group">
                        <label>Nome Cidade</label>
                        <input class="form-control" type="text" name="nomeCidade" id="nomecidade" 
                               value="${cidade.nomeCidade}" size="100" maxlength="100"/>
                    </div> 
                  <div class="form-group">
                      <label>Estado</label>
                    <select name="idestado" id="idestado">
                        <option value="">Selecione</option>
                        <c:forEach var="estado" items="${estados}">
                            <option value="${estado.idEstado}" ${cidade.estado.idEstado == estado.idEstado ? "selected" : ""}>
                                ${estado.nomeEstado}
                            </option>
                        </c:forEach>
                    </select>
                  </div>
              
                <input type="hidden" name="situacao" id="situacao" value="${cidade.situacao}" readonly="readonly"/>
            
                    <!-- Botão de Confirmação --> 
                    <div class="form-group">
                        <input type="reset" name="limpar" id="limpar" value="Limpar"/>
                        <button class="btn btn-success" type="submit" id="submit" onclick="validarCampos()">
                            Salvar Cidade</button>
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
    
    function validarCampos() {
        console.log("entrei na validação de campos");
        if (document.getElementById("nomecidade").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o nome da cidade!',
                showConfirmButton: false,
                timer: 1000
            });
            $("#nomecidade").focus();
        } else if (document.getElementById("idestado").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o estado da cidade!',
                showConfirmButton: false,
                timer: 1000
            });
            $("#idestado").focus();
             }  else if (document.getElementById("situacao").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique a situação da cidade!',
                showConfirmButton: false,
                timer: 1000
            });
            $("#situacao").focus(); 
            } else {
            gravarDados();
        }
    }
    
    function gravarDados() {
        console.log("Gravando dados ....");
        $.ajax({
            type: 'post',
            url: 'CidadeCadastrar',
            data: {
                idcidade: $('#idcidade').val(),
                nomecidade: $('#nomecidade').val(),
                idestado: $('#idestado').val(),
                situacao: $('#situacao').val(),
            },
            success:
                    function (data) {
                        console.log("reposta servlet->");
                        console.log(data);
                        if (data == 1) {
                            Swal.fire({
                                position: 'center',
                                icon: 'success',
                                title: 'Sucesso',
                                text: 'Cidade gravada com sucesso!',
                                showConfirmButton: true,
                                timer: 10000
                            }).then(function(){
                                window.location.href = "${pageContext.request.contextPath}/CidadeListar";
                            })
                        } else {
                            Swal.fire({
                                position: 'center',
                                icon: 'error',
                                title: 'Erro',
                                text: 'Não foi possível gravar a cidade!',
                                showConfirmButton: true,
                                timer: 10000
                            }).then(function(){
                                window.location.href = "${pageContext.request.contextPath}/CidadeListar";
                            })
                        }
                    },
            error:
                    function (data) {
                        window.location.href = "${pageContext.request.contextPath}/CidadeListar";
                    }
        });
    }
    
</script>   
<jsp:include page="/footer.jsp"/>
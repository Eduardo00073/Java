<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page = "/header.jsp"/>
<jsp:include page="/cadastros/menuLogado.jsp"/>

<div class="container-fluid">
    <!-- Page Heading -->
    <h1 class="h3 mb-2 text-gray-800">Estados</h1>
    <p class="mb-4">Formulário de Cadastro</p>

    <a class="btn btn-secondary mb-4" href="${pageContext.request.contextPath}/EstadoListar">
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
                        <input class="form-control" type="text" name="idestado" id="idestado" 
                               value="${estado.idEstado}" readonly="readonly"/>
                    </div>
                    <div class="form-group">
                        <label>Nome Do Estado</label>
                        <input class="form-control" type="text" name="nomeestado" id="nomeestado" 
                               value="${estado.nomeEstado}" size="100" maxlength="100"/>
                    </div>
                     <div class="form-group">
                        <label>Sigla Do Estado</label>
                        <input class="form-control" type="text" name="siglastado" id="siglaestado" 
                               value="${estado.siglaEstado}" size="2" maxlength="2"/>
                    </div>
                        </div>
                    </div>
                    <!-- Botão de Confirmação --> 
                    <div class="form-group">
                        <button class="btn btn-success" type="submit" id="submit" onclick="validarCampos()">
                            Salvar Estado</button>
                    </div> 
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
    
    function validarCampos() {
        console.log("entrei na validação de campos");
        if (document.getElementById("idestado").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o nome do estado!',
                showConfirmButton: false,
                timer: 1000
            });
            $("#idestado").focus();
        } else if (document.getElementById("nomeestado").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o estado do estado!',
                showConfirmButton: false,
                timer: 1000
            });
            $("#nomeestado").focus();
             }  else if (document.getElementById("siglaestado").value == '') {
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o estado do estado!',
                showConfirmButton: false,
                timer: 1000
            });
            $("#siglaestado").focus(); 
            } else {
            gravarDados();
        }
    }
    
    function gravarDados() {
        console.log("Gravando dados ....");
        $.ajax({
            type: 'post',
            url: 'EstadoCadastrar',
            data: {
                idestado: $('#idestado').val(),
                nomestado: $('#nomeestado').val(),
                siglaestado: $('#siglaestado').val(),
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
                                text: 'Estado gravada com sucesso!',
                                showConfirmButton: true,
                                timer: 10000
                            }).then(function(){
                                window.location.href = "${pageContext.request.contextPath}/EstadoListar";
                            })
                        } else {
                            Swal.fire({
                                position: 'center',
                                icon: 'error',
                                title: 'Erro',
                                text: 'Não foi possível gravar a estado!',
                                showConfirmButton: true,
                                timer: 10000
                            }).then(function(){
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
    
</script>   
<jsp:include page="/footer.jsp"/>
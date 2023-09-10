<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="iso-8859-1"%>
<jsp:include page="/header.jsp"/>
<jsp:include page = "/menu.jsp"/>

<div class="container-fluid">
    <h1 class="h3 mb-2 text-gray-800">Cidades</h1>
    <p class="mb-4">Formulário de Cadastro</p>
    
    <a class="btn btn-success mb-4" href="${pageContext.request.contextPath}/CidadeListar">
        <i class="fas fa-sticky-note"></i>
        <strong>Voltar</strong>
    </a>
        <div class="row">
            <div class="col-lg-9">
                <div class="card shadow mb-4">
                    <div class="card-body">
                        <div class="form-group">
                            <label>Id</label>
                            <input class="form-control" type="text" name="idCidade" id="idCidade" value="${cidade.idCidade}" readonly="readonly"/>
                        </div>
                        <div class="form-group">
                            <label>Nome</label>
                            <input class="form-control" type="text" name="nomeCidade" id="nomeCidade" value="${cidade.nomeCidade}" size="50" maxlength="50"/>
                        </div>
                        <div class="form-group">
                            <label>Estado</label>
                            <select name="idestado" id="idestado">
                                <option value="">Selecione</option>
                                    <c:forEach var="estado" items="${estados}">
                                        <option value="${estado.idEstado}" ${cidade.estado.idEstado == estado.idEstado ? 'selected': ''}>
                                            ${estado.nomeEstado}
                                        </option>
                                    </c:forEach>
                            </select>
                        </div>
                        <input type="hidden" name="situacao" id="situacao" value="${cidade.situacao}" readonly="readonly"/>
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
        if(document.getElementById("nomeCidade").value == ''){
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o nome da cidade',
                showConfimButton: false,
                timer: 1000
            })
            $("#nomeCidade").focus();
        }else if(document.getElementById("idestado").value == ''){
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o Estado de Cidade',
                showConfimButton: false,
                timer: 1000
            })
            $("#idestado").focus();
        }else if(document.getElementById("situacao").value == ''){
            Swal.fire({
                position: 'center',
                icon: 'error',
                title: 'Verifique o Situacao de Cidade',
                showConfimButton: false,
                timer: 1000
            })
            $("#situacao").focus();
        }else{
            gravarDados();
        }
    }
    
    function gravarDados(){
        console.log("Gravando Dados...");
        $.ajax({
            type: 'post',
            url: 'CidadeCadastrar',
            data: {
                idCidade: $('#idCidade').val(),
                nomeCidade: $('#nomeCidade').val(),
                idestado: $('#idestado').val(),
                situacao: $('#situacao').val()
                
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
                                text: 'Cidade gravada com Sucesso',
                                showConfimButton: false,
                                timer: 1000
                            }).then(()=>{
                                        window.location.href="${pageContext.request.contextPath}/CidadeListar";
                                    })
                        }else{
                            Swal.fire({
                                position: 'center',
                                icon: 'error',
                                title: 'Erro',
                                text: 'Não foi possível gravar a Cidade',
                                showConfimButton: false,
                                timer: 1000
                            }).then(()=>{
                                        window.location.href="${pageContext.request.contextPath}/CidadeListar";
                                    })
                        }
                    },
            error:
                function (data){
                    console.log("deu erro");
                    window.location.href = "${pageContext.request.contextPath}/CidadeListar";
                }
        });
    }
</script>
                
<%@include file="/footer.jsp" %>
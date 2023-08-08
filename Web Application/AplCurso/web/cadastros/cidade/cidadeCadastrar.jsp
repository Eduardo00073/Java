<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
                        <li class="breadcrumb-item">
                    <a href="${pageContext.request.contextPath}/EstadoListar">Estados</a></li>
                        <li class="breadcrumb-item active">Estados</li>
                    </ol>

                    <div class="clearfix"></div>
                </div>
            </div>
        </div>
        <!-- Card Example -->
        <div class="card shadow col-md-12">
            <div class="card-header py-3">
                <h6 class="m-0 font-weight-bold text-primary">Manutenção de Estados</h6>
            </div>
            <div class="card-body">
                <form name="cadastrarcidade" action="CidadeCadastrar" method="POST">
                    <div class="form-row">    
                        <input type="hidden" class="form-control" id="idcidade" name="idcidade" 
                               value="${cidade.idCidade}" readonly="readonly">
                        <input type="hidden" name="situacao" id="situacao" value="${cidade.situacao}" readonly="readonly"/>
                        <div class="form-group col-md-8">
                            <label for="nomecidade" class="col-form-label">Nome Cidade</label>
                            <input type="text" class="form-control descricao" id="nomecidade" name="nomecidade"
                                   required value="${cidade.nomeCidade}" style="text-transform:uppercase">
                        </div>
                        <div class="form-group col-md-1">
                            <label for="idestado" class="col-form-label">Estado</label>
                            <select class="form-control fct" name="idestado" id="idestado">
                                <option value="">Selecione</option>
                                <c:forEach var="estado" items="${estados}">
                                    <option value="${estado.idEstado}" 
                                        ${cidade.estado.idEstado == estado.idEstado ? "selected" : ""}>
                                        ${estado.siglaEstado}
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="form-group col-md-6">        
                        <button type="submit" class="btn btn-success navbar-btn" id="submit"><i class="fa fa-floppy-o" aria-hidden="true"></i> Salvar </button>
                        <button type="reset" class="btn btn-danger navbar-btn" id="reset"><i class="fa fa-floppy-o" aria-hidden="true"></i> Limpar</button>
                        <button class="btn btn-warning navbar-btn"
                            <a href="${pageContext.request.contextPath}/EstadoListar" class="btn btn-warning" id="submit">Cancelar</a>
                        </button>   
                    </div>        
                </form>  
            </div>
        </div>
                            
<%@ include file="/footer.jsp" %>

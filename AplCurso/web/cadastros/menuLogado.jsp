<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:if test="${sessionScope.tipousuario == 'Administrador'}">
  
  <style>
    .tela-branca {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: white;
      z-index: 9999;
    }
  </style>
  
  <div id="divBranca" class="tela-branca"></div>
  
  <jsp:include page="menuAdministrador.jsp"/>

  <script type="text/javascript">
      window.onload = function () {
          var currentUrl = window.location.pathname;
          var targetUrl = "${pageContext.request.contextPath}/EstadoListar";

          if (currentUrl.endsWith('homeLogado.jsp')) {
              window.location.href = targetUrl;
          } else {
              // Remove o div branco se a URL for diferente de homeLogado.jsp
              document.getElementById('divBranca').style.display = 'none';
          }
      }
  </script>
</c:if>


<c:if test="${sessionScope.tipousuario == 'Cliente'}">
  
  <style>
    .tela-branca {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: white;
      z-index: 9999;
    }
  </style>
  
  <div id="divBranca" class="tela-branca"></div>
  
  <jsp:include page="menuHeader.jsp"/>
  <jsp:include page="menuCliente.jsp"/>
   <jsp:include page="menuFooter.jsp"/>
   
  <script type="text/javascript">
      window.onload = function () {
          var currentUrl = window.location.pathname;
          var targetUrl = "${pageContext.request.contextPath}/EstadoListar";

          if (currentUrl.endsWith('homeLogado.jsp')) {
              window.location.href = targetUrl;
          } else {
              // Remove o div branco se a URL for diferente de homeLogado.jsp
              document.getElementById('divBranca').style.display = 'none';
          }
      }
  </script>
</c:if>


<c:if test="${sessionScope.tipousuario == 'Fornecedor'}">
  
  <style>
    .tela-branca {
      position: fixed;
      top: 0;
      left: 0;
      width: 100%;
      height: 100%;
      background-color: white;
      z-index: 9999;
    }
  </style>
  
  <div id="divBrancaFornecedor" class="tela-branca"></div>
  
  <jsp:include page="menuFornecedor.jsp"/>
  
  <script type="text/javascript">
      window.onload = function () {
          var currentUrl = window.location.pathname;
          var targetUrl = "${pageContext.request.contextPath}/EstadoListar";

          if (currentUrl.endsWith('homeLogado.jsp')) {
              window.location.href = targetUrl;
          } else {
              // Remove o div branco se a URL for diferente de homeLogado.jsp
              document.getElementById('divBrancaFornecedor').style.display = 'none';
          }
      }
  </script>
  
</c:if>

  




<%@ include file="header.jsp" %>
 <h1>
 <c:choose>
 <c:when test="${gimnasio == null}">
 <fmt:message key="msg.gimnasio-form.add" />
 </c:when>
 <c:otherwise>
 <fmt:message key="msg.gimnasio-form.edit" />
 </c:otherwise>
 </c:choose>
 </h1>
 <%-- Mostrar mensaje de error si existe --%>
 <c:if test="${not empty errorMessage}">
 <div class="error-message">${errorMessage}</div>
 </c:if>
 <form action="gimnasios" method="post">
 <input type="hidden" name="id" value="${gimnasio != null ? gimnasio.id : ''}" />
 <input type="hidden" name="action" value="${gimnasio == null ? 'insert' : 'update'}" />
 <label for="code"><fmt:message key='msg.gimnasio-form.code' />:</label>
 <input type="text" name="code" id="code" value="${gimnasio != null ? gimnasio.code : ''}" required />
 <label for="name"><fmt:message key='msg.gimnasio-form.name' />:</label>
 <input type="text" name="name" id="name" value="${gimnasio != null ? gimnasio.name : ''}" required />
 <!-- Cuando una cadena de caracteres incluye a otra esta debe llevar comillas simples -->
 <c:choose>
 <c:when test="${gimnasio == null}">
 <input type="submit" value="<fmt:message key='msg.gimnasioform.create' />" />
 </c:when>
 <c:otherwise>
 <input type="submit" value="<fmt:message key='msg.gimnasioform.update' />" />
 </c:otherwise>
 </c:choose>
 </form>
 <a href="gimnasios"><fmt:message key="msg.gimnasio-form.returnback" /></a>
<%@ include file="footer.jsp" %>
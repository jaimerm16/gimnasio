<%@ include file="header.jsp" %>
 <h1><fmt:message key="msg.gimnasio.title" /></h1>
 <a href="gimnasios?action=new"><fmt:message key="msg.gimnasio.add" /></a>
 <table border="1">
 <thead>
 <tr>
 <th><fmt:message key="msg.gimnasio.id" /></th>
 <th><fmt:message key="msg.gimnasio.code" /></th>
 <th><fmt:message key="msg.gimnasio.name" /></th>
 <th><fmt:message key="msg.gimnasio.actions" /></th>
 </tr>
 </thead>
 <tbody>
 <c:forEach var="gimnasio" items="${listgimnasios}">
 <tr>
 <td>${gimnasio.id}</td>
 <td>${gimnasio.code}</td>
 <td>${gimnasio.name}</td>
 <td>
 <a
href="gimnasios?action=edit&id=${gimnasio.id}"><fmt:message key="msg.gimnasio.edit"/></a>
 <form action="gimnasios" method="post" style="display:inline;">
 <input type="hidden" name="action" value="delete"/>
 <input type="hidden" name="id" value="${gimnasio.id}"/>
 <!-- Cuando una cadena de caracteres incluye a otra esta debe llevar comillas simples -->
 <input type="submit" value="<fmt:message key='msg.gimnasio.delete' />" onclick="return confirm('<fmt:message key='msg.gimnasio.confirm' />')" />
 </form>
 </td>
 </tr>
 </c:forEach>
 </tbody>
 </table>
<%@ include file="footer.jsp" %>
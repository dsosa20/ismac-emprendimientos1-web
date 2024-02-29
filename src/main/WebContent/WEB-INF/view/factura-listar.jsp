<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
    <h1>Lista de Facturas</h1>
        <button><a href="${pageContext.request.contextPath}/facturas/findOne?opcion=1">Agregar</a></button>
    <c:if test="${not empty facturas}">
        <table border="1">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Número de Factura</th>
                    <th>Fecha</th>
                    <th>iva</th>
                    <th>Total</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="factura" items="${facturas}">
                    <tr>
                        <td>${factura.idFactura}</td>
                        <td>${factura.numFactura}</td>
                        <td>${factura.fechaFactura}</td>
                        <td>${factura.iva}</td>
                        <td>${factura.total}</td>
              <td>
              <button><a href="${pageContext.request.contextPath}/facturas/findOne?idFactura${item.idFactura}&opcion=1">Actualizar</a></button>
              <button><a href="${pageContext.request.contextPath}/facturas/findOne?idFactura=${item.idFacturae}&opcion=2">Eliminar</button>
              </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </c:if>
    <c:if test="${empty facturas}">
        <p>No se encontraron facturas.</p>
    </c:if>
</body>
</html>
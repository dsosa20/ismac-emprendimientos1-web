S<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%> 
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1> Facturas </h1>
<button><a href="${pageContext.request.contextPath}/facturas/findOne?opcion=1">Agregar</a></button>
<table border="1">
    <thead>
        <tr>
            <th>ID Factura</th>
            <th>Número de Factura</th>
            <th>Fecha de Factura</th>
            <th>Total Neto</th>
            <th>IVA</th>
            <th>Total</th>
            <th>ID Cliente</th>
            <th>ID Pedido</th>
            <th>ID Forma de Pago</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="factura" items="${facturas}">
            <tr>			
                <td>${factura.idFactura}</td>
                <td>${factura.numFactura}</td>
                <td>${fn:substring(factura.fechaFactura,0,10)}</td>
                <td>${factura.totalNeto}</td>
                <td>${factura.iva}</td>
                <td>${factura.total}</td>
                <td>${factura.cliente.idCliente}</td>
                <td>${factura.pedido.idPedido}</td>
                <td>${factura.formaPago.idFormaPago}</td>
                <td>
                    <button><a href="${pageContext.request.contextPath}/facturas/findOne?idFactura=${factura.idFactura}&opcion=1">Actualizar</a></button>
                    <button><a href="${pageContext.request.contextPath}/facturas/findOne?idFactura=${factura.idFactura}&opcion=2">Eliminar</a></button>
                </td>		
            </tr>
        </c:forEach>
    </tbody>
</table>
</body>
</html>
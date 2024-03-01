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
<h1>Detalles de Factura</h1>
<button><a href="${pageContext.request.contextPath}/facturadetalles/findOne?opcion=1">Agregar</a></button>
<table border="1">
    <thead>
        <tr>
            <th>ID Factura Detalle</th>
            <th>Producto</th>
            <th>Cantidad</th>
            <th>Precio Unitario</th>
            <th>Subtotal</th>
            <th>Descuento 1</th>
            <th>Descuento 2</th>
            <th>ID Factura</th>
            <th>ID Empresa Producto</th>
            <th>Acciones</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="detalle" items="${facturadetalles}">
            <tr>			
                <td>${detalle.idFacturaDetalle}</td>
                <td>${detalle.producto}</td>
                <td>${detalle.cantidad}</td>
                <td>${detalle.preUnidad}</td>
                <td>${detalle.subTotal}</td>
                <td>${detalle.descuento1}</td>
                <td>${detalle.descuento2}</td>
                <td>${detalle.factura.idFactura}</td>
                <td>${detalle.empresaProducto.idempresa_producto}</td>
                <td>
                    <button><a href="${pageContext.request.contextPath}/facturadetalles/findOne?idFacturaDetalle=${detalle.idFacturaDetalle}&opcion=1">Actualizar</a></button>
                    <button><a href="${pageContext.request.contextPath}/facturadetalles/findOne?idFacturaDetalle=${detalle.idFacturaDetalle}&opcion=2">Eliminar</a></button>
                </td>		
            </tr>
        </c:forEach>
    </tbody>
</table>

</body>
</html>
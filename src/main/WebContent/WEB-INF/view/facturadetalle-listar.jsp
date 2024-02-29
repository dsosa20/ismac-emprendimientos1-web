<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Listado de Detalles de Factura</title>
</head>
<body>
    <h2>Listado de Detalles de Factura</h2>
    <button><a href="${pageContext.request.contextPath}/facturas/findOne?opcion=1">Agregar</a></button>
    <table border="1">
        <thead>
            <tr>
                <th>ID</th>
                <th>Producto</th>
                <th>Cantidad</th>
                <th>Precio Unitario</th>
                <th>Subtotal</th>
                <th>Descuento 1</th>
                <th>Descuento 2</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${facturadetalles}" var="detalle">
                <tr>
                    <td>${detalle.idFacturaDetalle}</td>
                    <td>${detalle.producto}</td>
                    <td>${detalle.cantidad}</td>
                    <td>${detalle.preUnidad}</td>
                    <td>${detalle.subTotal}</td>
                    <td>${detalle.descuento1}</td>
                    <td>${detalle.descuento2}</td>
          <td>
              <button><a href="${pageContext.request.contextPath}/facturas/findOne?idFactura${item.idFactura}&opcion=1">Actualizar</a></button>
              <button><a href="${pageContext.request.contextPath}/facturas/findOne?idFactura=${item.idFacturae}&opcion=2">Eliminar</button>
          </td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
</body>
</html>
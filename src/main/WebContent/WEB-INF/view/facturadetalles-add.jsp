<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
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
<h1>Detalles de Factura</h1>
<form action="${pageContext.request.contextPath}/facturadetalles/add" method="POST">
    <input type="hidden" id="idFacturaDetalle" name="idFacturaDetalle" value="${facturaDetalle.idFacturaDetalle}">
    <br/><br/>
    Producto:
    <input type="text" id="producto" name="producto" value="${facturaDetalle.producto}">
    <br/><br/>
    Cantidad:
    <input type="number" id="cantidad" name="cantidad" value="${facturaDetalle.cantidad}">
    <br/><br/>
    Precio Unitario:
    <input type="number" step="any" id="preUnidad" name="preUnidad" value="${facturaDetalle.preUnidad}">
    <br/><br/>
    Subtotal:
    <input type="number" step="any" id="subTotal" name="subTotal" value="${facturaDetalle.subTotal}">
    <br/><br/>
    Descuento 1:
    <input type="number" step="any" id="descuento1" name="descuento1" value="${facturaDetalle.descuento1}">
    <br/><br/>
    Descuento 2:
    <input type="number" step="any" id="descuento2" name="descuento2" value="${facturaDetalle.descuento2}">
    <br/><br/>
    ID Factura:
    <input type="number" id="idFactura" name="idFactura" value="${facturaDetalle.factura.idFactura}">
    <br/><br/>
    ID Empresa Producto:
    <input type="number" id="idEmpresaProducto" name="idEmpresaProducto" value="${facturaDetalle.empresaProducto.idempresa_producto}">
    <br/><br/>
    <button type="submit">Guardar</button>
    <button type="button" onclick="window.location.href='/ismac-emprendimientos1-web/facturadetalles/findAll';return false;">Cancelar</button>
</form>

</body>
</html>
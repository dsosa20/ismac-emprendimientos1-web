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
<h1>Facturas</h1>
<form action="${pageContext.request.contextPath}/facturas/add" method="POST">
    <input type="hidden" id="idFactura" name="idFactura" value="${facturas.idFactura}">
    <br/><br/>
    Número de Factura:
    <input type="text" id="numFactura" name="numFactura" value="${facturas.numFactura}">
    <br/><br/>
    Fecha de Factura:
    <input type="date" id="fechaFactura" name="fechaFactura" value="${facturas.fechaFactura}">
    <br/><br/>
    Total Neto:
    <input type="number" step="any" id="totalNeto" name="totalNeto" value="${facturas.totalNeto}">
    <br/><br/>
    IVA:
    <input type="number" step="any" id="iva" name="iva" value="${facturas.iva}">
    <br/><br/>
    Total:
    <input type="number" step="any" id="total" name="total" value="${facturas.total}">
    <br/><br/>
    ID Cliente:
    <input type="number" id="idCliente" name="idCliente" value="${facturas.cliente.idCliente}">
    <br/><br/>
    ID Pedido:
    <input type="number" id="idPedido" name="idPedido" value="${facturas.pedido.idPedido}">
    <br/><br/>
    ID Forma de Pago:
    <input type="number" id="idFormaPago" name="idFormaPago" value="${facturas.formaPago.idFormaPago}">
    <br/><br/>
    <button type="submit">Guardar</button>
    <button type="button" onclick="window.location.href='/ismac-emprendimientos1-web/facturas/findAll';return false;">Cancelar</button>
</form>
</body>
</html>
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
    <h1>Agregar Factura</h1>
	
	<form action="addFacturas" method="POST" enctype="multipart/form-data">
	 
	 Id Factura
	 <input type="hidden" id="idFactura" name="idFactura" value="${factura.idFactura}">
	 <br/><br/>
	 numFactura
	 <input type="text" id="numFactura" name="numFactura" value="${factura.numFactura}">
	 <br/><br/>
	 fechaFactura
	 <input type="date" id="fechaFactura" name="fechaFactura" value="${factura.fechaFactura}">
	 <br/><br/>
	 totalNeto
	 <input type="number" id="totalNeto" name="totalNeto" value="${factura.totalNeto}">
	 <br/><br/>
	 iva
	 <input type="number" id="iva" name="iva" value="${factura.iva}">
	 <br/><br/>
	 total
	 <input type="number" id="total" name="total" value="${factura.total}">
	 <br/><br/>
	 
cliente
	 <select id="idCliente" name="idCliente">	 	
	 	<c:forEach var="item" items="${clientes}" >
	 		<option value="${item.idCliente}">${item.nombre} ${item.apellido}</option>
	 	</c:forEach>	 		 		 		 
	 </select>
	 <br/><br/>
	 	 
	 pedido
	 <select id="idPedido" name="idPedido">
	 	<c:forEach var="item" items="${pedidos}">
	 		<option value="${item.idPedido}">${item.numPedido}</option>
	 	</c:forEach>
	 </select>	 	 
	 <br/><br/>
	
		 formapago
	 <select id="idFormaPago" name="idFormaPago">
	 	<c:forEach var="item" items="${pedidos}">
	 		<option value="${item.idFormaPago}">${item.formapago}</option>
	 	</c:forEach>
	 </select>	 	 
	 <br/><br/> 
		<button type="submit">Guardar</button>	
		<button type="button" onclick="window.location.href='/ismac-emprendimientos1-web/facturas/findAll'; return false;">Cancelar</button>
	
	</form>
</body>
</html>
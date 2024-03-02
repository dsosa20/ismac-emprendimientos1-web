<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<h1>Detalles de Factura</h1>
<form action="deldetalles" method="get">
    <input type="hidden" id="idFacturaDetalle" name="idFacturaDetalle" value="${detalle.idFacturaDetalle}">
    <strong>¿Desea eliminar el detalle de la factura?</strong><br><br>
    <button type="submit">Eliminar</button>
    <button type="button" onclick="window.location.href='/ismac-emprendimientos1-web/facturadetalles/findAll';return false;">Cancelar</button>
</form>


</body>
</html>
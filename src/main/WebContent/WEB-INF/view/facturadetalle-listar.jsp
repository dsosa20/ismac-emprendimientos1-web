<%@ page language="java" contentType="text/html; charset=ISO-8859-1"  
         pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>   

<!DOCTYPE html>

<html>

<head>

<meta charset="ISO-8859-1">

<title>Detalle Facturas</title>

</head>

<body>

<h1>Detalle Facturas</h1>

<table>

<thead>

<tr>
  <th>idDetalleFactura</th>
  <th>Producto</th>
  <th>Cantidad</th>
  <th>PrecioUnidad</th>
  <th>SubTotal</th>
  <th>Descuento1</th>
  <th>Descuento2</th>
  <th>Factura</th>   
  <th>EmpresaProducto</th>
  <th>Acciones</th>  
</tr>
</thead>

<tbody>

<c:forEach var="item" items="${facturas}">

<tr>
  <td>${item.idFacturaDetalle}</td>
  <td>${item.producto}</td>
  <td>${item.cantidad}</td>
  <td>${item.preUnidad}</td>
  <td>${item.subTotal}</td>
  <td>${item.descuento1}</td>
  <td>${item.descuento2}</td>
  <td>${item.factura.id}</td>
  <td>${item.empresaProducto.id}</td> 
</tr>

</c:forEach>

</tbody>

</table>

</body>

</html>
package com.distribuida.dto;

import java.util.Date;
import java.util.List;

import com.distribuida.entities.Factura;
import com.distribuida.entities.FacturaDetalle;

public interface FacturaService {

	
	public List<FacturaDetalle> findAll();
	public Factura findOne(int id);
	
	public void add(int idFacturaDetalle, String producto, int cantidad, Double preUnidad, Double subTotal,
			Double descuento1, Double descuento2, int idFactura, int idEmpresaProducto);
	public void add(int idFactura, String numFactura, Date fechaFactura, Double totalNeto, Double iva, Double total,
			int idCliente , int idPedido , int idFormaPago);	
	public int findMax();
	public int findOne(String numFactura);
	
	public List<Factura> findAll(String busqueda);
	
   //Metodos extras
	public void up(int idFactura, String numFactura, Date fechaFactura, Double totalNeto, Double iva, Double total,
			int idCliente , int idPedido , int idFormaPago);	
	public void del(int id);
	
	public FacturaDetalle findDetalleOne(int id);
	public void up(int idFacturaDetalle, String producto, int cantidad, Double preUnidad, Double subTotal,
			Double descuento1, Double descuento2, int idFactura, int idEmpresaProducto);
	
	
	public void deldetalles(int id);
}

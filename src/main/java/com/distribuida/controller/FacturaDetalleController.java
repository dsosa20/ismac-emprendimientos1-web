package com.distribuida.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.distribuida.dto.Empresa_productoService;
import com.distribuida.dto.FacturaService;
import com.distribuida.entities.Empresa_producto;
import com.distribuida.entities.Factura;
import com.distribuida.entities.FacturaDetalle;

@Controller
@RequestMapping("/facturadetalles")
public class FacturaDetalleController {	
	
	  @Autowired
	  private FacturaService facturaService;
	  @Autowired
	  private Empresa_productoService empresa_productoService;
	  
	    @GetMapping("/findAll")
	    public String findAll(Model model) {
	        List<FacturaDetalle> facturadetalles = facturaService.findAll();
	        model.addAttribute("facturadetalles", facturadetalles);
	        return "facturadetalles-listar";
	    }

	    @GetMapping("/findOne")
	    public String findOne(@RequestParam(name = "idFacturaDetalle", required = false) Integer idFacturaDetalle,
	                          @RequestParam(name = "opcion", required = false) Integer opcion,
	                          ModelMap modelMap) {
	        if (idFacturaDetalle != null) {
	            FacturaDetalle facturaDetalle = facturaService.findDetalleOne(idFacturaDetalle);
	            modelMap.addAttribute("facturaDetalle", facturaDetalle);
	        }

	        List<FacturaDetalle> facturasDetalles = facturaService.findAll(); 
	        List<Empresa_producto> empresasProductos = empresa_productoService.findAll(); 
	        modelMap.addAttribute("facturasDetalles", facturasDetalles);
	        modelMap.addAttribute("empresasProductos", empresasProductos);

	        if (opcion != null && opcion == 1) {
	            return "facturadetalles-add"; 
	        } else {
	            return "facturadetalles-del"; 
	    }
	    }

	    @PostMapping("/add")
	    public String add(
	            @RequestParam(name = "idFacturaDetalle", required = false) @Nullable Integer idFacturaDetalle,
	            @RequestParam(name = "producto") @Nullable String producto,
	            @RequestParam(name = "cantidad") @Nullable int cantidad,
	            @RequestParam(name = "preUnidad") @Nullable Double preUnidad,
	            @RequestParam(name = "subTotal") @Nullable Double subTotal,
	            @RequestParam(name = "descuento1") @Nullable Double descuento1,
	            @RequestParam(name = "descuento2") @Nullable Double descuento2,
	            @RequestParam(name = "idFactura") @Nullable Integer idFactura,
	            @RequestParam(name = "idEmpresaProducto") @Nullable Integer idEmpresaProducto
	    ) {
	        if (idFacturaDetalle == null) {
	            facturaService.add(0, producto, cantidad, preUnidad, subTotal, descuento1, descuento2, idFactura, idEmpresaProducto);
	        } else {
	            facturaService.up(idFacturaDetalle, producto, cantidad, preUnidad, subTotal, descuento1, descuento2, idFactura, idEmpresaProducto);
	        }
	        return "redirect:/facturadetalles/findAll";
	    }
	    
	    @GetMapping("/del")
	    public String del(@RequestParam("id") @Nullable Integer id) {
	        if (id != null) {
	            facturaService.deldetalles(id);
	        }
	        return "redirect:/facturadetalles/findAll";
	    }

}

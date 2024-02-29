package com.distribuida.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.distribuida.dto.FacturaService;
import com.distribuida.entities.Factura;
import com.distribuida.entities.FacturaDetalle;

@Controller
@RequestMapping("/facturas")
public class FacturaController {

    @Autowired
    private FacturaService facturaService;

//    @GetMapping("/findAll")
//    public String findAll(Model model) {
//        List<FacturaDetalle> facturadetalles = facturaService.findAll();
//        model.addAttribute("facturadetalles", facturadetalles);
//        return "facturadetalle-listar";
//    }
    
    
    
	@GetMapping("/findOne")
	public String findOne(@RequestParam("idFactura") @Nullable Integer idFactura
			, @RequestParam("opcion") @Nullable Integer opcion
			, Model model) {
		
		if(idFactura != null) {
			Factura factura = facturaService.findOne(idFactura);
			model.addAttribute("factura",factura);
		}
		if(opcion == 1) return "factura-add";
		else return "factura-del";
		
	}
    
    
    
    @PostMapping("/addFacturas")
    public String addFactura(@RequestParam("idFactua") @Nullable Integer idFactura 
    						 , @RequestParam("numFactura") @Nullable String numFactura
                             , @RequestParam("fechaFactura") @Nullable Date fechaFactura
                             , @RequestParam("totalNeto") @Nullable Double totalNeto
                             , @RequestParam("iva") @Nullable Double iva
                             , @RequestParam("total") @Nullable Double total
                             , @RequestParam("fk_idCliente") @Nullable Integer idCliente
                             , @RequestParam("fk_idPedido") @Nullable Integer idPedido
                             , @RequestParam("fk_idFormaPago") @Nullable Integer idFormaPago
                             ) {
    	if(idFactura == null) {
        	facturaService.add(0, numFactura, fechaFactura, totalNeto, iva, total,idCliente, idPedido, idFormaPago);
    	} else {
        	facturaService.up(idFactura, numFactura, fechaFactura, totalNeto, iva, total,idCliente, idPedido, idFormaPago);
    	}
        return "redirect:/facturas/findAll";
    }
    
    @GetMapping("/findAll")
    public String findAll(@RequestParam(name = "busqueda", required = false) String busqueda, Model model) {
        List<Factura> facturas;
        if (busqueda != null && !busqueda.isEmpty()) {
            facturas = facturaService.findAll(busqueda);
        } else {
            facturas = facturaService.findAll("");
        }
        model.addAttribute("facturas", facturas);
        return "factura-listar"; 
    }

    
}

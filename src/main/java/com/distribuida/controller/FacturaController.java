package com.distribuida.controller;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.lang.Nullable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.distribuida.dto.ClienteService;
import com.distribuida.dto.FacturaService;
import com.distribuida.dto.FormaPagoService;
import com.distribuida.dto.PedidoService;
import com.distribuida.entities.Cliente;
import com.distribuida.entities.Factura;
import com.distribuida.entities.FacturaDetalle;
import com.distribuida.entities.FormaPago;
import com.distribuida.entities.Pedido;

@Controller
@RequestMapping("/facturas")
public class FacturaController {

    @Autowired
    private FacturaService facturaService;
    @Autowired
    private ClienteService clienteService;
    @Autowired
    private PedidoService pedidoService;
    @Autowired
    private FormaPagoService formapagoService;
    

    @GetMapping("/findAll")
    public String findAll(@RequestParam(required = false, defaultValue = "") String busqueda, Model model) {
        List<Factura> facturas = facturaService.findAll(busqueda);
        model.addAttribute("facturas", facturas);
        return "facturas-listar";
    }
    
    @GetMapping("/findOne")
    public String findOne(@RequestParam(name = "idFactura", required = false) Integer idFactura,
                          @RequestParam(name = "opcion", required = false) Integer opcion,
                          ModelMap modelMap) {
        if (idFactura != null) {
            Factura factura = facturaService.findOne(idFactura);
            modelMap.addAttribute("factura", factura);
        }

        List<Cliente> clientes = clienteService.findAll();
        List<Pedido> pedidos = pedidoService.findAll();
        List<FormaPago> formasPago = formapagoService.findAll();
        modelMap.addAttribute("clientes", clientes);
        modelMap.addAttribute("pedidos", pedidos);
        modelMap.addAttribute("formasPago", formasPago);

        if (opcion != null && opcion == 1) {
            return "facturas-add"; 
        } else {
            return "facturas-del"; 
        }
    }
    
    @PostMapping("/add")
    public String add(
            @RequestParam(name = "idFactura", required = false) @Nullable Integer idFactura,
            @RequestParam(name = "numFactura") @Nullable String numFactura,
            @RequestParam(name = "fechaFactura") @Nullable @DateTimeFormat(pattern = "yyyy-MM-dd") Date fechaFactura,
            @RequestParam(name = "totalNeto") @Nullable double totalNeto,
            @RequestParam(name = "iva") @Nullable double iva,
            @RequestParam(name = "total") @Nullable double total,
            @RequestParam(name = "idCliente") @Nullable Integer idCliente,
            @RequestParam(name = "idPedido") @Nullable Integer idPedido,
            @RequestParam(name = "idFormaPago") @Nullable Integer idFormaPago
            ) {

        if (idFactura == null) {
            facturaService.add(0, numFactura, fechaFactura, totalNeto, iva, total, idCliente, idPedido, idFormaPago);
        } else {
            facturaService.up(idFactura, numFactura, fechaFactura, totalNeto, iva, total, idCliente, idPedido, idFormaPago);
        }
        return "redirect:/facturas/findAll";
    }

    @GetMapping("/del")
    public String del(@RequestParam("idFactura") @Nullable Integer idFactura) {
        facturaService.del(idFactura);
        return "redirect:/facturas/findAll";
    }
}

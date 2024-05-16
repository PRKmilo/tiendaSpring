package com.BO.TiendaVirtualSB;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import com.DAO.TiendaVirtualSB.ClienteDAO;
import com.DAO.TiendaVirtualSB.ProveedorDAO;
import com.DAO.TiendaVirtualSB.VentasDAO;
import com.DTO.TiendaVirtualSB.ClienteVO;
import com.DTO.TiendaVirtualSB.ProveedorVO;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;




@RestController
public class ClienteController {	
	@RequestMapping("/registrarCliente")
	public void registrarCliente(ClienteVO cli) 
	 {
		ClienteDAO Dao=new ClienteDAO(); 
	    Dao.registrarCliente(cli);	    
	 }	 
	/**
	 * permite consultar el Cliente asociado al documento enviado como parámetro
	 * o todos los clientes si no hay parámetro 
	 * @param documento 
	 * @return
	 */	
	@RequestMapping("/consultarClientes")
	public ArrayList<ClienteVO> consultarClientes(String nit) {
		ClienteDAO Dao=new ClienteDAO(); 
	    return 	Dao.consultarClientes(nit);		
	}

	@RequestMapping("/actualizarCliente")
	public String actualizarProveedor(ClienteVO cli) {		
		ClienteDAO dao = new ClienteDAO();
		dao.actualizarCliente(cli);
		return "Cliente Actulizado";		
	}
	
	@RequestMapping("/eliminarCliente")
	public String eliminarCliente(ClienteVO cli) {
		ClienteDAO dao = new ClienteDAO();
		dao.eliminarCliente(cli);
		return "Se elimino el cliente";
	}
	
	@RequestMapping("/consultarProveedores")
	public ArrayList<ProveedorVO> consultarProveedores(String nit) {		
		ProveedorDAO dao = new ProveedorDAO();
		return dao.consultarProveedores(nit);		
	}
	
	@RequestMapping("/registrarProveedor")
	public String registrarProveedor(ProveedorVO prov) {
		ProveedorDAO dao = new ProveedorDAO();
		dao.insertProveedor(prov);
		return "Se registro el proveedor";
	}
	
	@RequestMapping("/actualizarProveedor")
	public String actualizarProveedor(ProveedorVO prov) {
		System.out.println("ingresa a actualizar");
		ProveedorDAO dao = new ProveedorDAO();
		dao.actualizarProveedor(prov);
		return "Se actualizo  el proveedor";
	}

	@RequestMapping("/eliminarProveedor")
	public String eliminarProveedor(ProveedorVO prov) {
		ProveedorDAO dao = new ProveedorDAO();
		dao.eliminarProveedor(prov);
		return "Se elimino el proveedor";
	}
	@RequestMapping("/consultarVentas")
	public ArrayList<String> consultarVentas(String tipo) {		
		VentasDAO dao = new VentasDAO();
		return dao.consultarConsolidado(tipo);		
	}

	@RequestMapping("/registroVenta")
	public void registroVenta(String cedulacliente, double total) {		
		VentasDAO dao = new VentasDAO();
	    dao.insertVentas(cedulacliente,total);		
	}
}
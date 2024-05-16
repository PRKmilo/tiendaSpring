package com.BO.TiendaVirtualSB;

import java.util.ArrayList;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.DAO.TiendaVirtualSB.UsuarioDAO;
import com.DTO.TiendaVirtualSB.UsuarioVo;



@RestController
public class UsuarioController {
    @RequestMapping("/consultarUsuarios")
	public ArrayList<UsuarioVo> consultarUsuarios(String nombreUsuario, String password) {
		UsuarioDAO Dao=new UsuarioDAO(); 
	    return 	Dao.consultarUsuario(nombreUsuario, password);		
	}

	@RequestMapping("/consultarUsuarios2")
	public ArrayList<UsuarioVo> consultarUsuarios(String nit) {
		UsuarioDAO Dao=new UsuarioDAO(); 
	    return 	Dao.consultarUsuario2(nit);		
	}

	@RequestMapping("/registrarUsuario")
	public String requestMethodName(UsuarioVo user) {
	 UsuarioDAO dao = new UsuarioDAO();
	 dao.registrarUsuario(user);
	 return "Se registro usuario";
	}


	@RequestMapping("/actualizarUsuario")
	public String actualizarUsuario(UsuarioVo user) {
	 UsuarioDAO dao = new UsuarioDAO();
	 dao.actualizarUsuario(user);
	 return "Se actualizo usuario";
	}

	@RequestMapping("/eliminarUsuario")
	public String eliminarUsuarios(UsuarioVo user) {
	 UsuarioDAO dao = new UsuarioDAO();
	 dao.eliminarUsuario(user);
	 return "Se elimino usuario";
	}
}

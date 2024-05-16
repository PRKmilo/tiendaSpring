package com.DAO.TiendaVirtualSB;


import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.DTO.TiendaVirtualSB.ProveedorVO;;

public class ProveedorDAO {

	public void insertProveedor(ProveedorVO prov) {
		Conexion conex = new Conexion();
		System.out.println(prov.getCiudad_prov()+"ciudad prov "+prov.getNit_prov()+" nit prov");
		try {
			Statement estatuto = conex.getConnection().createStatement();
			estatuto.executeUpdate("INSERT INTO proveedores(nit_prov, ciudad_prov,direccion_prov,nombre_prov, telefono_prov) VALUES ('" + prov.getNit_prov() + "', '" + prov.getCiudad_prov()
					+ "', '" + prov.getDireccion_prov() + "', '" + prov.getNombre_prov() + "', '" + prov.getTelefono_prov() + "')");
			estatuto.close();
			conex.desconectar();

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public ArrayList<ProveedorVO> consultarProveedores(String nit) {
		ArrayList<ProveedorVO> proveedores = new ArrayList<ProveedorVO>();
		Conexion conex = new Conexion();

		String sql = "SELECT * FROM proveedores ";
		if (!nit.equals("null")) {
			sql = sql + "WHERE nit_prov = '" + nit + "'";
		}

		try {
			Statement consulta = conex.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				ProveedorVO prov = new ProveedorVO(res.getString("nit_prov"), res.getString("ciudad_prov"),
						res.getString("direccion_prov"), res.getString("nombre_prov"), res.getString("telefono_prov"));
				proveedores.add(prov);
			}
			res.close();
			consulta.close();
			conex.desconectar();

		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		return proveedores;
	}

	public void actualizarProveedor(ProveedorVO prov){
		Conexion conex = new Conexion();
    try {
        Statement estatuto = conex.getConnection().createStatement();
        estatuto.executeUpdate("UPDATE proveedores SET ciudad_prov = '" + prov.getCiudad_prov() + "', " +
                                        "direccion_prov = '" + prov.getDireccion_prov() + "', " +
                                        "nombre_prov = '" + prov.getNombre_prov() + "', " +
                                        "telefono_prov = '" + prov.getTelefono_prov() + "' " +
                                        "WHERE nit_prov = '" + prov.getNit_prov() + "'");
        estatuto.close();
        conex.desconectar();   
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
	}

	public void eliminarProveedor(ProveedorVO prov){
		Conexion conex = new Conexion();
    try {
        Statement estatuto = conex.getConnection().createStatement();
        estatuto.executeUpdate("DELETE FROM proveedores WHERE nit_prov = '" + prov.getNit_prov() + "'");
        estatuto.close();
        conex.desconectar();
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
	}

}

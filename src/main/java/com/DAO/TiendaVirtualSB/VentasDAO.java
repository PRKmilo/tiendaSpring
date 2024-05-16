package com.DAO.TiendaVirtualSB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.swing.JOptionPane;

import com.DTO.TiendaVirtualSB.Ventas;



public class VentasDAO {
	
	
	public void insertVentas(String cedula_cliente, double total) {
		Conexion conex = new Conexion();
		try {
			Statement estatuto = conex.getConnection().createStatement();
			estatuto.executeUpdate("INSERT INTO ventas (cedula_cliente, cedula_usuario, ivaventa, total_venta, valor_venta) VALUES ('" + cedula_cliente + "', 2222, 0.12, " + total + ", " + total + ")");
			estatuto.close();
			

		} catch (SQLException e) {
			System.out.println(e.getMessage());
		}
	}

	public ArrayList <String> consultarConsolidado(String tipo) {
		ArrayList<String> registros = new ArrayList<String>();
		Conexion conex = new Conexion();

		String sql = "";
		if (tipo.trim().equals("producto")) {
			sql = "SELECT codigo_producto AS Item, SUM(cantidad_producto) AS Unidades\r\n"
					+ "FROM detalle_ventas\r\n"
					+ "GROUP BY codigo_producto\r\n"
					+ "ORDER BY codigo_producto;";
			
		} else if (tipo.trim().equals("cliente")){
			sql = "SELECT (select cedula_cliente from ventas) AS Item, SUM(valor_total) AS Unidades\r\n"
					+ "FROM ventas\r\n"
					+ "GROUP BY cedula_cliente\r\n"
					+ "ORDER BY cedula_cliente;";
		}

		try {
			Statement consulta = conex.getConnection().createStatement();
			ResultSet res = consulta.executeQuery(sql);

			while (res.next()) {
				registros.add(res.getString("Item")+";"+res.getInt("unidades"));

			}
			res.close();
			consulta.close();
			

		} catch (Exception e) {
			JOptionPane.showMessageDialog(null, "no se pudo consultar el Proveedor\n" + e);
		}
		return registros;
	}
}

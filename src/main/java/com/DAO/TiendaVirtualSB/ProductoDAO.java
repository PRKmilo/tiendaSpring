package com.DAO.TiendaVirtualSB;

import java.sql.Statement;
import java.util.ArrayList;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.DTO.TiendaVirtualSB.ClienteVO;
import com.DTO.TiendaVirtualSB.ProductoVO;

public class ProductoDAO {


    public void registrarProducto(ProductoVO producto){
        Conexion conex= new Conexion();
       try {
             Statement estatuto = conex.getConnection().createStatement();

            String query = "INSERT INTO productos (ivacompra, nit_prov, nombre_producto, precio_compra, precio_venta) " +
                    "VALUES (" + producto.getIva() + ", '" + producto.getNit_prov() + "', '" +
                    producto.getNombre_producto() + "', " + producto.getPrecio_compra() + ", " +
                    producto.getPrecio_venta() + ")";
            estatuto.executeUpdate(query);

            estatuto.close();
            conex.desconectar();
        } catch (SQLException e) {
            System.out.println(e.getMessage());
        }
    }

    public ArrayList<ProductoVO> obtenerNombreProducto(String codigoProducto) {
    ArrayList<ProductoVO> productos = new ArrayList<ProductoVO>();
  Conexion conex= new Conexion();
  String sql = "SELECT * FROM productos ";
  if (!codigoProducto.equals("null")) {
	sql = sql + "WHERE codigo_producto = '" + codigoProducto + "'";
  }
  try {
	Statement consulta = conex.getConnection().createStatement();
    ResultSet res = consulta.executeQuery(sql);   
    while (res.next()){
      ProductoVO producto = new ProductoVO(res.getString("codigo_producto"),Double.parseDouble(res.getString("ivacompra")),res.getString("nit_prov"),
                                    res.getString("nombre_producto"),Double.parseDouble(res.getString("precio_compra")),Double.parseDouble(res.getString("precio_venta")));
      productos.add(producto);
    }
    res.close();
    consulta.close();
    conex.desconectar();
  } catch (Exception e) {
	  System.out.println(e.getMessage());
  }
  return productos;
}


    }


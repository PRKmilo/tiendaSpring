package com.DAO.TiendaVirtualSB;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import com.DTO.TiendaVirtualSB.UsuarioVo;

public class UsuarioDAO {
    public ArrayList<UsuarioVo> consultarUsuario(String nombreUsuario, String password) {
       
  ArrayList<UsuarioVo> usuarios = new ArrayList<UsuarioVo>();
  Conexion conex= new Conexion();
  String sql = "SELECT * FROM usuarios ";
  if (!nombreUsuario.equals("null") && !password.equals("null"))  {
	sql = sql + "WHERE usuario = '" + nombreUsuario +"' and password = '"+password+"';";
    System.out.println("este es el sql "+sql);
  }
  try {
   
	Statement consulta = conex.getConnection().createStatement();
    ResultSet res = consulta.executeQuery(sql);   
    while (res.next()){
        System.out.println(res+" esta es res");  
      UsuarioVo user = new UsuarioVo(res.getString("cedula_usuario"),res.getString("email_usuario"),res.getString("nombre_usuario"),
                                    res.getString("password"),res.getString("usuario"));
      usuarios.add(user);
    }
    res.close();
    consulta.close();
    conex.desconectar();
  } catch (Exception e) {
	  System.out.println(e.getMessage());
  }
  return usuarios;
 }

 public ArrayList<UsuarioVo> consultarUsuario2(String nombreUsuario) {
       
  ArrayList<UsuarioVo> usuarios = new ArrayList<UsuarioVo>();
  Conexion conex= new Conexion();
  String sql = "SELECT * FROM usuarios ";
  if (!nombreUsuario.equals("null") ) {
	sql = sql + "WHERE usuario = '" + nombreUsuario +"';";
    System.out.println("este es el sql "+sql);
  }
  try {
   
	Statement consulta = conex.getConnection().createStatement();
    ResultSet res = consulta.executeQuery(sql);   
    while (res.next()){
        
      UsuarioVo user = new UsuarioVo(res.getString("cedula_usuario"),res.getString("email_usuario"),res.getString("nombre_usuario"),
                                    res.getString("password"),res.getString("usuario"));
      usuarios.add(user);
    }
    res.close();
    consulta.close();
    conex.desconectar();
  } catch (Exception e) {
	  System.out.println(e.getMessage());
  }
  return usuarios;
 }
 public void registrarUsuario(UsuarioVo user){
  Conexion conex= new Conexion();
  try {
    Statement estatuto = conex.getConnection().createStatement();
    String query = "INSERT INTO usuarios (cedula_usuario, email_usuario, nombre_usuario, password, usuario) VALUES ('" +
            user.getCedula_usuario() + "', '" + user.getEmail_usuario() + "', '" +
            user.getNombre_usuario() + "', '" + user.getPassword() + "', '" +
            user.getUsuario() + "')";
    estatuto.executeUpdate(query);
    estatuto.close();
    conex.desconectar();  
  } catch (SQLException e) {
      System.out.println(e.getMessage());
  }
 }

 public void actualizarUsuario(UsuarioVo user){
  Conexion conex = new Conexion();
    try {
        Statement estatuto = conex.getConnection().createStatement();
        String query = "UPDATE usuarios SET email_usuario = '" + user.getEmail_usuario() + "', " +
                "nombre_usuario = '" + user.getNombre_usuario() + "', " +
                "password = '" + user.getPassword() + "', " +
                "usuario = '" + user.getUsuario() + "' " +
                "WHERE cedula_usuario = '" + user.getCedula_usuario() + "'";
        estatuto.executeUpdate(query);
        estatuto.close();
        conex.desconectar();
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
 }

 public void eliminarUsuario(UsuarioVo user){
  Conexion conex = new Conexion();
    try {
        Statement estatuto = conex.getConnection().createStatement();
        String query = "DELETE FROM usuarios WHERE cedula_usuario = '" + user.getCedula_usuario() + "'";
        estatuto.executeUpdate(query);
        estatuto.close();
        conex.desconectar();
    } catch (SQLException e) {
        System.out.println(e.getMessage());
    }
 }

}

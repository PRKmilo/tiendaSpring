package com.DTO.TiendaVirtualSB;

public class ProductoVO {
    private  String codigo_producto;
    private double iva;
    private String nit_prov;
    private String nombre_producto;
    private double precio_compra;
    private double precio_venta;

    public ProductoVO(String codigo_producto, double iva, String nit_prov, String nombre_producto, double precio_compra, double precio_venta) {
        this.codigo_producto = codigo_producto;
        this.iva = iva;
        this.nit_prov = nit_prov;
        this.nombre_producto = nombre_producto;
        this.precio_compra = precio_compra;
        this.precio_venta = precio_venta;
    }

    public String getCodigo_producto() {
        return codigo_producto;
    }

    public void setCodigo_producto(String codigo_producto) {
        this.codigo_producto = codigo_producto;
    }

    public double getIva() {
        return iva;
    }

    public void setIva(double iva) {
        this.iva = iva;
    }

    public String getNit_prov() {
        return nit_prov;
    }

    public void setNit_prov(String nit_prov) {
        this.nit_prov = nit_prov;
    }

    public String getNombre_producto() {
        return nombre_producto;
    }

    public void setNombre_producto(String nombre_producto) {
        this.nombre_producto = nombre_producto;
    }

    public double getPrecio_compra() {
        return precio_compra;
    }

    public void setPrecio_compra(double precio_compra) {
        this.precio_compra = precio_compra;
    }

    public double getPrecio_venta() {
        return precio_venta;
    }

    public void setPrecio_venta(double precio_venta) {
        this.precio_venta = precio_venta;
    }
    
}

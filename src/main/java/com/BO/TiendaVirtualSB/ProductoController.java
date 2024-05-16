package com.BO.TiendaVirtualSB;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.DAO.TiendaVirtualSB.ProductoDAO;
import com.DAO.TiendaVirtualSB.UsuarioDAO;
import com.DTO.TiendaVirtualSB.ProductoVO;
import com.DTO.TiendaVirtualSB.UsuarioVo;


@RestController
public class ProductoController {
    @RequestMapping("/registroProductos")
	public void requestMethodName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
	 
    ProductoDAO dao = new ProductoDAO();
	 List<ProductoVO> productos = new ArrayList<>();

        // Obtener el archivo CSV del formulario
        InputStream inputStream = request.getPart("fileCSV").getInputStream();

        List<String> lines = new ArrayList<>();
        try (BufferedReader reader = new BufferedReader(new InputStreamReader(inputStream))) {
            String line;
            int counter=0;
            while ((line = reader.readLine()) != null) {
                System.out.println("line "+ line);
                
                String[] operation = line.split(",");
                if(operation.length == 5  ){
                    lines.add(line);
                    if(counter > 0){
                    double iva =Double.parseDouble((operation[0]));
                    String prov = operation[1];
                    String nombre = operation[2];
                    double precio_compra = Double.parseDouble(operation[3]);
                    double  precio_venta = Double.parseDouble(operation[4]);
                    ProductoVO prod= new ProductoVO(prov, iva, prov, nombre, precio_compra, precio_venta); 
                    dao.registrarProducto(prod);
                    }
                }else{
                    throw new IllegalArgumentException("Formato erroneo");
                }
                counter++;
            }
        }
        

        System.out.println("ingresando a controlador de productos");
        System.out.println(inputStream);

        

        // Aquí puedes guardar la lista de productos en la base de datos o realizar alguna otra acción
        // Por ejemplo:
        // productService.guardarProductos(productos);

        // Enviar una respuesta al cliente
        response.getWriter().println("Productos cargados exitosamente.");
	}

    @RequestMapping("/consultaProducto")
    public ArrayList<ProductoVO> consultaProducto(String nit){
        return new ProductoDAO().obtenerNombreProducto(nit);
    }

    
}

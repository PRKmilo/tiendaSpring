<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Consulta de Venta - Tienda Genérica</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
    <header class="bg-dark text-white py-4">
        <div class="container">
            <h1 class="text-center">Tienda</h1>
        </div>
    </header>
    <nav class="navbar navbar-expand-lg navbar-light bg-dark">
        <div class="container">
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav mx-auto">
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/TiendaVirtualSB/ConsultaClientes.jsp">Consultar Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/TiendaVirtualSB/RegistroClientes.jsp">Registrar Clientes</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/TiendaVirtualSB/ConsultaProveedores.jsp">Consultar Proveedores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link  text-white" href="/TiendaVirtualSB/RegistroProveedores.jsp">Registrar Proveedores</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/TiendaVirtualSB/ConsultaUsuarios.jsp">Consultar Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/TiendaVirtualSB/RegistroProductos.jsp">Registrar Productos</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/TiendaVirtualSB/RegistroUsuarios.jsp">Registrar Usuarios</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link text-white" href="/TiendaVirtualSB/RegistroVenta.jsp">Registro Ventas</a>
                    </li>
                    
                </ul>
            </div>
        </div>
    </nav>

<label for="cedula">Cédula:</label>
<input type="text" id="cedula" name="cedula" size="10" maxlength="10">
<button type="button" class="btn btn-primary mr-2" onclick="consulta()">Consultar</button>
</form>

<p>
 <strong>Cliente:</strong>
 <span id="cliente"></span>
</p>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form>
                <!-- Fila 1 -->
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <label for="txtCampo1">Cod producto:</label>
                        <input type="text" class="form-control" id="txtCampo1" name="campo1">
                    </div>
                    <div class="form-group col-md-2">
                        <button type="button" onclick="consultarProducto1()" class="btn btn-primary">Consultar</button>
                    </div>
                    <div class="form-group col-md-2">
                        <label for="txtCampo2">Nombre Producto:</label>
                        <input type="text" class="form-control" id="txtCampo2" name="campo2">
                    </div>
                    <div class="form-group col-md-2">
                        <label for="txtCampo3">Cantidad:</label>
                        <input type="text" class="form-control" id="txtCampo3" name="campo3">
                    </div>
                    <div class="form-group col-md-1">
                        <label for="txtCampo3">Total:</label>
                        <input type="text" class="form-control" id="txtCampo4" name="campo3">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="container">
    
    <div class="row">
        <div class="col-md-12">
            <form>
                <!-- Fila 1 -->
                <div class="form-row">
                    <div class="form-group col-md-2">
                     
                        <input type="text" class="form-control" id="txtCampo11" name="campo1">
                    </div>
                    <div class="form-group col-md-2">
                        <button type="button" onclick="consultarProducto2()" class="btn btn-primary">Consultar</button>
                    </div>
                    <div class="form-group col-md-2">
                        
                        <input type="text" class="form-control" id="txtCampo5" name="campo2">
                    </div>
                    <div class="form-group col-md-2">
                      
                        <input type="text" class="form-control" id="txtCampo6" name="campo3">
                    </div>
                    <div class="form-group col-md-1">
                        
                        <input type="text" class="form-control" id="txtCampo7" name="campo3">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <form>
                <!-- Fila 1 -->
                <div class="form-row">
                    <div class="form-group col-md-2">
                        <input type="text" class="form-control" id="txtCampo8" name="campo1">
                    </div>
                    <div class="form-group col-md-2">
                        <button type="button" onclick="consultarProducto3()" class="btn btn-primary">Consultar</button>
                    </div>
                    <div class="form-group col-md-2">
                        <input type="text" class="form-control" id="txtCampo9" name="campo2">
                    </div>
                    <div class="form-group col-md-2">
                        <input type="text" class="form-control" id="txtCampo20" name="campo3">
                    </div>
                    <div class="form-group col-md-1">
                        <input type="text" class="form-control" id="txtCampo15" name="campo3">
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>

<button type="button" onclick="subirVenta()" class="btn btn-primary">Confirmar venta</button>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script>
 function consulta() {
        var nit = document.getElementById("cedula").value.trim();
        if (nit.trim() == "") {
            nit = "null";
        }
        var http = new XMLHttpRequest();
        var url = '/TiendaVirtualSB/consultarClientes';
        var params = "nit=" + nit;
        http.open('POST', url, true);
        //Send the proper header information along with the request
        http.setRequestHeader('Content-type',
                'application/x-www-form-urlencoded');
        http.onreadystatechange = function() {//Call a function when the state changes.
            if (http.readyState == 4 && http.status == 200) {
                var jsonResponse = JSON.parse(http.responseText);
    
    // Obtener el valor de nombre_cli del primer elemento del array (si lo hubiera)
                var nombreCliente = jsonResponse[0]["nombre_cli"];
    
    // Imprimir el valor de nombre_cli
               console.log(nombreCliente);
    
    // Llamar a la función insertValue() aquí si es necesario
               insertValue(nombreCliente);
            }
        }
        http.send(params);
    }

    function insertValue(nombre){
        var element = document.getElementById("cliente")
        element.innerHTML= nombre
        
    }

    function consultaGeneral(idcodigoproducto,idnombreproducto,idcantidad,idtotal ) {
        var nit = document.getElementById(idcodigoproducto).value.trim();
        if (nit.trim() == "") {
            nit = "null";
        }
        var http = new XMLHttpRequest();
        var url = '/TiendaVirtualSB/consultaProducto';
        var params = "nit=" + nit;
        http.open('POST', url, true);
        //Send the proper header information along with the request
        http.setRequestHeader('Content-type',
                'application/x-www-form-urlencoded');
        http.onreadystatechange = function() {//Call a function when the state changes.
            if (http.readyState == 4 && http.status == 200) {
                var jsonResponse = JSON.parse(http.responseText);
    
    // Obtener el valor de nombre_cli del primer elemento del array (si lo hubiera)
                var nombreproducto = jsonResponse[0]["nombre_producto"];
                var valorventa = jsonResponse[0]["precio_venta"];
    
    // Imprimir el valor de nombre_cli,n
              
    
    // Llamar a la función insertValue() aquí si es necesario
               insertValue2(idnombreproducto,idcantidad,idtotal,nombreproducto,valorventa);
            }
        }
        http.send(params);
    }

    function insertValue2( idnombreproducto, idcantidad, idtotal,nombreproducto,valor){
        var element2 = document.getElementById(idnombreproducto)
        var element3 = document.getElementById(idcantidad)
        var element4 = document.getElementById(idtotal)
       
        element2.value=nombreproducto
        element4.value=element3.value*valor
    }

    function consultarProducto1(){
        consultaGeneral("txtCampo1","txtCampo2","txtCampo3","txtCampo4" )
    }

    function consultarProducto2(){
        consultaGeneral("txtCampo11","txtCampo5","txtCampo6","txtCampo7" )
    }
    function consultarProducto3(){
        consultaGeneral("txtCampo8","txtCampo9","txtCampo20","txtCampo15" )
     }

     function subirVenta(){
        var nit = document.getElementById("cedula").value
        alert(nit)
        var total1 = document.getElementById("txtCampo4")
        var total2 = document.getElementById("txtCampo7")
        var total3 = document.getElementById("txtCampo15")

        var total = total1.value+total2.value+total3.value
        var http = new XMLHttpRequest();
			var url = '/TiendaVirtualSB/registroVenta';
			var params = "cedulacliente=" + nit + "&" + "total=" + total;
			http.open('POST', url, true);

			//Send the proper header information along with the request
			http.setRequestHeader('Content-type',
					'application/x-www-form-urlencoded');

			http.onreadystatechange = function() {//Call a function when the state changes.
				if (http.readyState == 4 && http.status == 200) {
					alert(http.responseText);
				}
			}
			http.send(params);
     }
</script>

    
            </body>
            </html>
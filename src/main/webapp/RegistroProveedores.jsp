<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Proveedores</title>
    <!-- Bootstrap CSS -->
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
    <div class="container">
        <h1 class="mt-5 mb-3">Registro de Proveedores</h1>
        <div class="row">
            <div class="col-md-6">
                <form>
                    <div class="form-group">
                        <label for="txtNIT">NIT:</label>
                        <input type="text" class="form-control" id="txtNIT" name="NIT">
                    </div>
                    <div class="form-group">
                        <label for="txtCiudad">Ciudad:</label>
                        <input type="text" class="form-control" id="txtCiudad" name="ciudad">
                    </div>
                    <div class="form-group">
                        <label for="txtDireccion">Dirección:</label>
                        <input type="text" class="form-control" id="txtDireccion" name="direccion">
                    </div>
                    <div class="form-group">
                        <label for="txtNombre">Nombre:</label>
                        <input type="text" class="form-control" id="txtNombre" name="nombre">
                    </div>
                    <div class="form-group">
                        <label for="txtTelefono">Teléfono:</label>
                        <input type="text" class="form-control" id="txtTelefono" name="telefono">
                    </div>
                    <button type="button" class="btn btn-primary mr-2" onclick="crear()">Registrar Proveedor</button>
					<button type="button" class="btn btn-primary mr-2" onclick="eliminar()">Eliminar
						 Proveedor</button>
					<button type="button" class="btn btn-primary mr-2" onclick="actualizar()">Actualizar Proveedor</button>
                    
                </form>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function validateFields() {
            var nit = document.getElementById("txtNIT").value.trim();
            var ciudad = document.getElementById("txtCiudad").value.trim();
            var direccion = document.getElementById("txtDireccion").value.trim();
            var nombre = document.getElementById("txtNombre").value.trim();
            var telefono = document.getElementById("txtTelefono").value.trim();
            
            if (nit.length == 0 || ciudad.length == 0 || direccion.length == 0 || nombre.length == 0 || telefono.length == 0) {
                alert("Por favor complete todos los campos.");
                return false;
            }
            return true;
        }

        function sendData(url) {
            if (!validateFields()) {
                return;
            } else {
                var nit = document.getElementById("txtNIT").value.trim();
                var ciudad = document.getElementById("txtCiudad").value.trim();
                var direccion = document.getElementById("txtDireccion").value.trim();
                var nombre = document.getElementById("txtNombre").value.trim();
                var telefono = document.getElementById("txtTelefono").value.trim();

                var http = new XMLHttpRequest();
                var url = '/TiendaVirtualSB'+ url;
                var params = "nit_prov=" + nit + "&ciudad_prov=" + ciudad + "&Direccion_prov=" + direccion + "&nombre_prov=" + nombre + "&telefono_prov=" + telefono;
                http.open('POST', url, true);

                //Send the proper header information along with the request
                http.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');

                http.onreadystatechange = function() {//Call a function when the state changes.
                    if (http.readyState == 4 && http.status == 200) {
                        alert(http.responseText);
                    }
                }
                http.send(params);
            }
        }

		function crear(){
		var suburl = '/registrarProveedor'
		sendData(suburl)
	}

	function eliminar(){
		var suburl = '/eliminarCliente'
		sendData(suburl)
	}

	function actualizar(){
		var suburl = '/actualizarProveedor';
		sendData(suburl)
	}
    </script>
</body>
</html>

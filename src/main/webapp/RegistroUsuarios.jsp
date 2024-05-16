<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Registro de Usuarios</title>
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
        <h1 class="mt-5 mb-3">Registro de Usuarios</h1>
        <div class="row">
            <div class="col-md-6">
                <form>
                    <div class="form-group">
                        <label for="txtCedula">Cédula:</label>
                        <input type="text" class="form-control" id="txtCedula" name="cedula">
                    </div>
                    <div class="form-group">
                        <label for="txtEmail">Email:</label>
                        <input type="email" class="form-control" id="txtEmail" name="email">
                    </div>
                    <div class="form-group">
                        <label for="txtNombre">Nombre:</label>
                        <input type="text" class="form-control" id="txtNombre" name="nombre">
                    </div>
                    <div class="form-group">
                        <label for="txtPassword">Contraseña:</label>
                        <input type="password" class="form-control" id="txtPassword" name="password">
                    </div>
                    <div class="form-group">
                        <label for="txtUsuario">Usuario:</label>
                        <input type="text" class="form-control" id="txtUsuario" name="usuario">
                    </div>
                    <button type="button" class="btn btn-primary mr-2" onclick="crear()">Crear</button>
                    <button type="button" class="btn btn-success mr-2" onclick="actualizar()">Actualizar</button>
                    <button type="button" class="btn btn-danger" onclick="eliminar()">Eliminar</button>
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
            var cedula = document.getElementById("txtCedula").value.trim();
            var email = document.getElementById("txtEmail").value.trim();
            var nombre = document.getElementById("txtNombre").value.trim();
            var password = document.getElementById("txtPassword").value.trim();
            var usuario = document.getElementById("txtUsuario").value.trim();
            
            if (cedula.length == 0 || email.length == 0 || nombre.length == 0 || password.length == 0 || usuario.length == 0) {
                alert("Por favor complete todos los campos.");
                return false;
            }
            return true;
        }

        function sendData(url) {
            if (!validateFields()) {
                return;
            } else {
                var cedula = document.getElementById("txtCedula").value.trim();
                var email = document.getElementById("txtEmail").value.trim();
                var nombre = document.getElementById("txtNombre").value.trim();
                var password = document.getElementById("txtPassword").value.trim();
                var usuario = document.getElementById("txtUsuario").value.trim();

                var http = new XMLHttpRequest();
                var url = '/TiendaVirtualSB' + url;
                var params = "cedula_usuario=" + cedula + "&email_usuario=" + email + "&nombre_usuario=" + nombre + "&password=" + password + "&usuario=" + usuario;
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
            var suburl = '/registrarUsuario';
            sendData(suburl);
        }

        function eliminar(){
            var suburl = '/eliminarUsuario';
            sendData(suburl);
        }

        function actualizar(){
            var suburl = '/actualizarUsuario';
            sendData(suburl);
        }
    </script>
</body>
</html>

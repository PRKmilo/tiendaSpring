<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Cargar Lista de Productos</title>
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
        <h1 class="mt-5 mb-3">Cargar Lista de Productos</h1>
        <div class="row">
            <div class="col-md-6">
                <form id="uploadForm" enctype="multipart/form-data">
                    <div class="form-group">
                        <label for="fileCSV">Seleccione un archivo CSV:</label>
                        <input type="file" class="form-control-file" id="fileCSV" name="fileCSV">
                    </div>
                    <button type="button" class="btn btn-primary" onclick="uploadCSV()">Cargar</button>
                </form>
                <div id="responseMessage" class="mt-3"></div>
            </div>
        </div>
    </div>
    
    <!-- Bootstrap JS -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>

    <script>
        function uploadCSV() {
            var form = $('#uploadForm')[0];
            var formData = new FormData(form);

            $.ajax({
                type: "POST",
                enctype: 'multipart/form-data',
                url: "/TiendaVirtualSB/registroProductos",
                data: formData,
                processData: false,
                contentType: false,
                cache: false,
                success: function (data) {
                    $('#responseMessage').html('<div class="alert alert-success" role="alert">Archivo CSV cargado exitosamente.</div>');
                },
                error: function (e) {
                    $('#responseMessage').html('<div class="alert alert-danger" role="alert">Error al cargar el archivo CSV.</div>');
                }
            });
        }
        
    </script>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Consulta de Usuarios</title>
<!-- Bootstrap CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script>
    function consultar() {
        var nit = document.getElementById("txtNIT").value.trim();
        if (nit.trim() == "") {
            nit = "null";
        }
        var http = new XMLHttpRequest();
        var url = '/TiendaVirtualSB/consultarUsuarios2';
        var params = "nit=" + nit;
        http.open('POST', url, true);
        //Send the proper header information along with the request
        http.setRequestHeader('Content-type',
                'application/x-www-form-urlencoded');
        http.onreadystatechange = function() {//Call a function when the state changes.
            if (http.readyState == 4 && http.status == 200) {
                alert(http.responseText);
                CreateTableFromJSON(http.responseText);
            }
        }
        http.send(params);
    }
    
    function CreateTableFromJSON(json_result) {
        
        const json_arr = JSON.parse(json_result);
        
        // EXTRACT VALUE FOR HTML HEADER.    
        var col = [];
        for (var i = 0; i < json_arr.length; i++) {
            for ( var key in json_arr[i]) {
                if (col.indexOf(key) === -1) {
                    col.push(key);
                }
            }
        }

        // CREATE DYNAMIC TABLE.
        var table = document.createElement("table");
        table.classList.add("table"); // Add Bootstrap table class
        // table.setAttribute("border", "1");

        // CREATE HTML TABLE HEADER ROW USING THE EXTRACTED HEADERS ABOVE.

        var tr = table.insertRow(-1); // TABLE ROW.
        

        for (var i = 0; i < col.length; i++) {
            var th = document.createElement("th"); // TABLE HEADER.
            th.innerHTML = col[i];
            tr.appendChild(th);
        }

        // ADD JSON DATA TO THE TABLE AS ROWS.
        for (var i = 0; i < json_arr.length; i++) {

            tr = table.insertRow(-1);

            for (var j = 0; j < col.length; j++) {
                var tabCell = tr.insertCell(-1);
                tabCell.innerHTML = json_arr[i][col[j]];
            }
        }

        // FINALLY ADD THE NEWLY CREATED TABLE WITH JSON DATA TO A CONTAINER.
        var divContainer = document.getElementById("dvResult");
        divContainer.innerHTML = "";
        divContainer.appendChild(table);
    }
</script>
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
        <h1 class="mt-5 mb-3">Consulta de Usuarios</h1>
        <div class="row">
            <div class="col-md-6">
                <div class="form-group row">
                    <label for="txtNIT" class="col-sm-3 col-form-label">Nombre del usuario:</label>
                    <div class="col-sm-6">
                        <input type="text" class="form-control" id="txtNIT" name="NIT">
                    </div>
                    <div class="col-sm-3">
                        <button onclick="consultar()" class="btn btn-primary">Consultar</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="row">
            <div class="col-md-12">
                <div id="dvResult"></div>
            </div>
        </div>
    </div>
<!-- Bootstrap JS -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

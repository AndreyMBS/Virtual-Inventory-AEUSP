<% Session.LCID = 5130; %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPrincipalUsuarios.aspx.cs" Inherits="AppInventarioVirtual.FrmPrincipalUsuarios" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, inicial-scale=1.0" />
    <title>Usuarios</title>
    <link rel="stylesheet" href="www/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../www/css/estilos.css" />
</head>
<body>
    <form id="form1" runat="server">

        <div>


            <nav class="navbar navbar-inverse bg-inverse nav-us" style="border: none;">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-nav">
                    <a class="nav-item nav-link" style="color: white; font-size: 4vh;" href="FrmConsultaUsuarios.aspx">Reporte de Usuarios</a>
                </div>
            </nav>
            <div class="fondo-us">
            </div>

            <div class="container">
                <div class="row align-items-center">
                    <div class="col">
                        <div class=" col-lg-12 col-md-8 col-sm-8 text-center">
                            <h1 style="text-align: center; color: #e5b365; font-size: 10vh;">Sistema de Usuarios</h1>
                            <br />
                            <div class="container">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <asp:Button ID="registrarUsuarios" runat="server" class="btn btn-us btn-lg" Text="Registrar Usuarios" OnClick="registrarUsuarios_Click" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class=" col-lg-5 col-md-8 col-sm-8">
                            <div class=" text-center col-md-4 col-sm-2">
                                <img src="www/css/img/usuarios/photo_2019-11-06_01-58-57.jpg" width="300" height="300" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="www/js/bootstrap.min.js"></script>
</body>
</html>

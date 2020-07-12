<% Session.LCID = 5130; %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPrincipal-Lim.aspx.cs" Inherits="AppInventarioVirtual.FrmPrincipal_Lim" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, inicial-scale=1.0" />
    <title>Limpieza</title>
    <link rel="stylesheet" href="www/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../www/css/estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <nav class="navbar navbar-inverse bg-inverse nav-lim" style="border: none;">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-nav">
                    <a class="nav-item nav-link" style="color: white; font-size: 4vh;" href="FrmConsulta-Lim.aspx">Consulta de Inventario</a>
                </div>
            </nav>
            <div class="fondo-lim">
            </div>

            <div class="container">
                <div class="row align-items-center" >
                    <div class="col">
                        <div class=" col-lg-12 col-md-8 col-sm-8 text-center">
                            <h1 style="text-align: center; color: #8ed8f8; font-size: 10vh;">Sistema de Limpieza</h1>
                            <br />
                            <div class="container">
                                <div class="row align-items-center">
                                    <div class="col">
                                        <asp:Button ID="registrarConsumible" runat="server" class="btn btn-lim btn-lg" Text="Registrar Consumible" OnClick="btn_registrarConsumible_Click" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class=" col-lg-5 col-md-8 col-sm-8">
                            <div class=" text-center col-md-4 col-sm-2">
                                <img src="www/css/img/limpieza/soap.png" width="300" height="300" />
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

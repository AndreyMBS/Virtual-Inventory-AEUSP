<% Session.LCID = 5130; %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPrincipalSalud.aspx.cs" Inherits="AppInventarioVirtual.FrmPrincipalSalud" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="viewport" content="width=device-width, inicial-scale=1.0" />
    <title>Salud</title>
    <link rel="stylesheet" href="www/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../www/css/estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

             <nav class="navbar navbar-inverse bg-inverse nav-salud" style="border:none;">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-nav">
                    <a class="nav-item nav-link" style="color: white; font-size: 4vh; " href="FrmConsultaSA.aspx">Consulta de Inventario</a>
                </div>
            </nav>
            <div class="fondo-salud">
            </div>

            <div class="container">
                <div class="row align-items-center">
                    <div class="col">
                        <div class=" col-lg-12 col-md-8 col-sm-8 text-center">
                            <h1 style="text-align: center; color: #225b28; font-size:10vh;">Área de Salud</h1>
                            <br />
                            <div class="container">
                                <div class="row align-items-center">
                                    <div class="col text-center">
                                        <asp:Button ID="registrarBoleta" runat="server" class="btn btn-salud btn-lg" Text="Registrar Boleta" OnClick="btn_RegistrarBoleta_Click"/>
                                    </div>
                                    <div class="col">
                                        <asp:Button ID="registrarConsumible" runat="server" class="btn btn-salud btn-lg" Text="Registrar Consumible" OnClick="btn_RgistrarConsumible_Click" />

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class=" col-lg-5 col-md-8 col-sm-8">
                            <div class=" text-center col-md-4 col-sm-2">
                                <img src="www/css/img/salud/014-512.png" width="300" height="300"  />
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


<% Session.LCID = 5130; %><%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPrincipalColchones.aspx.cs" Inherits="AppInventarioVirtual.FrmPrincipalColchones" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inventario de Colchones</title>
    <link href="www/css/bootstrap.min.css" rel="stylesheet" />
    <link href="www/css/estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <nav class="navbar navbar-inverse bg-inverse nav-inv">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-nav">
                    <a class="nav-item nav-link" style="color: white; font-size: 4vh;" href="FrmConsultarCol.aspx">Reporte de colchones</a>
                </div>
            </nav>
            <div class="fondo-colchones">
            </div>

            <div class="container text-center">
                <div class="row align-items-center">
                    <div class="col">
                        <div class=" col-lg-12 col-md-8 col-sm-8 text-center">
                            <h1 style="text-align: center; color: #005da4; font-size: 10vh;">Sistema de colchones</h1>
                            <br />
                            <div class="container">
                                <div class="row align-items-center">
                                    <div class="col text-center">
                                        <asp:Button ID="registrarColchon" runat="server" class="btn btn-outline-primary btn-lg btn-inv" Text="Registrar colchones" OnClick="registrarColchon_Click" />
                                    </div>
                                    <div class="col text-center">
                                        <asp:Button ID="prestamoColchones" runat="server" class="btn btn-outline-primary btn-lg btn-inv" Text="Prestamo de Colchones" OnClick="prestamoColchones_Click" />
                                    </div>
                                </div>
                                 <div class="col text-center" style="margin-top:3vh">
                                        <asp:Button ID="devolver" runat="server" class="btn btn-outline-primary btn-lg btn-inv" Text="Devolución de Colchones" OnClick="devolver_Click" />
                                    </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class="  col-lg-6 col-md-8 col-sm-8 " style="padding: 0">
                            <div class=" img-seguridad col-md-4 col-sm-2" style="padding: 0">
                                <img src="www/css/img/colchones/Bed-2-512.png" style="width: 300px; height: 300px;" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>

        </div>
    </form>
    <script src="www/js/jquery-3.4.1.min.js"></script>
    <script src="www/js/bootstrap.min.js"></script>
</body>
</html>



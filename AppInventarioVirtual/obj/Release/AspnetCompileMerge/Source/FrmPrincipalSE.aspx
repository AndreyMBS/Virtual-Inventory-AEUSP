<% Session.LCID = 5130; %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPrincipalSE.aspx.cs" Inherits="AppInventarioVirtual.WebForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, inicial-scale=1.0" />
    <title>Seguridad</title>
    <link rel="stylesheet" href="www/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../www/css/estilos.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-inverse bg-inverse navbar-se">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-nav">
                    <button type="button" style="border: none" class="btn btn-lg btn-se-nav" data-toggle="modal" data-target='#prueba'>
                        Reporte de Seguridad
                    </button>
                </div>

                <div class="modal" id="prueba" tabindex="-1" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header text-center" style="text-align: center">
                                <h4 class='modal-title col-12 text-center' style="color: #00C0F3">Tipos de Reporte</h4>
                                <button type="button" class="close"
                                    data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body text-center">
                                <asp:Button ID="TiempoReal" runat="server" class="btn btn-outline-primary btn-lg" Text="Entradas Activas" OnClick="TiempoReal_Click" />
                                <asp:Button ID="Fechas" runat="server" class="btn btn-outline-primary btn-lg" Text="Rango de Fechas" OnClick="Fechas_Click" />
                            </div>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="fondo">
            </div>

            <div class="container">
                <div class="row align-items-center">
                    <div class="col">
                        <div class=" col-lg-12 col-md-8 col-sm-8 text-center">
                            <h1 style="text-align: center; color: #00c0f3; font-size: 10vh;">Sistema de Seguridad</h1>
                            <br />
                            <div class="container">
                                <asp:Button ID="registro" runat="server" class="btn btn-outline-primary btn-lg" Text="Registro" OnClick="estudiantes_Click" />
                            </div>
                        </div>
                    </div>

                    <div class="">
                        <div class=" col-lg-5 col-md-8 col-sm-8">
                            <div class=" text-center col-md-4 col-sm-2">
                                <img src="www/css/img/seguridad/candado.png" class="img-seguridad" />
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

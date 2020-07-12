<% Session.LCID = 5130; %>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmPrincipalPR.aspx.cs" Inherits="AppInventarioVirtual.FrmPrincipalPR" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, inicial-scale=1.0" />
    <title>Presupuesto</title>
    <link href="www/css/bootstrap.min.css" rel="stylesheet" />
    <link href="www/css/estilos.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-inverse bg-inverse nav-pres" style="border: none;">
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="icon-bar"></span>
                </button>
                <div class="navbar-nav">
                    <button type="button" style="border: none" class="btn btn-lg btn-pre-nav" data-toggle="modal" data-target='#prueba'>
                        Reporte de Presupuesto
                    </button>
                </div>

                <div class="modal" id="prueba" tabindex="-1" role="dialog">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header text-center" style="text-align: center">
                                <h4 class='modal-title col-12 text-center' style="color: #6dc067">Tipos de Reporte</h4>
                                <button type="button" class="close"
                                    data-dismiss="modal" aria-label="Close">
                                    <span aria-hidden="true">&times;</span>
                                </button>
                            </div>
                            <div class="modal-body text-center">
                                <asp:Button ID="ConsultaTracto" runat="server" class="btn btn-pres btn-lg" Text="Tracto" OnClick="ConsultaTracto_Click" />
                                <asp:Button ID="ConsultaEfectivo" runat="server" class="btn btn-pres btn-lg" Text="Efectivo" OnClick="ConsultaEfectivo_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </nav>
            <div class="fondo-pres">
            </div>

            <div class="container">
                <div class="row align-items-center">
                    <div class="col">
                        <div class=" col-lg-12 col-md-5 col-sm-8 text-center">
                            <h1 style="text-align: center; color: #6dc067; font-size: 10vh;">Área de Presupuesto</h1>
                            <br />
                            <div class="container">
                                <div class="container">
                                    <div class="row align-items-center">
                                        <div class="col text-center">
                                            <asp:Button ID="efectivo" runat="server" class="btn btn-pres btn-lg" Text="Efectivo" OnClick="efectivo_Click" />
                                        </div>
                                        <div class="col">
                                            <asp:Button ID="tracto" runat="server" class="btn btn-pres btn-lg" Text="Tracto" OnClick="tracto_Click" />

                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="">
                        <div class=" col-lg-5 col-md-8 col-sm-8">
                            <div class=" text-center col-md-4 col-sm-2">
                                <img src="www/css/img/presupuesto/007_money_finance_transaction_payment_terminal_card_shopping-512.png" width="300" height="300" />
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

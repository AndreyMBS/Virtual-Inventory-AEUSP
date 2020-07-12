<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmModulos.aspx.cs" Inherits="AppInventarioVirtual.FrmModulos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Módulos</title>
    <meta name="viewport" content="width=device-width, inicial-scale=1.0" />
    <link rel="stylesheet" href="www/css/bootstrap.min.css" />
    <link rel="stylesheet" href="www/css/estilos.css" />
</head>

<body>
    <form id="form1" runat="server">

        <div>

            <div>
                <nav class="navbar nav-sis">
                    <a class="navbar" href="#">
                        <img src="www/css/img/asocia/LogoAsocia.png" class="d-inline-block align-top" width="40" height="35" alt="" />
                        Asociación de Estudiantes</a>
                </nav>
            </div>


            <div class="container text-center" style="padding: 0;">
                <div class=" row align-items-center">
                        <div class="">
                            <div class="  col-lg-6 col-md-8 col-sm-8 " style="padding: 0">
                                <div class=" col-md-4 col-sm-2 text-center" style="padding: 0; margin-top: 10vh;" >
                                    <img src="www/css/img/asocia/12140833_851091651678345_6307007217261841213_n.png" width="350" height="350" />
                                </div>
                            </div>
                        </div>
                    <div class="col-lg-8" style="padding:0">
                        <div class=" Panel col-lg-8 col-md-8 col-sm-8">

                            <br />
                            <br />

                            <div style="text-align: center; color: #9fbeaf; margin-top: 5vh; margin-bottom: 5vh">
                                <h1>Sistema AEUSP</h1>
                            </div>

                            <br />

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-4 col-md-4 col-sm-4">
                                        <asp:Label Text="Escoja una opción" runat="server" />
                                    </div>
                                    <div class="col-lg-6 col-md-7 col-sm-7">
                                        <asp:DropDownList class="btn btn-us" runat="server" CssClass="form-control" ID="cboxOpcion">
                                            <asp:ListItem Text="Área de Salud" Value="Salud" />
                                            <asp:ListItem Text="Área de Seguridad" Value="Seguridad" />
                                            <asp:ListItem Text="Registro Colchones" Value="Colchones" />
                                            <asp:ListItem Text="Registro de Usuarios" Value="Usuarios" />
                                            <asp:ListItem Text="Área de Limpieza" Value="Limpieza" />
                                            <asp:ListItem Text="Área de Alimentación" Value="Alimentacion" />
                                            <asp:ListItem Text="Área de Presupuesto" Value="Presupuesto" />
                                            <asp:ListItem Text="Asocia General" Value="Asocia" />
                                        </asp:DropDownList>
                                    </div>
                                </div>
                            </div>

                            <br />

                            <div class="text-center">
                                <div class="form-group">
                                    <div class="row">
                                        <div class="col-xl-12 col-md-3 col-sm-1">
                                            <asp:Button Text="Aceptar" ToolTip="Aceptar" runat="server"
                                                CssClass="btn btn-cre    btn-lg" ID="btnAceptar" OnClick="btnAceptar_Click" />
                                        </div>

                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>


    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>




</body>
</html>

<% Session.LCID = 5130; %>

<%@ Page Title="" Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="AppInventarioVirtual.FrmPrincipal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Inicio</title>
    <meta name="viewport" content="width=device-width, inicial-scale=1.0" />
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../www/css/estilos.css" />

    <script>

        function changeBackground() {

            if (screen.width < 800) {
                document.body.style.backgroundImage = "-webkit-linear-gradient(top, rgba(159,190,175,1) 0%, rgba(159,190,175,1) 2%, rgba(159,190,175,1) 23%, rgba(255,255,255,0.99) 59%, rgba(255,255,255,0.99) 100%)";
                
            } else {
                document.body.style.backgroundImage = "-webkit-linear-gradient(left, rgba(159,190,175,1) 0%, rgba(159,190,175,1) 2%, rgba(159,190,175,1) 23%, rgba(255,255,255,0.99) 59%, rgba(255,255,255,0.99) 100%)";
               
            }
        }
    </script>

</head>
<body onload="javascript:changeBackground()">
    <form id="form1" runat="server">

        <div>

            <div class="container">
                <div class="row align-items-center">
                    <div class="col-lg-6">
                        <div style="text-align: center; color: BLACK; margin-top: 8vh; margin-bottom: 5vh;">
                            <h1>Sistema General de AEUSP</h1>
                        </div>
                        <p class="text-justify">
                            Creado a partir de la necesidad de un sistema centralizado para el movimiento estudiantil 
                          a raíz del <strong>16 de octubre</strong>, debido a que satisface la urgencia por parte de la asociación 
                          general de llevar control en los datos de cada una de las comisiones fundadas en dicho movimiento. 
                          Para cumplir con tal necesidad, se crea la comisión de informática, encargada del desarrollo del 
                          software y mantenimiento técnico computacional, otorgando soporte a las demás comisiones y asociación 
                          general de la <strong>Universidad de Costa Rica, Sede del Pacífico</strong>. 
                        </p>
                        <p class="font-italic text-justify">“La tecnología por sí sola no basta. También tenemos que poner el corazón”</p>
                        – Jane Goodall.

                    <div>
                        <asp:Button ID="btnCreditos" Style="margin: 2vh 0vh;" class="btn btn-outline-dark" runat="server" Text="Créditos" OnClick="btnCreditos_Click" />

                    </div>

                    </div>
                    <div class="col-lg-6">
                        <div class=" Panel col-lg-7 col-md-3 col-sm-6" style="padding: 0; margin-right: 2vh; margin-top: 12vh;">
                            <div class="text-center" style="margin: 7vh;">
                                <img src="www/css/img/principal/208960-OZUKIR-265.png" width="100" height="100" />
                            </div>
                            <div style="text-align: center; color: #9fbeaf; margin-top: 8vh; margin-bottom: 5vh;">
                                <h1>Bienvenidos</h1>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-12 col-md-4 col-sm-4">
                                        <asp:Label Text="Usuario" runat="server" />
                                    </div>
                                    <div class="col-lg-12 col-md-7 col-sm-7">
                                        <asp:TextBox ID="txtUsuario" runat="server" CssClass="form-control" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <div class="row">
                                    <div class="col-lg-12 col-md-4 col-sm-4">
                                        <asp:Label Text="Contraseña" runat="server" />
                                    </div>
                                    <div class="col-lg-12 col-md-7 col-sm-7">
                                        <asp:TextBox ID="txtContrasena" runat="server" CssClass="form-control" TextMode="Password" />
                                    </div>
                                </div>
                            </div>

                            <div class="form-group text-center">
                                <asp:Button ID="entrar" Style="margin: 2vh 0vh;" class="btn btn-prin" runat="server" Text="Iniciar Sesión" OnClick="entrar_Click" />
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

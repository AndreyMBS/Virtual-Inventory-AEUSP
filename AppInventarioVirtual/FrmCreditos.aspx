<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="FrmCreditos.aspx.cs" Inherits="AppInventarioVirtual.FrmCreditos" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>Créditos</title>
    <meta name="viewport" content="width=device-width, inicial-scale=1.0" />
    <link rel="stylesheet" href="www/css/bootstrap.min.css" />
    <link rel="stylesheet" href="../www/css/estilos.css" />


    <script>

        function changeBackground() {

            if (screen.width < 800) {
                document.body.style.backgroundImage = "-webkit-linear-gradient(top, rgba(159,190,175,1) 0%, rgba(159,190,175,1) 2%, rgba(159,190,175,1) 23%, rgba(255,255,255,0.99) 59%, rgba(255,255,255,0.99) 100%)";
                $(window).resize(function () { location.reload(); });
            } else {
                document.body.style.backgroundImage = "-webkit-linear-gradient(left, rgba(159,190,175,1) 0%, rgba(159,190,175,1) 2%, rgba(159,190,175,1) 23%, rgba(255,255,255,0.99) 59%, rgba(255,255,255,0.99) 100%)";
                $(window).resize(function () { location.reload(); });
            }
        }
    </script>



</head>

<body onload="javascript:changeBackground()">

    <form id="form2" runat="server">

        <div class=" Panel col-lg-10 col-md-3 col-sm-6 text-center">
            <div style="margin-top: 8vh; margin-bottom: 5vh">
                <h1 style="text-align: center; color: black;">Ad Honorem</h1>
            </div>
            <p style="text-align: center">El presente sistema ha sido desarrollado por los siguientes miembros de la <strong>comisión de informática:</strong></p>
            <div class="container">
                <div class="row align-items-center text.center">
                    <div class=" col-lg-6 col-md-8 col-sm-8 align-self-center">
                        <p style="text-align: center">Araya Portuguez Oliver (4to año)</p>
                        <p style="text-align: center">Baltodano Chaves Kevin (2do año)</p>
                        <p style="text-align: center">Benavides Murillo Marjorie (2do año)</p>
                        <p style="text-align: center">Cordero Bedoya Ethan (3er año)</p>
                        <p style="text-align: center">Cordero Espinoza Josué (3er año)</p>
                    </div>
                    <div class=" col-lg-6 col-md-8 col-sm-8 align-self-center">
                        <p style="text-align: center">Mena Brenes Andrey (2do año)</p>
                        <p style="text-align: center">Morales Gamboa Manfred (3er año)</p>
                        <p style="text-align: center">Morales Silva Joseph (3er año)</p>
                        <p style="text-align: center">Ortega Bolaños Jose Rodolfo (3er año)</p>
                        <p style="text-align: center">Ramírez Vargas Keilyn (2do año)</p>
                        <p style="text-align: center">Torres Castro Fabián (3er año)</p>
                    </div>
                </div>
            </div>
            <p style="text-align: center">Todos los estudiantes de la comisión corresponden a la carrera de <strong>Bachillerato en Informática Empresarial, 2019.</strong></p>
            <div class="form-group text-center">
                <asp:Button ID="Atras" Style="margin: 2vh 0vh;" class="btn btn-cre btn-lg" runat="server" Text="Atras" OnClick="Atras_Click" />
            </div>
        </div>
    </form>
    <script src="www/js/jquery-3.4.1.min.js"></script>
    <script src="www/js/bootstrap.min.js"></script>
</body>
</html>

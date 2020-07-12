<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Inventario.Master" AutoEventWireup="true" CodeBehind="FrmEntregaColchones.aspx.cs" Inherits="AppInventarioVirtual.FrmEntregaColchones" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class=" Panel col-lg-5 col-md-3 col-sm-6">
        <div style="text-align: center; color: #005da4; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Movimientos de Colchones</h1>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Nombre del Solicitante " runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtNombreSol" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Acción" runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:RadioButtonList ID="rbAccion" RepeatDirection="Horizontal" Width="100%" AutoPostBack="true" runat="server">
                        <asp:ListItem Text="Entrada" />
                        <asp:ListItem Text="Salida" />
                    </asp:RadioButtonList>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Ubicación " runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtUbicacion" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>



        <div class="container text-center">
            <div class="form-group">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <asp:Button Text="Registrar movimiento" ToolTip="Registrar movimiento" runat="server"
                            CssClass="btn btn-inv" ID="btnRegistrar" />
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

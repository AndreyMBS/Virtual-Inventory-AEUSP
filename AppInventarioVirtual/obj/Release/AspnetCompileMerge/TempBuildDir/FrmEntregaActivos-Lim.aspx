<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Limpieza.Master" AutoEventWireup="true" CodeBehind="FrmEntregaActivos-Lim.aspx.cs" Inherits="AppInventarioVirtual.FrmEntregaActivos_Lim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

      <div class=" Panel col-lg-4 col-md-3 col-sm-6">
        <div style="text-align: center; color: #8ed8f8; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Entrega de Activos</h1>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Carné de Usuario" runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtCarne" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Cédula Asistente " runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtCedulaA" runat="server"
                        CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Fecha" runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtFecha" runat="server"
                        CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Código Consumible " runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtCodigoC" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Nombre del consumible " runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtNombreC" runat="server"
                        CssClass="form-control" />
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Código de Organismo " runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtCodigoO" runat="server"
                        CssClass="form-control" />
                </div>
            </div>
        </div>

            <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Cantidad de entrega " runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtCant" runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>


        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Observacion" runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtObservacion" runat="server"
                        CssClass="form-control" />
                </div>
            </div>
        </div>

      

        <div class="container text-center">
            <div class="form-group">
                <div class="row">
                    <div class="col-lg-12 col-md-12 col-sm-12">
                        <asp:Button Text="Registrar entrega" ToolTip="Registrar entrega" runat="server"
                            CssClass="btn btn-lim" ID="btnRegistrar" />
                    </div>
                </div>
            </div>
        </div>
    </div>


</asp:Content>

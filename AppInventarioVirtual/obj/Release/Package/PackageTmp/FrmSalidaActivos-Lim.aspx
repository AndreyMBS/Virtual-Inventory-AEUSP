<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Limpieza.Master" AutoEventWireup="true" CodeBehind="FrmSalidaActivos-Lim.aspx.cs" Inherits="AppInventarioVirtual.FrmSalidaActivos_Lim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class=" row align-items-center">
            <div class="col">
                <div class="Panel col-lg-8 col-md-8 col-sm-8">
                    <div style="text-align: center; color: #8ed8f8; margin-top: 5vh; margin-bottom: 5vh">
                        <h1>Salida de Activos</h1>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Código de movimiento" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCodigoMovimiento" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Tipo" runat="server" />
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <asp:RadioButtonList ID="rTipo" RepeatDirection="Horizontal" Width="100%" AutoPostBack="true" runat="server">
                                    <asp:ListItem Text=" Entrada" />
                                    <asp:ListItem Text=" Salida" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Carné Usuario" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCarneU" runat="server"
                                    CssClass="form-control" />
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
                                <asp:Label Text="Descripción" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtDescripcion" runat="server"
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
                                <asp:Label Text="Seleccione" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtSeleccionActivo" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Cantidad Solicitada" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCant" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>


                    <div class="container text-center">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-lg-12 col-md-12 col-sm-12">
                                    <asp:Button Text="Registrar" ToolTip="Registrar" runat="server"
                                        CssClass="btn btn-lim" ID="btnRegistrar" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="">
                <div class=" col-lg-5 col-md-8 col-sm-8 " style="padding: 0">
                    <div class="mg-seguridad-rigth col-md-4 col-sm-2" style="padding: 0">
                        <img src="www/css/img/seguridad/security2.png" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

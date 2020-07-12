<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Limpieza.Master" AutoEventWireup="true" CodeBehind="FrmRegistroActivos-Lim.aspx.cs" Inherits="AppInventarioVirtual.FrmActivosLimpieza" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container" style="padding: 0;">
        <div class=" row align-items-center">
            <div class="">
                <div class="  col-lg-6 col-md-8 col-sm-8 " style="padding: 0">
                    <div class=" img-seguridad col-md-4 col-sm-2" style="padding: 0">
                        <img src="www/css/img/limpieza/soap.png"  width="300" height="300"/>
                    </div>
                </div>
            </div>
            <div class="col" >
                <div class=" Panel col-lg-8 col-md-8 col-sm-8" >
                    <div style="text-align: center; color: #8ed8f8; margin-top: 5vh; margin-bottom: 5vh">
                        <h1>Registro de Activos</h1>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Código de activo " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Nombre" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtNombre" runat="server"
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
                                <asp:Label Text="Placa " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtPlaca" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Observación " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtObservacion" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Disponibilidad" runat="server" />
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <asp:RadioButtonList ID="rbDisponible" RepeatDirection="Horizontal" Width="100%" AutoPostBack="true" runat="server">
                                    <asp:ListItem Text=" Disponible" />
                                    <asp:ListItem Text=" Prestado" />
                                    <asp:ListItem Text=" Perdido" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>



                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Cantidad de salida " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-4 col-sm-4">
                                <asp:TextBox ID="txtCanS" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Cantidad de entrada " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-4 col-sm-4">
                                <asp:TextBox ID="txtCanE" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Cantidad de total " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-4 col-sm-4">
                                <asp:TextBox ID="txtCanT" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>


                    <div class="form-group text-center">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <asp:Button Text="Registrar producto" ToolTip="Agregar Producto al Sistema" runat="server"
                                    CssClass="btn btn-lim" ID="btnRegistrar" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

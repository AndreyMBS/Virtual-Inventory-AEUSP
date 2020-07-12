<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Asocia.Master" AutoEventWireup="true" CodeBehind="FrmRegistroActivos-Asocia.aspx.cs" Inherits="AppInventarioVirtual.FrmRegistroActivos_Asocia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="padding: 0;">
        <div class=" row align-items-center">
            <div class="">
                <div class="  col-lg-6 col-md-8 col-sm-8 " style="padding: 0">
                    <div class=" img-seguridad col-md-4 col-sm-2" style="padding: 0">
                        <img src="www/css/img/asocia/013_news_newspaper_global_articles_feed-512.png" width="300" height="300" />
                    </div>
                </div>
            </div>
            <div class="col">
                <div class=" Panel col-lg-8 col-md-8 col-sm-8">
                    <div style="text-align: center; color: #80a9ba; margin-top: 5vh; margin-bottom: 5vh">
                        <h1>Registro de Activos</h1>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Placa " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtPlaca" runat="server" CssClass="form-control" required="true" TextMode="Number" MaxLength="15" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Nombre " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required="true" />
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
                                    CssClass="form-control" required="true" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Ubicacion " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtUbicacion" runat="server" CssClass="form-control" required="true" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Estado" runat="server" />
                            </div>
                            <div class="col-lg-6 col-md-7 col-sm-7">
                                <asp:DropDownList class="btn btn-us" runat="server" CssClass="form-control" ID="cboxEstado">
                                    <asp:ListItem Text="Bueno" Value="B" />
                                    <asp:ListItem Text="Malo" Value="M" />
                                    <asp:ListItem Text="Intermedio" Value="I" />
                                    <asp:ListItem Text="Perdido" Value="P" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>


                    <div class="text-center">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xl-12 col-md-3 col-sm-1">
                                    <asp:Button Text="Registrar" ToolTip="Registrar activo en el sistema" runat="server"
                                        CssClass="btn btn-aso btn-lg" ID="btnRegistrar" OnClick="btnRegistrar_Click" />
                                    <asp:Button Text="Modificar" ToolTip="Modificar activo del sistema" runat="server"
                                        CssClass="btn btn-aso btn-lg" ID="btnModificar" OnClick="btnModificar_Click" Visible="False" />
                                    <asp:Button Text="Eliminar" ToolTip="Eliminar activo del sistema" runat="server"
                                        CssClass="btn btn-aso btn-lg" ID="btnEliminar" OnClick="btnEliminar_Click" Visible="False" />
                                </div>
                                <asp:Label ID="lbNotificaciones" Text="" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

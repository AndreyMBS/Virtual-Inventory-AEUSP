<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Alimentacion.Master" AutoEventWireup="true" CodeBehind="FrmRegistroConsumibles-Ali.aspx.cs" Inherits="AppInventarioVirtual.FrmIngresoConsu_Lim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class=" row align-items-center">
            <div class="col">
                <div class="Panel col-lg-8 col-md-8 col-sm-8">
                    <div style="text-align: center; color: #a25b4f; margin-top: 5vh; margin-bottom: 5vh">
                        <h1>Registro de Consumibles</h1>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Nombre " runat="server" />
                            </div>
                            <div class="col-lg-5 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtNombre" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                    
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Categoría " runat="server" />
                            </div>
                            <div class="col-lg-5 col-md-7 col-sm-7">
                                <asp:DropDownList class="btn btn-ali" runat="server" ID="dlTipo" CssClass="form-control">
                                    <asp:ListItem Text="Viveres" Value="viveres" />
                                    <asp:ListItem Text="Vegetales" Value="vegetales" />
                                    <asp:ListItem Text="Frutas" Value="frutas" />
                                    <asp:ListItem Text="Bebidas" Value="bebidas" />
                                    <asp:ListItem Text="Otros Artículos" Value="otros" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Unidad de medida " ID="lblImpVenta" runat="server" />
                            </div>
                            <div class="col-lg-5 col-md-7 col-sm-7">
                                <asp:DropDownList class="btn btn-ali " runat="server" ID="dlUnidad" CssClass="form-control">
                                    <asp:ListItem Text="Unitario"/>
                                    <asp:ListItem Text="Kilos"/>
                                    <asp:ListItem Text="Litros"/>
                                    <asp:ListItem Text="Paquetes"/>
                                    <asp:ListItem Text="Otro"/>
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Cantidad " runat="server" />
                            </div>
                            <div class="col-lg-5 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCant" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="text-center">
                        <div class="form-group">
                            <div class="row">
                                <div class="col-xl-6 col-md-6 col-sm-1">
                                    <asp:Button Text="Añadir" ToolTip="Agregar Producto al Sistema" runat="server"
                                        CssClass="btn btn-ali btn-lg" ID="btnRegistrar" OnClick="btnRegistrar_Click"/>
                                </div>
                                <div class="col-xl-6 col-md-6 col-sm-1">
                                    <asp:Button Text="Cancelar" ToolTip="Cancelar" runat="server"
                                        CssClass="btn btn-ali  btn-lg" ID="btnCancelar" OnClick="btnCancelar_Click" />
                                </div>
                                <div class="col-xl-6 col-md-6 col-sm-1">
                                    <asp:Button Text="Modificar" ToolTip="Agregar Producto al Sistema" runat="server"
                                        CssClass="btn btn-ali btn-lg" ID="btnModificar" OnClick="btnModificar_Click" Visible="false" />
                                </div>
                                <div class="col-xl-6 col-md-6 col-sm-1">
                                    <asp:Button Text="Eliminar" ToolTip="Agregar Producto al Sistema" runat="server"
                                        CssClass="btn btn-ali btn-lg" ID="btnEliminar" OnClick="btnEliminar_Click" Visible="false" />
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="">
                <div class=" col-lg-5 col-md-8 col-sm-8 " style="padding: 0">
                    <div class="mg-seguridad-rigth col-md-4 col-sm-2" style="padding: 0">
                        <img src="www/css/img/alimentacion/food.png" width="300" height="300" />
                    </div>
                </div>
            </div>

        </div>
    </div>
    </div>
</asp:Content>

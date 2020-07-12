<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Usuarios.Master" AutoEventWireup="true" CodeBehind="FrmRegistroUsuarios.aspx.cs" Inherits="AppInventarioVirtual.FrmRegistroUsuarios" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class=" Panel col-lg-4 col-md-3 col-sm-6">
        <div style="text-align: center; color: #e5b365; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Registro de Usuarios</h1>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Carné" runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtCarnet" runat="server" CssClass="form-control" required="true"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Cédula" runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtCedula" runat="server"
                        CssClass="form-control" required="true"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Nombre Completo " runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtNombre" runat="server"
                        CssClass="form-control" required="true"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Contraseña " runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtContra" runat="server"
                        CssClass="form-control" TextMode="Password"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Grupo" runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:DropDownList ID="DDLOrganizaciones" class="btn btn-us" runat="server" CssClass="form-control" required="true">
                        <asp:ListItem Text="Asocia General" Value="asociaGeneral" />
                        <asp:ListItem Text="Comisión de alimentación" Value="comiAli" />
                        <asp:ListItem Text="Comisión de limpieza" Value="comiLimpi" />
                        <asp:ListItem Text="Comisión de seguridad" Value="comiSe" />
                        <asp:ListItem Text="Comisión de salud" Value="comiSa" />
                        <asp:ListItem Text="Comisión de presupuesto" Value="comiPres" />
                        <asp:ListItem Text="Comisión de inventario de colchones" Value="comiCol" />
                        <asp:ListItem Text="Comisión de informática" Value="superUsuario" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>
        <br />
        <div class="text-center">
            <div class="form-group">
                <div class="row">
                    <div class="col-lg-4 col-md-3 col-sm-1">
                        <asp:Button Text="Añadir" ToolTip="Agregar" runat="server"
                            CssClass="btn btn-us" ID="btnRegistrar" OnClick="btnAgregar_Click"/>
                    </div>
                     <div class="col-lg-4 col-md-3 col-sm-1">
                        <asp:Button Text="Eliminar" ToolTip="Eliminar" runat="server"
                            CssClass="btn btn-us" ID="btnEliminar" OnClick="btnEliminar_Click" Visible="false"/>
                    </div>
                     <div class="col-lg-4 col-md-3 col-sm-1">
                        <asp:Button Text="Modificar" ToolTip="Modificar" runat="server"
                            CssClass="btn btn-us" ID="btnModificar" OnClick="btnModificar_Click" Visible="false"/>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>

</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Inventario.Master" AutoEventWireup="true" CodeBehind="FrmRegistroColchones.aspx.cs" Inherits="AppInventarioVirtual.FrmRegistroColchones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" Panel col-lg-4 col-md-3 col-sm-6">
        <div style="text-align: center; color: #005da4; margin-top: 8vh; margin-bottom: 5vh;">
            <h1>Módulo de Colchones</h1>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Número Colchón" runat="server" />
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtNumero" runat="server" CssClass="form-control" required="true" min="1"/>
                </div>
            </div>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label ID="procedencia" runat="server" Text="Procedencia "></asp:Label>
                </div>
                <div class="col-lg-7 col-md-7 col-sm-7">
                    <asp:TextBox ID="txtProveniencia" runat="server" CssClass="form-control" required="true"/>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Estado" runat="server" />
                </div>
                <div class="col-lg-7 col-md-8 col-sm-8">
                    <asp:DropDownList ID="dlEstado" class="btn btn-us" runat="server" CssClass="form-control">
                        <asp:ListItem Text="Bueno" Value="bueno" />
                        <asp:ListItem Text="Malo" Value="malo" />
                        <asp:ListItem Text="Intermedio" Value="intermedio" />
                    </asp:DropDownList>
                </div>
            </div>

        </div>
        <div class="form-group ">
            <div class="row">
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <asp:Label Text="Observación" runat="server" />
                </div>
                <div class="col-lg-7 col-md-8 col-sm-8">
                    <asp:TextBox ID="txtObservacion" runat="server" CssClass="form-control" required="true" TextMode="MultiLine"/>
                </div>
            </div>
        </div>
        <br />
        <div class="text-center">
            <div class="form-group">
                <div class="row">
                    <div class="col-lg-6 col-md-3 col-sm-1">
                        <asp:Button Text="Añadir" ToolTip="Agregar movimiento" runat="server"
                            CssClass="btn btn-inv" ID="btnTransaccion" OnClick="btnTransaccion_Click"/>
                    </div>
                    <div class="col-lg-6 col-md-3 col-sm-1">
                        <asp:Button Text="Eliminar" runat="server" Visible="false" Enabled="false"
                            class="btn btn-inv" ID="btnEliminar" OnClick="btnEliminar_Click"/>
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

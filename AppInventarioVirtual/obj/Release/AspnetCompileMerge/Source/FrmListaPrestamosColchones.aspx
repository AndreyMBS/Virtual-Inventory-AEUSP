<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Inventario.Master" AutoEventWireup="true" CodeBehind="FrmListaPrestamosColchones.aspx.cs" Inherits="AppInventarioVirtual.FrmListaPrestamosColchones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" Panel col-lg-8 col-md-3 col-sm-6">
        <div style="text-align: center; color: #005da4; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Prestamo de Colchones</h1>
        </div>

        <div class="container ">
            <div class="row">
                <div class="col-lg-8">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-3">
                                <asp:Label Text="Búsqueda:" runat="server" />
                            </div>
                            <div class="col-xl-4 col-lg-3 col-md-4 col-sm-4">
                                <asp:TextBox ID="txtBusqueda" runat="server" CssClass="form-control" OnTextChanged="txtBusqueda_TextChanged" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-4 col-sm-4">
                    <div class="form-group">
                        <div class="row">
                            <asp:RadioButtonList ID="rbgConsulta" runat="server">
                                <asp:ListItem Text="Número Colchón" />
                                <asp:ListItem Text="Cédula del Solicitante" />
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-8 col-md-8 col-sm-8" style="position: center; margin: 0 auto; width: auto; text-align: center;">
            <asp:GridView runat="server" ID="dgtListaColchonesPrestados"
                CssClass="table table-responsive-lg" DataKeyNames="ID"
                AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="dgtListaColchonesPrestados_PageIndexChanging">
                <PagerSettings Mode="Numeric"
                    Position="Bottom"
                    PageButtonCount="5" />
                <PagerStyle BackColor="#005da4"
                    ForeColor="White"
                    Height="30px"
                    VerticalAlign="Bottom"
                    HorizontalAlign="Center" />
                <Columns>
                    <asp:BoundField DataField="ID" HeaderText="ID" HeaderStyle-CssClass="bg-info TextoContenido" Visible="false" />

                    <asp:HyperLinkField DataNavigateUrlFields="ID" HeaderStyle-CssClass=" TextoContenido" HeaderStyle-BackColor="#005da4" HeaderStyle-Font-Bold="false" HeaderStyle-ForeColor="White"
                        DataNavigateUrlFormatString="FrmDevolverColchones.aspx?id={0}" DataTextField="Cedula" HeaderText="Cédula del Solicitante" />

                    <asp:BoundField DataField="Fecha" HeaderText="Fecha" HeaderStyle-CssClass=" TextoContenido" HeaderStyle-BackColor="#005da4" HeaderStyle-Font-Bold="false" HeaderStyle-ForeColor="White" />

                    <asp:BoundField DataField="Ubicacion" HeaderText="Ubicación" HeaderStyle-CssClass=" TextoContenido" HeaderStyle-BackColor="#005da4" HeaderStyle-Font-Bold="false" HeaderStyle-ForeColor="White" />
                </Columns>
            </asp:GridView>
        </div>
    </div>
</asp:Content>

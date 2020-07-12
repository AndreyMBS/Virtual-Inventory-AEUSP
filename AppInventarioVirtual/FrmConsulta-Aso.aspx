<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Asocia.Master" AutoEventWireup="true" CodeBehind="FrmConsulta-Aso.aspx.cs" Inherits="AppInventarioVirtual.FrmConsulta_Aso" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" Panel col-lg-8 col-md-3 col-sm-6">
        <div style="text-align: center; color: #80a9ba; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Activos</h1>
        </div>


        <div class="container text-center">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-3">
                                <asp:Label Text="Buscar " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-3 col-sm-3">
                                <asp:TextBox ID="txtBuscar" runat="server" AutoPostBack="true" CssClass="form-control" OnTextChanged="txtBuscar_TextChanged1" />
                            </div>
                        </div>
                    </div>
                </div>




            </div>
        </div>



        <div>
            <div class="card-body">
                <asp:GridView runat="server" ID="GVConsulta" CssClass="table table-responsive-lg" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" OnPageIndexChanging="GVConsulta_PageIndexChanging">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="placa"
                            HeaderStyle-CssClass=" TextoContenido" HeaderStyle-BackColor="#80A9BA" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            DataNavigateUrlFormatString="FrmRegistroActivos-Asocia.aspx?placa={0}"
                            DataTextField="placa" HeaderText="Placa">

                            <HeaderStyle BackColor="#80A9BA" CssClass=" TextoContenido" Font-Bold="False" ForeColor="White"></HeaderStyle>
                        </asp:HyperLinkField>
                        <asp:BoundField DataField="nombre" HeaderText="Nombre" HeaderStyle-BackColor="#80A9BA" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            HeaderStyle-CssClass=" TextoContenido">
                            <HeaderStyle BackColor="#80A9BA" CssClass=" TextoContenido" Font-Bold="False" ForeColor="White"></HeaderStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="estado" HeaderText="Estado" HeaderStyle-BackColor="#80A9BA" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            HeaderStyle-CssClass=" TextoContenido">
                            <HeaderStyle BackColor="#80A9BA" CssClass=" TextoContenido" Font-Bold="False" ForeColor="White" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ubicacion" HeaderText="Ubicación" HeaderStyle-BackColor="#80A9BA" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            HeaderStyle-CssClass=" TextoContenido">

                            <HeaderStyle BackColor="#80A9BA" CssClass=" TextoContenido" Font-Bold="False" ForeColor="White"></HeaderStyle>
                        </asp:BoundField>

                    </Columns>
                </asp:GridView>
            </div>
        </div>
        <div class="col text-center">
            <asp:Button ID="registrarActivo" runat="server" class="btn btn-aso btn-lg" Text="Registrar Activo" OnClick="btnRegistrar_Click" />

        </div>
    </div>
</asp:Content>

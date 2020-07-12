<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Usuarios.Master" AutoEventWireup="true" CodeBehind="FrmConsultaUsuarios.aspx.cs" Inherits="AppInventarioVirtual.FrmConsultaUsuarios" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" Panel col-lg-8 col-md-3 col-sm-6">
        <div style="text-align: center; color: #e5b365; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Usuarios</h1>
        </div>

        <div>
            <div class="card-body">
                <asp:GridView runat="server" CssClass="table table-responsive-lg" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" DataSourceID="SqlDataSource">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="carnet"
                            HeaderStyle-CssClass=" TextoContenido" HeaderStyle-BackColor="#e5b365" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            DataNavigateUrlFormatString="FrmRegistroUsuarios.aspx?carnet={0}"
                            DataTextField="carnet" HeaderText="Carné" />
                        <asp:BoundField DataField="cedula" HeaderText="Cédula" HeaderStyle-BackColor="#e5b365" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            HeaderStyle-CssClass=" TextoContenido" />
                        <asp:BoundField DataField="nombreCompleto" HeaderText="Nombre" HeaderStyle-BackColor="#e5b365" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            HeaderStyle-CssClass=" TextoContenido" />
                        <asp:BoundField DataField="nombre" HeaderText="Comisión" HeaderStyle-BackColor="#e5b365" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            HeaderStyle-CssClass=" TextoContenido" />
                    </Columns>
                </asp:GridView>
                <asp:SqlDataSource runat="server" ID="SqlDataSource" ConnectionString='<%$ ConnectionStrings:ucraeuspConnectionString %>' SelectCommand="SELECT * FROM [VP_CNS_COMISIONES]"></asp:SqlDataSource>
            </div>
        </div>
    </div>
</asp:Content>

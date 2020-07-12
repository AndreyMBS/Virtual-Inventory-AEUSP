<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Seguridad.Master" AutoEventWireup="true" CodeBehind="FrmConsultaGeneral-SE.aspx.cs" Inherits="AppInventarioVirtual.FrmConsultaGeneral_SE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" Panel col-lg-8 col-md-3 col-sm-6">
        <div style="text-align: center; color: #00c0f3; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Seguridad de Entradas Activas</h1>
        </div>
        <div>
            <div class="card-body">
                <asp:GridView runat="server" CssClass="table table-responsive-lg" AutoGenerateColumns="False" ID="GVEntradas">
                    <Columns>
                        <asp:BoundField DataField="nombreCompleto" HeaderText="Nombre"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                        <asp:BoundField DataField="cedula" HeaderText="Cédula"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                        <asp:BoundField DataField="ultFecha" HeaderText="Fecha de entrada activa"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

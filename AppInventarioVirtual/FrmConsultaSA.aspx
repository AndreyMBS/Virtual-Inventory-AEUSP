<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Salud.Master" AutoEventWireup="true" CodeBehind="FrmConsultaSA.aspx.cs" Inherits="AppInventarioVirtual.FrmConsultaSA" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    
    <div class=" Panel col-lg-4 col-md-3 col-sm-6">
        <div style="text-align: center; color: #225b28; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Salud</h1>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-md-3 col-sm-3">
                    <asp:Label Text="Buscar " runat="server" />
                </div>
                <div class="col-lg-4 col-md-3 col-sm-3">
                    <asp:TextBox ID="txtBuscar"  runat="server" CssClass="form-control" />
                </div>
            </div>
        </div>

        <div>
            <div class="card-body">
                <asp:GridView runat="server" CssClass="table table-responsive-lg" AutoGenerateColumns="false">
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="0"
                            HeaderStyle-CssClass="bg-dark TextoContenido"
                            DataNavigateUrlFormatString="0"
                            DataTextField="0" HeaderText="Nombre" />
                        <asp:BoundField DataField="Descripcion" HeaderText="Descripción"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


</asp:Content>

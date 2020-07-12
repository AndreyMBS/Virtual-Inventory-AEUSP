<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Limpieza.Master" AutoEventWireup="true" CodeBehind="FrmConsulta-Lim.aspx.cs" Inherits="AppInventarioVirtual.FrmConsumiblesLimpieza" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class=" Panel col-lg-4 col-md-3 col-sm-6">
        <div style="text-align: center; color: #8ed8f8; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Limpieza</h1>
        </div>

        <div class="container text-center">
            <div class="row">

                <div class="col-lg-12">
                    <div class="form-group text-center">
                        <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-3">
                                <asp:Label Text="Buscar " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-3 col-sm-3">
                                <asp:TextBox ID="txtBuscar" runat="server" CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div>
            <div class="card-body">
                <asp:GridView runat="server" ID="dtgListaConsumibles" BorderColor="gray"
                    CssClass="table table-responsive-lg" DataKeyNames="IdConsumible" AutoGenerateColumns="false"
                    AllowPaging="true" PageSize="5" OnPageIndexChanging="dtgListaConsumibles_PageIndexChanging">

                    <PagerSettings Mode="Numeric"
                        Position="Bottom"
                        PageButtonCount="5" />

                    <PagerStyle BackColor="#8ed8f8"
                        Height="30px"
                        VerticalAlign="Bottom"
                        HorizontalAlign="Center" />
                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="IdConsumible" HeaderStyle-CssClass=" TextoContenido" DataNavigateUrlFormatString="FRMModEliConsumibles-Lim.aspx?IdConsumible={0}"
                            DataTextField="Nombre" HeaderText="Nombre" HeaderStyle-BackColor="#8ed8f8" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false" />
                        <asp:BoundField DataField="CantidadInventario" HeaderText="Cantidad" HeaderStyle-CssClass=" TextoContenido" SortExpression="CantidadInventario" HeaderStyle-BackColor="#8ed8f8" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>


</asp:Content>

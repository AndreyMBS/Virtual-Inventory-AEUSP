<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Inventario.Master" AutoEventWireup="true" CodeBehind="FrmConsultarCol.aspx.cs" Inherits="AppInventarioVirtual.FrmConsultarCol" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     
   <div class=" Panel col-lg-8 col-md-3 col-sm-6">
        <div style="text-align: center; color: #005da4; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Inventario de Colchones</h1>
        </div>

        <div class="form-group">
            <div class="row">
                <div class="col-lg-2 col-md-3 col-sm-3">
                    <asp:Label Text="Búsqueda " runat="server" />
                </div>
                <div class="col-lg-3 col-md-3 col-sm-3">
                    <asp:DropDownList ID="dlConsulta" class="btn btn-col" runat="server" CssClass="form-control" AutoPostBack="true"
                        OnSelectedIndexChanged="dlConsulta_SelectedIndexChanged">
                        <asp:ListItem Text="Ambos" Value="A" />
                        <asp:ListItem Text="Disponibles" Value="1" />
                        <asp:ListItem Text="Prestados" Value="0" />
                    </asp:DropDownList>
                </div>
            </div>
        </div>

        <div>
            <div class="card-body">
                <asp:ScriptManager ID="SM_1" runat="server" />
                <asp:UpdatePanel runat="server" ID="up_Consulta" UpdateMode="Always">
                    <ContentTemplate>
                        <asp:GridView runat="server" ID="dgtListaColchones"
                            CssClass="table table-responsive-lg" DataKeyNames="ID"
                            AutoGenerateColumns="false" AllowPaging="true" PageSize="5" OnPageIndexChanging="dgtListaColchones_PageIndexChanging">

                            <PagerSettings Mode="Numeric"
                                Position="Bottom"
                                PageButtonCount="5" />
                            <PagerStyle BackColor="#005da4"
                                ForeColor="White"
                                Height="30px"
                                VerticalAlign="Bottom"
                                HorizontalAlign="Center" />

                            <Columns>
                                <asp:HyperLinkField DataNavigateUrlFields="ID" HeaderStyle-CssClass=" TextoContenido" HeaderStyle-BackColor="#005da4" HeaderStyle-Font-Bold="false" HeaderStyle-ForeColor="White"
                                    DataNavigateUrlFormatString="FrmRegistroColchones.aspx?id={0}" DataTextField="NumeroColchon" HeaderText="Número Colchón" />
                                <asp:BoundField DataField="Disponibilidad" HeaderText="Disponibilidad" HeaderStyle-CssClass=" TextoContenido" HeaderStyle-BackColor="#005da4" HeaderStyle-Font-Bold="false"  HeaderStyle-ForeColor="White"/>
                                <asp:BoundField DataField="Estado" HeaderText="Estado" HeaderStyle-CssClass=" TextoContenido"  HeaderStyle-BackColor="#005da4" HeaderStyle-Font-Bold="false"  HeaderStyle-ForeColor="White"/>
                            </Columns>
                        </asp:GridView>
                    </ContentTemplate>
                </asp:UpdatePanel>
            </div>
        </div>
    </div>


</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Presupuesto.Master" AutoEventWireup="true" CodeBehind="FrmConsultaEfectivo-PR.aspx.cs" Inherits="AppInventarioVirtual.FrmConsultaEfectivo_PR" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



   <div class=" Panel col-lg-10 col-md-3 col-sm-6 text-center">
        <div style="text-align: center; color: #6dc067; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Efectivo</h1>
        </div>


        <div class="container text-center">
            <div class="row">
                <div class="col-lg-4">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-3 col-sm-3">
                                <asp:Label Text="Fecha Inicial" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-3 col-sm-3">
                                <asp:TextBox ID="txtFechaI" runat="server" CssClass="form-control" TextMode="Date" required="true"/>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-3 col-sm-3">
                                <asp:Label Text="Fecha Final " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-3 col-sm-3">
                                <asp:TextBox ID="txtFechaF" runat="server" CssClass="form-control" TextMode="Date" required="true"/>
                            </div>
                        </div>
                    </div>
                </div>


                <div class="col-lg-4">
                    <div class="form-group text-center">
                        <div class="row">
                            <div class="col-lg-5 col-md-4 col-sm-4">
                                <asp:Button ID="btnConsultar" runat="server" class="btn btn-pres" Text="Consultar" OnClick="btnConsultar_Click"/>
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div>
            <div class="card-body">
                <asp:GridView ID="dgtConsulta" runat="server" CssClass="table table-responsive-lg" AutoGenerateColumns="false"
                    AllowPaging="true" PageSize="5" OnPageIndexChanging="dgtConsulta_PageIndexChanging">
                    <PagerSettings Mode="Numeric"
                                Position="Bottom"
                                PageButtonCount="5" />
                            <PagerStyle BackColor="#005da4"
                                ForeColor="White"
                                Height="30px"
                                VerticalAlign="Bottom"
                                HorizontalAlign="Center" />
                    <Columns>
                        <%--<asp:HyperLinkField DataNavigateUrlFields="0"
                            HeaderStyle-CssClass="bg-dark TextoContenido"
                            DataNavigateUrlFormatString="0"
                            DataTextField="0" HeaderText="Cédula" /> --%>
                        <asp:BoundField DataField="Usuario" HeaderText="Usuario"
                            HeaderStyle-CssClass="bg-dark TextoContenido"/>
                        <asp:BoundField DataField="Tipo" HeaderText="Tipo"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                        <asp:BoundField DataField="Monto" HeaderText="Monto"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                        <asp:BoundField DataField="Fecha" HeaderText="Fecha"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>

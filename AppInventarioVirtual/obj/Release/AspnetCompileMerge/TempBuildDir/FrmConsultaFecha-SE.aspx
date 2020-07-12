<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Seguridad.Master" AutoEventWireup="true" CodeBehind="FrmConsultaFecha-SE.aspx.cs" Inherits="AppInventarioVirtual.FrmConsulta_SE" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" Panel col-xl-12 col-md-3 col-sm-6">
        <div style="text-align: center; color: #00c0f3; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Seguridad por Fechas</h1>
        </div>
        <div class="container text-center">
            <div class="row">
                <div class="col-lg-3">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-3 col-sm-3">
                                <asp:Label Text="Fecha Inicial" runat="server" />
                            </div>
                            <div class="col-lg-8 col-md-3 col-sm-3">
                                <asp:TextBox ID="txtFechaI" runat="server" CssClass="form-control" TextMode="Date" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-3">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-3 col-sm-3">
                                <asp:Label Text="Fecha Final " runat="server" />
                            </div>
                            <div class="col-lg-8 col-md-3 col-sm-3">
                                <asp:TextBox ID="txtFechaF" runat="server" CssClass="form-control" TextMode="Date" />
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="form-group">
                        <div class="row align-items-center">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Movimiento" runat="server" />
                            </div>
                            <div class="col-lg-8 col-md-7 col-sm-7">
                                <asp:DropDownList class="btn btn-us" runat="server" CssClass="form-control" ID="DDLMovimiento">
                                    <asp:ListItem Text="Entrada" Value="e" />
                                    <asp:ListItem Text="Salida" Value="s" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="form-group text-center">
                        <div class="row">
                            <div class="col-lg-7 col-md-4 col-sm-4">
                                <asp:Button ID="btnConsultar" runat="server" class="btn btn-outline-primary" Text="Consultar" OnClick="btnConsultar_Click" />
                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>

        <div>
            <div class="card-body">
                <asp:GridView runat="server" CssClass="table table-responsive-lg" AutoGenerateColumns="false" ID="GVAsistencias">
                    <Columns>

                        <asp:BoundField DataField="cedulaAsistente" HeaderText="Cédula"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                        <asp:BoundField DataField="tipo" HeaderText="Tipo"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                        <asp:BoundField DataField="nombreCompleto" HeaderText="Nombre"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                        <asp:BoundField DataField="fecha" HeaderText="Fecha"
                            HeaderStyle-CssClass="bg-dark TextoContenido" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>

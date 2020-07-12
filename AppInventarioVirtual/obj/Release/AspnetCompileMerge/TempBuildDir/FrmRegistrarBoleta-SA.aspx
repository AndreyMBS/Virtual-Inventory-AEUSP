<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Salud.Master" AutoEventWireup="true" CodeBehind="FrmRegistrarBoleta-SA.aspx.cs" Inherits="AppInventarioVirtual.FrmIngresarPaciente" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div style="text-align: center; color: #225b28; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Boleta de Atención</h1>
        </div>
        <div class=" row offset-md-0">
            <div class="col-lg-6">
                <div class="Panel col-lg-6 col-md-8 col-sm-8"  style="margin: 0%; margin-right: 0%;">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-6 col-md-4 col-sm-4">
                                <asp:Label Text="Número de Boleta" runat="server" />
                                <!-- Es un consecutivo!-->
                            </div>
                            <div class="col-lg-4 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCodigo" runat="server" CssClass="form-control" ReadOnly="true" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Nombre" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtNombre" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Cédula " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCedula" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Carné" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCarne" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Edad" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtEdad" runat="server" TextMode="Number"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Carrera" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCarrera" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-lg-6" style="margin: 0; margin-right: 0;">
                <div class="Panel col-lg-6 col-md-8 col-sm-8">

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Fecha " ID="Label1" runat="server" />
                                <!-- Agregar la fecha con hora!-->
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtFecha" runat="server" ReadOnly="true"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Atendido por " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtResponsable" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Observación " ID="lblImpVenta" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtObservacion" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Tratamiento " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtTratamiento" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Artículo Suministrado " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtArtSumis" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="card text-center">
                        <div class="card-body">
                            <asp:GridView runat="server" ID="dtgListaAlimentos"
                                CssClass="table table-responsive-lg">
                                <Columns>
                                    <asp:HyperLinkField HeaderText="Producto"/>
                                    <asp:BoundField HeaderText="Cantidad"
                                        HeaderStyle-CssClass="bg-dark TextoContenido" />
                                    <asp:BoundField HeaderText="Observacion"
                                        HeaderStyle-CssClass="bg-dark TextoContenido" />
                                </Columns>
                            </asp:GridView>
                        </div>
                    </div>



                    <br />
                    <div class="form-group text-center">
                        <asp:Button ID="registrar" runat="server" Style="margin: 4vh;" class="btn btn-salud btn-lg" Text="Registrar boleta" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

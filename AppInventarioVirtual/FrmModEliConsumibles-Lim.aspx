<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Limpieza.Master" AutoEventWireup="true" CodeBehind="FrmModEliConsumibles-Lim.aspx.cs" Inherits="AppInventarioVirtual.FrmModEliConsumibles_Lim" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row align-items-center">
            <div class="col">
                <div class="Panel col-lg-10 col-md-8 col-sm-8">
                    <div style="text-align: center; color: #8ed8f8; margin-top: 5vh; margin-bottom: 5vh">
                        <h1>Registro de Consumibles</h1>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label runat="server" Text="Nombre: "></asp:Label>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" required="true"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label runat="server" Text="Cantidad: "></asp:Label>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" required="true" TextMode="Number" min="0"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <br />
                    <div>
                        <div class="form-group text-center">
                            <div class="row" >
                                <div class="col-xl-12 col-md-6 col-sm-1">
                                    <asp:Button ID="btnAgregar" runat="server" Text="Añadir" ToolTip="Agregar" CssClass="btn btn-lim btn-lg" OnClick="btnAgregar_Click"/>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Limpieza.Master" AutoEventWireup="true" CodeBehind="FrmRegistroConsumibles-Lim.aspx.cs" Inherits="AppInventarioVirtual.FrmRegistroConsumibles_Lim" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class=" row align-items-center">
            <div class="col">
                <div class=" Panel col-lg-10 col-md-8 col-sm-8">
                    <div style="text-align: center; color: #8ed8f8; margin-top: 5vh; margin-bottom: 5vh">
                        <h1>Registro de Consumibles</h1>
                    </div>
                   
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Nombre " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Cantidad (Unidades)" runat="server" required="true"/>
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCantidad" runat="server" CssClass="form-control" required="true" TextMode="Number" min="0"></asp:TextBox>
                            </div>
                        </div>
                    </div>

                    <div class=" form-group  text-center">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <asp:Button ID="Registrar" runat="server" Text="Registrar" CssClass="btn btn-lim btn-lg" OnClick="btnAgregar_Click"/>
                                <asp:Button ID="Cancelar" runat="server" Text="Cancelar" CssClass="btn btn-lim btn-lg" OnClick="Cancelar_Click" />
                            </div>
                            <asp:Label ID="lbNotificaciones" Text="" runat="server" />
                            <div class="col">
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="">
                <div class=" col-lg-5 col-md-8 col-sm-8 " style="padding: 0">
                    <div class="mg-seguridad-rigth col-md-4 col-sm-2" style="padding: 0">
                        <img src="www/css/img/limpieza/tissue-paper.png"  width="300" height="300" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

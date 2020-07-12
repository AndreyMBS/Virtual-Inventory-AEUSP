<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Salud.Master" AutoEventWireup="true" CodeBehind="FrmRegistroConsumibles-SA.aspx.cs" Inherits="AppInventarioVirtual.FrmRegistroConsumibles_SA" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class="container">
        <div class=" row align-items-center">
            <div class="col">
                <div class="Panel col-lg-8 col-md-8 col-sm-8 offset-md-0">
                    <div style="text-align: center; color: #225b28; margin-top: 5vh; margin-bottom: 5vh">
                        <h1>Registro de Suministros</h1>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Código del producto" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCodigoP" runat="server" CssClass="form-control" />
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
                                <asp:Label Text="Cantidad" runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtCant" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Descripción " runat="server" />
                            </div>
                            <div class="col-lg-7 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtDescripcion" runat="server"
                                    CssClass="form-control" />
                            </div>
                        </div>
                    </div>

                    
                    <br />
                    <div class="form-group text-center">
                        <asp:Button ID="registrar" runat="server" Style="margin: 4vh;" class="btn btn-salud btn-lg" Text="Registrar producto" />
                    </div>
                </div>
            </div>
            <div class="">
                <div class=" col-lg-4 col-md-8 col-sm-8 text-center" style="padding: 0">
                    <div class="mg-seguridad-rigth col-md-4 col-sm-2" style="padding: 0">
                        <img src="www/css/img/salud/14-512.png" width="300" height="300" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

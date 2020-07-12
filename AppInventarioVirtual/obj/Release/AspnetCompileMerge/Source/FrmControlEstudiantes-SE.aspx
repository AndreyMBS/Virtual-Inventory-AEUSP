    <%@ Page Title="" Language="C#" MasterPageFile="~/ME-Seguridad.Master" AutoEventWireup="true" CodeBehind="FrmControlEstudiantes-SE.aspx.cs" Inherits="AppInventarioVirtual.WebForm1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container">
        <div class=" row align-items-center">
            <div class="col">
                <div class="Panel col-lg-8 col-md-8 col-sm-8">
                    <div style="text-align: center; color: #00c0f3; margin-top: 10vh; margin-bottom: 5vh">
                        <h1>Control de Acceso a la Sede</h1>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Registro Existente" runat="server" ID="lbRegistroExistente" />
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <asp:RadioButtonList ID="rbRegistroExistente" RepeatDirection="Horizontal" Width="100%" runat="server" OnSelectedIndexChanged="rbRegistroExistente_SelectedIndexChanged" AutoPostBack="True">
                                    <asp:ListItem Text="Si" Value="Si" Selected="True" />
                                    <asp:ListItem Text="No" Value="No" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Tipo" runat="server" ID="lbTipo" Visible="False" />
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <asp:RadioButtonList ID="rbTipo" RepeatDirection="Horizontal" Width="100%" AutoPostBack="true" runat="server" OnSelectedIndexChanged="rbTipo_SelectedIndexChanged" Visible="False">
                                    <asp:ListItem Text="Estudiante" Selected="True" />
                                    <asp:ListItem Text="Particular" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Acción" runat="server" ID="lbAccion" />
                            </div>
                            <div class="col-lg-8 col-md-8 col-sm-8">
                                <asp:RadioButtonList ID="rbAccion" RepeatDirection="Horizontal" Width="100%" runat="server">
                                    <asp:ListItem Text="Entrada" Value="E" Selected="True" />
                                    <asp:ListItem Text="Salida" Value="S" />
                                </asp:RadioButtonList>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <asp:Label Text="Cédula" runat="server" ID="lbCedula" />
                        <asp:TextBox ID="txtCedula" runat="server" CssClass="form-control" MaxLength="20" TextMode="Number"/>
                    </div>

                    <div class="form-group">
                        <asp:Label Text="Carné " runat="server" ID="lbCarnet" Visible="False" />
                        <asp:TextBox ID="txtCarnet" runat="server" CssClass="form-control" Visible="False" MaxLength="12" />
                    </div>

                    <div class="form-group">
                        <asp:Label Text="Nombre Completo " runat="server" ID="lbNombre" Visible="False" />
                        <asp:TextBox ID="txtNombre" runat="server" CssClass="form-control" Visible="False" MaxLength="100" />
                    </div>

                    <div class="form-group">
                        <asp:Label Text="Fecha de Nacimiento" runat="server" ID="lbFechaNacimiento" Visible="False" />
                        <asp:TextBox ID="caFechaNacimiento" runat="server" CssClass="form-control" Visible="False" TextMode="Date" />
                    </div>

                    <div class="form-group">
                        <asp:Label Text="Telefono " runat="server" ID="lbTelefono" Visible="False" />
                        <asp:TextBox ID="txtTelefono" runat="server" CssClass="form-control" Visible="False" MaxLength="20" TextMode="Number" />
                    </div>

                    <div class="form-group">
                        <asp:Label Text="Carrera " runat="server" ID="lbCarrera" Visible="False" />
                        <asp:DropDownList class="btn btn-primary" runat="server" CssClass="form-control" ID="cboxCarrera" Visible="False">
                            <asp:ListItem Text="Adm. Aduanera y Comercio Exterior" Value="Adm. Aduanera y Comercio Exterior" />
                            <asp:ListItem Text="Dirección de Empresas" Value="Dirección de Empresas" />
                            <asp:ListItem Text="Enseñanza del Inglés" Value="Enseñanza del Inglés" />
                            <asp:ListItem Text="Infórmatica Empresarial" Value="Infórmatica Empresarial" />
                            <asp:ListItem Text="Infórmatica y Tecnología Multimedia" Value="Infórmatica y Tecnología Multimedia" />
                            <asp:ListItem Text="Ingeniería Electrica" Value="Ingeniería Electrica" />
                            <asp:ListItem Text="Inglés en formación en Gestión Empresarial" Value="Inglés en formación en Gestión Empresarial" />
                            <asp:ListItem Text="Gestión Cultural" Value="Gestión Cultural" />
                            <asp:ListItem Text="Ingeniería Electromecánica Industrial" Value="Ingeniería Electromecánica Industrial" />
                            <asp:ListItem Text="Otra" Value="Otra" />
                        </asp:DropDownList>
                    </div>

                    <div class="form-group text-center">
                        <asp:Button ID="registrar" runat="server" Style="margin: 4vh;" class="btn btn-outline-primary btn-lg" Text="Registrar" OnClick="registrar_Click" />
                    </div>

                    <div class="form-group text-center">
                        <asp:Label runat="server" ID="lbNotificacion" Font-Bold="True" />
                    </div>
                </div>
            </div>
            <div class="">
                <div class=" col-lg-5 col-md-8 col-sm-8 " style="padding: 0">
                    <div class="mg-seguridad-rigth col-md-4 col-sm-2" style="padding: 0">
                        <img src="www/css/img/seguridad/security2.png" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

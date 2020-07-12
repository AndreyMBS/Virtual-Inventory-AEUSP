<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Inventario.Master" AutoEventWireup="true" CodeBehind="FrmDevolverColchones.aspx.cs" Inherits="AppInventarioVirtual.FrmDevolverColchones" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" Panel col-lg-8 col-md-3 col-sm-6">    
        <div style="text-align: center; color: #005da4; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Prestamo de Colchones</h1>
        </div>

        <div class="container ml-0 mt-3">
            <div class="form-group">
                <div class="row">
                    <div class="col-lg-2 col-md-4 col-sm-2 col-xl-2">
                        <asp:Label Text="Nombre Solicitante:" runat="server" />
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xl-4">
                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" Enabled="false" />
                    </div>
                </div>
            </div>
        </div>

        <div class="col-lg-6 col-md-5 col-sm-10 col-xl-6 text-center" style="position: center; margin: auto; width: auto; text-align: center;">
            <div class="cardB text-center">
                <div class="col-lg-8 col-md-10 col-sm-0 col-lx-8">
                    <asp:ScriptManager ID="sm_1" runat="server" />
                    <asp:UpdatePanel runat="server" ID="up_Consulta" UpdateMode="Always">
                        <ContentTemplate>
                            <asp:GridView runat="server" ID="dgtListaColchones" CssClass="table table-responsive-lg table-responsive-md table-responsive-sm table-responsive-xl" DataKeyNames="NumeroColchon"
                                AutoGenerateColumns="false" OnRowDeleting="dgtListaColchones_RowDeleting">
                                <Columns>
                                    <asp:BoundField DataField="NumeroColchon" HeaderText="Número Colchón" HeaderStyle-CssClass=" TextoContenido" HeaderStyle-BackColor="#005da4" HeaderStyle-Font-Bold="false" HeaderStyle-ForeColor="White" />

                                    <asp:BoundField DataField="Estado" HeaderText="Estado" HeaderStyle-CssClass=" TextoContenido" HeaderStyle-BackColor="#005da4" HeaderStyle-Font-Bold="false" HeaderStyle-ForeColor="White" />

                                    <asp:CommandField HeaderImageUrl="/www/css/img/delete.png" ButtonType="Image" DeleteImageUrl="/www/css/img/delete.png" HeaderStyle-BackColor="#005da4" HeaderStyle-Font-Bold="false" HeaderStyle-ForeColor="White"
                                        ShowDeleteButton="true" InsertVisible="false" ShowCancelButton="false" HeaderStyle-CssClass=" text-center img-fluid" />
                                </Columns>
                            </asp:GridView>
                        </ContentTemplate>
                    </asp:UpdatePanel>
                </div>
            </div>
        </div>

        <div class="text-center">
            <div class="form-group">
                <div class="row text-center">
                    <div class="col-md-5 col-sm-5 col-xl-3">
                        <asp:Button ID="btnAceptar" Text="Aceptar" runat="server" CssClass="btn btn-inv" OnClick="btnAceptar_Click" />
                    </div>
                    <div class="col-md-5 col-sm-5 col-xl-3">
                        <asp:Button ID="btnCancelar" Text="Cancelar" runat="server" CssClass="btn btn-inv" OnClick="btnCancelar_Click" />
                    </div>
                </div>
            </div>
        </div>
    </div>
</asp:Content>

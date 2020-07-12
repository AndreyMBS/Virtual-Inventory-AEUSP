<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Inventario.Master" AutoEventWireup="true" CodeBehind="FrmPrestamoColchones.aspx.cs" Inherits="AppInventarioVirtual.WebForm4" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <div class=" Panel col-lg-10 col-md-3 col-sm-6">
        <div style="text-align: center; color: #005da4; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Prestamo de Colchones</h1>
        </div>

        <div class="container ml-0 mt-3">
            <div class="form-group">
                <div class="row">
                    <div class="col-lg-1 col-md-2 col-sm-2 col-xl-1">
                        <asp:Label Text="Solicitante:" runat="server" />
                    </div>
                    <div class="col-lg-1 col-md-2 col-sm-2 col-xl-3">
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtCedula" required="true" />
                    </div>
                    <div class="col-lg-2 col-md-2 col-sm-4 col-xl-2">
                        <asp:Button Text="Consultar" CssClass="btn btn-inv" ID="btnConsultarCedula" runat="server"
                            OnClick="btnConsultarCedula_Click" />
                    </div>

                    <div class="col-lg-1 col-md-2 col-sm-2 col-xl-1">
                        <asp:Label Text="Ubicación:" runat="server" />
                    </div>
                    <div class="col-lg-1 col-md-2 col-sm-2 col-xl-4">
                        <asp:TextBox CssClass="form-control" runat="server" ID="txtUbicacion" TextMode="MultiLine" Enabled="false" required="true" />
                    </div>

                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-lg-1 col-md-4 col-sm-2 col-xl-1">
                        <asp:Label Text="Nombre:" runat="server" />
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xl-4">
                        <asp:TextBox runat="server" ID="txtNombre" CssClass="form-control" Enabled="false" />
                    </div>
                </div>
            </div>

            <div class="form-group">
                <div class="row">
                    <div class="col-lg-1 col-md-4 col-sm-2 col-xl-1">
                        <asp:Label Text="Colchón:" runat="server" />
                    </div>
                    <div class="col-lg-2 col-md-5 col-sm-5 col-xl-3">


                        <ajaxToolkit:ComboBox ID="cboxColchones" Enabled="false" runat="server" AutoCompleteMode="SuggestAppend" DropDownStyle="Simple" DataTextField="numeroColchon" DataValueField="numeroColchon" MaxLength="0" Style="display: inline;" CssClass="aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled aspNetDisabled" DataSourceID="SqlDataSource">
                        </ajaxToolkit:ComboBox>

                        <asp:SqlDataSource runat="server" ID="SqlDataSource" ConnectionString='<%$ ConnectionStrings:ucraeuspConnectionString %>' SelectCommand="SELECT * FROM [VP_CNS_NUMEROCOLCHONESDISPONIBLES] ORDER BY [numeroColchon]"></asp:SqlDataSource>
                    </div>
                    <div class="col-lg-4 col-md-5 col-sm-6 col-xl-2">
                        <asp:Button Text="Agregar" CssClass="btn btn-inv" ID="btnAgregarColchon" runat="server" OnClick="btnAgregarColchon_Click" Enabled="false" />
                    </div>
                </div>
            </div>

        </div>

        <div class="col-lg-6 col-md-5 col-sm-10 col-xl-6 text-center">
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

        <div class="align-content-lg-center align-content-md-center align-content-sm-center align-content-xl-center col-lg-4 col-md-4 col-sm-4 col-xl-4" style="margin: auto; position: center;">
            <div class="form-group">
                <div class="row">
                    <div class="col-lg-3 col-md-5 col-sm-5 col-xl-3">
                        <asp:Button ID="btnPrestar" Text="Prestar" runat="server" CssClass="btn btn-inv" OnClick="btnPrestar_Click" Visible="false" />
                    </div>
                    <div class="col-lg-3 col-md-5 col-sm-5 col-xl-3">
                        <asp:Button ID="btnLimpiar" Text="Limpiar" runat="server" CssClass="btn btn-inv" OnClick="btnLimpiar_Click" Visible="false" />
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>

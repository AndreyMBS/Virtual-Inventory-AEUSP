<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Alimentacion.Master" AutoEventWireup="true" CodeBehind="FrmConsultarConsu-Ali.aspx.cs" Inherits="AppInventarioVirtual.ConsultarConsu_Ali" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">




    <div class=" Panel col-lg-8 col-md-3 col-sm-6">
        <div style="text-align: center; color: #a25b4f; margin-top: 5vh; margin-bottom: 5vh">
            <h1>Consulta de Alimentación</h1>
        </div>


        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-2 col-md-3 col-sm-3">
                                <asp:Label Text="Buscar " runat="server" />
                            </div>
                            <div class="col-lg-4 col-md-3 col-sm-3">
                                <asp:TextBox ID="txtBuscar" runat="server" AutoPostBack="true" CssClass="form-control" OnTextChanged="txtBuscar_TextChanged"/>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-lg-3">
                    <div class="form-group">
                        <div class="row">
                            <asp:RadioButtonList  ID="radiobutonNombre" CssClass="spaced" runat="server" RepeatDirection="Vertical">
                                <asp:ListItem  Value="1" Text=" Nombre" />
                               <asp:ListItem  Value="2" Text=" Categoria" />
                            </asp:RadioButtonList>
                        </div>
                    </div>
                </div>

               
            </div>
        </div>



        <div>
            <div class="card-body">
                <asp:GridView runat="server" CssClass="table table-responsive-lg" AutoGenerateColumns="false" AllowPaging="true" PageSize="5" ID="dtgListaAlimentos" OnPageIndexChanging="dtgListaAlimentos_PageIndexChanging">
                    
                    
                <pagersettings mode="Numeric"
          position="Bottom"           
          pagebuttoncount="5"/>
                      
        <pagerstyle BackColor="#a25b4f"
          height="30px"
          verticalalign="Bottom"
          horizontalalign="Center"/>

                    <Columns>
                        <asp:HyperLinkField DataNavigateUrlFields="id"
                            HeaderStyle-CssClass=" TextoContenido" HeaderStyle-BackColor="#a25b4f" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            DataNavigateUrlFormatString="FrmRegistroConsumibles-Ali.aspx?id={0}"
                            DataTextField="Nombre_Consumible" HeaderText="Nombre Producto" />
 
                        <asp:BoundField DataField="Categoria" HeaderText="Categoría" HeaderStyle-BackColor="#a25b4f" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            HeaderStyle-CssClass=" TextoContenido" />
                        <asp:BoundField DataField="Unidad_Medida" HeaderText="Unidad de medida" HeaderStyle-BackColor="#a25b4f" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            HeaderStyle-CssClass=" TextoContenido" />
                        <asp:BoundField DataField="Cantidad" HeaderText="Cantidad" HeaderStyle-BackColor="#a25b4f" HeaderStyle-ForeColor="White" HeaderStyle-Font-Bold="false"
                            HeaderStyle-CssClass=" TextoContenido" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
         <div class="form-group text-center">
                    <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <asp:Button Text="Añadir" runat="server" CssClass="btn btn-ali" ID="btnAñadir" OnClick="btnAñadir_Click"/>
                        </div>
                    </div> 
                </div>
    </div>

</asp:Content>

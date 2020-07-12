<%@ Page Title="" Language="C#" MasterPageFile="~/ME-Presupuesto.Master" AutoEventWireup="true" CodeBehind="FrmCuentaEfectivo.aspx.cs" Inherits="AppInventarioVirtual.FrmCuentaEfectivo" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   <div class="container">
        <div class=" row align-items-center">
            <div class="">
                <div class=" col-lg-5 col-md-8 col-sm-8 " style="padding: 0;">
                    <div class="mg-seguridad-rigth col-md-4 col-sm-2" style="padding: 0">
                        <img src="www/css/img/presupuesto/001_money_cash_gold_wealth_income_safe_finance-512.png" width="300" height="300" />
                    </div>
                </div>
            </div>
            <div class="col">
                <div class="Panel col-lg-8 col-md-3 col-sm-8">
                    <div style="text-align: center; color: #6dc067; margin-top: 5vh; margin-bottom: 5vh">
                        <h1>Cuenta Efectivo</h1>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Presupuesto" runat="server" />
                            </div>
                            <div class="col-lg-5 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtPresupuesto" runat="server"
                                    CssClass="form-control" Enabled="false" />
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Detalle:" runat="server" />
                            </div>
                            <div class="col-lg-5 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtDetalle" runat="server"
                                    CssClass="form-control" TextMode="MultiLine" required="true"/>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Acción:" runat="server" />
                            </div>
                            <div class="col-lg-5 col-md-8 col-sm-8">
                                <asp:DropDownList class="btn btn-pres" runat="server" ID="dlTipo" CssClass="form-control">
                                    <asp:ListItem Text="Ingresar Presupuesto" Value="E" />
                                    <asp:ListItem Text="Sacar Presupuesto" Value="S" />
                                </asp:DropDownList>
                            </div>
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="row">
                            <div class="col-lg-4 col-md-4 col-sm-4">
                                <asp:Label Text="Monto" runat="server" required="true"/>
                            </div>
                            <div class="col-lg-5 col-md-7 col-sm-7">
                                <asp:TextBox ID="txtIngresar" runat="server"
                                    CssClass="form-control" TextMode="Number" />
                            </div>
                        </div>
                    </div>

                    <div class=" form-group text-center">
                        <div class="row">
                            <div class="col-lg-12 col-md-12 col-sm-12">
                                <asp:Button Text="Aceptar" runat="server" class="btn btn-pres" ID="btnTransaccion" OnClick="btnTransaccion_Click"/>
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
    </div>
</asp:Content>

using System;

namespace AppInventarioVirtual
{
    public partial class FrmModulos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            switch (cboxOpcion.SelectedValue)
            {
                case "Salud":
                    Response.Redirect("FrmPrincipalSalud.aspx");
                    break;
                case "Seguridad":
                    Response.Redirect("FrmPrincipalSE.aspx");
                    break;
                case "Usuarios":
                    Response.Redirect("FrmPrincipalUsuarios.aspx");
                    break;
                case "Colchones":
                    Response.Redirect("FrmPrincipalColchones.aspx");
                    break;
                case "Limpieza":
                    Response.Redirect("FrmPrincipal-Lim.aspx");
                    break;
                case "Alimentacion":
                    Response.Redirect("FrmPrincipal-Ali.aspx");
                    break;
                case "Presupuesto":
                    Response.Redirect("FrmPrincipalPR.aspx");
                    break;
                case "Asocia":
                    Response.Redirect("FrmConsulta-Aso.aspx");
                    break;

                default:
                    Response.Redirect("Default.aspx");
                    break;
            }
        }
    }
}
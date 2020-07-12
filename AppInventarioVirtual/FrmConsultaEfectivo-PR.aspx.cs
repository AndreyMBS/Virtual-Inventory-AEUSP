#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace AppInventarioVirtual
{
    public partial class FrmConsultaEfectivo_PR : System.Web.UI.Page
    {
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        AEUSP entidades;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                this.entidades = new AEUSP();
                var organismo1 = this.entidades.SP_CNS_ORGANISMOUSUARIO(Session["Usuario"].ToString());
                var organismo2 = this.entidades.SP_CNS_ORGANISMOUSUARIO(Session["Usuario"].ToString());
                var organismo3 = this.entidades.SP_CNS_ORGANISMOUSUARIO(Session["Usuario"].ToString());
                //Se pregunta si no está autenticado el usuario
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Default.aspx");
                }
                else if (!organismo1.Single().ToString().Equals("PE1") && !organismo2.Single().ToString().Equals("IF1") && !organismo3.Single().ToString().Equals("AS1"))
                {
                    Response.Write("<script language=javascript>alert('El usuario actual no Posee Permisos para acceder a este módulo');</script>");
                    Response.Redirect("FrmModulos.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }

        protected void btnConsultar_Click(object sender, EventArgs e)
        {
            try
            {
                this.entidades = new AEUSP();
                var consulta = this.entidades.SP_CNS_MOVIMIENTOSEFECTIVOXFECHA(DateTime.Parse(this.txtFechaI.Text),
                    DateTime.Parse(this.txtFechaF.Text).AddDays(1));
                this.dgtConsulta.DataSource = consulta;
                this.dgtConsulta.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dgtConsulta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            try
            {
                this.entidades = new AEUSP();
                var consulta = this.entidades.SP_CNS_MOVIMIENTOSEFECTIVOXFECHA(DateTime.Parse(this.txtFechaI.Text),
                    DateTime.Parse(this.txtFechaF.Text).AddDays(1));
                this.dgtConsulta.DataSource = consulta;
                this.dgtConsulta.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
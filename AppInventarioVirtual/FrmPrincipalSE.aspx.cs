#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Linq;
using System.Web;

namespace AppInventarioVirtual
{
    public partial class WebForm3 : System.Web.UI.Page
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
                else if (!organismo1.Single().ToString().Equals("SE1") && !organismo2.Single().ToString().Equals("IF1") && !organismo3.Single().ToString().Equals("SE1"))
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

        protected void entrada_Click(object sender, EventArgs e)
        {

        }

        protected void Fechas_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmConsultaFecha-SE.aspx");
        }

        protected void TiempoReal_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmConsultaGeneral-SE.aspx");
        }

        protected void estudiantes_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmControlEstudiantes-SE.aspx");
        }

        protected void particulares_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmControlParticulares.aspx");
        }
    }
}
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace AppInventarioVirtual
{
    public partial class FrmListaPrestamosColchones : System.Web.UI.Page
    {
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        AEUSP entidades;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.rbgConsulta.SelectedIndex = 0;
            }
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
                else if (!organismo1.Single().ToString().Equals("CO1") && !organismo2.Single().ToString().Equals("IF1") && !organismo3.Single().ToString().Equals("AS1"))
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

        protected void txtBusqueda_TextChanged(object sender, EventArgs e)
        {
            try
            {
                this.entidades = new AEUSP();
                if (this.rbgConsulta.SelectedIndex == 0)
                    this.tablaNumero();
                else
                    this.tablaCedula();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void tablaNumero()
        {
            try
            {
                var listaPrestamo = this.entidades.SP_CNS_PRESTAMOCOLCHONESXNUMERO(this.txtBusqueda.Text);
                this.dgtListaColchonesPrestados.DataSource = listaPrestamo;
                this.dgtListaColchonesPrestados.DataBind();
            }

            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void tablaCedula()
        {
            try
            {
                var listaPrestamo = this.entidades.SP_CNS_PRESTAMOSCOLCHONESXCEDULA(this.txtBusqueda.Text);
                this.dgtListaColchonesPrestados.DataSource = listaPrestamo;
                this.dgtListaColchonesPrestados.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dgtListaColchonesPrestados_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.entidades = new AEUSP();
            if (this.rbgConsulta.SelectedIndex == 0)
                this.tablaNumero();
            else
                this.tablaCedula();
        }
    }
}
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace AppInventarioVirtual
{
    public partial class FrmConsultarCol : System.Web.UI.Page
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
            try
            {
                if (!IsPostBack)
                {
                    //Se instancian las entidades de la BD
                    this.entidades = new AEUSP();

                    //Se obtienen los datos apartir de las letras tecleadas
                    var colchones = entidades.SP_CNS_COLCHONES();

                    //Se actualiza la tabla
                    this.dgtListaColchones.DataSource = colchones;
                    this.dgtListaColchones.DataBind();
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void cargarDatos()
        {
            try
            {
                this.entidades = new AEUSP();
                if (dlConsulta.SelectedValue == "A")
                {
                    var listaColchones = this.entidades.SP_CNS_COLCHONES();
                    this.dgtListaColchones.DataSource = listaColchones;
                }
                else
                {
                    var listaColchones = this.entidades.SP_CNS_DISPONIBILIDADCOLCHONES(int.Parse(this.dlConsulta.SelectedValue));
                    this.dgtListaColchones.DataSource = listaColchones;
                }
                this.dgtListaColchones.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dlConsulta_SelectedIndexChanged(object sender, EventArgs e)
        {
            try
            {
                this.cargarDatos();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void dgtListaColchones_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            this.dgtListaColchones.PageIndex = e.NewPageIndex;
            this.cargarDatos();
        }
    }
}

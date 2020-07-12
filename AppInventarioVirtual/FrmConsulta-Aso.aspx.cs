#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI.WebControls;

namespace AppInventarioVirtual
{
    public partial class FrmConsulta_Aso : System.Web.UI.Page
    {
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        AEUSP db = null;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                this.db = new AEUSP();
                var organismo1 = this.db.SP_CNS_ORGANISMOUSUARIO(Session["Usuario"].ToString());
                var organismo2 = this.db.SP_CNS_ORGANISMOUSUARIO(Session["Usuario"].ToString());
                //Se pregunta si no está autenticado el usuario
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Default.aspx");
                }
                else if (!organismo1.Single().ToString().Equals("AS1") && !organismo2.Single().ToString().Equals("IF1"))
                {
                    Response.Write("<script language=javascript>alert('El usuario actual no Posee Permisos para acceder a este módulo');</script>");
                    Response.Redirect("FrmModulos.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
            cargarDatos();
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmRegistroActivos-Asocia.aspx");
        }

        protected void txtBuscar_TextChanged1(object sender, EventArgs e)
        {
            this.filtrarNombre();
        }

        protected void GVConsulta_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GVConsulta.PageIndex = e.NewPageIndex;
            cargarDatos();
        }

        private void cargarDatos()
        {
            AEUSP db = new AEUSP();
            var list = db.Sp_Cns_InvActivosAso();
            GVConsulta.DataSource = list;
            GVConsulta.DataBind();

        }

        private void filtrarNombre()
        {

            using (SqlConnection cnx = new SqlConnection(@"data source=sql5047.site4now.net;initial catalog=DB_A4F898_AppInventario;persist security info=True;user id=DB_A4F898_AppInventario_admin;password=aeusp1234;"))
            {
                cnx.Open();

                SqlCommand cmd = new SqlCommand("exec[Sp_Cns_InvaAsoPorNombre] @nombre", cnx);
                cmd.Parameters.AddWithValue("@nombre", txtBuscar.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                GVConsulta.DataSource = dt;
                GVConsulta.DataBind();



            }
        }
    }
}
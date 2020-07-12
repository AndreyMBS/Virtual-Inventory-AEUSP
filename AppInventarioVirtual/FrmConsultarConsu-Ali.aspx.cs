
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
    public partial class ConsultarConsu_Ali : System.Web.UI.Page
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
                else if (!organismo1.Single().ToString().Equals("AL1") && !organismo2.Single().ToString().Equals("IF1") && !organismo3.Single().ToString().Equals("AS1"))
                {
                    Response.Write("<script language=javascript>alert('El usuario actual no Posee Permisos para acceder a este módulo');</script>");
                    Response.Redirect("FrmModulos.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                radiobutonNombre.SelectedIndex = 1;
                this.cargarDatos();

            }
        }

        protected void txtBuscar_TextChanged(object sender, EventArgs e)
        {
            if (radiobutonNombre.SelectedValue == "1")
            {

                this.filtroNombre();
            }
            if (radiobutonNombre.SelectedValue == "2")
            {

                this.filtroCategoria();
            }
        }

        public void cargarDatos()
        {
            using (SqlConnection cnx = new SqlConnection(@"Data Source=ucraeusp.mssql.somee.com;Initial Catalog=ucraeusp;Persist Security Info=True;User ID=joserodo99_SQLLogin_1;Password=e7aad4xmcd"))
            {
                cnx.Open();
                SqlCommand consulta = new SqlCommand(string.Format("SELECT E.idConsumible AS id, e.nombre AS Nombre_Consumible, E.inventario as Cantidad,c.unidadMedida as Unidad_Medida,c.Categoria as Categoria FROM tbConsumible E, tbConsumibleAlimentacion c where e.idConsumible = c.idConsumible"), cnx);
                SqlDataAdapter da = new SqlDataAdapter(consulta);
                DataTable dt = new DataTable();
                da.Fill(dt);
                dtgListaAlimentos.DataSource = dt;
                dtgListaAlimentos.DataBind();

            }
        }

        public void filtroCategoria()
        {
            using (SqlConnection cnx = new SqlConnection(@"Data Source=ucraeusp.mssql.somee.com;Initial Catalog=ucraeusp;Persist Security Info=True;User ID=joserodo99_SQLLogin_1;Password=e7aad4xmcd"))
            {
                cnx.Open();

                SqlCommand cmd = new SqlCommand("exec[Sp_Cns_FiltroCategoria] @filtro", cnx);
                cmd.Parameters.AddWithValue("@filtro", txtBuscar.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dtgListaAlimentos.DataSource = dt;
                dtgListaAlimentos.DataBind();



            }
        }
        public void filtroNombre()
        {
            using (SqlConnection cnx = new SqlConnection(@"Data Source=ucraeusp.mssql.somee.com;Initial Catalog=ucraeusp;Persist Security Info=True;User ID=joserodo99_SQLLogin_1;Password=e7aad4xmcd"))
            {
                cnx.Open();

                SqlCommand cmd = new SqlCommand("exec[Sp_Cns_FiltroAlimentacion] @filtro", cnx);
                cmd.Parameters.AddWithValue("@filtro", txtBuscar.Text);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);

                dtgListaAlimentos.DataSource = dt;
                dtgListaAlimentos.DataBind();



            }
        }

        protected void dtgListaAlimentos_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dtgListaAlimentos.PageIndex = e.NewPageIndex;
            cargarDatos();
        }

        protected void btnAñadir_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmRegistroConsumibles-Ali.aspx");

        }
    }
}
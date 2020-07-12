#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Linq;
using System.Web;

namespace AppInventarioVirtual
{
    public partial class FrmConsultaUsuarios : System.Web.UI.Page
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
                //Se pregunta si no está autenticado el usuario
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Default.aspx");
                }
                else if (!organismo1.Single().ToString().Equals("IF1") && !organismo2.Single().ToString().Equals("AS1"))
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
    }
}

/*db = new AEUSP();
if (!IsPostBack)
{
    CargarDatos();
}
}

protected void txtBuscar_TextChanged(object sender, EventArgs e)
{
try
{
    var listaCarnet = db.SP_CNS_USUARIOS(txtBuscar.Text);
    GVUsuarios.DataSource = listaCarnet;
    GVUsuarios.DataBind();
}
catch (Exception)
{

    throw;
}
}

public void CargarDatos() {
using (SqlConnection con = new SqlConnection(@"data source=DESKTOP-SEARVSC;initial catalog=AEUSP;integrated security=True;MultipleActiveResultSets=True;App=EntityFramework")) {
    con.Open();
    SqlCommand sqlCommand = new SqlCommand(string.Format("select u.carnet, u.cedula, u.nombreCompleto, o.nombre from tbUsuario u, tbOrganismo o, tbOrganismoUsuario ou where u.carnet=ou.miembro and o.codigo = ou.codigo", con));
    SqlDataAdapter sqlDataAdapter = new SqlDataAdapter(sqlCommand);
    DataTable dataTable = new DataTable();
    sqlDataAdapter.Fill(dataTable);
    GVUsuarios.DataSource = dataTable;
    GVUsuarios.DataBind();
}

}
}
}*/

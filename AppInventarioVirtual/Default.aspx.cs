#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
using System;
using System.Linq;
using System.Web.Security;

namespace AppInventarioVirtual
{
    public partial class FrmPrincipal : System.Web.UI.Page
    {
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private AEUSP db;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        protected void Page_Load(object sender, EventArgs e)
        {
            db = new AEUSP();
        }

        protected void entrar_Click(object sender, EventArgs e)
        {
            try
            {
                if (this.intentoLogueo(this.txtUsuario.Text, this.txtContrasena.Text))
                {
                    //Se inicia una sesión utilizando cockies
                    FormsAuthentication.SetAuthCookie(this.txtUsuario.Text, false);
                    Session["Usuario"] = this.txtUsuario.Text;
                    Response.Redirect("FrmModulos.aspx");
                }
                else
                {
                    Response.Write("<script language=javascript>alert('Usuario y/o contraseña incorrectos');</script>");
                }
            }
            catch
            {
                Response.Write("<script language=javascript>alert('Ha ocurrido un error,vuelva a intentarlo');</script>");
                txtContrasena.Text = "";
                txtUsuario.Text = "";
            }
        }

        private bool intentoLogueo(string carnet, string password)
        {
            bool autorizado = false;

            //Se instancia las entidades de la base de datos
            this.db = new AEUSP();

            tbUsuario user = null;
            user = this.db.tbUsuario.FirstOrDefault(u => u.carnet == carnet.Trim());

            if (user != null)
            {
                if (user.clave.Equals(password.Trim()))
                {
                    autorizado = true;
                }
            }
            return autorizado;
        }

        protected void btnCreditos_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmCreditos.aspx");
        }
    }
}

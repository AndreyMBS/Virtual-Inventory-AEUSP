#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Linq;
using System.Transactions;
using System.Web;

namespace AppInventarioVirtual
{
    public partial class FrmRegistroUsuarios : System.Web.UI.Page
    {
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private AEUSP db;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private string carne;
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
            db = new AEUSP();

            if (Request.QueryString["carnet"] != null)
            {
                carne = Request.QueryString["carnet"];
                btnRegistrar.Visible = false;
                btnModificar.Visible = true;
                btnEliminar.Visible = true;
                txtCarnet.Enabled = false;
                txtCedula.Enabled = false;
                txtNombre.Enabled = false;
                DDLOrganizaciones.Enabled = false;
            }
            else
            {
                carne = "";
            }
            if (!IsPostBack)
            {
                this.cargarDatosUsuario(carne);
            }
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    var usuario = db.tbUsuario.FirstOrDefault(u => u.carnet == txtCarnet.Text);
                    if (usuario == null)
                    {
                        usuario = db.tbUsuario.Create();
                        usuario.carnet = txtCarnet.Text;
                        usuario.cedula = txtCedula.Text;
                        usuario.nombreCompleto = txtNombre.Text;
                        usuario.clave = txtContra.Text;
                        db.tbUsuario.Add(usuario);
                        db.SaveChanges();
                        if (DDLOrganizaciones.SelectedValue.Equals("comiCol"))
                        {
                            db.SP_ADDUSERORGANISM("CO1", txtCarnet.Text);
                        }
                        else if (DDLOrganizaciones.SelectedValue.Equals("asociaGeneral"))
                        {
                            db.SP_ADDUSERORGANISM("AS1", txtCarnet.Text);
                        }
                        else if (DDLOrganizaciones.SelectedValue.Equals("comiAli"))
                        {
                            db.SP_ADDUSERORGANISM("AL1", txtCarnet.Text);
                        }
                        else if (DDLOrganizaciones.SelectedValue.Equals("comiLimpi"))
                        {
                            db.SP_ADDUSERORGANISM("C001", txtCarnet.Text);
                        }
                        else if (DDLOrganizaciones.SelectedValue.Equals("comiSe"))
                        {
                            db.SP_ADDUSERORGANISM("SE1", txtCarnet.Text);
                        }
                        else if (DDLOrganizaciones.SelectedValue.Equals("comiSa"))
                        {
                            db.SP_ADDUSERORGANISM("SA1", txtCarnet.Text);
                        }
                        else if (DDLOrganizaciones.SelectedValue.Equals("comiPres"))
                        {
                            db.SP_ADDUSERORGANISM("PE1", txtCarnet.Text);
                        }
                        else
                        {
                            db.SP_ADDUSERORGANISM("IF1", txtCarnet.Text);
                        }
                        scope.Complete();
                        limpiar();
                        Response.Redirect("FrmConsultaUsuarios.aspx");
                    }
                }

            }
            catch
            {
                Response.Write("<script language=javascript>alert('Ha ocurrido un error en el registro del usuario');</script>");
                throw;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    var usuario = db.tbUsuario.FirstOrDefault(u => u.carnet == txtCarnet.Text);
                    usuario.clave = txtContra.Text;
                    db.SaveChanges();
                    scope.Complete();
                    limpiar();
                    Response.Redirect("FrmConsultaUsuarios.aspx");
                }
            }
            catch
            {
                Response.Write("<script language=javascript>alert('Ha ocurrido un error en la modificación del usuario');</script>");
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    var usuario = db.tbUsuario.FirstOrDefault(u => u.carnet == txtCarnet.Text);
                    if (usuario.carnet.Equals(txtCarnet.Text))
                    {
                        db.SP_ELIMINAR_USUARIO(txtCarnet.Text);
                        db.tbUsuario.Remove(usuario);
                        db.SaveChanges();
                        scope.Complete();
                        limpiar();
                        Response.Redirect("FrmConsultaUsuarios.aspx");
                    }
                    else
                    {
                        Response.Write("<script language=javascript>alert('El usuario que desea eliminar no existe');</script>");
                    }
                }
            }
            catch
            {
                Response.Write("<script language=javascript>alert('Ha ocurrido un error al eliminar el usuario');</script>");
            }
        }

        private void limpiar()
        {
            txtCarnet.Text = "";
            txtCedula.Text = "";
            txtContra.Text = "";
            txtNombre.Text = "";
            DDLOrganizaciones.ClearSelection();
        }

        private void cargarDatosUsuario(string carnet)
        {
            db = new AEUSP();
            var usuario = db.tbUsuario.FirstOrDefault(u => u.carnet.Equals(carnet));
            if (usuario != null)
            {
                txtCarnet.Text = usuario.carnet;
                txtNombre.Text = usuario.nombreCompleto;
                txtCedula.Text = usuario.cedula;
                txtContra.Text = usuario.clave;
            }
        }
    }
}
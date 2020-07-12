#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Linq;
using System.Transactions;
using System.Web;

namespace AppInventarioVirtual
{
    public partial class FrmRegistroActivos_Asocia : System.Web.UI.Page
    {
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private AEUSP db;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private int pid;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                this.db = new AEUSP();
                var organismo1 = this.db.SP_CNS_ORGANISMOUSUARIO(Session["Usuario"].ToString());
                var organismo2 = this.db.SP_CNS_ORGANISMOUSUARIO(Session["Usuario"].ToString());
                var organismo3 = this.db.SP_CNS_ORGANISMOUSUARIO(Session["Usuario"].ToString());
                //Se pregunta si no está autenticado el usuario
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Default.aspx");
                }
                else if (!organismo2.Single().ToString().Equals("IF1") && !organismo3.Single().ToString().Equals("AS1"))
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
            if (Request.QueryString["placa"] != null)
            {
                this.pid = Convert.ToInt32(Request.QueryString["placa"]);
                this.btnRegistrar.Visible = false;
                this.btnEliminar.Visible = true;
                this.btnModificar.Visible = true;
                this.txtPlaca.Enabled = false;
                this.txtNombre.Enabled = false;
            }
            else
            {
                this.pid = 0;

            }

            // un postback es un evento generado por un control web
            // al negarlo es la carga inicial del formulario
            if (!IsPostBack)
                this.cargardatos(this.pid);
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            try
            {

                using (TransactionScope scope = new TransactionScope())
                {
                    int v = Convert.ToInt32(txtPlaca.Text);
                    var activoGeneral = db.tbActivoGeneral.FirstOrDefault(a => a.placa == v);
                    if (activoGeneral == null)
                    {
                        var activo = db.tbActivo.Create();
                        activo.codigoOrganismo = "AS1";
                        activo.cantidadTotal = 1;
                        activo.cantidadInventario = 1;
                        activo.estado = cboxEstado.SelectedValue;
                        activo.observacion = txtObservacion.Text;
                        db.tbActivo.Add(activo);
                        activoGeneral = db.tbActivoGeneral.Create();
                        activoGeneral.placa = Convert.ToInt32(txtPlaca.Text);
                        activoGeneral.idActivo = activo.idActivo;
                        activoGeneral.nombre = txtNombre.Text;
                        activoGeneral.ubicacion = txtUbicacion.Text;
                        db.tbActivoGeneral.Add(activoGeneral);
                        db.SaveChanges();
                        scope.Complete();
                        lbNotificaciones.Text = "Se ha registrado exitosamente";
                        limpiarCampos();
                    }
                    else
                    {
                        lbNotificaciones.Text = "El numero de placa ingresado ya esta registrado.";
                    }
                }
            }
            catch
            {
                lbNotificaciones.Text = "Ha ocurrido un error.";
            }
        }

        private void cargardatos(int v)
        {
            try
            {
                var activoG = db.tbActivoGeneral.FirstOrDefault(a => a.placa == v);
                var activo = db.tbActivo.FirstOrDefault(a => a.idActivo == activoG.idActivo);
                if (activoG != null)
                {
                    txtNombre.Text = activoG.nombre.ToString();
                    txtObservacion.Text = activo.observacion.ToString();
                    txtPlaca.Text = activoG.placa.ToString();
                    txtUbicacion.Text = activoG.ubicacion.ToString();
                    cboxEstado.SelectedValue = activo.estado;
                }
            }
            catch
            {
                // Response.Write("<script language=javascript>alert('Ha ocurrido un error.');</script>");
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            try
            {

                using (TransactionScope scope = new TransactionScope())
                {
                    var activoGeneral = db.tbActivoGeneral.FirstOrDefault(ag => ag.placa == this.pid);
                    var activo = db.tbActivo.FirstOrDefault(a => a.idActivo == activoGeneral.idActivo);
                    db.tbActivoGeneral.Remove(activoGeneral);
                    db.tbActivo.Remove(activo);
                    db.SaveChanges();
                    scope.Complete();
                    Response.Redirect("FrmConsulta-Aso.aspx");
                }
            }
            catch
            {
                Response.Write("<script language=javascript>alert('Ha ocurrido un error.');</script>");
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    var activoGeneral = db.tbActivoGeneral.FirstOrDefault(ag => ag.placa == this.pid);
                    var activo = db.tbActivo.FirstOrDefault(a => a.idActivo == activoGeneral.idActivo);
                    activo.observacion = txtObservacion.Text;
                    activoGeneral.ubicacion = txtUbicacion.Text;
                    activo.estado = cboxEstado.SelectedValue;
                    activo.cantidadTotal = 1;
                    db.SaveChanges();
                    scope.Complete();
                    Response.Redirect("FrmConsulta-Aso.aspx");
                }
            }
            catch
            {
                Response.Write("<script language=javascript>alert('Ha ocurrido un error.');</script>");
            }
        }

        private void limpiarCampos()
        {
            txtPlaca.Text = "";
            txtNombre.Text = "";
            txtObservacion.Text = "";
            txtUbicacion.Text = "";
            cboxEstado.SelectedValue = "B";
        }
    }
}
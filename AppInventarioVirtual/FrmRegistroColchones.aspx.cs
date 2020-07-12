#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;

namespace AppInventarioVirtual
{
    public partial class FrmRegistroColchones : System.Web.UI.Page
    {
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private AEUSP entidades;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private string strIdActivo;
        private int accion = 1;
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'tbColchon' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private tbColchon colchon;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'tbColchon' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                if (Request.QueryString["id"] != null)
                {
                    strIdActivo = Request.QueryString["id"];
                    this.btnTransaccion.Text = "Modificar";
                    this.btnEliminar.Enabled = true;
                    this.btnEliminar.Visible = true;
                    this.accion = 2;
                    if (!IsPostBack)
                    {
                        this.llenarCampos();
                    }
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }

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
                else if (!organismo1.Single().ToString().Equals("CO1") && !organismo2.Single().ToString().Equals("IF1"))
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

        protected void btnTransaccion_Click(object sender, EventArgs e)
        {
            int aux = 1;
            try
            {
                if (!string.IsNullOrEmpty(this.txtNumero.Text) && !string.IsNullOrEmpty(this.txtObservacion.Text) && !string.IsNullOrEmpty(this.txtProveniencia.Text))
                {
                    //Se instancian las entidades de la BD
                    this.entidades = new AEUSP();

                    if (accion == 1)
                    {
                        using (TransactionScope scope = new TransactionScope())
                        {
                            //Se instancia la tabla para registrar el activo
                            tbActivo activo = new tbActivo();

                            //Se llenan los datos del activo
                            activo.estado = this.dlEstado.SelectedValue;
                            activo.observacion = this.txtObservacion.Text;

                            //Se procede a llenar los datos del colchón
                            this.llenarDatosColchon();

                            this.entidades.SP_INS_REGISTRARCOLCHON(activo.estado, activo.observacion, colchon.numeroColchon,
                                colchon.procedencia);
                            this.entidades.SaveChanges();
                            scope.Complete();
                        }

                    }
                    else
                    {
                        int index = int.Parse(this.strIdActivo);
                        tbActivo activo = entidades.tbActivo.FirstOrDefault(a => a.idActivo == index);

                        activo.estado = this.dlEstado.SelectedValue;
                        activo.observacion = this.txtObservacion.Text;

                        this.entidades.SaveChanges();
                    }
                }
            }
            catch
            {
                aux = 0;
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                           "alertIns", "alert('Se presentó un error con los datos del colchón, favor comprobrar');", true);
            }
            if (aux == 1)
                Response.Redirect("FrmConsultarCol.aspx");
        }

        private void llenarDatosColchon()
        {
            try
            {
                this.colchon = new tbColchon();

                colchon.numeroColchon = int.Parse(this.txtNumero.Text);
                colchon.procedencia = this.txtProveniencia.Text;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        private void llenarCampos()
        {
            try
            {
                this.entidades = new AEUSP();

                int index = int.Parse(this.strIdActivo);
                tbActivo activo = entidades.tbActivo.FirstOrDefault(a => a.idActivo == index);
                tbColchon colchon = entidades.tbColchon.FirstOrDefault(c => c.idActivo == index);

                //Se llenan los datos
                this.txtNumero.Enabled = false;
                this.txtNumero.Text = colchon.numeroColchon.ToString();

                this.txtProveniencia.Enabled = false;
                this.txtProveniencia.Text = colchon.procedencia;

                this.dlEstado.SelectedValue = activo.estado;

                this.txtObservacion.Text = activo.observacion;
                this.entidades = null;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            int aux = 1;
            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    this.entidades = new AEUSP();

                    int index = int.Parse(this.strIdActivo);
                    tbActivo activo = entidades.tbActivo.FirstOrDefault(a => a.idActivo == index);
                    tbColchon colchon = entidades.tbColchon.FirstOrDefault(c => c.idActivo == index);

                    this.entidades.SP_DTL_ELIMINARDETALLECOLCHO(index);
                    this.entidades.tbColchon.Remove(colchon);
                    this.entidades.tbActivo.Remove(activo);
                    this.entidades.SaveChanges();
                    scope.Complete();
                }
            }
            catch
            {
                aux = 0;
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                       "alertIns", "alert('Error al eliminar el colchón');", true);
            }
            if (aux == 1)
                Response.Redirect("FrmConsultarCol.aspx");
        }
    }
}
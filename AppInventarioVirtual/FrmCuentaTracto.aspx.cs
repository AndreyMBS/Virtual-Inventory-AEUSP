using DataAccess;
using System;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;

namespace AppInventarioVirtual
{
    public partial class WebForm8 : System.Web.UI.Page
    {
        AEUSP entidades;
        tbCuenta cuenta;
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
                else if (!organismo1.Single().ToString().Equals("PE1") && !organismo2.Single().ToString().Equals("IF1") && !organismo3.Single().ToString().Equals("AS1"))
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
                this.entidades = new AEUSP();
                cuenta =
                    this.entidades.tbCuenta.FirstOrDefault(c => c.idCuenta == "T");
                this.txtPresupuesto.Text = cuenta.monto.ToString();
                this.entidades = null;
            }
            catch (Exception ex)
            {
                Response.Write("<script language='JavaScript'>alert(" + ex + ");</script>");
            }
        }

        protected void btnTransaccion_Click(object sender, EventArgs e)
        {
            int aux = 1;
            try
            {
                if (decimal.Parse(this.txtIngresar.Text) <= decimal.Parse(this.txtPresupuesto.Text) && this.dlTipo.SelectedValue.Equals("S") || this.dlTipo.SelectedValue.Equals("E"))
                {
                    //Se instancias las entidades de la BD
                    entidades = new AEUSP();
                    using (TransactionScope scope = new TransactionScope())
                    {
                        this.entidades.SP_ISN_CUENTA("T", Session["Usuario"].ToString(), this.txtDetalle.Text, DateTime.Now, this.dlTipo.SelectedValue, Convert.ToDecimal(this.txtIngresar.Text));
                        var idMov = this.entidades.SP_CNS_MOVTRACTO();
                        int idM = int.Parse(idMov.Single().Value.ToString());
                        this.entidades.SP_ISN_TRACTO(idM, this.txtFactura.Text, this.txtEmpresa.Text);
                        //Se guardan los cambios en la BD
                        this.entidades.SaveChanges();
                        scope.Complete();
                    }
                }
                else
                {
                    aux = 0;
                    ScriptManager.RegisterStartupScript(this, this.GetType(),
                           "alertIns", "alert('El monto a retirar es mayor que la cantidad almacenada');", true);
                }
            }
            catch
            {
                aux = 0;
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                           "alertIns", "alert('Se presentó un error');", true);
            }
            if (aux == 1)
                Response.Redirect("FrmCuentaTracto.aspx");
        }
    }
}
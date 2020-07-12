#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AppInventarioVirtual
{
    public partial class FrmDevolverColchones : System.Web.UI.Page
    {
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private AEUSP entidades;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private string strId;
        private string strCedula;
        DataTable tabla;
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

            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    this.strId = Request.QueryString["id"].ToString();
                    this.entidades = new AEUSP();
                    this.txtNombre.Text = this.entidades.SP_CNS_ASISTENTEPRESTAMO(int.Parse(strId)).Single().nombreCompleto;
                    this.strCedula = this.entidades.SP_CNS_ASISTENTEPRESTAMO(int.Parse(strId)).Single().cedula;
                    Session["CedulaSolicitante"] = this.strCedula;
                    this.cargarTabla();
                }
            }
        }

        private void cargarTabla()
        {
            try
            {
                var listaColchones = this.entidades.SP_CNS_COLCHONESPRESTAMO(int.Parse(strId));
                this.dgtListaColchones.DataSource = listaColchones;
                this.dgtListaColchones.DataBind();
            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void dgtListaColchones_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                this.tabla = new DataTable();
                this.tabla.Columns.Add(new DataColumn("NumeroColchon", typeof(int)));
                this.tabla.Columns.Add(new DataColumn("Estado", typeof(string)));

                for (int i = 0; i < this.dgtListaColchones.Rows.Count; i++)
                {
                    if (Convert.ToInt32(this.dgtListaColchones.DataKeys[e.RowIndex].Value) != int.Parse(this.dgtListaColchones.Rows[i].Cells[0].Text))
                    {
                        DataRow fila = tabla.NewRow();
                        fila["NumeroColchon"] = int.Parse(this.dgtListaColchones.Rows[i].Cells[0].Text);
                        fila["Estado"] = this.dgtListaColchones.Rows[i].Cells[1].Text;
                        this.tabla.Rows.Add(fila);
                    }
                    else
                    {
                        List<int> listaColchones = new List<int>();
                        listaColchones.Add(Convert.ToInt32(this.dgtListaColchones.Rows[i].Cells[0].Text));
                        Session["listaColchones"] = listaColchones;
                    }
                }
                this.dgtListaColchones.DataSource = this.tabla;
                this.dgtListaColchones.DataBind();

            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            int aux = 1;
            try
            {
                List<int> listaColchones = (List<int>)Session["listaColchones"];
                if (listaColchones.Count > 0)
                {
                    using (TransactionScope scope = new TransactionScope())
                    {
                        this.entidades = new AEUSP();
                        this.entidades.SP_INS_REGISTRARMOVIMIENTO(Session["Usuario"].ToString(), Session["CedulaSolicitante"].ToString(), "E", DateTime.Now);
                        for (int i = 0; i < listaColchones.Count; i++)
                        {
                            var idAct = this.entidades.SP_CNS_COLCHONXNUMERO(listaColchones[i]);
                            this.entidades.SP_INS_REGISTRARDEVOLUCIONESCOLCHON(idAct.Single(), 1);
                        }
                        this.entidades.SaveChanges();
                        scope.Complete();
                    }
                }
            }
            catch
            {
                aux = 0;
                ScriptManager.RegisterStartupScript(this, this.GetType(),
                           "alertIns", "alert('Se presentó un error');", true);
            }
            Session["listaColchones"] = null;
            Session["CedulaSolicitante"] = null;
            if (aux == 1)
                Response.Redirect("FrmListaPrestamosColchones.aspx");
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmListaPrestamosColchones.aspx");
        }
    }
}
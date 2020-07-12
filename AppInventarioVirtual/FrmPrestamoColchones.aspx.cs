#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using Modelo;
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
    public partial class WebForm4 : System.Web.UI.Page
    {
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private AEUSP entidades;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private DataTable tabla;
        private List<Colchon> listaColchones;
        private Colchon colchon;

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
        }

        protected void btnConsultarCedula_Click(object sender, EventArgs e)
        {
            try
            {
                this.entidades = new AEUSP();

                var nombre = this.entidades.SP_CNS_Asistente(this.txtCedula.Text);
                string nombreCompleto = nombre.ElementAt(0);
                this.txtNombre.Text = nombreCompleto;
                this.btnLimpiar.Visible = true;
                this.txtUbicacion.Enabled = true;
                this.cboxColchones.Enabled = true;
                this.btnAgregarColchon.Enabled = true;
            }
            catch (Exception)
            {
                Response.Write("<script>window.alert('La persona consultada no esta almacenada en el sistema.');</script>"
                    + "<script>window.setTimeout(location.href='FrmPrestamoColchones.aspx', 2000);</script>");
            }
        }

        protected void dgtListaColchones_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                this.listaColchones = new List<Colchon>();
                this.tabla = new DataTable();
                this.tabla.Columns.Add(new DataColumn("NumeroColchon", typeof(int)));
                this.tabla.Columns.Add(new DataColumn("Estado", typeof(string)));

                for (int i = 0; i < this.dgtListaColchones.Rows.Count; i++)
                {
                    if (Convert.ToInt32(dgtListaColchones.DataKeys[e.RowIndex].Value) != int.Parse(this.dgtListaColchones.Rows[i].Cells[0].Text))
                    {
                        this.colchon = new Colchon();
                        this.colchon.numeroColchon = int.Parse(this.dgtListaColchones.Rows[i].Cells[0].Text);
                        this.colchon.estado = this.dgtListaColchones.Rows[i].Cells[1].Text;
                        this.listaColchones.Add(this.colchon);
                    }
                }

                for (int i = 0; i < this.listaColchones.Count; i++)
                {
                    DataRow fila = tabla.NewRow();
                    fila["NumeroColchon"] = this.listaColchones[i].numeroColchon;
                    fila["Estado"] = this.listaColchones[i].estado;
                    this.tabla.Rows.Add(fila);
                }
                this.dgtListaColchones.DataSource = this.tabla;
                this.dgtListaColchones.DataBind();
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnAgregarColchon_Click(object sender, EventArgs e)
        {
            try
            {
                this.recargarTabla();
                this.cboxColchones.SelectedIndex = 0;

            }
            catch (Exception)
            {
                this.cboxColchones.SelectedIndex = 0;
            }
        }

        private void recargarTabla()
        {
            try
            {
                this.entidades = new AEUSP();
                var colchonSolicitado = this.entidades.SP_CNS_COLCHONPORNUMERO(int.Parse(this.cboxColchones.Text));

                if (colchonSolicitado != null)
                {
                    this.tabla = new DataTable();
                    this.tabla.Columns.Add(new DataColumn("NumeroColchon", typeof(int)));
                    this.tabla.Columns.Add(new DataColumn("Estado", typeof(string)));

                    this.listaColchones = new List<Colchon>();

                    //Se almancena el colchon solicitado nuevamente
                    this.colchon = new Colchon();
                    this.colchon.numeroColchon = colchonSolicitado.Single().numeroColchon;
                    colchonSolicitado = null;
                    colchonSolicitado = this.entidades.SP_CNS_COLCHONPORNUMERO(int.Parse(this.cboxColchones.Text));
                    this.colchon.estado = colchonSolicitado.Single().Estado;
                    colchonSolicitado = null;
                    colchonSolicitado = this.entidades.SP_CNS_COLCHONPORNUMERO(int.Parse(this.cboxColchones.Text));
                    this.listaColchones.Add(this.colchon);

                    //Se obtienen los datos almacenados en la tabla                    
                    for (int i = 0; i < this.dgtListaColchones.Rows.Count; i++)
                    {
                        if (int.Parse(this.dgtListaColchones.Rows[i].Cells[0].Text) == colchonSolicitado.Single().numeroColchon)
                        {
                            this.listaColchones.RemoveAt(0);
                        }
                        this.colchon = new Colchon();
                        this.colchon.numeroColchon = int.Parse(this.dgtListaColchones.Rows[i].Cells[0].Text);
                        this.colchon.estado = this.dgtListaColchones.Rows[i].Cells[1].Text;
                        this.listaColchones.Add(this.colchon);
                        colchonSolicitado = null;
                        colchonSolicitado = this.entidades.SP_CNS_COLCHONPORNUMERO(int.Parse(this.cboxColchones.Text));
                    }

                    //Se procede a llenar la tabla                        
                    for (int i = 0; i < this.listaColchones.Count; i++)
                    {
                        DataRow fila = tabla.NewRow();
                        fila["NumeroColchon"] = this.listaColchones[i].numeroColchon;
                        fila["Estado"] = this.listaColchones[i].estado;
                        this.tabla.Rows.Add(fila);
                    }
                    this.dgtListaColchones.DataSource = this.tabla;
                    this.dgtListaColchones.DataBind();
                }
                this.btnPrestar.Visible = true;
                this.btnLimpiar.Visible = true;
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }

        protected void btnPrestar_Click(object sender, EventArgs e)
        {
            int aux = 1;
            try
            {
                if (!string.IsNullOrEmpty(txtCedula.Text) && !string.IsNullOrEmpty(this.txtUbicacion.Text) && this.dgtListaColchones.Rows.Count > 0)
                {
                    this.entidades = new AEUSP();
                    using (TransactionScope scope = new TransactionScope())
                    {
                        this.entidades.SP_INS_REGISTRARMOVIMIENTO("B75566", this.txtCedula.Text, "S", DateTime.Now);
                        this.registrarPrestamosColchones();
                        scope.Complete();
                    }
                }
                else
                {
                    aux = 0;
                    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns",
                        "alert('Se necesita seleccionar colchones para realizar el préstamo');", true);
                }
            }
            catch
            {
                aux = 0;
                ScriptManager.RegisterStartupScript(this, this.GetType(), "alertIns",
                    "alert('Se presentó un error al realizar el prestamo, favor verificar los datos.');", true);
            }
            if (aux == 1)
                Response.Redirect("FrmConsultarCol.aspx");
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmPrestamoColchones.aspx");
        }

        private void registrarPrestamosColchones()
        {
            try
            {
                //Se recorre la tabla para extraer los datos de los colchones
                for (int i = 0; i < this.dgtListaColchones.Rows.Count; i++)
                {
                    var idActido = this.entidades.SP_CNS_IDCOLCHON(int.Parse(this.dgtListaColchones.Rows[i].Cells[0].Text));
                    int idAct = Convert.ToInt32(idActido.Single().Value);
                    this.entidades.SP_INS_REGISTRARPRESTAMOSCOLCHON(idAct, 1, this.txtUbicacion.Text);
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}
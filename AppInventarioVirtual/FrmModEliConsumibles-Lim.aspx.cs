#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using Modelo;
using System;
using System.Linq;
using System.Transactions;
using System.Web;

namespace AppInventarioVirtual
{
    public partial class FrmModEliConsumibles_Lim : System.Web.UI.Page
    {
        private Consumible varCons;

#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private AEUSP entidades;
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
                else if (!organismo1.Single().ToString().Equals("C001") && !organismo2.Single().ToString().Equals("IF1"))
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

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            try
            {

                long num = 0;

                bool valido = long.TryParse(txtCantidad.Text.Trim(), out num);

                if (valido)
                {

                    if (int.Parse(this.txtCantidad.Text.Trim()) >= 0)
                    {

                        using (TransactionScope scope = new TransactionScope())
                        {

                            this.varCons = new Consumible();

                            this.varCons.codigoOrganismo = "C001";
                            this.varCons.nombre = this.txtNombre.Text.Trim();
                            this.varCons.inventario = int.Parse(this.txtCantidad.Text.Trim());

                            this.entidades = new AEUSP();

                            tbConsumible tablaCons = new tbConsumible();

                            tablaCons.codigoOrganismo = this.varCons.codigoOrganismo;
                            tablaCons.nombre = this.varCons.nombre;
                            tablaCons.inventario = this.varCons.inventario;

                            this.entidades.tbConsumible.Add(tablaCons);

                            this.entidades.SaveChanges();

                            scope.Complete();

                            this.txtNombre.Text = "";
                            this.txtCantidad.Text = "";

                            Response.Redirect("FrmConsulta-Lim.aspx");


                        }

                    }

                }

            }
            catch (Exception ex)
            {
                throw ex;

            }
        }
    }
}
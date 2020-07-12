using DataAccess;
using Modelo;
using System;
using System.Linq;
using System.Transactions;
using System.Web;
using System.Web.UI;

namespace AppInventarioVirtual
{
    public partial class FrmIngresoConsu_Lim : System.Web.UI.Page
    {
        private int pid;
        private int aux = 1;
        private int idConsumi;
        private ConsumibleAlimentacion consuA;
        private AEUSP entidad;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["Usuario"] != null)
            {
                this.entidad = new AEUSP();
                var organismo1 = this.entidad.SP_CNS_ORGANISMOUSUARIO(Session["Usuario"].ToString());
                var organismo2 = this.entidad.SP_CNS_ORGANISMOUSUARIO(Session["Usuario"].ToString());
                //Se pregunta si no está autenticado el usuario
                if (!HttpContext.Current.User.Identity.IsAuthenticated)
                {
                    Response.Redirect("Default.aspx");
                }
                else if (!organismo1.Single().ToString().Equals("AL1") && !organismo2.Single().ToString().Equals("IF1"))
                {
                    Response.Write("<script language=javascript>alert('El usuario actual no Posee Permisos para acceder a este módulo');</script>");
                    Response.Redirect("FrmModulos.aspx");
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
            //se pregunta si en la URL se envia un parametro
            if (Request.QueryString["id"] != null)
            {
                this.pid = Convert.ToInt32(Request.QueryString["id"]);
                this.btnRegistrar.Visible = false;
                this.btnEliminar.Visible = true;
                this.btnModificar.Visible = true;
                this.txtNombre.Enabled = false;
                this.btnCancelar.Visible = false;
                this.dlTipo.Enabled = false;
                this.dlUnidad.Enabled = false;
            }
            else
            {
                this.pid = 0;

            }

            // un postback es un evento generado por un control web
            // al negarlo es la carga inicial del formulario
            if (!IsPostBack)
                this.cargarDatosAlimento(this.pid);
        }

        protected void btnCancelar_Click(object sender, EventArgs e)
        {
            Response.Redirect("FrmPrincipal-Ali.aspx");
        }

        protected void btnRegistrar_Click(object sender, EventArgs e)
        {
            this.consuA = new ConsumibleAlimentacion();
            this.entidad = new AEUSP();

            try
            {
                using (TransactionScope scope = new TransactionScope())
                {
                    if (string.IsNullOrEmpty(txtNombre.Text))// no hacemos nada si el espacio es vacio
                    {



                    }
                    else if (string.IsNullOrEmpty(txtCant.Text))// no hacemos nada si el espacio es vacio
                    {


                    }
                    else if (string.IsNullOrEmpty(dlTipo.Text))// no hacemos nada si el espacio es vacio
                    {

                    }
                    else if (string.IsNullOrEmpty(dlUnidad.Text))// no hacemos nada si el espacio es vacio
                    {
                        //ScriptManager.RegisterStartupScript(this, this.GetType(),
                        //    "alertIns", "alert('Seleccione una unidad Valida, no deje la unidad sin seleccionar ');", true);
                    }
                    else
                    {

                        this.consuA.nombreConsumible = this.txtNombre.Text;
                        this.consuA.codidgoOrganismo = "AL1";
                        this.consuA.inventario = Convert.ToInt32(this.txtCant.Text);


                        this.entidad = new AEUSP();

                        //se instancia la entidad tblEstudiantes
                        tbConsumible tbConsuA = new tbConsumible();
                        //se asignan los datos del objeto en la tabla

                        tbConsuA.nombre = this.consuA.nombreConsumible;
                        tbConsuA.codigoOrganismo = "AL1";
                        tbConsuA.inventario = this.consuA.inventario;

                        //se agrega los datos de la tabla en la entidad especifica
                        this.entidad.tbConsumible.Add(tbConsuA);
                        //se guardan los cambios
                        this.entidad.SaveChanges();

                        this.llenarTablaConsumibleAlimentacion();
                    }
                    scope.Complete();
                    aux = 0;
                }


            }
            catch
            {

                ScriptManager.RegisterStartupScript(this, this.GetType(),
                           "alertIns", "alert('Se presento un error');", true);
                throw;
            }
            if (aux == 0)
            {
                Response.Redirect("FrmConsultarConsu-Ali.aspx");
            }
        }

        public void llenarTablaConsumibleAlimentacion()
        {
            try
            {

                this.consuA = new ConsumibleAlimentacion();

                this.consuA.categoria = this.dlTipo.Text;
                this.consuA.unidadMedida = this.dlUnidad.Text;

                tbConsumibleAlimentacion tbAlimen = new tbConsumibleAlimentacion();


                idConsumi = entidad.tbConsumible.Max(a => a.idConsumible);
                tbAlimen.idConsumible = this.idConsumi;
                tbAlimen.categoria = this.consuA.categoria;
                tbAlimen.unidadMedida = this.consuA.unidadMedida;

                this.entidad.tbConsumibleAlimentacion.Add(tbAlimen);
                //se guardan los cambios
                this.entidad.SaveChanges();

            }
            catch (Exception ex)
            {

                throw ex;
            }
        }

        protected void btnModificar_Click(object sender, EventArgs e)
        {
            try
            {
                if (string.IsNullOrEmpty(txtCant.Text))// no hacemos nada si el espacio es vacio
                {
                    Response.Write("<script language='JavaScript'>" +
                        "alert('Problemas, ingresa una Cantidad valida para el producto')</script>");
                }
                else
                {
                    //Se instancia las entidades
                    this.entidad = new AEUSP();

                    // se busca al estudiante
                    tbConsumible consumible = this.entidad.tbConsumible.FirstOrDefault(u => u.idConsumible == this.pid);

                    //se modifican los datos del estudiante con los datos del FRONT-END
                    consumible.inventario = Convert.ToInt32(this.txtCant.Text);


                    // se aplican los cambios
                    this.entidad.SaveChanges();

                    //se redirecciona en la lista de estudiantes
                    Response.Redirect("FrmConsultarConsu-Ali.aspx");
                }
            }
            catch (Exception ex)
            {

                throw ex;
            }



        }

        protected void btnEliminar_Click(object sender, EventArgs e)
        {
            //se instancia las entidades

            this.entidad = new AEUSP();
            // se busca el estudiante

            tbConsumible consumible =
            this.entidad.tbConsumible.FirstOrDefault(u => u.idConsumible == this.pid);
            tbConsumibleAlimentacion consuAli =
                this.entidad.tbConsumibleAlimentacion.FirstOrDefault(c => c.idConsumible == this.pid);

            // se elimina el estudiante de la tabla
            this.entidad.tbConsumible.Remove(consumible);
            this.entidad.tbConsumibleAlimentacion.Remove(consuAli);

            // se aplican los cambios
            this.entidad.SaveChanges();

            //se redirecciona al listado

            Response.Redirect("FrmConsultarConsu-Ali.aspx");
        }

        private void cargarDatosAlimento(int pid)
        {


            //se busca un estudiante con la cedula enviada por parametro
            //metodo firstordefault() permite buscar entidades ORM
            this.entidad = new AEUSP();
            tbConsumible consumible =
                this.entidad.tbConsumible.FirstOrDefault(e => e.idConsumible == pid);
            tbConsumibleAlimentacion consuAli =
                this.entidad.tbConsumibleAlimentacion.FirstOrDefault(c => c.idConsumible == pid);

            //se pregunta si tine datos

            if (consumible != null)
            {
                //se asignan los datos del Objeto al front-end
                this.txtNombre.Text = consumible.nombre;
                this.txtCant.Text = consumible.inventario.ToString();
                this.dlTipo.Text = consuAli.categoria;
                this.dlUnidad.Text = consuAli.unidadMedida;


            }
        }


    }
}
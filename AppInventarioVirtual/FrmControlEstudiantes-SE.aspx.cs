#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using DataAccess;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'DataAccess' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
using System;
using System.Linq;
using System.Transactions;
using System.Web;

namespace AppInventarioVirtual
{
    public partial class WebForm1 : System.Web.UI.Page
    {
#pragma warning disable CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)
        private AEUSP entidades;
#pragma warning restore CS0246 // El nombre del tipo o del espacio de nombres 'AEUSP' no se encontró (¿falta una directiva using o una referencia de ensamblado?)

        protected void Page_Load(object sender, EventArgs e)
        {
            entidades = new AEUSP();
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
                else if (!organismo1.Single().ToString().Equals("SE1") && !organismo2.Single().ToString().Equals("IF1") && !organismo3.Single().ToString().Equals("AS1"))
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

        protected void registrar_Click(object sender, EventArgs e)
        {
            this.entidades = new AEUSP();
            if (validarCampos())
            {
                try
                {
                    using (TransactionScope scope = new TransactionScope())
                    {
                        var asistente = entidades.tbAsistente.FirstOrDefault(a => a.cedula == txtCedula.Text);
                        if (rbRegistroExistente.SelectedValue.Equals("No"))
                        {
                            if (asistente == null)
                            {
                                if (rbTipo.SelectedValue.Equals("Estudiante"))
                                {
                                    var estudiante = entidades.tbEstudiante.FirstOrDefault(es => es.carnet == txtCarnet.Text);
                                    if (estudiante == null)
                                    {
                                        asistente = entidades.tbAsistente.Create();
                                        asistente.cedula = txtCedula.Text;
                                        asistente.nombreCompleto = txtNombre.Text;
                                        asistente.fechaNacimiento = Convert.ToDateTime(caFechaNacimiento.Text);
                                        asistente.telefono = txtTelefono.Text;
                                        asistente.tipo = "Estudiante";
                                        estudiante = entidades.tbEstudiante.Create();
                                        estudiante.cedula = asistente.cedula;
                                        estudiante.carnet = txtCarnet.Text;
                                        estudiante.carrera = cboxCarrera.SelectedValue;
                                        entidades.tbAsistente.Add(asistente);
                                        entidades.tbEstudiante.Add(estudiante);

                                        if (rbAccion.SelectedValue.Equals("E"))
                                        {
                                            asistente.estado = 1;
                                        }
                                        else
                                        {
                                            asistente.estado = 0;
                                        }
                                        entidades.SaveChanges();
                                        entidades.Sp_Ins_Movimiento(txtCedula.Text, rbAccion.Text, DateTime.Now);
                                        entidades.SaveChanges();
                                        lbNotificacion.Text = "¡Registro Exitoso!";
                                        limpiarCampos();
                                        habilitarCampos(false);
                                        rbRegistroExistente.SelectedValue = "Si";
                                    }
                                    else
                                    {
                                        lbNotificacion.Text = "Se ha encontrado un Registro Existente para el carné digitado.";
                                    }
                                }
                                else
                                {
                                    asistente = entidades.tbAsistente.Create();
                                    asistente.cedula = txtCedula.Text;
                                    asistente.nombreCompleto = txtNombre.Text;
                                    asistente.fechaNacimiento = Convert.ToDateTime(caFechaNacimiento.Text);
                                    asistente.telefono = txtTelefono.Text;
                                    asistente.tipo = "Particular";
                                    entidades.tbAsistente.Add(asistente);

                                    if (rbAccion.SelectedValue.Equals("E"))
                                    {
                                        asistente.estado = 1;
                                    }
                                    else
                                    {
                                        asistente.estado = 0;
                                    }
                                    entidades.SaveChanges();
                                    entidades.Sp_Ins_Movimiento(txtCedula.Text, rbAccion.Text, DateTime.Now);
                                    entidades.SaveChanges();
                                    lbNotificacion.Text = "¡Registro Exitoso!";
                                    limpiarCampos();
                                    habilitarCampos(false);
                                    rbRegistroExistente.SelectedValue = "Si";
                                }
                            }
                            else
                            {
                                lbNotificacion.Text = "Se ha encontrado un Registro Existente para la Cédula digitada.";
                                limpiarCampos();
                                habilitarCampos(false);
                                rbRegistroExistente.SelectedValue = "Si";
                            }
                        }
                        else
                        {
                            if (asistente != null)
                            {
                                if (rbAccion.SelectedValue.Equals("E"))
                                {
                                    asistente.estado = 1;
                                }
                                else
                                {
                                    asistente.estado = 0;
                                }
                                entidades.Sp_Ins_Movimiento(txtCedula.Text, rbAccion.Text, DateTime.Now);
                                entidades.SaveChanges();
                                lbNotificacion.Text = "¡Registro Exitoso!";
                                txtCedula.Text = "";
                            }
                            else
                            {
                                lbNotificacion.Text = "No se ha encontrado ningún registro previo, debe LLenar el Formulario.";
                            }
                        }
                        scope.Complete();
                    }
                }
                catch
                {
                    lbNotificacion.Text = "Ha ocurrido un error, Intente de Nuevo.";
                    throw;
                }
            }
            else
            {
                lbNotificacion.Text = "Debe llenar los Campos Activos";
            }
        }

        protected void rbTipo_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbTipo.SelectedValue.Equals("Estudiante"))
            {
                txtCarnet.Enabled = true;
                cboxCarrera.Enabled = true;
            }
            else
            {
                txtCarnet.Text = "";
                txtCarnet.Enabled = false;
                cboxCarrera.Enabled = false;
            }
        }

        protected void rbRegistroExistente_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (rbRegistroExistente.SelectedValue.Equals("Si"))
            {
                habilitarCampos(false);
            }
            else
            {
                habilitarCampos(true);
            }
        }

        private void limpiarCampos()
        {
            txtCedula.Text = "";
            txtCarnet.Text = "";
            txtNombre.Text = "";
            caFechaNacimiento.Text = "";
            txtTelefono.Text = "";
        }

        private void habilitarCampos(bool estado)
        {
            lbTipo.Visible = estado;
            rbTipo.Visible = estado;
            lbCarnet.Visible = estado;
            txtCarnet.Visible = estado;
            lbNombre.Visible = estado;
            txtNombre.Visible = estado;
            lbFechaNacimiento.Visible = estado;
            caFechaNacimiento.Visible = estado;
            lbTelefono.Visible = estado;
            txtTelefono.Visible = estado;
            lbCarrera.Visible = estado;
            cboxCarrera.Visible = estado;
        }

        private bool validarCampos()
        {
            if (rbRegistroExistente.SelectedValue.Equals("No"))
            {
                if (rbTipo.SelectedValue.Equals("Estudiante"))
                {
                    if ((txtCedula.Text != "") && (txtCarnet.Text != "") && (txtNombre.Text != "") && (caFechaNacimiento.Text != "") && (txtTelefono.Text != ""))
                    {
                        return true;
                    }
                    return false;
                }
                else
                {
                    if ((txtCedula.Text != "") && (txtNombre.Text != "") && (caFechaNacimiento.Text != "") && (txtTelefono.Text != ""))
                    {
                        return true;
                    }
                    return false;
                }
            }
            else
            {
                if (txtCedula.Text != "")
                {
                    return true;
                }
                return false;
            }
        }
    }
}
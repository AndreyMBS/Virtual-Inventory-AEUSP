using System;

namespace AppInventarioVirtual
{
    public partial class FrmCreditos : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Atras_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}
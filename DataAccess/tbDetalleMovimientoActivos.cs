//------------------------------------------------------------------------------
// <auto-generated>
//     Este código se generó a partir de una plantilla.
//
//     Los cambios manuales en este archivo pueden causar un comportamiento inesperado de la aplicación.
//     Los cambios manuales en este archivo se sobrescribirán si se regenera el código.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataAccess
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbDetalleMovimientoActivos
    {
        public int idMovimiento { get; set; }
        public int idActivo { get; set; }
        public int cantidad { get; set; }
        public string ubicacion { get; set; }
    
        public virtual tbActivo tbActivo { get; set; }
        public virtual tbMovimientoActivo tbMovimientoActivo { get; set; }
    }
}
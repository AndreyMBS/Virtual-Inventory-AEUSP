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
    
    public partial class tbConsumible
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbConsumible()
        {
            this.tbConsumibleAlimentacion = new HashSet<tbConsumibleAlimentacion>();
            this.tbConsumibleSalud = new HashSet<tbConsumibleSalud>();
        }
    
        public int idConsumible { get; set; }
        public string codigoOrganismo { get; set; }
        public string nombre { get; set; }
        public int inventario { get; set; }
    
        public virtual tbOrganismo tbOrganismo { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbConsumibleAlimentacion> tbConsumibleAlimentacion { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbConsumibleSalud> tbConsumibleSalud { get; set; }
    }
}
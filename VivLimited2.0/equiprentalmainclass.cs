//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace VivLimited2._0
{
    using System;
    using System.Collections.Generic;
    
    public partial class equiprentalmainclass
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public equiprentalmainclass()
        {
            this.equiprentalsubclasses = new HashSet<equiprentalsubclass>();
            this.equipmentreservations = new HashSet<equipmentreservation>();
        }
    
        public short Id { get; set; }
        public string EquipCategory { get; set; }
        public string ImgIconUrl { get; set; }
        public string EditedBy { get; set; }
        public Nullable<System.DateTime> DateTimeEdited { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<equiprentalsubclass> equiprentalsubclasses { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<equipmentreservation> equipmentreservations { get; set; }
    }
}
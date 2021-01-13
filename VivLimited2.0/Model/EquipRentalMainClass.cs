namespace VivLimited2._0.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class EquipRentalMainClass
    {
        public EquipRentalMainClass()
        {
            this.EquipRentalSubclasses = new HashSet<EquipRentalSubclass>();
            this.EquipmentReservations = new HashSet<EquipmentReservation>();
        }
        [Key]
        public int Id { get; set; }
        public string EquipCategory { get; set; }
        public string ImgIconUrl { get; set; }
        public string EditedBy { get; set; }
        public DateTime? DateTimeEdited { get; set; }
    
        public virtual ICollection<EquipRentalSubclass> EquipRentalSubclasses { get; set; }

        public virtual ICollection<EquipmentReservation> EquipmentReservations { get; set; }
    }
}

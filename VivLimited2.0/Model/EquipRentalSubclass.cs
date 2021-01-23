namespace VivLimited2._0
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class EquipRentalSubclass
    {
        public EquipRentalSubclass()
        {
            this.EquipRentalImageSliders = new HashSet<EquipRentalImageSlider>();
            this.EquipmentReservations = new HashSet<EquipmentReservation>();
        }
        [Key]
        public int Id { get; set; }
        public string EquipName { get; set; }
        public string Specification { get; set; }
        public bool? Available { get; set; }
        public string Cost { get; set; }
        public short? EquipRentalMainClassId { get; set; }
        public string ImageUrl { get; set; }
        public string EditedBy { get; set; }
        public DateTime? DateTimeEdited { get; set; }
    
        public virtual EquipRentalMainClass equiprentalmainclass { get; set; }
        public virtual ICollection<EquipRentalImageSlider> EquipRentalImageSliders { get; set; }
        public virtual ICollection<EquipmentReservation> EquipmentReservations { get; set; }
    }
}

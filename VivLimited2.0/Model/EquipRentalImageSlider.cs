namespace VivLimited2._0
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class EquipRentalImageSlider
    {
        [Key]
        public int Id { get; set; }
        public string ImageUrl { get; set; }
        public string ImageDescription { get; set; }
        public short? EquipmentSubClassId { get; set; }
        public DateTime? DateTimeEdited { get; set; }
        public string EditedBy { get; set; }
    
        public virtual EquipRentalSubclass EquipRentalSubclass { get; set; }
    }
}

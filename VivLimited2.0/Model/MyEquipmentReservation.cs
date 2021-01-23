namespace VivLimited2._0
{
    using System;
    using System.Collections.Generic;
    
    public class MyEquipmentReservation
    {
        public int Id { get; set; }
        public string Name { get; set; }
        public string Company { get; set; }
        public string PhoneNumb { get; set; }
        public string Email { get; set; }
        public DateTime? StartDate { get; set; }
        public DateTime? EndDate { get; set; }
        public short? EquipmentCategoryId { get; set; }
        public short? EquipmentTypeId { get; set; }
        public string Comments { get; set; }
    
        public virtual EquipRentalMainClass equiprentalmainclass { get; set; }
        public virtual EquipRentalSubclass equiprentalsubclass { get; set; }
    }
}

namespace VivLimited2._0.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Career
    {
        [Key]
        public int Id { get; set; }
        public string JobTitle { get; set; }
        public string JobDescription { get; set; }
        public string HowToApply { get; set; }
        public DateTime? ExpiryDate { get; set; }
        public bool? Publish { get; set; }
        public string EditedBy { get; set; }
        public DateTime? DateTimeEdited { get; set; }
    }
}

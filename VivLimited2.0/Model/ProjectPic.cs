namespace VivLimited2._0.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;

    public class ProjectPic
    {
        [Key]
        public int Id { get; set; }
        [ForeignKey("ProjectId")]
        public int? ProjectId { get; set; }
        public string ImageUrl { get; set; }
        public string Description { get; set; }
        public string CreatedBy { get; set; }
        public DateTime? DateTimeCreated { get; set; }
    
        public virtual Project Project { get; set; }
    }
}

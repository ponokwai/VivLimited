namespace VivLimited2._0.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class Project
    {
        public Project()
        {
            this.ProjectPics = new HashSet<ProjectPic>();
        }
        [Key]
        public int Id { get; set; }
        public string Title { get; set; }
        public string Client { get; set; }
        public string Consultant { get; set; }
        public DateTime? DateAwarded { get; set; }
        public DateTime? DateCompleted { get; set; }
        public string Status { get; set; }
        public string EditedBy { get; set; }
        public DateTime? DateTimeEdited { get; set; }
    
        public virtual ICollection<ProjectPic> ProjectPics { get; set; }
    }
}

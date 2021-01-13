namespace VivLimited2._0.Model
{
    using System;
    using System.ComponentModel.DataAnnotations;

    public class HomePageSlider
    {
        [Key]
        public int Id { get; set; }
        public string ImageUrl { get; set; }
        public string CaptionHeading { get; set; }
        public string CaptionDesc { get; set; }
        public string LastUpdatedBy { get; set; }
        public DateTime? LastUpdateDateTime { get; set; }
    }
}

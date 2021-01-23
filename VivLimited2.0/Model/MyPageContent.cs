namespace VivLimited2._0
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;

    public class MyPageContent
    {
        [Key]
        public int Id { get; set; }
        public string PageTitle { get; set; }
        public string PageText { get; set; }
        public string PageUrl { get; set; }
        public string PageBannerUrl { get; set; }
        public string DefaultPageIconUrl { get; set; }
        public string EditedBy { get; set; }
        public DateTime? DateTimeEdited { get; set; }
    }
}

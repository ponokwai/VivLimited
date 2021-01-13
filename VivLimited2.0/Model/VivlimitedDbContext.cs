using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace VivLimited2._0.Model
{
    public class VivlimitedDbContext : DbContext
    {
        public VivlimitedDbContext()
            : base("name=dbo_vivlimitedEntities")
        {

        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<homepageslider>().
        }

        public virtual DbSet<HomePageSlider> HomePageSliders { get; set; }
        public virtual DbSet<PageContent> PageContents { get; set; }
        public virtual DbSet<Career> Careers { get; set; }
        public virtual DbSet<EquipRentalMainClass> equiprentalmainclasses { get; set; }
        public virtual DbSet<EquipRentalSubclass> EquipRentalSubclasses { get; set; }
        public virtual DbSet<Project> Projects { get; set; }
        public virtual DbSet<ProjectPic> ProjectPics { get; set; }
        public virtual DbSet<EquipRentalImageSlider> EquipRentalImageSliders { get; set; }
        public virtual DbSet<EquipmentReservation> EquipmentReservations { get; set; }
    }
}
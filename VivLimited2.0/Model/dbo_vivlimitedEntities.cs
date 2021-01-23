using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;

namespace VivLimited2._0
{
    public class dbo_vivlimitedEntities : DbContext
    {
        public dbo_vivlimitedEntities()
            : base("name=dbo_vivlimitedEntities")
        {

        }
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            //modelBuilder.Entity<homepageslider>().
        }

        public DbSet<HomePageSlider> homepagesliders { get; set; }
        public DbSet<MyPageContent> pagecontents { get; set; }
        public DbSet<Career> careers { get; set; }
        public DbSet<EquipRentalMainClass> equiprentalmainclasses { get; set; }
        public DbSet<EquipRentalSubclass> equiprentalsubclasses { get; set; }
        public DbSet<Project> projects { get; set; }
        public DbSet<ProjectPic> projectpics { get; set; }
        public DbSet<EquipRentalImageSlider> equiprentalimageSliders { get; set; }
        public DbSet<MyEquipmentReservation> EquipmentReservations { get; set; }
    }
}
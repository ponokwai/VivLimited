using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Web;
using VivLimited2._0.Model;

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

        public virtual DbSet<HomePageSlider> homepagesliders { get; set; }
        public virtual DbSet<PageContent> pagecontents { get; set; }
        public virtual DbSet<Career> careers { get; set; }
        public virtual DbSet<EquipRentalMainClass> equiprentalmainclasses { get; set; }
        public virtual DbSet<EquipRentalSubclass> equiprentalsubclasses { get; set; }
        public virtual DbSet<Project> projects { get; set; }
        public virtual DbSet<ProjectPic> projectpics { get; set; }
        public virtual DbSet<EquipRentalImageSlider> equiprentalimageSliders { get; set; }
        public virtual DbSet<Model.EquipmentReservation> EquipmentReservations { get; set; }
    }
}
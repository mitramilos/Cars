using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Cars.Models
{
    public class Car
    {
        [Key]
        public int Id { get; set; }

        [Column(TypeName ="nvarchar(150)")]
        [Required(ErrorMessage ="Model is required")]
        public string Model { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        [Required(ErrorMessage = "Power is required")]
        public int Power  { get; set; }

        [Column(TypeName = "nvarchar(150)")]
        [Required(ErrorMessage = "Description is required")]
        public string Description { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        public int  Prize { get; set; }

        [ForeignKey("Engine")]
        [DisplayName("Engine Version")]
        public string Version { get; set; }


        [ForeignKey("Whells")]
        [DisplayName("Wheels")]
        public string Name { get; set; }

       


    }
}

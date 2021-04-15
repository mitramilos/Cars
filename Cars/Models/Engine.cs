using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Cars.Models
{
    public class Engine
    {
        [Key]
        public int Id_engine { get; set; }

        [Column(TypeName ="nvarchar(50)")]
        [Required(ErrorMessage = "Engine version is required")]
        public string Version { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        [Required(ErrorMessage = "Engine description is required")]
        [DisplayName("Engine description")]
        public string EDescription { get; set; } 

    }
}

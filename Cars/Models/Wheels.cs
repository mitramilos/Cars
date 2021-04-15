using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Threading.Tasks;

namespace Cars.Models
{
    public class Wheels
    {

        [Key]
        public int ID_Whells { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        [Required(ErrorMessage = "Name is required")]
        public string Name { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        
        public string  Session { get; set; }

        [Column(TypeName = "nvarchar(50)")]
        [Required(ErrorMessage = "Size is required")]
        public int Size { get; set; }


    }
}

using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cars.Models
{
    public class CarsContext: DbContext
    {
        public CarsContext(DbContextOptions<CarsContext> options): base(options)
        {

        }
        public  DbSet<Car> Cars { get; set; }


    }
}

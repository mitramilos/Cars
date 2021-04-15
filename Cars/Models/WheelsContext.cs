using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cars.Models
{
    public class WheelsContext : DbContext 
    {
        public WheelsContext(DbContextOptions<WheelsContext> options) : base(options)
        {

        }

        public DbSet<Wheels> wheels  { get; set; }

    }
}
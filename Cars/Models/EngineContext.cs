using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Cars.Models
{
    public class EngineContext : DbContext
    {
        public EngineContext(DbContextOptions<EngineContext> options) : base(options)
        {

        }

        public DbSet<Engine> Engines { get; set; }

    }
}

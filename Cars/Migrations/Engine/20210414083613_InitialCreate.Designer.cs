﻿// <auto-generated />
using Cars.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

namespace Cars.Migrations.Engine
{
    [DbContext(typeof(EngineContext))]
    [Migration("20210414083613_InitialCreate")]
    partial class InitialCreate
    {
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "2.1.8-servicing-32085")
                .HasAnnotation("Relational:MaxIdentifierLength", 128)
                .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

            modelBuilder.Entity("Cars.Models.Engine", b =>
                {
                    b.Property<int>("Id_engine")
                        .ValueGeneratedOnAdd()
                        .HasAnnotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn);

                    b.Property<string>("EDescription")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)");

                    b.Property<string>("Version")
                        .IsRequired()
                        .HasColumnType("nvarchar(50)");

                    b.HasKey("Id_engine");

                    b.ToTable("Engines");
                });
#pragma warning restore 612, 618
        }
    }
}

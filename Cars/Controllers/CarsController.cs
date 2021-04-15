using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Cars.Models;

namespace Cars.Controllers
{
    public class CarsController : Controller
    {
        private readonly CarsContext _context;

        public CarsController(CarsContext context)
        {
            _context = context;
        }

        // GET: Cars
        public async Task<IActionResult> Index()
        {
            return View(await _context.Cars.ToListAsync());
        }

      

        // GET: Cars/Create
        public IActionResult AddOrEdit(int id=0)
        {
            if (id == 0)
                return View(new Car());
            else
                return View(_context.Cars.Find(id));
        }

        // POST: Cars/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddOrEdit([Bind("Id,Model,Power,Description,Prize,Version,Name")] Car car)
        {
            if (ModelState.IsValid)
            {
                if (car.Id == 0)
                    _context.Add(car);
                else
                    _context.Update(car);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(car);
        }





        // GET: Cars/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            var car = await _context.Cars.FindAsync(id);
            _context.Cars.Remove(car);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));

        }

        }
}

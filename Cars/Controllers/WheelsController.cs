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
    public class WheelsController : Controller
    {
        private readonly WheelsContext _context;

        public WheelsController(WheelsContext context)
        {
            _context = context;
        }

        // GET: Wheels
        public async Task<IActionResult> Index()
        {
            return View(await _context.wheels.ToListAsync());
        }


        // GET: Wheels/Create
        public IActionResult AddOrEdit(int id=0)
        {
            if (id == 0)
                return View(new Wheels());
            else
                return View(_context.wheels.Find(id));
        }

        // POST: Wheels/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddOrEdit([Bind("ID_Whells,Name,Session,Size")] Wheels wheels)
        {
            if (ModelState.IsValid)
            {
                if(wheels.ID_Whells==0)
                 _context.Add(wheels);
                else
                  _context.Update(wheels);

                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(wheels);
        }

      

       

        // GET: Wheels/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            var wheel = await _context.wheels.FindAsync(id);
            _context.wheels.Remove(wheel);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

      
    }
}

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
    public class EnginesController : Controller
    {
        private readonly EngineContext _context;

        public EnginesController(EngineContext context)
        {
            _context = context;
        }

        // GET: Engines
        public async Task<IActionResult> Index()
        {
            return View(await _context.Engines.ToListAsync());
        }

      
        

        // GET: Engines/Create
        public IActionResult AddOrEdit(int id=0)
        {
            if (id == 0)
                return View(new Engine());
            else
                return View(_context.Engines.Find(id));
        }

        // POST: Engines/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> AddOrEdit([Bind("Id_engine,Version,EDescription")] Engine engine)
        {
            if (ModelState.IsValid)
            {    if(engine.Id_engine==0)
                    _context.Add(engine);
                else
                    _context.Update(engine);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            return View(engine);
        }

     

        // GET: Engines/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            var wheels = await _context.Engines.FindAsync(id);
            _context.Engines.Remove(wheels);
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

       
    }
}

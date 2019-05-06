using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using WarehouseManagerment.Core.CSharp;
using WarehouseManagerment.Models;

namespace WarehouseManagerment.Controllers
{
    public class DistributorController : Controller
    {
        // GET: Distributor
        public ActionResult addDistributor()
        {
            ViewBag.CategoryList = CategoryCore.Get();
            return View();
        }
        [HttpPost]
        public ActionResult addDistributor(tbNhaPhanPhoi Distributor)
        {
            DistributorCore.Post(Distributor);
            return RedirectToAction("showDistributors");
        }
        public ActionResult showDistributors()
        {
            ViewBag.DistributorList = DistributorCore.Get();
            return View();
        }
        public ActionResult editDistributor(string distributorId)
        {
            ViewBag.Distributor = DistributorCore.Get(Convert.ToInt32(distributorId));
            ViewBag.CategoryList = CategoryCore.Get();
            return View();
        }
        [HttpPost]
        public ActionResult editDistributor(tbNhaPhanPhoi Distributor)
        {
            DistributorCore.Put(Distributor);
            return RedirectToAction("viewDistributor", new { DistributorId = Distributor.distributorId });
        }
        public ActionResult viewDistributor(string distributorId)
        {
            ViewBag.Distributor = DistributorCore.Get(Convert.ToInt32(distributorId));
            return View();
        }
        public JsonResult deleteDistributor(string distributorId)
        {
            if (DistributorCore.Delete(Convert.ToInt32(distributorId)))
                return Json(true);
            return Json(false);
        }
    }
}
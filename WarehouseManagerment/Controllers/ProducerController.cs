using WarehouseManagerment.Core.CSharp;
using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WarehouseManagerment.Controllers
{
    public class ProducerController : Controller
    {
        public ActionResult addProducer()
        {
            ViewBag.CategoryList = CategoryCore.Get();
            return View();
        }
        [HttpPost]
        public ActionResult addProducer(tbNhaSanXuat Producer)
        {
            ProducerCore.Post(Producer);
            return RedirectToAction("showProducers");
        }
        public ActionResult showProducers()
        {
            ViewBag.ProducerList = ProducerCore.Get();
            return View();
        }
        public ActionResult editProducer(string ProducerId)
        {
            ViewBag.Producer = ProducerCore.Get(Convert.ToInt32(ProducerId));
            ViewBag.CategoryList = CategoryCore.Get();
            return View();
        }
        [HttpPost]
        public ActionResult editProducer(tbNhaSanXuat Producer)
        {
            ProducerCore.Put(Producer);
            return RedirectToAction("viewProducer", new { ProducerId = Producer.producerId });
        }
        public ActionResult viewProducer(string ProducerId)
        {
            ViewBag.Producer = ProducerCore.Get(Convert.ToInt32(ProducerId));
            return View();
        }
        public JsonResult deleteProducer(string ProducerId)
        {
            if (ProducerCore.Delete(Convert.ToInt32(ProducerId)))
                return Json(true);
            return Json(false);
        }
    }
}
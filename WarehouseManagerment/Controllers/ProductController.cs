using WarehouseManagerment.Core.CSharp;
using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WarehouseManagerment.Controllers
{
    public class ProductController : Controller
    {
        public ActionResult addProduct()
        {
            ViewBag.CategoryList = CategoryCore.Get();
            return View();
        }
        [HttpPost]
        public ActionResult addProduct(tbHangHoa Product)
        {
            ProductCore.Post(Product);
            return RedirectToAction("showProducts");
        }
        public ActionResult showProducts()
        {
            ViewBag.ProductList = ProductCore.Get();
            return View();
        }
        public ActionResult editProduct(string ProductId)
        {
            ViewBag.Product = ProductCore.Get(Convert.ToInt32(ProductId));
            ViewBag.CategoryList = CategoryCore.Get();
            return View();
        }
        [HttpPost]
        public ActionResult editProduct(tbHangHoa Product)
        {
            ProductCore.Put(Product);
            return RedirectToAction("viewProduct", new { ProductId = Product.productId });
        }
        public ActionResult viewProduct(string ProductId)
        {
            ViewBag.Product = ProductCore.Get(Convert.ToInt32(ProductId));
            return View();
        }
        public JsonResult deleteProduct(string ProductId)
        {
            if (ProductCore.Delete(Convert.ToInt32(ProductId)))
                return Json(true);
            return Json(false);
        }
    }
}
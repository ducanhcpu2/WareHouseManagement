using WarehouseManagerment.Models;
using WarehouseManagerment.Core.CSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WarehouseManagerment.Controllers
{
    public class OpBillController : Controller
    {

        public ActionResult addOpBill()
        {
            ViewBag.DistributorList = DistributorCore.Get();
            ViewBag.ProductList = ProductCore.Get();
            return View();
        }
        [HttpPost]
        public ActionResult addOpBill(tbPhieuXuat OpBill, string[] amount, string[] priceCurrent, string[] productId)
        {
            tbCT_PhieuXuat[] array = new tbCT_PhieuXuat[amount.Length];
            for (int i = 0; i < amount.Length; i++)
            {
                array[i] = new tbCT_PhieuXuat { amount = Convert.ToInt32(amount[i]), priceCurrent = Convert.ToInt32(priceCurrent[i]), productId = Convert.ToInt32(productId[i]) };
            }
            tbTaiKhoan user = (tbTaiKhoan)Session["user"];
            OpBill.accountId = user.accountId;
            OpBill.priceTotal = 0;
            OpBillCore.Post(OpBill, array);
            return RedirectToAction("showOpBills");
        }
        public ActionResult showOpBills()
        {
            ViewBag.OpBillList = OpBillCore.Get();
            return View();
        }
        public ActionResult editOpBill(int OpBillId)
        {
            ViewBag.OpBill = OpBillCore.Get(OpBillId);
            ViewBag.DistributorList = DistributorCore.Get();
            ViewBag.ProductList = ProductCore.Get();
            return View();
        }
        [HttpPost]
        public ActionResult editOpBill(tbPhieuXuat OpBill, int[] id, int[] productId, int[] amount, int[] priceCurrent)
        {
            OpBillCore.Put(OpBill);
            try
            {
                int j = 0;
                for (int i = 0; i < id.Length; i++)
                {
                    j++;
                    tbCT_PhieuXuat tmp = new tbCT_PhieuXuat { id = id[i], opBillId = OpBill.opBillId, amount = amount[i], priceCurrent = priceCurrent[i], productId = productId[i] };
                    OpBillDetailCore.Put(tmp);
                }

                for (int i = j; i < productId.Length; i++)
                {
                    tbCT_PhieuXuat tmp = new tbCT_PhieuXuat { opBillId = OpBill.opBillId, amount = amount[i], priceCurrent = priceCurrent[i], productId = productId[i] };
                    OpBillDetailCore.Post(tmp);
                }
                OpBillCore.Put(OpBill);
            }
            catch
            {

            }
            return RedirectToAction("viewOpBill", new { OpBillId = OpBill.opBillId });
        }
        public ActionResult viewOpBill(int OpBillId)
        {
            ViewBag.OpBill = OpBillCore.Get(OpBillId);
            return View();
        }
        public JsonResult deleteOpBill(int OpBillId)
        {
            tbPhieuXuat OpBill = OpBillCore.Get(OpBillId);
            try
            {
                foreach (tbCT_PhieuXuat item in OpBill.tbCT_PhieuXuat)
                {
                    OpBillDetailCore.Delete(item.id);
                }
            }
            catch
            {
                return Json(false);
            }
            if (OpBillCore.Delete(OpBillId))
                return Json(true);
            return Json(false);
        }
    }
}
using WarehouseManagerment.Core.CSharp;
using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WarehouseManagerment.Controllers
{
    public class IpBillController : Controller
    {
        dbQLKho db =new dbQLKho();
        public ActionResult addIpBill()
        {
            ViewBag.ProducerList = ProducerCore.Get();
            ViewBag.ProductList = ProductCore.Get();          
            return View();
        }
        [HttpPost]
        public ActionResult addIpBill(tbPhieuNhap IpBill, string[] amount,string[] priceCurrent, string[] productId)
        {
            tbCT_PhieuNhap[] array = new tbCT_PhieuNhap[amount.Length];
            for(int i=0;i<amount.Length;i++)
            {
                array[i] = new tbCT_PhieuNhap { amount = Convert.ToInt32(amount[i]), priceCurrent = Convert.ToInt32(priceCurrent[i]), productId = Convert.ToInt32(productId[i]) };
            }
            tbTaiKhoan user = (tbTaiKhoan)Session["user"];
            IpBill.accountId = user.accountId;
            IpBill.priceTotal = 0;
            IpBillCore.Post(IpBill,array);
            return RedirectToAction("showIpBills");
        }
        public ActionResult showIpBills()
        {
            ViewBag.IpBillList = IpBillCore.Get();
            return View();
        }
        public ActionResult editIpBill(int IpBillId)
        {
            ViewBag.IpBill = IpBillCore.Get(IpBillId);
            ViewBag.ProducerList = ProducerCore.Get();
            ViewBag.ProductList = ProductCore.Get();
            return View();
        }
        [HttpPost]
        public ActionResult editIpBill(tbPhieuNhap IpBill,int[] id,int [] productId,int[] amount,int[] priceCurrent)
        {

            IpBillCore.Put(IpBill);
            try
            {
                int j = 0;

                for (int i=0;i<id.Length;i++)
                {
                    j++;
                    tbHangHoa pro = new tbHangHoa();
                    var u = pro.productId;
                    tbCT_PhieuNhap tmp = new tbCT_PhieuNhap {id=id[i], ipBillId = IpBill.ipBillId, amount = amount[i], priceCurrent = priceCurrent[i], productId = productId[i] };
                    IpBillDetailCore.Put(tmp);
                   // IpBill.priceTotal += amount[i] * priceCurrent[i];
                   // var a = db.tbHangHoas.Where(s=>s.productId == productId[i]).Select(s => new {  amount = s.amount}).FirstOrDefault();
                    // a += tmp.amount;

                }
                for (int i = j; i < productId.Length; i++)
                {
                    tbCT_PhieuNhap tmp = new tbCT_PhieuNhap{ipBillId=IpBill.ipBillId,amount=amount[i],priceCurrent=priceCurrent[i],productId=productId[i] };
                    IpBillDetailCore.Post(tmp);
                    //IpBill.priceTotal += amount[i] * priceCurrent[i];
                    //var a = db.tbHangHoas.Where(s => s.productId == productId[i]).Select(s => new { Nullable<int> Amount = s.amount }).FirstOrDefault();
                   // a += amount[i];
                }
                IpBillCore.Put(IpBill);
            }
            catch
            {

            }
            return RedirectToAction("viewIpBill", new { IpBillId = IpBill.ipBillId });
        }
        public ActionResult viewIpBill(int IpBillId)
        {
            ViewBag.IpBill = IpBillCore.Get(IpBillId);
            return View();
        }
        public JsonResult deleteIpBill(int IpBillId)
        {
            tbPhieuNhap IpBill = IpBillCore.Get(IpBillId);
            try
            {
                foreach (tbCT_PhieuNhap item in IpBill.tbCT_PhieuNhap)
                {
                    IpBillDetailCore.Delete(item.id);
                }
            }
            catch
            {
                return Json(false);
            }
            if (IpBillCore.Delete(IpBillId))
                return Json(true);
            return Json(false);
        }
    }
}
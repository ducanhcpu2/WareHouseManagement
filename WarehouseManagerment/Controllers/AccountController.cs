using WarehouseManagerment.Support.Decryption;
using WarehouseManagerment.Models;
using WarehouseManagerment.Core.CSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WarehouseManagerment.Controllers
{
    public class AccountController : Controller
    {
        // GET: Account
        public ActionResult Login()
        {
            return View();
        }
        //Kiểm tra đăng nhập
        [HttpPost]
        public ActionResult checkOut(string username, string pass)
        {
            dbQLKho db = new dbQLKho();
            var tableAccount = from tbTaiKhoan in db.tbTaiKhoans select tbTaiKhoan;
            foreach (var acc in tableAccount)
            {
                try
                {
                    if (MD5HashCode.getHashCode(pass.Trim()).ToLower().Equals(acc.passWord.Trim()) && acc.userName.Trim().Equals(username.Trim()))
                    {
                        Session["user"] = acc;
                        return RedirectToAction("Index", "Home");
                    }
                }
                catch
                {
                    continue; 
                }
                
            }
            return RedirectToAction("Login");
        }
        //Xem thông tin người dùng
        public ActionResult showInformation()
        {
            if (Session["user"] != null)
            {
                tbTaiKhoan acc = (tbTaiKhoan)Session["user"];
                Session["user"] = AccountCore.GetId(acc.accountId);
                return View();
            }
            return RedirectToAction("Login");
        }
        //end
        //Thay đổi mật khẩu
        public ActionResult changePass()
        {
            if(Session["user"]!=null)
            {
                Session["user"] = Session["user"];
                return View();
            }
            return RedirectToAction("Login");
        }
        [HttpPost]
        public JsonResult changePass(string oldPass,string newPass)
        {
            tbTaiKhoan acc = (tbTaiKhoan)Session["user"];
            if(MD5HashCode.getHashCode(oldPass.Trim()).ToLower().Equals(acc.passWord.Trim()))
            {
                acc.passWord = MD5HashCode.getHashCode(newPass.Trim()).ToLower();
                if (AccountCore.Put(acc))
                    return Json(new {Response= "Đổi mật khẩu thành công!" });
                return Json(new { Response = "Đổi mật khẩu thất bại!" });
            }
            return Json(new {Response = "Mật khẩu cũ không chính xác!" });
        }
        //end
        //Thay đổi thông tin người dùng
        [HttpPost]
        public JsonResult changeInformation(tbTaiKhoan acc)
        {
            tbTaiKhoan user = (tbTaiKhoan)Session["user"];
            acc.accountId = user.accountId;
            acc.passWord = user.passWord;
            acc.userName = user.userName;
            if (AccountCore.Put(acc))
                return Json(new { Response = "Thông tin thay đổi thành công!" });
            return Json(new { Response = "Thông tin thay đổi thất bại!" });
        }
    }
}
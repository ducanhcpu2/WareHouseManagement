using WarehouseManagerment.Models;
using WarehouseManagerment.Core.CSharp;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using Newtonsoft.Json;

namespace WarehouseManagerment.Controllers
{
    public class CategoryController : Controller
    {
        [HttpPost]
        public JsonResult addCategory(string value,string id)
        {
            tbLoaiHangHoa Category = new tbLoaiHangHoa { categoryName = value };
            CategoryCore.Post(Category);
            List<int> valueList = new List<int>();
            List<string> labelList = new List<string>();
            try
            {
                foreach (var item in CategoryCore.Get())
                {
                        valueList.Add(item.categoryId);
                        labelList.Add(item.categoryName);
                }
            }
            catch { }
            return Json(new { valueList = JsonConvert.SerializeObject(valueList), labelList = JsonConvert.SerializeObject(labelList), id = id });
        }
    }
}
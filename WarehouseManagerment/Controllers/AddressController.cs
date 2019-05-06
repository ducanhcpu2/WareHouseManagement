using WarehouseManagerment.Core.CSharp;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace WarehouseManagerment.Controllers
{
    public class AddressController : Controller
    {
        // GET: Address
        [HttpPost]
        public JsonResult getDistrictList(string cityId,string containDistrict)
        {
            var data = JsonConvert.SerializeObject(AddressCore.getDistrictList(Convert.ToInt32(cityId)));
            return Json(new { containDistrict = containDistrict, data=data });
        }
        [HttpPost]
        public JsonResult getTownList(string districtId,string containTown)
        {
            var data = JsonConvert.SerializeObject(AddressCore.getTownList(Convert.ToInt32(districtId)));
            return Json(new { containTown = containTown, data = data });
        }
    }
}
using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WarehouseManagerment.Core.CSharp
{
    public class MenuCore
    {
        public static List<Menu> Get()
        {
            dbQLKho db = new dbQLKho();
            return (from lst in db.Menus where lst.parentId==null select lst).ToList();
        }
    }
}
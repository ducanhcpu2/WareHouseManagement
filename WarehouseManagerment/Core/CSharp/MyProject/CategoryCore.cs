using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WarehouseManagerment.Core.CSharp
{
    public class CategoryCore
    {
        public static List<tbLoaiHangHoa> Get()
        {
            dbQLKho db = new dbQLKho();
            return db.tbLoaiHangHoas.ToList();
        }
        public static tbLoaiHangHoa Get(int categoryId)
        {
            dbQLKho db = new dbQLKho();
            return db.tbLoaiHangHoas.Single(x => x.categoryId==categoryId);
        }
        public static bool Put(tbLoaiHangHoa category)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.Entry(category).State = EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Post(tbLoaiHangHoa category)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.tbLoaiHangHoas.Add(category);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Delete(int categoryId)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                tbLoaiHangHoa category = db.tbLoaiHangHoas.Single(x => x.categoryId==categoryId);
                db.tbLoaiHangHoas.Remove(category);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
    }
}
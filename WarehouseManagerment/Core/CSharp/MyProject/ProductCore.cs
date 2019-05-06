using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WarehouseManagerment.Core.CSharp
{
    public class ProductCore
    {
        public static List<tbHangHoa> Get()
        {            
            dbQLKho db = new dbQLKho();
            return db.tbHangHoas.ToList();
        }
        public static tbHangHoa Get(int productId)
        {
            dbQLKho db = new dbQLKho();
            return db.tbHangHoas.Single(x => x.productId==productId);
        }
        public static bool Put(tbHangHoa product)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.Entry(product).State = EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Post(tbHangHoa product)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.tbHangHoas.Add(product);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Delete(int productId)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                tbHangHoa product = db.tbHangHoas.Single(x => x.productId==productId);
                db.tbHangHoas.Remove(product);
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
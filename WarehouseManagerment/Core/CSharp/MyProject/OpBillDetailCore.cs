using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WarehouseManagerment.Core.CSharp
{
    public class OpBillDetailCore
    {
        public static List<tbCT_PhieuXuat> Get()
        {
            dbQLKho db = new dbQLKho();
            return db.tbCT_PhieuXuat.ToList();
        }
        public static tbCT_PhieuXuat Get(int opBillId)
        {
            dbQLKho db = new dbQLKho();
            return db.tbCT_PhieuXuat.Single(x => x.opBillId == opBillId);
        }
        public static bool Put(tbCT_PhieuXuat opBill)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.Entry(opBill).State = EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Post(tbCT_PhieuXuat opBill)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.tbCT_PhieuXuat.Add(opBill);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Delete(int opBillId)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                tbCT_PhieuXuat opBill = db.tbCT_PhieuXuat.Single(x => x.opBillId == opBillId);
                db.tbCT_PhieuXuat.Remove(opBill);
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
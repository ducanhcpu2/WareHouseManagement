using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WarehouseManagerment.Core.CSharp
{
    public class OpBillCore
    {
        public static List<tbPhieuXuat> Get()
        {
            dbQLKho db = new dbQLKho();
            return db.tbPhieuXuats.ToList();
        }
        public static tbPhieuXuat Get(int opBillId)
        {
            dbQLKho db = new dbQLKho();
            return db.tbPhieuXuats.Single(x => x.opBillId==opBillId);
        }
        public static bool Put(tbPhieuXuat opBill)
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
        public static bool Post(tbPhieuXuat opBill, tbCT_PhieuXuat[] array)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.tbPhieuXuats.Add(opBill);
                db.SaveChanges();
                dbQLKho db2 = new dbQLKho();
                tbPhieuXuat item = db2.tbPhieuXuats.ToList().LastOrDefault();
                foreach (var itm in array)
                {
                    itm.opBillId = item.opBillId;
                    OpBillDetailCore.Post(itm);
                }
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
                tbPhieuXuat opBill = db.tbPhieuXuats.Single(x => x.opBillId==opBillId);
                db.tbPhieuXuats.Remove(opBill);
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
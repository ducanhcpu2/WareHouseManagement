using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WarehouseManagerment.Core.CSharp
{
    public class IpBillCore
    {
        public static List<tbPhieuNhap> Get()
        {
            dbQLKho db = new dbQLKho();
            return db.tbPhieuNhaps.ToList();
        }
        public static tbPhieuNhap Get(int ipBillId)
        {
            dbQLKho db = new dbQLKho();
            return db.tbPhieuNhaps.Single(x => x.ipBillId==ipBillId);
        }
        public static bool Put(tbPhieuNhap ipBill)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.Entry(ipBill).State = EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Post(tbPhieuNhap ipBill,tbCT_PhieuNhap[] array)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.tbPhieuNhaps.Add(ipBill);
                db.SaveChanges();
                dbQLKho db2 = new dbQLKho();
                tbPhieuNhap item = db2.tbPhieuNhaps.ToList().LastOrDefault();
                foreach (var itm in array)
                {
                    itm.ipBillId = item.ipBillId;
                    IpBillDetailCore.Post(itm);
                }
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Delete(int ipBillId)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                tbPhieuNhap ipBill = db.tbPhieuNhaps.Single(x => x.ipBillId == ipBillId);
                db.tbPhieuNhaps.Remove(ipBill);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        public static bool Delete_2(int ipBillId)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                tbPhieuNhap ipBill = db.tbPhieuNhaps.Single( x => x.ipBillId == ipBillId );
                db.tbPhieuNhaps.Remove(ipBill);
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
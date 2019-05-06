using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WarehouseManagerment.Core.CSharp
{
    public class IpBillDetailCore
    {
        public static List<tbCT_PhieuNhap> Get()
        {
            dbQLKho db = new dbQLKho();
            return db.tbCT_PhieuNhap.ToList();
        }
        public static tbCT_PhieuNhap Get(int ipBillDetailId)
        {
            dbQLKho db = new dbQLKho();
            return db.tbCT_PhieuNhap.Single(x => x.id == ipBillDetailId);
        }
        public static bool Put(tbCT_PhieuNhap ipBillDetail)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.Entry(ipBillDetail).State = EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Post(tbCT_PhieuNhap ipBillDetail)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.tbCT_PhieuNhap.Add(ipBillDetail);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Delete(int ipBillDetailId)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                tbCT_PhieuNhap ipBillDetail = db.tbCT_PhieuNhap.Single(x => x.id == ipBillDetailId);
                db.tbCT_PhieuNhap.Remove(ipBillDetail);
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
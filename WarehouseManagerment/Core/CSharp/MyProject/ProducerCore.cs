using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WarehouseManagerment.Core.CSharp
{
    public class ProducerCore
    {
        public static List<tbNhaSanXuat> Get()
        {
            dbQLKho db = new dbQLKho();
            return db.tbNhaSanXuats.ToList();
        }
        public static tbNhaSanXuat Get(int producerId)
        {
            dbQLKho db = new dbQLKho();
            return db.tbNhaSanXuats.Single(x => x.producerId==producerId);
        }
        public static bool Put(tbNhaSanXuat producer)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.Entry(producer).State = EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Post(tbNhaSanXuat producer)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.tbNhaSanXuats.Add(producer);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Delete(int producerId)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                tbNhaSanXuat producer = db.tbNhaSanXuats.Single(x => x.producerId==producerId);
                db.tbNhaSanXuats.Remove(producer);
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
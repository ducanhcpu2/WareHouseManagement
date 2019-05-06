using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.Entity;

namespace WarehouseManagerment.Core.CSharp
{
    public class DistributorCore
    {
        public static List<tbNhaPhanPhoi> Get()
        {
            dbQLKho db = new dbQLKho();
            return db.tbNhaPhanPhois.ToList();
        }
        public static tbNhaPhanPhoi Get(int distributorId)
        {
            dbQLKho db = new dbQLKho();
            return db.tbNhaPhanPhois.Single(x => x.distributorId==distributorId);
        }
        public static bool Put(tbNhaPhanPhoi distributor)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.Entry(distributor).State = EntityState.Modified;
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Post(tbNhaPhanPhoi distributor)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                db.tbNhaPhanPhois.Add(distributor);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }

        internal static void Put(tbNhaSanXuat distributor)
        {
            throw new NotImplementedException();
        }

        public static bool Delete(int distributorId)
        {
            try
            {
                dbQLKho db = new dbQLKho();
                tbNhaPhanPhoi distributor = db.tbNhaPhanPhois.Single(x => x.distributorId==distributorId);
                db.tbNhaPhanPhois.Remove(distributor);
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
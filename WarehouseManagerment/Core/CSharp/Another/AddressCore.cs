using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WarehouseManagerment.Core.CSharp
{
    public class AddressCore
    {

        public static string getStrAddress(int townId)
        {
            try
            {
                string result = "";
                tbXa_ xa = dbAddress.tbXa_.Single(x => x.MaXa == townId);
                result += xa.TenXa+", ";
                tbHuyen_ huyen = dbAddress.tbHuyen_.Single(x => x.MaHuyen == xa.MaHuyen);
                result += huyen.TenHuyen+", ";
                result += dbAddress.tbTinh_.Single(x => x.MaTinh == huyen.MaTinh).TenTinh;
                return result;
            }
            catch
            {
                return "-1";
            }

        }
        public static List<tbTinh_> getCityList()
        {
            return dbAddress.tbTinh_.ToList();
        }
        public static List<tbHuyen_> getDistrictList(int cityId)
        {
            return (from distry in dbAddress.tbHuyen_ where distry.MaTinh == cityId select distry).ToList();
        }
        public static List<tbXa_> getTownList(int distryId)
        {
            return (from town in dbAddress.tbXa_ where town.MaHuyen == distryId select town).ToList();
        }
        private static dbDiaChi dbAddress = new dbDiaChi();
    }
    
}
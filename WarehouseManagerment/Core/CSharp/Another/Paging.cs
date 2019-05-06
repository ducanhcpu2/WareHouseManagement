using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
namespace WarehouseManagerment.Core.CSharp
{
    public class Page
    {

        //--------------------------
        public int currentPage ; //Biến để xác định số của trang hiện tại
        public int totalPage; // Biến chứa tổng số trang của source Data
        public int _sizeOnPage ;//Số lượng hàng trong một trang        
    }
    public class paging<T>
    {

        public static List<T> Convert(Page p, List<T> sourceData)
        {
            try
            {
                var items = sourceData.Skip((p.currentPage - 1) * p._sizeOnPage).Take(p._sizeOnPage);
                return items.ToList();
            }
            catch
            {
                return null;
            }
        }
    }
}
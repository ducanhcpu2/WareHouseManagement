//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace WarehouseManagerment.Models
{
    using System;
    using System.Collections.Generic;
    
    public partial class tbCT_PhieuXuat
    {
        public int id { get; set; }
        public Nullable<int> opBillId { get; set; }
        public Nullable<int> productId { get; set; }
        public Nullable<int> amount { get; set; }
        public Nullable<int> priceCurrent { get; set; }
    
        public virtual tbPhieuXuat tbPhieuXuat { get; set; }
        public virtual tbHangHoa tbHangHoa { get; set; }
    }
}

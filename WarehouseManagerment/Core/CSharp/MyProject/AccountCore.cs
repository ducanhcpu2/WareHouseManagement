using WarehouseManagerment.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WarehouseManagerment.Core.CSharp
{
    public class AccountCore
    {

        public static tbTaiKhoan GetId(int id)
        {
            tbTaiKhoan acc = (from account in db.tbTaiKhoans where account.accountId == id select account).FirstOrDefault();
            return acc; 
        }
        public static bool Put(tbTaiKhoan account)
        {
            tbTaiKhoan acc = db.tbTaiKhoans.Single(x => x.accountId == account.accountId);
            acc.accountName = account.accountName;
            acc.accountDate = account.accountDate;
            acc.accountImage = account.accountImage;
            acc.accountNumberPhone = account.accountNumberPhone;
            acc.accountSex = account.accountSex;
            acc.accountTown = account.accountTown;
            acc.accountAddress = account.accountAddress;
            acc.userName = account.userName;
            acc.passWord = account.passWord;
            try
            {
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        public static bool Post(tbTaiKhoan account)
        {
            try
            {
                db.tbTaiKhoans.Add(account);
                db.SaveChanges();
                return true;
            }
            catch
            {
                return false;
            }
        }
        private static dbQLKho db = new dbQLKho();
    }
}
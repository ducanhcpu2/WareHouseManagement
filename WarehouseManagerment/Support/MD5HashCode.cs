using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Security.Cryptography;
namespace WarehouseManagerment.Support.Decryption
{
     class MD5HashCode
    {
        public static string getHashCode(string temp)
        {
            string result = "";
            Byte[] medium = System.Text.Encoding.UTF8.GetBytes(temp);
            MD5CryptoServiceProvider md5 = new MD5CryptoServiceProvider();
            medium = md5.ComputeHash(medium);
            foreach (Byte convert in medium)
            {
                result += convert.ToString("X2");
            }
            return result;
        }
    }
}
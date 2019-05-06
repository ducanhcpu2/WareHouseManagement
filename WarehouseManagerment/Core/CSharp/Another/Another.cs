using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
namespace WarehouseManagerment.Core.CSharp.Jker
{
    #region Jker_Date
    public class JkDate
    {
        public static DateTime changeDate(DateTime date)
        {
            string[] str = date.ToString("dd/MM/yyy").Split('/');
            return new DateTime(Convert.ToInt32(str[2]),Convert.ToInt32(str[0]),Convert.ToInt32(str[1]));
        }        
    }
    #endregion Jker_Date    
    #region Jker_Json
    public class JkJson
    {
        public static string toJson(object data)
        {
            var res = JsonConvert.SerializeObject(data, Formatting.None,
                   new JsonSerializerSettings() { ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore });
            return res;
        }        
    }
    #endregion Jker_Json
    #region Jker_Response
    public class JkResponseData
    {
        #region properties
        public object data { get; set; }
        public bool status { get; set; }
        public string error { get; set; }
        public string mess { get; set; }
        #endregion properties
        #region methods
        public JkResponseData(object _data,bool _status,string _error,string _mess)
        {
            this.data = _data;
            this.status = _status;
            this.error = _error;
            this.mess = _mess;
        }
        public static string  toReturn(object obj, bool status, string error, string mess)
        {
            return JkJson.toJson(new JkResponseData(obj, status, error, mess));
        }
        #endregion
    }
    #endregion Jker_Response
    #region Jker_Message
    public class JkMess
    {
        public const string done = "Xong";
        public const string success = "Thành công";
        public const string failure = "Thất bại";
        public const string error = "Lỗi";
    }
    #endregion Jker_Message
}
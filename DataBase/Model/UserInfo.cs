using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataBase.Model
{
    [Serializable]
    public class UserInfo
    {
        public string User_ID { get; set; }
        public string User_Code { get; set; }
        public string User_Name { get; set; }
    }
}

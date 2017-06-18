using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataBase.Model
{
    [Serializable]
    public class BlackUser
    {
        public string BlackID { get; set; }
        public String Card_Id { get; set; }
        public String Card_Name { get; set; }
        public string U_Tel { get; set; }
        public string User_ID { get; set; }
        public string User_Name { get; set; }
        public int STATE { get; set; }
        public DateTime AddDate { get; set; }
        public string MEMO { get; set; }
        public int FLAG { get; set; }
        public DateTime CreateDate { get; set; }
    }
}

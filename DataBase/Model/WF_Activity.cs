using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataBase.Model
{
    [Serializable]
    public class WF_Activity
    {
        public string Id { get; set; }
        public string FlowInfoId { get; set; }
        public string ActName { get; set; }
        public int Step { get; set; }
        public string Department { get; set; }
        public string RoleId { get; set; }
        public string GroupId { get; set; }
        public int ApproverCount { get; set; }
        public int ApproveType { get; set; }
        public DateTime CreateTime { get; set; }
    }
}

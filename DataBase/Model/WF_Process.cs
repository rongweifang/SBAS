using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataBase.Model
{
    [Serializable]
    public class WF_Process
    {
        public int Id { get; set; }
        public string WorFlowId { get; set; }
        public string ActivityId { get; set; }
        public int Step { get; set; }
        public string ApproverID { get; set; }
        public int Operate { get; set; }
        public DateTime OperateTime { get; set; }
        public string Remark { get; set; }
        public bool IsFinish { get; set; }
        public DateTime CreateTime { get; set;
        }
    }
}

using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataBase.Model
{
    [Serializable]
    public class WF_WorkFlow
    {
        public string Id { get; set; }
        public string WorkInfoId { get; set; }
        public string ContractId { get; set; }
        public string CurrentActivityId { get; set; }
        public string NextActivityId { get; set; }
        public string StatusDescrip { get; set; }
        public string Requester{ get; set; }
        public string Creater { get; set; }
        public int WFStatus { get; set; }
        public bool IsFinish { get; set; }
        public DateTime CreateTime { get; set; }

    }
}

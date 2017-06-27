using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace DataBase.Model
{
    [Serializable]
    public class WF_WorkFlowInfo
    {
        public string ID { get; set; }
        public string WFName { get; set; }
        public string Descript { get; set; }
        public double AmountFrom { get; set; }
        public double AmountTo { get; set; }
        public DateTime CreateTime { get; set; }
    }
}

using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Busines.IDAO
{
    public interface SR_WorkFlow_IDAO
    {
        DataTable GetWorkFlowList();
        DataTable GetWorkFlowItemList(string ParentId);
        string GetWorkFlowName(string ParentId);
        DataTable GetWorkFLowActionList();
    }
}

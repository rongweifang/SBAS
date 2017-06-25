using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
namespace DataBase.Enums
{
    public enum WorkFlowStatus
    {
        [Description("审核中")]
        Approving = 1,
        [Description("拒绝")]
        Reject = 2,
        [Description("后退")]
        Back = 3,
        [Description("取消")]
        Cancel = 4,
        [Description("重新提交")]
        Resubmit = 5,
        [Description("结束")]
        End = 6
    }
}

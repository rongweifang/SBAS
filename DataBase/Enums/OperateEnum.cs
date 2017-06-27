using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
namespace DataBase.Enums
{
    public enum OperateEnum
    {
        [Description("提交")]
        Submit=1,
        [Description("通过")]
        Approve=2,
        [Description("拒绝")]
        Reject =3,
        [Description("退回")]
        Back =5,
        [Description("取消")]
        Cancel =5,
        [Description("重新提交")]
        Resubmit =6
    }
}

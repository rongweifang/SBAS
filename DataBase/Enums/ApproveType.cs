using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel;
namespace DataBase.Enums
{
    public enum ApproveType
    {
        [Description("角色")]
        Role=1,
        [Description("部门")]
        Department=2,
        [Description("提交者")]
        Submitter=3,
        [Description("用户组")]
        Group=4,
        [Description("跳过仅显示")]
        Skip=5
    }
}

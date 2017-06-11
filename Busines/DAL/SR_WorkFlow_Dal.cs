using Busines.IDAO;
using Common.DotNetData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;

namespace Busines.DAL
{
    public class SR_WorkFlow_Dal : SR_WorkFlow_IDAO
    {
        public DataTable GetWorkFlowList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT WorkFlow_ID,WorkFlow_Name,DeleteMark,ReMark,CreateDate,CreateUserId,CreateUserName,ModifyDate,ModifyUserId,ModifyUserName ");
            strSql.Append("FROM Tickets_WorkFlow ");
            strSql.Append("ORDER BY CreateDate ASC");

            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }
        public DataTable GetWorkFlowItemList(string ParentId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT Item_ID,Item_Name,ParentId,UserGroup_ID,(SELECT WorkFlow_Name FROM Tickets_WorkFlow WHERE WorkFlow_ID=WF.ParentId) AS ParentName,(SELECT UserGroup_Name FROM Base_UserGroup WHERE UserGroup_ID=WF.UserGroup_ID) AS UserGroupName,SortCode,ReMark,DeleteMark,CreateDate,CreateUserId,CreateUserName,ModifyDate,ModifyUserId,ModifyUserName ");
            strSql.Append("FROM Tickets_WorkFlowItem WF ");
            strSql.Append("WHERE ParentId='" + ParentId + "'");
            strSql.Append("ORDER BY SortCode ASC");

            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }
        public string GetWorkFlowName(string ParentId)
        {
            string FlowName="";
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT WorkFlow_Name ");
            strSql.Append("FROM Tickets_WorkFlow ");
            strSql.Append("WHERE WorkFlow_ID='" + ParentId + "'");

            DataTable dt= DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
            if (DataTableHelper.IsExistRows(dt))
            {
                FlowName = dt.Rows[0]["WorkFlow_Name"].ToString();
            }
            return FlowName;
        }
        public DataTable GetWorkFLowActionList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT Menu_Id,(SELECT Menu_Name FROM Base_SysMenu WHERE Menu_Id=WFA.Menu_Id) AS Ticket_Name,WorkFlow_ID,(SELECT WorkFlow_Name FROM Tickets_WorkFlow WHERE WorkFlow_ID=WFA.WorkFlow_ID) AS WorkFlowName,DeleteMark,CreateDate,CreateUserId,CreateUserName,ModifyDate,ModifyUserId,ModifyUserName ");
            strSql.Append("FROM Tickets_WorkFLowAction WFA ");
            strSql.Append("ORDER BY CreateDate ASC");

            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }
    }
}

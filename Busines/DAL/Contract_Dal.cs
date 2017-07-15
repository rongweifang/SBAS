using Busines.IDAO;
using Common.DotNetData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.SessionState;
using Common.DotNetCode;
using Common.DotNetBean;

namespace Busines.DAL
{
    public class Contract_Dal : Contract_IDAO, IRequiresSessionState
    {
        public bool IsInitFinger(string UID, string ContractType)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat(@"DECLARE @UID NVARCHAR(50)='{0}'
INSERT INTO Contract_Finger (UID,ContractType,ClassID,FingerCode,FingerName,SignCode,Memo) 
SELECT @UID AS UID,ContractType,ClassID,FingerCode,FingerName,SignCode,Memo FROM Contract_Finger_TemP WHERE ContractType='{1}'", UID, ContractType);

            int count = DataFactory.SqlDataBase().ExecuteBySql(sb);
            return count > 0 ? true : false;


        }

        public double GetLoan(string ContractID)
        {
            double loan = 0d;
            StringBuilder sb = new StringBuilder();
            sb.Append(@"SELECT M_Loan  FROM View_Contract  WHERE [UID]=@ContractID");

            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb, new SqlParam[] { new SqlParam("@ContractID", ContractID) });
            if (DataTableHelper.IsExistRows(dt))
            {
                if (double.TryParse(dt.Rows[0][0].ToString(), out loan))
                {

                }
            }
            return loan;
        }

        public DataTable GetApproveListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT *  ");
            strSql.Append("FROM View_Approve U");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "createdate", "DESC", pageIndex, pageSize, ref count);
        }
        public DataTable GetMyApproveListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            strSql.Append("SELECT *  ");
            strSql.AppendFormat("FROM (SELECT VA.* FROM View_Approve VA , Base_UserRole BUR WHERE VA.RoleId=BUR.Roles_ID AND WFStatus=1 AND BUR.User_ID='{0}') U", UserId);
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "createdate", "DESC", pageIndex, pageSize, ref count);
        }

        public DataTable GetMyApproveList(StringBuilder SqlWhere)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            strSql.Append("SELECT *  ");
            strSql.AppendFormat("FROM (SELECT VA.* FROM View_Approve VA , Base_UserRole BUR WHERE VA.RoleId=BUR.Roles_ID AND WFStatus=1 AND BUR.User_ID='{0}') U", UserId);
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);

        }

    }
}

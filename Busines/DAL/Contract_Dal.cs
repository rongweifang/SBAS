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
using System.Collections;

namespace Busines.DAL
{
    public class Contract_Dal : Contract_IDAO, IRequiresSessionState
    {
        public DataTable GetContractTypeList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM Contract_Type ORDER BY CID ASC");
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }

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
        public DataTable GetMyApproveOverListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            strSql.Append("SELECT *  ");
            strSql.AppendFormat("FROM (SELECT  VA.*,WP.Operate,WP.IsPass FROM WF_WorkFlow WF LEFT JOIN WF_Process WP ON WF.Id=WP.WorFlowId LEFT JOIN View_Approve VA ON WF.Id=VA.Id  WHERE ApproverID = '{0}') U", UserId);
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "createdate", "DESC", pageIndex, pageSize, ref count);
        }
        public DataTable GetMyApproveOverList(StringBuilder SqlWhere)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            strSql.Append("SELECT *  ");
            strSql.AppendFormat("FROM (SELECT  VA.*,WP.Operate,WP.IsPass FROM WF_WorkFlow WF LEFT JOIN WF_Process WP ON WF.Id=WP.WorFlowId LEFT JOIN View_Approve VA ON WF.Id=VA.Id  WHERE ApproverID = '{0}') U", UserId);
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
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

        public bool InsertProcess(string CID, bool IsPass, string Operat, string SignBase)
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("View_Approve", "Id", CID);

            Hashtable ha = new Hashtable();
            ha["APPROVERID"] = RequestSession.GetSessionUser().UserId.ToString();
            ha["WORFLOWID"] = ht["ID"].ToString();
            ha["ACTIVITYID"] = ht["ACTIVITYID"].ToString();
            ha["Operate"] = Operat;
            ha["STEP"] = ht["STEP"];
            ha["OPERATETIME"] = DateTime.Now.ToString();
            ha["SIGNBASE"] = SignBase;
            ha["ISPASS"] = IsPass ? "1" : "0";
            //Operate
            return DataFactory.SqlDataBase().Submit_AddOrEdit("WF_Process", "id", "", ha);
        }

        public int ApproveDisose(string CID, bool IsPass, string Operat, string SignBase)
        {
            int result = 0;
            bool pro = InsertProcess(CID, IsPass, Operat, SignBase);
            if (pro)
            {
                if (IsPass)
                {
                    Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("View_Approve", "Id", CID);

                    string sqltable = string.Format(" (SELECT TOP 1 * FROM  WF_Activity WHERE FlowInfoId='{0}' AND Step>{1}) B ", ht["WORKINFOID"].ToString(), ht["STEP"].ToString());

                    Hashtable hb = DataFactory.SqlDataBase().GetHashtableById(sqltable, "FlowInfoId", ht["WORKINFOID"].ToString());
                    if (hb.Count > 0 && hb.Contains("FLOWINFOID"))
                    {
                        StringBuilder sb = new StringBuilder();
                        sb.AppendFormat("UPDATE WF_WorkFlow SET CurrentActivityId='{0}' WHERE Id='{1}'", hb["ID"].ToString(), CID);

                        int count = DataFactory.SqlDataBase().ExecuteBySql(sb);
                        if (count > 0)
                        {
                            result = 1;
                            //ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批成功！');setTimeout('OpenClose()','100');</script>");
                        }
                        else
                        {
                            result = 2;
                            //ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批失败！');</script>");
                            //Save.Enabled = true;
                        }
                    }
                    else
                    {
                        //结束
                        StringBuilder sb = new StringBuilder();
                        sb.AppendFormat("UPDATE WF_WorkFlow SET IsFinish=1,WFStatus=6,CurrentActivityId='' WHERE Id='{0}'", CID);

                        int count = DataFactory.SqlDataBase().ExecuteBySql(sb);
                        if (count > 0)
                        {
                            result = 4;
                            // ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批结束！');setTimeout('OpenClose()','100');</script>");
                        }
                        else
                        {
                            result = 3;
                            //ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('审批结束失败！');</script>");
                            //Save.Enabled = true;
                        }
                    }
                }
                else
                {
                    StringBuilder sbback = new StringBuilder();
                    sbback.AppendFormat("UPDATE WF_WorkFlow SET CurrentActivityId=(SELECT TOP 1 ID FROM WF_Activity WHERE FlowInfoId=(SELECT WorkInfoId FROM WF_WorkFlow WHERE Id='{0}') ORDER BY Step ASC) WHERE Id='{0}'", CID);

                    int count = DataFactory.SqlDataBase().ExecuteBySql(sbback);
                    if (count > 0)
                    {
                        result = 1;
                    }
                    else
                    {
                        result = 2;
                    }
                }
            }
            else
            {
                result = 2;
            }
            return result;
        }

        //GetContract_SelectListPage
        public DataTable GetContract_SelectListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            strSql.Append("SELECT *  ");
            strSql.Append("FROM (SELECT CS.* ,CT.ContractName FROM Contract_Select CS,Contract_Type CT WHERE CS.ContractType=CT.ContractType) U ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "SL_Order", "ASC", pageIndex, pageSize, ref count);
        }
        public DataTable GetContract_SelectList(StringBuilder SqlWhere)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            strSql.Append("SELECT *  ");
            strSql.Append("FROM (SELECT CS.* ,CT.ContractName FROM Contract_Select CS,Contract_Type CT WHERE CS.ContractType=CT.ContractType) U ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }

        public DataTable GetContract_SelectSubList(string SL_ID)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            strSql.Append("SELECT *  ");
            strSql.AppendFormat("FROM Contract_SelectSub U WHERE SL_ID='{0}'", SL_ID);
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }

        public bool CreateContract(string UID,string ContractContent)
        {
            string CreateUser = RequestSession.GetSessionUser().UserName.ToString();
            string User_Code = RequestSession.GetSessionUser().User_Account.ToString();
            StringBuilder sb = new StringBuilder();

            sb.Append("INSERT INTO Contract_History (UID,ContractContent,CreateUser,User_Code) VALUES (@UID,@ContractContent,@CreateUser,@User_Code)");

            SqlParam[] param = new SqlParam[] { new SqlParam("@UID", UID), new SqlParam("@ContractContent", ContractContent), new SqlParam("@CreateUser", CreateUser), new SqlParam("@User_Code", User_Code) };
            int count = DataFactory.SqlDataBase().ExecuteBySql(sb, param);
            return count > 0 ? true : false;

        }

        public bool IsApproving(string UID)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT COUNT(1) FROM View_Approve WHERE UID='{0}' AND (IsFinish=1 OR WFStatus =6 OR ISNULL(Step,0)>1) ", UID);

            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);

            return int.Parse(dt.Rows[0][0].ToString()) >0 ? false : true;
        }
        public DataTable GetHistoryListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            strSql.Append("SELECT *  ");
            strSql.Append("FROM (SELECT *  FROM View_History VH WHERE VH.HUID NOT IN(SELECT HUID FROM View_History WHERE CreateDate<(SELECT MAX(CreateDate) FROM View_History WHERE UID=VH.UID) AND UID=VH.UID)) U ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "CreateDate", "DESC", pageIndex, pageSize, ref count);
        }

        public string GetUIDbyHUID(string HUID)
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_History", "HUID", HUID);
            if (ht.Count>0 &&ht!=null)
            {
                return ht["UID"].ToString();
            }
            else
            {
                return "";
            }
        }

        public bool IsExistApprove(string UID)
        {
            int count = DataFactory.SqlDataBase().IsExist("WF_WorkFlow", "ContractId", UID);
            return count > 0 ? true : false;
        }

    }
}

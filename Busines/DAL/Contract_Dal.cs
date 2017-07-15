﻿using Busines.IDAO;
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
            strSql.AppendFormat("FROM (SELECT WF.*,WP.Step,WP.Operate,WP.OperateTime as createdate,WP.IsPass FROM WF_WorkFlow WF LEFT JOIN WF_Process WP ON WF.Id=WP.WorFlowId WHERE ApproverID = '{0}') U", UserId);
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "createdate", "DESC", pageIndex, pageSize, ref count);
        }
        public DataTable GetMyApproveOverList(StringBuilder SqlWhere)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            strSql.Append("SELECT *  ");
            strSql.AppendFormat("FROM (SELECT WF.*,WP.Step,WP.Operate,WP.OperateTime as createdate,WP.IsPass FROM WF_WorkFlow WF LEFT JOIN WF_Process WP ON WF.Id=WP.WorFlowId WHERE ApproverID = '{0}') U", UserId);
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
            }
            else
            {
                result = 2;
            }
            return result;
        }

    }
}

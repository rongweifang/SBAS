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
using Busines.MODEL;
using Common.SendMessage;


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
                            //Organization_Zipcode
                            if (IsSendMessage(RequestSession.GetSessionUser().OrganizationID.ToString()))
                            {
                                //通过角色获取用户
                                StringBuilder su = new StringBuilder();
                                su.AppendFormat("SELECT USER_ID FROM Base_UserRole BU LEFT JOIN WF_Activity WA ON BU.Roles_ID=WA.RoleId WHERE WA.Id='{0}'", hb["ID"].ToString());
                                DataTable du = DataFactory.SqlDataBase().GetDataTableBySQL(su);
                                if (DataTableHelper.IsExistRows(du))
                                {
                                    foreach (DataRow dr in du.Rows)
                                    {
                                        SendMsg(dr["USER_ID"].ToString());
                                    }
                                }
                                
                            }
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
        public DataTable GetContractInfoByID(string UID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT *  ");
            strSql.Append("FROM View_Contract ");
            strSql.AppendFormat("WHERE UID='{0}'", UID);
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }
        public bool Contract_Loan_Add(Contract_Loan_Model model)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into Contract_Loan(");
            strSql.Append("ContractID,Card_ID,Card_Name,M_Loan,Loan_Balance,M_Loan_Months,M_Replay_Type,Current_Month,Loan_StartDate,Loan_SettleDate,UserID,M_Rate_Month,M_Rate_Year)");
            strSql.Append(" values (");
            strSql.Append("@ContractID,@Card_ID,@Card_Name,@M_Loan,@Loan_Balance,@M_Loan_Months,@M_Replay_Type,@Current_Month,@Loan_StartDate,@Loan_SettleDate,@UserID,@M_Rate_Month,@M_Rate_Year)");

            SqlParam[] param = new SqlParam[] {
                new SqlParam("@ContractID", model.ContractID),
                new SqlParam("@Card_ID", model.Card_ID),
                new SqlParam("@Card_Name",model.Card_Name),
                new SqlParam("@M_Loan",model.M_Loan),
                new SqlParam("@Loan_Balance", model.Loan_Balance),
                new SqlParam("@M_Loan_Months", model.M_Loan_Months),
                new SqlParam("@M_Replay_Type", model.M_Replay_Type),
                new SqlParam("@Current_Month", model.Current_Month),
                new SqlParam("@Loan_StartDate", model.Loan_StartDate),
                new SqlParam("@Loan_SettleDate", model.Loan_SettleDate),
                new SqlParam("@UserID", model.UserID),
                new SqlParam("@M_Rate_Month", model.M_Rate_Month),
                new SqlParam("@M_Rate_Year", model.M_Rate_Year) };

            int rows = DataFactory.SqlDataBase().ExecuteBySql(strSql, param);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool Contract_Loan_Exists(string ContractID)
        {
            int rows = DataFactory.SqlDataBase().IsExist("Contract_Loan", "ContractID", ContractID);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }

        }
        public DataTable GetMortgageDetailPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            //strSql.Append("SELECT *  ");
            // strSql.Append("FROM (SELECT *,CASE WHEN M_Loan_Months< DATEDIFF(m,Loan_SettleDate,GETDATE()) THEN M_Loan_Months ELSE DATEDIFF(m,Loan_SettleDate,GETDATE())+1 END Loan_M,(SELECT User_Name FROM  Base_UserInfo BU WHERE User_ID=CL.UserID) AS User_Name  FROM Contract_Loan CL) U ");
            strSql.Append(@"SELECT *,
CASE WHEN M_Replay_Type='等额本金' THEN CAST(((M_Loan/M_Loan_Months)+M_Loan*(M_Loan_Months-Loan_M+1)/M_Loan_Months*M_Rate_Month/1000 ) AS numeric(18, 2))
ELSE 
CAST((M_Loan*(CONVERT(numeric(18, 6) ,M_Rate_Month)/1000)*power((1+CONVERT(numeric(18, 6) ,M_Rate_Month)/1000),M_Loan_Months)/(
power((1+CONVERT(numeric(18, 6) ,M_Rate_Month)/1000),M_Loan_Months)-1)) AS numeric(18, 2))
END PerPay
 FROM (SELECT *,
CASE WHEN M_Loan_Months< DATEDIFF(m,GETDATE(),Loan_SettleDate) THEN M_Loan_Months ELSE DATEDIFF(m,Loan_SettleDate,GETDATE())+1 END Loan_M,
(SELECT User_Name FROM  Base_UserInfo BU WHERE User_ID=CL.UserID) AS User_Name  
FROM Contract_Loan CL) M");

            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Loan_StartDate", "ASC", pageIndex, pageSize, ref count);
        }
        private void SendMsg(string UserID)
        {
            DataTable dt = GetUserPhoneByUserID(UserID);
            if (DataTableHelper.IsExistRows(dt))
            {
                #region 短信发送
                //发送短信--{UserName}你有新的审批事务，请登录【贷前调查管理系统】进行审批！
                string User_Name = dt.Rows[0]["User_Name"].ToString();
                string User_Telphone = dt.Rows[0]["User_Telphone"].ToString(); 

                string _c = string.Format("{0},你有新的审批事务，请登录【贷前调查管理系统】进行审批！[{1}]", User_Name, DateTime.Now.ToString());
                if (ValidateUtil.IsValidMobile(User_Telphone))
                {
                    int nRet = SendMessage.sendOnce(User_Telphone, _c);
                    SaveSendMessage(User_Name, User_Telphone, _c, DateTime.Now.ToString(), nRet, RequestSession.GetSessionUser().UserId.ToString(), 1);
                }
                #endregion
            }
        }
        private DataTable GetUserPhoneByUserID(string UserID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT BU.User_Name,BA.PropertyInstance_Value AS User_Telphone FROM ");
            strSql.Append("Base_UserInfo BU LEFT JOIN Base_AppendPropertyInstance BA ON BU.User_ID=BA.PropertyInstance_Key  ");
            strSql.Append(" WHERE BA.Property_Control_ID='User_Telphone' ");
            strSql.Append(" AND BU.USER_ID=@UserID");

            SqlParam[] param = new SqlParam[] {
                new SqlParam("@UserID", UserID) };

            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, param);
        }
        /// <summary>
        /// 保存短信记录
        /// </summary>
        /// <param name="UserName">收信人姓名</param>
        /// <param name="UserTel">接收号码</param>
        /// <param name="MSG">短信内容</param>
        /// <param name="SendTime">发送时间</param>
        /// <param name="State">发送状态：系统反馈状态</param>
        /// <param name="CreateUser">创建人-系统操作员</param>
        /// <param name="MsgType">短信类型：1-审批短信；2-催费短信</param>
        /// <returns></returns>
        public bool SaveSendMessage(string UserName,string UserTel,string MSG,string SendTime,int State,string CreateUser,int MsgType)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("insert into MessageInfo(");
            strSql.Append("UserName,UserTel,MSG,SendTime,State,CreateUser,MsgType)");
            strSql.Append(" values (");
            strSql.Append("@UserName,@UserTel,@MSG,@SendTime,@State,@CreateUser,@MsgType)");

            SqlParam[] param = new SqlParam[] {
                new SqlParam("@UserName", UserName),
                new SqlParam("@UserTel", UserTel),
                new SqlParam("@MSG",MSG),
                new SqlParam("@SendTime",SendTime),
                new SqlParam("@State", State),
                new SqlParam("@CreateUser", CreateUser),
                new SqlParam("@MsgType", MsgType) };

            int rows = DataFactory.SqlDataBase().ExecuteBySql(strSql, param);
            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool IsSendMessage(string Organization_ID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.AppendFormat("SELECT COUNT(1)  FROM Base_Organization WHERE Organization_ID='{0}' AND Organization_Zipcode='101' ", Organization_ID);

            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
            int rows = int.Parse(dt.Rows[0][0].ToString());

            if (rows > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public DataTable GetMessageHistoryPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            string UserId = RequestSession.GetSessionUser().UserId.ToString();
            strSql.Append(@"SELECT MI.*,BU.User_Name FROM MessageInfo MI LEFT JOIN Base_UserInfo BU ON MI.CreateUser=BU.User_ID ");

            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "CreateDate", "DESC", pageIndex, pageSize, ref count);
        }

    }
}

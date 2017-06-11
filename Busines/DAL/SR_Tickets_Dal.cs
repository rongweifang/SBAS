using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Drawing;
using System.Drawing.Imaging;
using System.Text;
using ThoughtWorks.QRCode.Codec;
using System.Collections;
using Common.DotNetData;
using Common.DotNetJson;

namespace Busines.DAL
{
    public class SR_Tickets_Dal : SR_Tickets_IDal
    {
        public SR_Tickets_Dal()
        { }

        #region Orgaization

        public string GetOrgaizationName(string Organization_ID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT Organization_Name ");
            strSql.Append("FROM Base_Organization ");
            strSql.Append("WHERE  Organization_ID=@Organization_ID ");
            strSql.Append("ORDER BY SortCode DESC");
            SqlParam[] para = new SqlParam[] {
            new SqlParam("@Organization_ID",Organization_ID),
            };
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
            if (DataTableHelper.IsExistRows(dt))
            {
                return dt.Rows[0]["Organization_Name"].ToString();
            }
            else
            {
                return "";
            }
        }
        //获取用户所属机构
        public DataTable GetOrgaizationList(string User_ID)
        {
            //SELECT ORG.Organization_ID,ORG.Organization_Name FROM Base_StaffOrganize SF,Base_Organization ORG WHERE SF.Organization_ID=ORG.Organization_ID AND ORG.DeleteMark=1 AND SF.USER_ID=@UserID  ORDER BY ORG.SortCode DESC
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT ORG.Organization_ID,ORG.Organization_Name ");
            strSql.Append("FROM Base_StaffOrganize SF,Base_Organization ORG ");
            strSql.Append("WHERE SF.Organization_ID=ORG.Organization_ID ");
            strSql.Append("AND ORG.DeleteMark=1 ");
            strSql.Append("AND SF.USER_ID=@UserID  ");
            strSql.Append("ORDER BY ORG.SortCode DESC");
            SqlParam[] para = new SqlParam[] {
            new SqlParam("@UserID",User_ID),
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }

        public string GetOrganization_IDs(string User_ID)
        {
            string Organization_IDs = "";
            DataTable dt = GetOrgaizationList(User_ID);
            if (DataTableHelper.IsExistRows(dt))
            {

                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    if (!string.IsNullOrEmpty(Organization_IDs))
                    {
                        Organization_IDs = Organization_IDs + ",'" + dt.Rows[i]["Organization_ID"].ToString() + "'";
                    }
                    else
                    {
                        Organization_IDs = "'" + dt.Rows[i]["Organization_ID"].ToString() + "'";
                    }
                }
            }
            return Organization_IDs;
        }

        public string GetOrganization_Fax(string Organization_ID)
        {
            string Organization_Fax = "localhost";
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT Organization_Fax FROM Base_Organization WHERE DeleteMark = 1 AND Organization_ID=@Organization_ID");
            SqlParam[] para = new SqlParam[]{
                new SqlParam("@Organization_ID",Organization_ID),
            };
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
            if (DataTableHelper.IsExistRows(dt))
            {
                if (!string.IsNullOrEmpty(dt.Rows[0]["Organization_Fax"].ToString()))
                {
                    Organization_Fax = dt.Rows[0]["Organization_Fax"].ToString();
                }
            }
            return Organization_Fax;
        }

        public DataTable GetOrgaizationList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT Organization_ID,\r\n                            Organization_Name FROM Base_Organization WHERE DeleteMark = 1 ORDER BY SortCode ASC");
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }
        #endregion

        #region  Tickets
        /// <summary>
        /// 获取票号列表
        /// </summary>
        /// <returns></returns>
        public DataTable GetTickets_NO_List()
        {
            StringBuilder strSql = new StringBuilder();
            //strSql.Append("SELECT [TICKETS_NO_ID],(SELECT [Organization_Name] FROM [Base_Organization] WHERE [Organization_ID]=TNO.[ParentId]) AS [Organization_Name],(SELECT [Menu_Title] FROM [Base_SysMenu] WHERE [Menu_Id]=TNO.[Menu_Id]) AS [Menu_Title],[TICKET_NO],[CREATETIME],[REMARK] FROM Tickets_NO TNO");
            strSql.Append("SELECT TNO.TICKETS_NO_ID,ORG.Organization_Name,TNO.UseCount,('['+(SELECT Menu_Name FROM Base_SysMenu WHERE Menu_Id=SM.ParentId)+']－'+SM.Menu_Name) AS Menu_Title,TNO.TICKET_NO,TNO.CREATETIME,TNO.REMARK FROM Tickets_NO TNO,Base_Organization ORG,Base_SysMenu SM WHERE TNO.ParentId=ORG.Organization_ID AND TNO.Menu_Id=SM.Menu_Id ORDER BY TNO.ParentId ASC");
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }
        public DataTable GetTicketsNOListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            string orderflag = "";
            strSql.Append("SELECT TNO.TICKETS_NO_ID,ORG.Organization_Name,TNO.UseCount,('['+(SELECT Menu_Name FROM Base_SysMenu WHERE Menu_Id=SM.ParentId)+']－'+SM.Menu_Name) AS Menu_Title,TNO.TICKET_NO,TNO.CREATETIME,TNO.REMARK ");
            strSql.Append("FROM Tickets_NO TNO,Base_Organization ORG,Base_SysMenu SM ");
            strSql.Append("WHERE TNO.ParentId=ORG.Organization_ID AND TNO.Menu_Id=SM.Menu_Id ");
            if (string.IsNullOrEmpty(SqlWhere.ToString()))
            {
                orderflag = "Organization_Name";
            }
            else
            {
                orderflag = "TICKET_NO";
                strSql.Append(SqlWhere);
            }

            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), orderflag, "ASC", pageIndex, pageSize, ref count);
        }
        /// <summary>
        /// 判断票号是否存在
        /// </summary>
        /// <param name="ParentId"></param>
        /// <param name="Menu_Id"></param>
        /// <returns></returns>
        public bool GetExistsTickets(string ParentId, string Menu_Id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT COUNT(1) FROM Tickets_NO");
            strSql.Append(" WHERE ParentId=@ParentId AND Menu_Id=@Menu_Id ");
            SqlParam[] para = new SqlParam[]
			{
				new SqlParam("@ParentId", ParentId),
                new SqlParam("@Menu_Id",Menu_Id)
			};

            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
            int Count = int.Parse(dt.Rows[0][0].ToString());
            if (Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public DataTable GetTicketsList()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT SM.Menu_Id, ('['+(SELECT Menu_Name FROM Base_SysMenu WHERE Menu_Id=SM.ParentId)+']－'+SM.Menu_Name) AS Menu_Name FROM Base_SysMenu SM WHERE SM.DeleteMark = 1 AND SM.Menu_Type =2 AND SM.ParentId IN ('e84c0fca-d912-4f5c-a25e-d5765e33b0d2','b863d076-37bb-45aa-8318-37942026921e','4cfc4395-7a80-489a-84a7-247d8b47c86c') ORDER BY SM.ParentId ASC");
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }
        public bool GetExistsTicket_NO(string ParentId, string Menu_Id, string TICKET_NO)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT COUNT(1) FROM Tickets_NO ");
            strSql.Append(" WHERE ");
            strSql.Append(" ParentId=@ParentId");
            strSql.Append(" AND Menu_Id=@Menu_Id ");
            strSql.Append(" AND TICKET_NO=@TICKET_NO");
            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@ParentId",ParentId),
                 new SqlParam("@Menu_Id",Menu_Id),
                  new SqlParam("@TICKET_NO",TICKET_NO),
            };
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
            int Count = int.Parse(dt.Rows[0][0].ToString());
            if (Count > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        public DataTable GetTicket_NO(string ParentId, string Menu_Id)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TICKETS_NO_ID,TICKET_NO,UseCount FROM ");
            strSql.Append(" Tickets_NO ");
            strSql.Append("WHERE ParentId=@ParentId ");
            strSql.Append("AND Menu_Id=@Menu_Id");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@ParentId",ParentId),
                new SqlParam("@Menu_Id",Menu_Id),
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }
        public int GetTicketNO(string ParentId, string Menu_Id)
        {
            DataTable dt = GetTicket_NO(ParentId, Menu_Id);
            if (DataTableHelper.IsExistRows(dt))
            {
                return int.Parse(dt.Rows[0]["TICKET_NO"].ToString());
            }
            else
            {
                return 0;
            }
        }

        public bool UpdateTicketNo(string TICKETS_NO_ID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("UPDATE  Tickets_NO SET ");
            strSql.Append(" TICKET_NO=TICKET_NO+1 ");
            strSql.Append(",ModifyDate= '" + DateTime.Now + "'");
            strSql.Append(",ModifyUserId= '" + RequestSession.GetSessionUser().UserId.ToString() + "'");
            strSql.Append(",ModifyUserName= '" + RequestSession.GetSessionUser().UserName.ToString() + "(" + RequestSession.GetSessionUser().UserAccount.ToString() + ")'");
            strSql.Append(" WHERE TICKETS_NO_ID=@TICKETS_NO_ID ");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@TICKETS_NO_ID",TICKETS_NO_ID),
            };
            if (DataFactory.SqlDataBase().ExecuteBySql(strSql, para) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        public bool UpdateTicketNo(string TICKETS_NO_ID, int oldID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("UPDATE  Tickets_NO SET ");
            strSql.Append(" TICKET_NO=TICKET_NO+1 ");
            strSql.Append(",ModifyDate= " + DateTime.Now.ToString());
            strSql.Append(",ModifyUserId= " + RequestSession.GetSessionUser().UserAccount.ToString());
            strSql.Append(",ModifyUserName= '" + RequestSession.GetSessionUser().UserName.ToString() + "(" + RequestSession.GetSessionUser().UserAccount.ToString() + ")'");
            strSql.Append(" WHERE TICKETS_NO_ID=@TICKETS_NO_ID ");
            strSql.Append(" AND TICKET_NO=@TICKET_NO");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@TICKETS_NO_ID",TICKETS_NO_ID),
                new SqlParam("@TICKET_NO",oldID),
            };
            if (DataFactory.SqlDataBase().ExecuteBySql(strSql, para) > 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }

        #endregion

        #region OperaterItem
        public DataTable GetOperaterItemList(string ParentId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM ");
            strSql.Append(" Tickets_OperaterItem ");
            strSql.Append(" WHERE ");
            strSql.Append(" ParentId = @ParentId");
            strSql.Append(" ORDER BY SortCode ASC");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@ParentId",ParentId),
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }
        public void InsertOperaterItem(string ParentId, string[] OperaterItemValue)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            if (OperaterItemValue == null || (OperaterItemValue != null && OperaterItemValue.Length == 0))
            {
                return;
            }
            int len = OperaterItemValue.Length;
            int SortCode = 1;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("BEGIN \n\n");
            if (len > 0)
            {
                for (int i = 0; i < len; i++)
                {
                    if (!string.IsNullOrEmpty(OperaterItemValue[i]))
                    {
                        strSql.Append("INSERT INTO Tickets_OperaterItem ");
                        strSql.Append(" (OperaterItem_ID,ParentId,SortCode,OperaterItem_Name,CreateUserId,CreateUserName) ");
                        strSql.Append(" VALUES ('");
                        strSql.Append(CommonHelper.GetGuid + "','");
                        strSql.Append(ParentId + "',");
                        strSql.Append(SortCode + ",'");
                        strSql.Append(OperaterItemValue[i] + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserId + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserName + "'");
                        strSql.Append(");\n\r ");
                        SortCode++;
                    }
                }
            }
            strSql.Append("END");

            DataFactory.SqlDataBase().ExecuteBySql(strSql);
        }

        public void DeleteOperaterItem(string ParentId)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            StringBuilder strSql = new StringBuilder();
            strSql.Append("DELETE FROM Tickets_OperaterItem ");
            strSql.Append("WHERE ");
            strSql.Append("ParentId=@ParentId");
            SqlParam[] para = new SqlParam[]
			{
				new SqlParam("@ParentId", ParentId),
			};
            DataFactory.SqlDataBase().ExecuteBySql(strSql, para);
        }

        #endregion



        /// <summary>
        /// 是否存在该记录
        /// </summary>
        public bool Exists(string OPERATE_ID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("select count(1) from Tickets_Operater");
            strSql.Append(" where OPERATE_ID=@OPERATE_ID ");
            SqlParam[] para = new SqlParam[]
			{
				new SqlParam("@OPERATE_ID", OPERATE_ID),
			};
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);

            // return int.Parse(dt.Rows[0][0].ToString());
            int row = int.Parse(dt.Rows[0][0].ToString());
            if (row >= 1)
            {
                return true;
            }
            else
            {
                return false;
            }

        }

        #region OperateTickets
        /// <summary>
        /// 获得数据列表
        /// </summary>
        public DataTable GetOperateList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TP.OPERATE_ID,TP.Operate_Name,TP.Operate_Type,TP.Organization_ID,ORG.Organization_Code,ORG.Organization_Name,TP.Ticket_Code,TP.Ticket_Item_ID,TP.Tickets_NO_ID,TP.Ticket_NO,TP.STARTER,TP.BYORDER,TP.STARTINGTIME,TP.OPERATESTARTTIME,TP.OPERATEENDTIME,TP.OPERATETASK,TP.REMARKS,TP.LINEOPERATOR,TP.GUARDIAN,TP.Ticket_States,TP.Work_Flow_ID,TP.SortCode,TP.DeleteMark,TP.CreateDate,TP.CreateUserId,TP.CreateUserName,TP.ModifyDate,TP.ModifyUserId,TP.ModifyUserName  ");
            strSql.Append("FROM Tickets_Operater TP,Base_Organization ORG ");
            strSql.Append("WHERE TP.Organization_ID=ORG.Organization_ID ");
            strSql.Append("AND TP.DeleteMark=1   ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" AND " + strWhere);
            }
            strSql.Append(" ORDER BY TP.Ticket_NO DESC");
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }

        public DataTable GetOperateListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TP.OPERATE_ID,TP.Operate_Name,TP.Operate_Type,TP.Organization_ID,ORG.Organization_Code,ORG.Organization_Name,TP.Ticket_Code,TP.Ticket_Item_ID,TP.Tickets_NO_ID,TP.Ticket_NO,TP.STARTER,TP.BYORDER,TP.STARTINGTIME,TP.OPERATESTARTTIME,TP.OPERATEENDTIME,TP.OPERATETASK,TP.REMARKS,TP.LINEOPERATOR,TP.GUARDIAN,TP.Ticket_States,TP.Work_Flow_ID,TP.SortCode,TP.DeleteMark,TP.CreateDate,TP.CreateUserId,TP.CreateUserName,TP.ModifyDate,TP.ModifyUserId,TP.ModifyUserName  ");
            strSql.Append("FROM Tickets_Operater TP,Base_Organization ORG ");
            strSql.Append("WHERE TP.Organization_ID=ORG.Organization_ID ");
            strSql.Append("AND TP.DeleteMark=1   ");
            strSql.Append(SqlWhere);
            //strSql.Append(" ORDER BY TP.Ticket_NO DESC");
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }


        public DataTable GetOperateList(string Organization_ID, string Operate_Type)
        {
            string strWhere = "TP.Organization_ID IN (" + Organization_ID + ") AND TP.Operate_Type='" + Operate_Type + "'";
            return GetOperateList(strWhere);
        }
        #endregion

        #region Tickets_Station_Operater
        /// <summary>
        /// 获得数据列表StationOperater
        /// </summary>
        public DataTable GetStationOperaterList(string strWhere)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TP.*,ORG.Organization_Code,ORG.Organization_Name,TS.States_Name  ");
            strSql.Append("FROM Tickets_Station_Operater TP,Base_Organization ORG,Tickets_States TS ");
            strSql.Append("WHERE TP.Organization_ID=ORG.Organization_ID AND TP.Ticket_States=TS.States_ID ");
            strSql.Append("AND TP.DeleteMark=1   ");
            if (strWhere.Trim() != "")
            {
                strSql.Append(" AND " + strWhere);
            }
            strSql.Append(" ORDER BY TP.Ticket_NO DESC");
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }

        public DataTable GetStationOperaterListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TP.*,ORG.Organization_Code,ORG.Organization_Name,TS.States_Name  ");
            strSql.Append("FROM Tickets_Station_Operater TP,Base_Organization ORG,Tickets_States TS ");
            strSql.Append("WHERE TP.Organization_ID=ORG.Organization_ID AND TP.Ticket_States=TS.States_ID ");
            strSql.Append("AND TP.DeleteMark=1   ");
            strSql.Append(SqlWhere);
            //strSql.Append(" ORDER BY TP.Ticket_NO DESC");
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }


        public DataTable GetStationOperaterList(string Organization_ID, string Operate_Type)
        {
            string strWhere = "TP.Organization_ID IN (" + Organization_ID + ") AND TP.Operate_Type='" + Operate_Type + "'";
            return GetStationOperaterList(strWhere);
        }
        #endregion

        #region QRCode
        public bool ToQRCode(string CodeStr, string Filename)
        {
            //生成图像
            Bitmap image = ToQRCode(CodeStr);
            //将image保存到filename
            image.Save(Filename);
            return true;
        }

        public Bitmap ToQRCode(string CodeStr)
        {
            if (string.IsNullOrEmpty(CodeStr))
            {
                CodeStr = "0";
            }
            QRCodeEncoder qrCodeEncoder = new QRCodeEncoder();
            qrCodeEncoder.QRCodeEncodeMode = QRCodeEncoder.ENCODE_MODE.BYTE;
            qrCodeEncoder.QRCodeErrorCorrect = QRCodeEncoder.ERROR_CORRECTION.M;
            qrCodeEncoder.QRCodeVersion = 7;
            qrCodeEncoder.QRCodeScale = 3;
            //生成图像
            return qrCodeEncoder.Encode(CodeStr, Encoding.Default);
        }
        #endregion

        #region States
        public DataTable GetStateList(string Tickets_Type)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT States_ID,States_Name,Tickets_Type FROM Tickets_States");
            if (!(string.IsNullOrEmpty(Tickets_Type) || Tickets_Type == ""))
            {
                strSql.Append(" WHERE Tickets_Type='" + Tickets_Type + "'");
            }
            strSql.Append(" ORDER BY States_ID ASC");
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
        }
        public DataTable GetStateList()
        {
            return GetStateList("");
        }
        public string GetStateName(int States_ID, string Tickets_Type)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT States_Name FROM Tickets_States ");
            strSql.Append("WHERE States_ID=" + States_ID);
            if (!(string.IsNullOrEmpty(Tickets_Type) || Tickets_Type == ""))
            {
                strSql.Append(" AND Tickets_Type='" + Tickets_Type + "'");
            }
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
            if (DataTableHelper.IsExistRows(dt))
            {
                return dt.Rows[0]["States_Name"].ToString();
            }
            else
            {
                return "";
            }
        }
        public string GetStateName(int States_ID)
        {
            return GetStateName(States_ID, "");
        }
        #endregion

        #region GetMonth
        //public IList<string> GetMonth()
        //{

        //}
        #endregion

        #region ChangeStates
        public int ChangeStateTicket(string TableName, string pkName, string pkVal, string StateName, string StateVal)
        {
            Hashtable ht = new Hashtable();

            ht.Add(StateName, StateVal);
            ht.Add("ModifyDate", DateTime.Now);
            ht.Add("ModifyUserId", RequestSession.GetSessionUser().UserId.ToString());
            ht.Add("ModifyUserName", RequestSession.GetSessionUser().UserName.ToString());

            return DataFactory.SqlDataBase().UpdateByHashtable(TableName, pkName, pkVal, ht);
        }

        public int IsExistTicket(string TableName, string pkName, string pkVal, string StateName, string StateVal)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.AppendFormat("SELECT COUNT(1) FROM {0} WHERE {1}='{2}' AND {3} IN ({4})", TableName, pkName, pkVal, StateName, StateVal);
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql);

            return int.Parse(dt.Rows[0][0].ToString());
        }
        #endregion

        #region  Emergency
        public DataTable GetEmergencyListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TE.*,ORG.Organization_Code,ORG.Organization_Name,TS.States_Name ");
            strSql.Append("FROM Tickets_Emergency TE,Base_Organization ORG,Tickets_States TS ");
            strSql.Append("WHERE TE.Organization_ID=ORG.Organization_ID AND TE.Ticket_States=TS.States_ID ");
            strSql.Append("AND TE.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }
        #endregion

        #region Control
        public DataTable GetControlListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TC.Control_ID,TC.Control_Name,TC.Operate_Type,TC.Organization_ID,TC.Tickets_NO_ID,ORG.Organization_Code,ORG.Organization_Name,TC.Ticket_NO,TC.Header,TC.Issuer,TC.Task,TC.TeamName,TC.TeamUsers,TC.Ticket_States,TC.CreateDate,TC.CreateUserId,TC.CreateUserName,TC.ModifyDate,TC.ModifyUserId,TC.ModifyUserName ");
            strSql.Append("FROM Tickets_Control TC,Base_Organization ORG ");
            strSql.Append("WHERE TC.Organization_ID=ORG.Organization_ID ");
            strSql.Append("AND TC.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }
        public DataTable GetControlItemList(string ParentId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM Tickets_ControlItem ");
            strSql.Append("WHERE ParentId = @ParentId ");
            strSql.Append("ORDER BY SortCode ASC");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@ParentId",ParentId),
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }
        public void InsertControlItem(string ParentId, string[] WorkItem, string[] DangerItem, string[] StepItem, string[] ItemIssuer)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            if (WorkItem == null || (WorkItem != null && WorkItem.Length == 0))
            {
                return;
            }
            int len = WorkItem.Length;
            int SortCode = 1;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("BEGIN \n\n");
            if (len > 0)
            {
                for (int i = 0; i < len; i++)
                {
                    if (!string.IsNullOrEmpty(WorkItem[i]))
                    {
                        strSql.Append("INSERT INTO Tickets_ControlItem ");
                        strSql.Append(" (ControlItem_ID,ParentId,SortCode,WorkItem,DangerItem,StepItem,ItemIssuer,CreateUserId,CreateUserName) ");
                        strSql.Append(" VALUES ('");
                        strSql.Append(CommonHelper.GetGuid + "','");
                        strSql.Append(ParentId + "',");
                        strSql.Append(SortCode + ",'");
                        strSql.Append(WorkItem[i] + "','");
                        strSql.Append(DangerItem[i] + "','");
                        strSql.Append(StepItem[i] + "','");
                        strSql.Append(ItemIssuer[i] + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserId + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserName + "'");
                        strSql.Append(");\n\r ");
                        SortCode++;
                    }
                }
            }
            strSql.Append("END");

            DataFactory.SqlDataBase().ExecuteBySql(strSql);
        }

        public void DeleteControlItem(string ParentId)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            StringBuilder strSql = new StringBuilder();
            strSql.Append("DELETE FROM Tickets_ControlItem ");
            strSql.Append("WHERE ");
            strSql.Append("ParentId=@ParentId");
            SqlParam[] para = new SqlParam[]
			{
				new SqlParam("@ParentId", ParentId),
			};
            DataFactory.SqlDataBase().ExecuteBySql(strSql, para);
        }
        #endregion

        #region Emergency
        public DataTable GetEmergencyItemList(string ParentId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM Tickets_EmergencyItem ");
            strSql.Append("WHERE ParentId = @ParentId ");
            strSql.Append("ORDER BY SortCode ASC");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@ParentId",ParentId),
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }
        public void InsertEmergencyItem(string ParentId, string[] Items)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            if (Items == null || (Items != null && Items.Length == 0))
            {
                return;
            }
            int len = Items.Length;
            int SortCode = 1;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("BEGIN \n\n");
            if (len > 0)
            {
                for (int i = 0; i < len; i++)
                {
                    if (!string.IsNullOrEmpty(Items[i]))
                    {
                        strSql.Append("INSERT INTO Tickets_EmergencyItem ");
                        strSql.Append(" ([EmergencyItem_ID],[ParentId],[SortCode],[EmergencyItem_Name],[CreateUserId],[CreateUserName]) ");
                        strSql.Append(" VALUES ('");
                        strSql.Append(CommonHelper.GetGuid + "','");
                        strSql.Append(ParentId + "',");
                        strSql.Append(SortCode + ",'");
                        strSql.Append(Items[i] + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserId + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserName + "'");
                        strSql.Append(");\n\r ");
                        SortCode++;
                    }
                }
            }
            strSql.Append("END");

            DataFactory.SqlDataBase().ExecuteBySql(strSql);
        }
        public void DeleteEmergencyItem(string ParentId)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            StringBuilder strSql = new StringBuilder();
            strSql.Append("DELETE FROM [Tickets_EmergencyItem] ");
            strSql.Append("WHERE ");
            strSql.Append("ParentId=@ParentId");
            SqlParam[] para = new SqlParam[]
			{
				new SqlParam("@ParentId", ParentId),
			};
            DataFactory.SqlDataBase().ExecuteBySql(strSql, para);
        }
        #endregion

        #region Task
        public DataTable GetTaskListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT  TT.Task_ID,TT.Operate_Name,TT.Operate_Type,TT.Work_ID,TT.Work_NO,TT.Organization_ID,TT.Tickets_NO_ID,TT.Ticket_NO,TT.Header,TT.TeamLeader,TT.Task,TT.TeamUsers,TT.TeamName,TT.UserCount,TT.Plantime1,TT.Plantime2,TT.Notes,TT.Issuer,TT.IssueTime,TT.LicensType,TT.Licensor,TT.LicensTime,TT.LicensType2,TT.Licensor2,TT.LicensTime2,TT.LicensType3,TT.Licensor3,TT.LicensTime3,TT.EvacuateTime,TT.Memo,TT.Ticket_States,TT.DeleteMark,TT.CreateDate,TT.CreateUserId,TT.CreateUserName,TT.ModifyDate,TT.ModifyUserId,TT.ModifyUserName,ORG.Organization_Code,ORG.Organization_Name ");
            strSql.Append("FROM Tickets_Task TT,Base_Organization ORG ");
            strSql.Append("WHERE TT.Organization_ID=ORG.Organization_ID ");
            strSql.Append("AND TT.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }
        public DataTable GetTaskItemList(string ParentId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM Tickets_TaskItem ");
            strSql.Append("WHERE ParentId = @ParentId ");
            strSql.Append("ORDER BY SortCode ASC");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@ParentId",ParentId),
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }
        public void InsertTaskItem(string ParentId, string[] TaskItem_Name, string[] TaskItem_Content)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            if (TaskItem_Name == null || (TaskItem_Name != null && TaskItem_Name.Length == 0))
            {
                return;
            }
            int len = TaskItem_Name.Length;
            int SortCode = 1;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("BEGIN \n\n");
            if (len > 0)
            {
                for (int i = 0; i < len; i++)
                {
                    if (!string.IsNullOrEmpty(TaskItem_Name[i]))
                    {
                        strSql.Append("INSERT INTO Tickets_TaskItem ");
                        strSql.Append(" ([TaskItem_ID],[ParentId],[SortCode],[TaskItem_Name],[TaskItem_Content],[CreateUserId],[CreateUserName]) ");
                        strSql.Append(" VALUES ('");
                        strSql.Append(CommonHelper.GetGuid + "','");
                        strSql.Append(ParentId + "',");
                        strSql.Append(SortCode + ",'");
                        strSql.Append(TaskItem_Name[i] + "','");
                        strSql.Append(TaskItem_Content[i] + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserId + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserName + "'");
                        strSql.Append(");\n\r ");
                        SortCode++;
                    }
                }
            }
            strSql.Append("END");

            DataFactory.SqlDataBase().ExecuteBySql(strSql);
        }
        public void InsertTaskItem(string ParentId, string[] TaskItem_Name, string[] TaskItem_Position, string[] TaskItem_Content)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            if (TaskItem_Name == null || (TaskItem_Name != null && TaskItem_Name.Length == 0))
            {
                return;
            }
            int len = TaskItem_Name.Length;
            int SortCode = 1;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("BEGIN \n\n");
            if (len > 0)
            {
                for (int i = 0; i < len; i++)
                {
                    if (!string.IsNullOrEmpty(TaskItem_Name[i]))
                    {
                        strSql.Append("INSERT INTO Tickets_TaskItem  ([TaskItem_ID],[ParentId],[SortCode],[CreateUserId],[CreateUserName],[TaskItem_Name],[TaskItem_Position],[TaskItem_Content])");
                        strSql.AppendFormat("VALUES ('{0}','{1}',{2},'{3}','{4}','{5}','{6}','{7}');\n\r ", CommonHelper.GetGuid, ParentId, SortCode, RequestSession.GetSessionUser().UserId, RequestSession.GetSessionUser().UserName, TaskItem_Name[i], TaskItem_Position[i], TaskItem_Content[i]);
                        SortCode++;
                    }
                }
            }
            strSql.Append("END");

            DataFactory.SqlDataBase().ExecuteBySql(strSql);
        }
        #endregion

        #region Work1
        public DataTable GetWork1ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TW1.Work_ID,TW1.Operate_Name,TW1.Operate_Type,TW1.Organization_ID,TW1.Tickets_NO_ID,TW1.Ticket_NO,TW1.Header,TW1.TeamLeader,TW1.Task,TW1.TeamUsers,TW1.TeamName,TW1.UserCount,TW1.Plantime1,TW1.Plantime2,TW1.Notes,TW1.Retain,TW1.OtherNotes,TW1.Issuer,TW1.IssueTime,TW1.LicensType,TW1.Licensor,TW1.LicensTime,TW1.LicensType2,TW1.Licensor2,TW1.LicensTime2,TW1.LicensType3,TW1.Licensor3,TW1.LicensTime3,TW1.NewHeader,TW1.ChangeTime,TW1.ChangeContent,TW1.TimeRelay,TW1.RelayTime,TW1.GroundLead,TW1.GroundLeadCount,TW1.EvacuateTime,TW1.Memo,TW1.Ticket_States,TW1.DeleteMark,TW1.CreateDate,TW1.CreateUserId,TW1.CreateUserName,TW1.ModifyDate,TW1.ModifyUserId,TW1.ModifyUserName,ORG.Organization_Code,ORG.Organization_Name ");
            strSql.Append("FROM Tickets_Work1 TW1,Base_Organization ORG ");
            strSql.Append("WHERE TW1.Organization_ID=ORG.Organization_ID ");
            strSql.Append("AND TW1.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }

        #endregion

        #region GroundLead
        public void InsertGroundItem(string ParentId, string[] Position, string[] GroundLead_NO, string[] HangTime, string[] RemoveTime)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            if (Position == null || (Position != null && Position.Length == 0))
            {
                return;
            }
            int len = Position.Length;
            int SortCode = 1;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("BEGIN \n\n");
            if (len > 0)
            {
                for (int i = 0; i < len; i++)
                {
                    if (!string.IsNullOrEmpty(Position[i]))
                    {
                        strSql.Append("INSERT INTO Tickets_Work1GroundItem ");
                        strSql.Append(" ([GroundLeadID],[ParentId],[SortCode],[Position],[GroundLead_NO],[HangTime],[RemoveTime],[CreateUserId],[CreateUserName]) ");
                        strSql.Append(" VALUES ('");
                        strSql.Append(CommonHelper.GetGuid + "','");
                        strSql.Append(ParentId + "',");
                        strSql.Append(SortCode + ",'");
                        strSql.Append(Position[i] + "','");
                        strSql.Append(GroundLead_NO[i] + "','");
                        strSql.Append(HangTime[i] + "','");
                        strSql.Append(RemoveTime[i] + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserId + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserName + "'");
                        strSql.Append(");\n\r ");
                        SortCode++;
                    }
                }
            }
            strSql.Append("END");

            DataFactory.SqlDataBase().ExecuteBySql(strSql);
        }

        public void InsertGroundItem(string ParentId, string[] Position, string[] GroundLead_NO, string[] HangUser)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            if (Position == null || (Position != null && Position.Length == 0))
            {
                return;
            }
            int len = Position.Length;
            int SortCode = 1;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("BEGIN \n\n");
            if (len > 0)
            {
                for (int i = 0; i < len; i++)
                {
                    if (!string.IsNullOrEmpty(Position[i]))
                    {
                        strSql.Append("INSERT INTO Tickets_Work1GroundItem ");
                        strSql.Append(" ([GroundLeadID],[ParentId],[SortCode],[Position],[GroundLead_NO],[HangUser],[CreateUserId],[CreateUserName]) ");
                        strSql.Append(" VALUES ('");
                        strSql.Append(CommonHelper.GetGuid + "','");
                        strSql.Append(ParentId + "',");
                        strSql.Append(SortCode + ",'");
                        strSql.Append(Position[i] + "','");
                        strSql.Append(GroundLead_NO[i] + "','");
                        strSql.Append(HangUser[i] + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserId + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserName + "'");
                        strSql.Append(");\n\r ");
                        SortCode++;
                    }
                }
            }
            strSql.Append("END");

            DataFactory.SqlDataBase().ExecuteBySql(strSql);
        }
        public DataTable GetGroundLeadItemList(string ParentId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM Tickets_Work1GroundItem ");
            strSql.Append("WHERE ParentId = @ParentId ");
            strSql.Append("ORDER BY SortCode ASC");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@ParentId",ParentId),
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }
        #endregion

        #region GateItem
        public DataTable GetGateItemList(string ParentId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM Tickets_GateItem ");
            strSql.Append("WHERE ParentId = @ParentId ");
            strSql.Append("ORDER BY SortCode ASC");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@ParentId",ParentId),
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }
        public void InsertGateItem(string ParentId, string[] OrgName, string[] GateName, string[] HangUser)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            if (OrgName == null || (OrgName != null && OrgName.Length == 0))
            {
                return;
            }
            int len = OrgName.Length;
            int SortCode = 1;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("BEGIN \n\n");
            if (len > 0)
            {
                for (int i = 0; i < len; i++)
                {
                    if (!string.IsNullOrEmpty(OrgName[i]))
                    {
                        strSql.Append("INSERT INTO Tickets_GateItem ");
                        strSql.Append(" ([GateID],[ParentId],[SortCode],[OrgName],[GateName],[HangUser],[CreateUserId],[CreateUserName]) ");
                        strSql.Append(" VALUES ('");
                        strSql.Append(CommonHelper.GetGuid + "','");
                        strSql.Append(ParentId + "',");
                        strSql.Append(SortCode + ",'");
                        strSql.Append(OrgName[i] + "','");
                        strSql.Append(GateName[i] + "','");
                        strSql.Append(HangUser[i] + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserId + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserName + "'");
                        strSql.Append(");\n\r ");
                        SortCode++;
                    }
                }
            }
            strSql.Append("END");

            DataFactory.SqlDataBase().ExecuteBySql(strSql);
        }
        #endregion

        #region work2
        public DataTable GetWork2ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TW2.Work_ID,TW2.Operate_Name,TW2.Operate_Type,TW2.Organization_ID,TW2.Tickets_NO_ID,TW2.Ticket_NO,TW2.Header,TW2.Task,TW2.TeamUsers,TW2.TeamName,TW2.UserCount,TW2.Plantime1,TW2.Plantime2,TW2.ETime,TW2.OverTime,TW2.Notes,TW2.Issuer,TW2.IssueTime,TW2.TimeRelay,TW2.RelayTime,TW2.Memo,TW2.Ticket_States,TW2.DeleteMark,TW2.CreateDate,TW2.CreateUserId,TW2.CreateUserName,TW2.ModifyDate,TW2.ModifyUserId,TW2.ModifyUserName,ORG.Organization_Code,ORG.Organization_Name ");
            strSql.Append("FROM Tickets_Work2 TW2,Base_Organization ORG ");
            strSql.Append("WHERE TW2.Organization_ID=ORG.Organization_ID ");
            strSql.Append("AND TW2.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);

        }
        #endregion

        #region OpenDoor
        public bool IsableOpenDoor(string TicketsInfo)
        {
            bool isvaild = false;
            if (!string.IsNullOrEmpty(TicketsInfo))
            {
                string[] arr = TicketsInfo.Split('|');
                if (arr != null || (arr == null && arr.Length > 0))
                {
                    string Tablename = arr[0].ToString();
                    //string pKname = arr[1].ToString();
                    string pKname = GetpKname(Tablename);
                    string pKvalue = arr[2].ToString();
                    try
                    {
                        StringBuilder strSql = new StringBuilder();
                        strSql.AppendFormat("SELECT * FROM {0} WHERE {1}=@pKvalue AND UseCount>0 AND Ticket_States IN (3,4,5)", Tablename, pKname);
                        SqlParam[] para = new SqlParam[]
                    {
                        new SqlParam("@pKvalue",pKvalue),
                    };

                        DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
                        if (DataTableHelper.IsExistRows(dt))
                        {
                            StringBuilder slectSql = new StringBuilder();
                            slectSql.AppendFormat("SELECT * FROM {0} WHERE {1}='{2}' AND UseCount>0 AND Ticket_States IN (3,4,5) AND LastUseTime is not null AND datediff(minute ,GETDATE(),LastUseTime)>-10 AND datediff(minute ,GETDATE(),LastUseTime)<10", Tablename, pKname, pKvalue);
                            DataTable sldt = DataFactory.SqlDataBase().GetDataTableBySQL(slectSql);
                            if (!DataTableHelper.IsExistRows(sldt))
                            {
                                StringBuilder updatesql = new StringBuilder();
                                updatesql.AppendFormat("UPDATE {0} SET UseCount=UseCount-1,LastUseTime=GETDATE() WHERE {1}='{2}'", Tablename, pKname, pKvalue);
                                DataFactory.SqlDataBase().ExecuteBySql(updatesql);
                            }

                            isvaild = true;
                        }
                    }
                    catch (Exception)
                    {

                        throw;
                    }

                }
            }
            return isvaild;
        }
        public DataTable GetTicketsInfoByID(string tablename, string pKvalue)
        {
            DataTable dt = new DataTable();
            string pKname = GetpKname(tablename);

            if (!string.IsNullOrEmpty(pKname))
            {
                StringBuilder strSql = new StringBuilder();
                strSql.AppendFormat("SELECT *  FROM {0} WHERE {1}='{2}'", tablename, pKname, pKvalue);
                dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
            }
            return dt;
        }

        public string GetTicketInfoByNO(string TicketNO, string TicketType)
        {
            string result = string.Empty;

            if ((!string.IsNullOrEmpty(TicketNO))&&(!string.IsNullOrEmpty(TicketType)))
            {
                 StringBuilder strSql = new StringBuilder();
                 strSql.AppendFormat("SELECT *  FROM {0} WHERE Ticket_NO='{1}' AND UseCount>0 AND Ticket_States IN (3,4,5)", TicketType, TicketNO);
                DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql);

                if (DataTableHelper.IsExistRows(dt))
                {
                    DataRow row = dt.Rows[0];
                    result = TicketType + "|" + GetpKname(TicketType) + "|" + row[0].ToString();
                } 
            }

            return result;
        }
        /// <summary>
        /// 获取两票信息（含工器具明细）--2015-1-24
        /// </summary>
        /// <param name="TicketsInfo">传递票号信息</param>
        /// <returns></returns>
        public string GetTicketsInfo(string TicketsInfo)
        {
            if (string.IsNullOrEmpty(TicketsInfo))
                return Result.GetFaultXml(Error.XML_IS_NULL);

            string[] arr = TicketsInfo.Split('|');
            if (arr == null || arr.Length == 0)
                return Result.GetFaultXml(Error.XML_IS_NULL);

            string Tablename = arr[0].ToString();
            //string pKname = arr[1].ToString();
            string pKname = GetpKname(Tablename);
            string pKvalue = arr[2].ToString();
            try
            {
                StringBuilder strSql = new StringBuilder();
                strSql.AppendFormat("SELECT TS.Ticket_NO AS TICKETSNO,TS.Operate_Name AS TICKETSTYPE,TS.HEADER AS HEADER,TE.EquipmentID AS EQUIPMENTID,TS.Ticket_States AS STATES,TS.UseCount AS UESE,TS.Operate_Type AS TICKETSTYPEID,TE.EquipmentName AS EQUIPMENTNAME FROM {0} TS LEFT OUTER JOIN Tickets_Equipments TE ON TE.TICKETID=TS.{1} WHERE TS.{1}=@pKvalue", Tablename, pKname);
                SqlParam[] para = new SqlParam[]
                    {
                        new SqlParam("@pKvalue",pKvalue),
                    };

                DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
                if (DataTableHelper.IsExistRows(dt))
                {
                    return GetTicketsXml(dt);

                }
                else
                {
                    return Result.GetFaultXml(Error.RESULT_ERROR);
                }
            }
            catch (Exception ex)
            {
                return Result.GetFaultXml(ex.Message);
            }
        }
        private string GetTicketsXml(DataTable dt)
        {
            StringBuilder xml = new StringBuilder();
            xml.Append("<DATAS>");
            foreach (DataRow row in dt.Rows)
            {
                xml.AppendFormat("<TICKETSNO>{0}</TICKETSNO>", row["TICKETSNO"].ToString());
                xml.AppendFormat("<TICKETSTYPE>{0}</TICKETSTYPE>", row["TICKETSTYPE"].ToString());
                xml.AppendFormat("<HEADER>{0}</HEADER>", row["HEADER"].ToString());
                xml.AppendFormat("<EQUIPMENTID>{0}</EQUIPMENTID>", row["EQUIPMENTID"].ToString());
                xml.AppendFormat("<STATES>{0}</STATES>", row["STATES"].ToString());
                xml.AppendFormat("<UESE>{0}</UESE>", row["UESE"].ToString());
                xml.AppendFormat("<TICKETSTYPEID>{0}</TICKETSTYPEID>", row["TICKETSTYPEID"].ToString());
                xml.AppendFormat("<EQUIPMENTNAME>{0}</EQUIPMENTNAME>", row["EQUIPMENTNAME"].ToString());
            }
            xml.Append("</DATAS>");

            return xml.ToString();
        }
        private string GetpKname(string tablename)
        {
            string pKname = "";
            if (!string.IsNullOrEmpty(tablename))
            {
                switch (tablename)
                {
                    case "Tickets_Control":
                        pKname = "Control_ID";
                        break;
                    case "Tickets_Emergency":
                        pKname = "Emergency_ID";
                        break;
                    case "Tickets_Operater":
                        pKname = "OPERATE_ID";
                        break;
                    case "Tickets_Task":
                        pKname = "Task_ID";
                        break;
                    case "Tickets_Work1":
                        pKname = "Work_ID";
                        break;
                    case "Tickets_Work2":
                        pKname = "Work_ID";
                        break;
                    case "Tickets_Station_Operater":
                        pKname = "OPERATE_ID";
                        break;
                    default:
                        break;
                }
            }
            return pKname;
        }
        #endregion

        #region Cable1
        public DataTable GetCable1ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TC1.*,ORG.Organization_Code,ORG.Organization_Name,TS.States_Name ");
            strSql.Append("FROM Tickets_Cable1 TC1,Base_Organization ORG,Tickets_States TS ");
            strSql.Append("WHERE TC1.Organization_ID=ORG.Organization_ID AND TC1.Ticket_States=TS.States_ID ");
            strSql.Append("AND TC1.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }
        #endregion

        #region GetExeState
        public string GetExeState(string stateNum, int type)
        {
            if (type == 0)
            {
                if (stateNum == "1")
                {
                    return "√";
                }
                else
                {
                    return "×";
                }
            }
            else
            {
                if (stateNum == "1")
                {
                    return "已执行";
                }
                else
                {
                    return "未执行";
                }

            }
        }
        #endregion

        #region Cable2
        public DataTable GetCable2ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TK.*,ORG.Organization_Code,ORG.Organization_Name,TS.States_Name ");
            strSql.Append("FROM Tickets_Cable2 TK,Base_Organization ORG,Tickets_States TS ");
            strSql.Append("WHERE TK.Organization_ID=ORG.Organization_ID AND TK.Ticket_States=TS.States_ID ");
            strSql.Append("AND TK.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }
        #endregion

        #region Fire1
        public DataTable GetFire1ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TK.*,ORG.Organization_Code,ORG.Organization_Name,TS.States_Name  ");
            strSql.Append("FROM Tickets_Fire1 TK,Base_Organization ORG,Tickets_States TS ");
            strSql.Append("WHERE TK.Organization_ID=ORG.Organization_ID AND TK.Ticket_States=TS.States_ID ");
            strSql.Append("AND TK.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }
        #endregion

        #region Fire2
        public DataTable GetFire2ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TK.*,ORG.Organization_Code,ORG.Organization_Name ");
            strSql.Append("FROM Tickets_Fire2 TK,Base_Organization ORG ");
            strSql.Append("WHERE TK.Organization_ID=ORG.Organization_ID ");
            strSql.Append("AND TK.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }
        #endregion

        #region Security
        public DataTable GetSecurityListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TK.*,ORG.Organization_Code,ORG.Organization_Name,TS.States_Name ");
            strSql.Append("FROM Tickets_Security TK,Base_Organization ORG,Tickets_States TS ");
            strSql.Append("WHERE TK.Organization_ID=ORG.Organization_ID AND TK.Ticket_States=TS.States_ID ");
            strSql.Append("AND TK.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }
        public DataTable GetSecurityItemList(string ParentId)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT * FROM Tickets_SecurityItem ");
            strSql.Append("WHERE ParentId = @ParentId ");
            strSql.Append("ORDER BY SortCode ASC");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@ParentId",ParentId),
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }
        public void InsertSecurityItem(string ParentId, string[] SecurityExecution, string[] SecurityContent, string[] SecurityRecovery)
        {
            if (string.IsNullOrEmpty(ParentId))
            {
                return;
            }
            if (SecurityExecution == null || (SecurityExecution != null && SecurityExecution.Length == 0))
            {
                return;
            }
            int len = SecurityExecution.Length;
            int SortCode = 1;
            StringBuilder strSql = new StringBuilder();
            strSql.Append("BEGIN \n\n");
            if (len > 0)
            {
                for (int i = 0; i < len; i++)
                {
                    if (!string.IsNullOrEmpty(SecurityExecution[i]))
                    {
                        strSql.Append("INSERT INTO Tickets_SecurityItem ");
                        strSql.Append(" ([SecurityItemID],[ParentId],[SortCode],[SecurityExecution],[SecurityContent],[SecurityRecovery],[CreateUserId],[CreateUserName]) ");
                        strSql.Append(" VALUES ('");
                        strSql.Append(CommonHelper.GetGuid + "','");
                        strSql.Append(ParentId + "',");
                        strSql.Append(SortCode + ",'");
                        strSql.Append(SecurityExecution[i] + "','");
                        strSql.Append(SecurityContent[i] + "','");
                        strSql.Append(SecurityRecovery[i] + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserId + "','");
                        strSql.Append(RequestSession.GetSessionUser().UserName + "'");
                        strSql.Append(");\n\r ");
                        SortCode++;
                    }
                }
            }
            strSql.Append("END");

            DataFactory.SqlDataBase().ExecuteBySql(strSql);
        }
        #endregion

        #region Station Work1
        public DataTable GetStationWork1ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TC1.*,ORG.Organization_Code,ORG.Organization_Name,TS.States_Name ");
            strSql.Append("FROM Tickets_Station_Work1 TC1,Base_Organization ORG,Tickets_States TS ");
            strSql.Append("WHERE TC1.Organization_ID=ORG.Organization_ID AND TC1.Ticket_States=TS.States_ID ");
            strSql.Append("AND TC1.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);

        }
        #endregion

        #region Station Emergency
        public DataTable GetStationEmergencyListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TE.*,ORG.Organization_Code,ORG.Organization_Name,TS.States_Name ");
            strSql.Append("FROM Tickets_Station_Emergency TE,Base_Organization ORG,Tickets_States TS ");
            strSql.Append("WHERE TE.Organization_ID=ORG.Organization_ID AND TE.Ticket_States=TS.States_ID ");
            strSql.Append("AND TE.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }
        #endregion

        #region Station Work2
        public DataTable GetStationWork2ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TK.*,ORG.Organization_Code,ORG.Organization_Name,TS.States_Name ");
            strSql.Append("FROM Tickets_Station_Work2 TK,Base_Organization ORG,Tickets_States TS ");
            strSql.Append("WHERE TK.Organization_ID=ORG.Organization_ID AND TK.Ticket_States=TS.States_ID ");
            strSql.Append("AND TK.DeleteMark=1 ");
            strSql.Append(SqlWhere);
            return DataFactory.SqlDataBase().GetPageList(strSql.ToString(), IList_param.ToArray<SqlParam>(), "Ticket_NO", "Desc", pageIndex, pageSize, ref count);
        }
        #endregion

        #region GetEquipmentList
        public DataTable GetEquipmentList(string TicketID)
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT TOP 1 * FROM Tickets_Equipments ");
            strSql.Append("WHERE TICKETID = @TICKETID ");

            SqlParam[] para = new SqlParam[]
            {
                new SqlParam("@TICKETID",TicketID),
            };
            return DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
        }
        #endregion
    }
}

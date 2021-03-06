﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using Common.DotNetData;
using Common.DotNetCode;
using Busines.MODEL;

namespace Busines.IDAO
{
    public interface Contract_IDAO
    {
        DataTable GetContractTypeList();
        bool IsInitFinger(string UID, string ContractType);

        double GetLoan(string ContractID);
        DataTable GetApproveListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetMyApproveListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetMyApproveOverListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetMyApproveOverList(StringBuilder SqlWhere);
        DataTable GetMyApproveList(StringBuilder SqlWhere);
        bool InsertProcess(string CID, bool IsPass, string Operat, string SignBase);
        int ApproveDisose(string CID, bool IsPass, string Operat, string SignBase);
        DataTable GetContract_SelectListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetContract_SelectList(StringBuilder SqlWhere);
        DataTable GetContract_SelectSubList(string SL_ID);
        bool CreateContract(string UID, string ContractContent);
        bool IsApproving(string UID);
        DataTable GetHistoryListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        string GetUIDbyHUID(string HUID);
        bool IsExistApprove(string UID);
        DataTable GetContractInfoByID(string UID);
        bool Contract_Loan_Add(Contract_Loan_Model model);
        bool Contract_Loan_Exists(string ContractID);
        DataTable GetMortgageDetailPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        bool SaveSendMessage(string UserName, string UserTel, string MSG, string SendTime, int State, string CreateUser, int MsgType);
        bool IsSendMessage(string Organization_ID);
        DataTable GetMessageHistoryPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetUserGuaranteeByUID(string UID);
        DataTable GetUserGuaranteeByUGID(string UGID);
        DataTable GetUserPledgeByUID(string UID);
    }
}

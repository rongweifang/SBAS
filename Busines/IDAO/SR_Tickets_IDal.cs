using Common.DotNetCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;


namespace Busines.IDAO
{
    public interface SR_Tickets_IDal
    {
        bool Exists(string PL_OPERATE_ID);
        string GetOrgaizationName(string Organization_ID);
        DataTable GetOrgaizationList(string User_ID);
        string GetOrganization_IDs(string User_ID);
        string GetOrganization_Fax(string Organization_ID);
        DataTable GetOrgaizationList();
        DataTable GetTicketsNOListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetTickets_NO_List();
        DataTable GetTicketsList();
        bool GetExistsTicket_NO(string ParentId, string Menu_Id, string TICKET_NO);
        DataTable GetTicket_NO(string ParentId,string Menu_Id);
        int GetTicketNO(string ParentId, string Menu_Id);
        bool UpdateTicketNo(string TICKETS_NO_ID);
        bool UpdateTicketNo(string TICKETS_NO_ID, int oldID);
        DataTable GetOperaterItemList(string ParentId);
        void InsertOperaterItem(string ParentId, string[] OperaterItemValue);
        void DeleteOperaterItem(string ParentId);
        bool GetExistsTickets(string ParentId, string Menu_Id);
        DataTable GetOperateList(string strWhere);
        DataTable GetOperateListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetOperateList(string Organization_ID, string Operate_Type);
        DataTable GetStationOperaterList(string strWhere);
        DataTable GetStationOperaterListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        bool ToQRCode(string CodeStr, string Filename);
        Bitmap ToQRCode(string CodeStr);
        DataTable GetStateList(string Tickets_Type);
        DataTable GetStateList();
        string GetStateName(int States_ID, string Tickets_Type);
        string GetStateName(int States_ID);
        //IList<string> GetMonth();
        int ChangeStateTicket(string TableName, string pkName, string pkVal, string StateName, string StateVal);
        int IsExistTicket(string TableName, string pkName, string pkVal, string StateName,string StateVal);
        DataTable GetEmergencyListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetControlListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetControlItemList(string ParentId);
        void InsertControlItem(string ParentId, string[] WorkItem, string[] DangerItem, string[] StepItem, string[] ItemIssuer);
        void DeleteControlItem(string ParentId);
        DataTable GetEmergencyItemList(string ParentId);
        void InsertEmergencyItem(string ParentId, string[] Items);
        void DeleteEmergencyItem(string ParentId);
        DataTable GetTaskListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetTaskItemList(string ParentId);
        void InsertTaskItem(string ParentId, string[] TaskItem_Name, string[] TaskItem_Content);
        void InsertTaskItem(string ParentId, string[] TaskItem_Name, string[] TaskItem_Position, string[] TaskItem_Content);
        DataTable GetWork1ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        void InsertGroundItem(string ParentId, string[] Position, string[] GroundLead_NO, string[] HangTime, string[] RemoveTime);
        //void InsertGroundItem(string ParentId, string[] Position, string[] GroundLead_NO, string[] HangUser, string[] HangTime, string[] RemoveTime);
        void InsertGroundItem(string ParentId, string[] Position, string[] GroundLead_NO, string[] HangUser);
        void InsertGateItem(string ParentId, string[] OrgName, string[] GateName, string[] HangUser);
        DataTable GetGroundLeadItemList(string ParentId);
        DataTable GetGateItemList(string ParentId);
        DataTable GetWork2ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        bool IsableOpenDoor(string TicketsInfo);
        DataTable GetTicketsInfoByID(string tablename, string pKvalue);
        string GetTicketsInfo(string TicketsInfo);
        DataTable GetCable1ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        string GetExeState(string stateNum, int type);
        DataTable GetCable2ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetFire1ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetFire2ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetSecurityListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        void InsertSecurityItem(string ParentId, string[] SecurityExecution, string[] SecurityContent, string[] SecurityRecovery);
        DataTable GetSecurityItemList(string ParentId);
        DataTable GetStationWork1ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetStationEmergencyListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetStationWork2ListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetEquipmentList(string TicketID);
        string GetTicketInfoByNO(string TicketNO, string TicketType);
    }
}

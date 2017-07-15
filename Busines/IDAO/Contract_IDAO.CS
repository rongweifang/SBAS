using System;
using System.Collections.Generic;
using System.Linq;
using System.Data;
using System.Text;
using Common.DotNetData;
using Common.DotNetCode;

namespace Busines.IDAO
{
    public interface Contract_IDAO
    {
        bool IsInitFinger(string UID, string ContractType);

        double GetLoan(string ContractID);
        DataTable GetApproveListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetMyApproveListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetMyApproveOverListPage(StringBuilder SqlWhere, IList<SqlParam> IList_param, int pageIndex, int pageSize, ref int count);
        DataTable GetMyApproveOverList(StringBuilder SqlWhere);
        DataTable GetMyApproveList(StringBuilder SqlWhere);
        bool InsertProcess(string CID, bool IsPass, string Operat, string SignBase);
        int ApproveDisose(string CID, bool IsPass, string Operat, string SignBase);
    }
}

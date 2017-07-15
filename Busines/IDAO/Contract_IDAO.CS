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
        DataTable GetMyApproveList(StringBuilder SqlWhere);
    }
}

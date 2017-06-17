using Busines.IDAO;
using Common.DotNetData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web.SessionState;

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
    }
}

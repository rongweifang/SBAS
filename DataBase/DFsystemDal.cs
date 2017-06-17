using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using TestAndroid.DAL;

namespace DataBase
{
    public class DFsystemDal : BaseDAL
    {
        public ResTableField GetInputMatch(string tablename,string field,string input)
        {
            using (var context = WDbContext())
            {
                string strSql = "";
                if (string.IsNullOrEmpty(input))
                {
                    strSql = string.Format("SELECT DISTINCT {0} AS S FROM {1} WHERE  ISNULL({0},'')<>''", field, tablename);
                    
                }
                else
                {
                    strSql = string.Format("SELECT DISTINCT {0} AS S FROM {1} WHERE  ISNULL({0},'')<>'' AND {0} LIKE '%{2}%'", field, tablename, input);

                }
                var retItem = context.Sql(strSql)
                    .QueryMany<ItemTableField>();

                ResTableField res = new ResTableField();
                res.sItems = retItem;

                return res;
            }
        }
        public ResTableField GetInputMatch(string tablename, string field, string UserName, string input)
        {
            using (var context = WDbContext())
            {
                string strSql = "";
                if (string.IsNullOrEmpty(input))
                {
                    strSql = string.Format("SELECT DISTINCT {0} AS S FROM {1} WHERE ISNULL({0},'')<>'' AND [USER_ID]='{2}'", field, tablename, UserName);

                }
                else
                {
                    strSql = string.Format("SELECT DISTINCT {0} AS S FROM {1} WHERE  ISNULL({0},'')<>'' AND [USER_ID]='{2}' AND {0} LIKE '%{3}%'", field, tablename, UserName, input);

                }
                var retItem = context.Sql(strSql)
                    .QueryMany<ItemTableField>();

                ResTableField res = new ResTableField();
                res.sItems = retItem;

                return res;
            }
        }
    }
}

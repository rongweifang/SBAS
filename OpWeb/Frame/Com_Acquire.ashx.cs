using Common.DotNetBean;
using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using TestAndroid.BLL;

namespace OpWeb.Frame
{
    /// <summary>
    /// Com_Acquire 的摘要说明
    /// </summary>
    public class Com_Acquire : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                context.Response.Write("");
                context.Response.End();
            }

            context.Response.ContentType = "text/plain";
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1.0);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";
            string TableName = context.Request["T"];
            string TableField = context.Request["F"];
            string UserName = context.Request["U"];
            string Sinput = context.Request["P"];

            DFsystemDal DF = new DFsystemDal();
            var res = "";
            if (!string.IsNullOrEmpty(TableName) &&!string.IsNullOrEmpty(TableField) )
            {
                ResTableField s = new ResTableField();
                if (!string.IsNullOrEmpty(UserName))
                {
                    string userid = RequestSession.GetSessionUser().UserId.ToString();
                    res = JsonTool.Serialize<ResTableField>(DF.GetInputMatch(TableName, TableField, userid, Sinput));
                }
                else
                {
                    res = JsonTool.Serialize<ResTableField>(DF.GetInputMatch(TableName, TableField, Sinput));
                }
               
            }

            context.Response.Write(res);
            context.Response.End();

        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}
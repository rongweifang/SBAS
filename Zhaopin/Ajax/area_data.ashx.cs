using Busines.DAL;
using Busines.IDAO;
using Common.DotNetJson;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Zhaopin.Ajax
{
    /// <summary>
    /// area_data 的摘要说明
    /// </summary>
    public class area_data : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1.0);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";
            string value = context.Request["value"];

            IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
            if (value != null)
            {
                context.Response.Write(JsonHelper.DataTableToJson(peridal.getCity(value)));
                context.Response.End();
            }
            else
            {
                context.Response.Write(JsonHelper.DataTableToJson(peridal.getCity("1")));
                context.Response.End();

            }
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
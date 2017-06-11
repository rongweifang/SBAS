using Busines.DAL;
using Busines.IDAO;
using Common.DotNetData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;

namespace Zhaopin.Ajax
{
    /// <summary>
    /// University_data 的摘要说明
    /// </summary>
    public class University_data : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1.0);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";
            string location = context.Request["location"];
            string action = context.Request["action"];
            string q = context.Request["q"];

            IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
            if (action != null)
            {
                if (action=="Search")
                {
                    if (location!=null)
                    {
                        //getSchool_Info
                        context.Response.Write(DataTabeleToString(peridal.getSchool_Info(q,location)));
                        context.Response.End();
                    }
                }
               
            }
            
        }
        public string DataTabeleToString(DataTable dt)
        {
            StringBuilder sb = new StringBuilder();
            if (DataTableHelper.IsExistRows(dt))
            {
                foreach (DataRow dr in dt.Rows)
                {
                    sb.AppendFormat("{0},{1};",dr[0].ToString(),dr[1].ToString());
                }
            }
            return sb.ToString();
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
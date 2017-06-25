using Common.DotNetBean;
using System;
using System.Collections.Generic;
using System.Drawing;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace OpWeb.Frame
{
    /// <summary>
    /// Common_Files 的摘要说明
    /// </summary>
    public class Common_Files : IHttpHandler, IRequiresSessionState
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



        }

        private Bitmap Base64ToImg(string base64Code)
        {
            MemoryStream stream = new MemoryStream(Convert.FromBase64String(base64Code));
            return new Bitmap(stream);
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
using Busines;
using Busines.DAL;
using Busines.IDAO;
using System;
using System.Web;
using System.Web.SessionState;

namespace Zhaopin.Ajax
{
    /// <summary>
    /// Common_UserValidate 的摘要说明
    /// </summary>
    public class Common_UserValidate : IHttpHandler, IRequiresSessionState
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1.0);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";

            string Action = context.Request["action"];
            string name = context.Request["name"];
            string email = context.Request["email"];
            string loginName = context.Request["loginName"];
            string mobile = context.Request["mobile"];
            string rand = context.Request["rand"];
            string emailcode = context.Request["emailcode"];
            IMPC_Person_IDAO personidao = new IMPC_Person_DAL();
            string text = Action;
            if (text != null)
            {
                if (text == "validname")
                {
                    context.Response.Write(personidao.validname(loginName));
                    context.Response.End();
                }
                else if (text == "validmail")
                {
                    context.Response.Write(personidao.validmail(email));
                    context.Response.End();
                }
                else if (text == "validmobile")
                {
                    context.Response.Write(personidao.validmobile(mobile));
                    context.Response.End();
                }
                else if (text == "validrand")
                {
                    context.Response.Write(rand.ToLower() == context.Session["dt_session_code"].ToString().ToLower()?0:1);
                }
                else if (text == "emailcode")
                {
                    context.Response.Write(personidao.validemailcode(email,emailcode));
                    context.Response.End();
                }
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
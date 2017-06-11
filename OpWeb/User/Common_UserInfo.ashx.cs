using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace OpWeb.User
{
    /// <summary>
    /// Common_UserInfo 的摘要说明
    /// </summary>
    public class Common_UserInfo : IHttpHandler, IRequiresSessionState
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            context.Response.Buffer = true;
            context.Response.ExpiresAbsolute = DateTime.Now.AddDays(-1.0);
            context.Response.AddHeader("pragma", "no-cache");
            context.Response.AddHeader("cache-control", "");
            context.Response.CacheControl = "no-cache";
            string Action = context.Request["action"];
            string user_ID = context.Request["user_ID"];
            Hashtable ht = new Hashtable();
            string text = Action.ToLower();
            if (text != null)
            {
                switch (text)
                {
                    case "recover":
                        context.Response.Write(peridal.ChangeLock(user_ID, "0"));
                        context.Response.End();
                        break;
                    case "flag":
                        context.Response.Write(peridal.AddFlag(RequestSession.GetSessionUser().UserId.ToString(),user_ID));
                        context.Response.End();
                        break;
                    case "lock":
                        context.Response.Write(peridal.ChangeLock(user_ID, "1"));
                        context.Response.End();
                        break;
                    case "submitpass":
                        //ChangeStatus
                        context.Response.Write(peridal.ChangeStatus(user_ID, "1"));
                        context.Response.End();
                        break;
                    case "submitnotpass":
                        context.Response.Write(peridal.ChangeStatus(user_ID, "2"));
                        context.Response.End();
                        break;
                    case "onover":
                        context.Response.Write(peridal.ChangeStatus(user_ID, "3"));
                        context.Response.End();
                        break;
                    case "recheck":
                        context.Response.Write(peridal.ReCheckUser(user_ID));
                        context.Response.End();
                        break;
                    case "delete":
                        context.Response.Write(peridal.DeleteFlag(RequestSession.GetSessionUser().UserId.ToString(),user_ID));
                        context.Response.End();
                        break;
                    case "exports":
                        context.Response.Write(peridal.ExportExcelFilebyUserID(user_ID));
                        context.Response.End();
                        break;
                    default:
                        context.Response.Write(0);
                        context.Response.End();
                        break;
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
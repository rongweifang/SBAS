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
    /// MessageSend 的摘要说明
    /// </summary>
    public class MessageSend : IHttpHandler, IRequiresSessionState
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
            string ID = context.Request["ID"];
            string MsgInfo = context.Request["MessageInfo"];
            string MessageType = context.Request["MsgType"];
            string MsgTitle = context.Request["MsgTitle"];
            Hashtable ht = new Hashtable();
            string text = Action.ToLower();
            if (text != null)
            {
                switch (text)
                {
                    case "sendmessage":
                        context.Response.Write(peridal.UpdateSendMessage(ID));
                        context.Response.End();
                        break;
                    case "createmessage":
                        context.Response.Write(peridal.CreateSendMessage(RequestSession.GetSessionUser().UserId.ToString(), MessageType, MsgTitle, MsgInfo, ID));
                        context.Response.End();
                        break;
                    case "feedback":
                        context.Response.Write(peridal.ReadFeedback(ID));
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
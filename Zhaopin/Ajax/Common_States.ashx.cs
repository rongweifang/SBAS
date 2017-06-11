using Busines;
using Busines.DAL;
using Busines.IDAO;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Zhaopin.Ajax
{
    /// <summary>
    /// Common_States 的摘要说明
    /// </summary>
    public class Common_States : IHttpHandler, IRequiresSessionState
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
            string module = context.Request["module"];
            string tableName = context.Request["tableName"];
            string pkName = context.Request["pkName"];
            string pkVal = context.Request["pkVal"];
            string StateName = context.Request["StateName"];
            SR_Tickets_IDal systemidao = new SR_Tickets_Dal();
            string text = Action;
            int Return = 0;
            if (text != null)
            {
                if (!(text == "Cut"))
                {
                    switch(text)
                    {
                        case "invalid":
                            Return = systemidao.ChangeStateTicket(tableName, pkName, pkVal, StateName, "6");
                            context.Response.Write(Return.ToString());
                            break;
                        case "submitaudit":
                            Return = systemidao.ChangeStateTicket(tableName, pkName, pkVal, StateName, "1");
                            context.Response.Write(Return.ToString());
                            break;
                        case "submitpass":
                            Return = systemidao.ChangeStateTicket(tableName, pkName, pkVal, StateName, "3");
                            context.Response.Write(Return.ToString());
                            break;
                        case "submitnotpass":
                            Return = systemidao.ChangeStateTicket(tableName, pkName, pkVal, StateName, "2");
                            context.Response.Write(Return.ToString());
                            break;
                        case "execin":
                            Return = systemidao.ChangeStateTicket(tableName, pkName, pkVal, StateName, "4");
                            context.Response.Write(Return.ToString());
                            break;
                        case "execover":
                            Return = systemidao.ChangeStateTicket(tableName, pkName, pkVal, StateName, "5");
                            context.Response.Write(Return.ToString());
                            break;
                        case "IsExist":
                            Return = systemidao.IsExistTicket(tableName, pkName, pkVal, StateName,"0,2");
                            context.Response.Write(Return.ToString());
                            break;
                        case "IsSubmit":
                            Return = systemidao.IsExistTicket(tableName, pkName, pkVal, StateName, "1");
                            context.Response.Write(Return.ToString());
                            break;
                        case "Isexecin":
                            Return = systemidao.IsExistTicket(tableName, pkName, pkVal, StateName, "3,4");
                            context.Response.Write(Return.ToString());
                            break;
                        default:
                            break;
                    }
                }
                else
                {
                    context.Session.Abandon();
                    context.Session.Clear();
                    context.Response.Write(1);
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
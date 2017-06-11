using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;

namespace Zhaopin.Ajax
{
    /// <summary>
    /// Common_UserRecord 的摘要说明
    /// </summary>
    public class Common_UserRecord : IHttpHandler, IRequiresSessionState
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
            string tableName = context.Request["type"];
            string ID = context.Request["ID"];

            IMPC_Person_IDAO personidao = new IMPC_Person_DAL();
            if (RequestSession.GetSessionUser() == null)
            {
                context.Session.Abandon();
                context.Session.Clear();
                context.Response.Write(0);
                context.Response.End();
            }
            if (string.IsNullOrEmpty(ID))
            {
                context.Session.Abandon();
                context.Session.Clear();
                context.Response.Write(0);
                context.Response.End();
            }
            string text = Action.ToLower();
            int Return = 0;
            if (text != null)
            {
                if (text == "del")
                {
                    switch (tableName.ToLower())
                    {
                        case "family":
                            Return = personidao.FamilyDel(ID);
                            context.Response.Write(Return.ToString());
                            break;
                        case "work":
                            Return = personidao.WorkDel(ID);
                            context.Response.Write(Return.ToString());
                            break;
                        case "award":
                            Return = personidao.AwardDel(ID);
                            context.Response.Write(Return.ToString());
                            break;
                        case "paper":
                            Return = personidao.PaperDel(ID);
                            context.Response.Write(Return.ToString());
                            break;
                        case "research":
                            Return = personidao.ResearchDel(ID);
                            context.Response.Write(Return.ToString());
                            break;
                        case "attachment":
                            Return = personidao.AttachmentDel(ID);
                            context.Response.Write(Return.ToString());
                            break;
                        case "education":
                            Return = personidao.EducationDel(ID);
                            context.Response.Write(Return.ToString());
                            break;
                        case "language":
                            Return = personidao.LanguageDel(ID);
                            context.Response.Write(Return.ToString());
                            break;
                        case "computer":
                            Return = personidao.ComputerDel(ID);
                            context.Response.Write(Return.ToString());
                            break;
                        case "certother":
                            Return = personidao.CertOtherDel(ID);
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
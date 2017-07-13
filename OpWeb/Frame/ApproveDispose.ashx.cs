using Common.DotNetBean;
using DataBase;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using DataBase.Dal;

namespace OpWeb.Frame
{
    /// <summary>
    /// ApproveDispose 的摘要说明
    /// </summary>
    public class ApproveDispose : IHttpHandler, IRequiresSessionState
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
            string WorkInfoId = context.Request["WorkInfoId"];
            string ContractId = context.Request["ContractId"];
            string ContractType = context.Request["ContractType"];

            if (RequestSession.GetSessionUser() == null)
            {
                context.Response.Write("");
                context.Response.End();
            }
            if (Action != null)
            {
                string ACT = Action.ToUpper();
                if (ACT == "SUBMIT")
                {
                    WorkFlowService flowService = new WorkFlowService();
                    context.Response.Write(flowService.CreateWorkFlow(ContractId).ToUpper());
                    context.Response.End();
                }
                else if (ACT == "APPROVE")
                {

                }
            }
            else
            {
                context.Response.Write("false");
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
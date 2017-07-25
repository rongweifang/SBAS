using Busines.DAL;
using Busines.IDAO;
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
            string HUID = context.Request["HUID"];

            Contract_IDAO cidal = new Contract_Dal();

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
                    //WorkFlowService flowService = new WorkFlowService();
                    //context.Response.Write(flowService.CreateWorkFlow(ContractId).ToUpper());
                    //context.Response.End();
                    //判断是否已经存在审批记录
                  
                    string UID = cidal.GetUIDbyHUID(HUID);
                    bool isexist = cidal.IsExistApprove(UID);
                    if (isexist)
                    {
                        context.Response.Write("EXIST");
                        context.Response.End();
                    }
                    else
                    {
                    if (!string.IsNullOrEmpty(UID))
                    {
                        WorkFlowService flowService = new WorkFlowService();
                        context.Response.Write(flowService.CreateWorkFlow(UID).ToUpper());
                        context.Response.End();
                    }
                    else
                    {
                        context.Response.Write("false");
                        context.Response.End();
                    }
                    }
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
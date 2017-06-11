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
    /// Common_UserApply 的摘要说明
    /// </summary>
    public class Common_UserApply : IHttpHandler, IRequiresSessionState
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
            string specID = context.Request["specID"];
       
            IMPC_Person_IDAO personidao = new IMPC_Person_DAL();
            string text = Action;
            if (text != null)
            {
                if (text == "specapply")
                {
                    if (personidao.IsUserCheck())
                    {
                        if (personidao.IsFreshs(specID))
                        {
                            if (personidao.IsSpecialtyNormal(specID))
                            {
                                context.Response.Write(personidao.ApplySpec(specID));
                                context.Response.End();
                            }
                            else
                            {
                                context.Response.Write(2);
                                context.Response.End();
                            }
                        }
                        else
                        {
                            context.Response.Write(4);
                            context.Response.End();
                        }
                       
                    }
                    else
                    {
                        context.Response.Write(3);
                        context.Response.End();
                    }
                    
                   
                }
                //else if (text == "validmail")
                //{
                //    context.Response.Write(personidao.validmail(email));
                //    context.Response.End();
                //}
               
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
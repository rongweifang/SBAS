using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserCenter
{
    public partial class login : System.Web.UI.Page
    {
        IMPC_Person_IDAO person_idao = new IMPC_Person_DAL();
        RM_UserInfo_IDAO user_idao = new RM_UserInfo_Dal();
        RM_System_IDAO sys_idao = new RM_System_Dal();
        IPScanerHelper objScan = new IPScanerHelper();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_Login_Click(object sender, EventArgs e)
        {
            //if (this.rand.Value.ToLower() != this.Session["dt_session_code"].ToString().ToLower())
            //{
            //    this.rand.Focus();
            //    this.randerr.InnerHtml = "验证码输入不正确！";
            //    this.randerr.Style.Add(HtmlTextWriterStyle.Color, "red");
            //    return;
            //}

            DataTable dtlogin = person_idao.PersonLogin(name.Value.Trim(), password.Value.Trim(), loginName.Value.Trim());
            if (dtlogin != null)
            {
                objScan.DataPath = Server.MapPath("/Themes/IPScaner/QQWry.Dat");
                objScan.IP = RequestHelper.GetIP();
                //string OWNER_address = objScan.IPLocation();
                string OWNER_address = RequestHelper.GetIP();
                if (dtlogin.Rows.Count != 0)
                {
                    user_idao.SysLoginLog(loginName.Value.Trim(), "1", OWNER_address);
                    Hashtable ht = new Hashtable();
                    ht["LASTTIME"] = DateTime.Now.ToString();
                    ht["LastIP"] = OWNER_address;
                    DataFactory.SqlDataBase().Submit_AddOrEdit("Personinfo", "loginName", loginName.Value.Trim(), ht);
                    RequestSession.AddSessionUser(new SessionUser
                    {
                        UserId = dtlogin.Rows[0]["User_ID"].ToString(),
                        UserAccount = dtlogin.Rows[0]["loginName"].ToString(),
                        UserName = dtlogin.Rows[0]["name"].ToString(),
                        UserPwd = dtlogin.Rows[0]["password"].ToString(),
                        Organization_IDs = "",
                        OrganizationID = "",
                        Organization_Fax = ""
                    });

                    Response.Redirect("/UserCenter/");
                }
                else
                {
                    user_idao.SysLoginLog(loginName.Value.Trim(), "0", OWNER_address);
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('用户名或密码错误！');</script>");
                    return;
                }
            }
            else
            {

            }
        }


    }
}
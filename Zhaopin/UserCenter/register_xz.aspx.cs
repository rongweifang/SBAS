using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetCode;
using Common.DotNetEamil;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserCenter
{
    public partial class register_xz : System.Web.UI.Page
    {
        private IMPC_Person_IDAO perdal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {

            }
        }

        private bool chk_form(Hashtable ht)
        {

            return checkname(ht["name"].ToString());


        }
        private bool checkname(string realname)
        {
            if (string.IsNullOrEmpty(realname))
            {
                return false;
            }
            else if (!Regex.IsMatch(realname, "^[\u2e80-\ufe4f]{1,9}[·]{0,1}[\u2e80-\ufe4f]{1,9}$"))
            {
                return false;
            }
            else if (realname.Length < 2 || realname.Length > 11)
            {
                return false;
            }
            else
            {

                return true;
            }
        }
        protected void btn_submit_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('报名时间已经结束，注册功能被锁定！');</script>");
            //Hashtable ht = new Hashtable();
            //ht = ControlBindHelper.GetWebControls(this.Page);
            //ht["User_ID"] = CommonHelper.GetGuid;
            //string datetime = DateTime.Now.ToString();
            //if (!chk_form(ht))
            //{
            //    return;
            //}
            //if (!IDCardValidation.CheckIDCard18(ht["loginName"].ToString()))
            //{
            //    return;
            //}
            //if (perdal.validname(ht["loginName"].ToString()) == 1)
            //{
            //    return;
            //}
            //if (perdal.validmail(ht["email"].ToString()) == 1)
            //{
            //    return;
            //}

            //string idcard = ht["loginName"].ToString();

            //string sexno=idcard.Substring(16, 1);

            //ht["sex"] = (int.Parse(sexno) % 2 == 0) ? "0" : "1";

            //ht["birthday"] = idcard.Substring(6, 4) + "-" + idcard.Substring(10, 2) + "-" + idcard.Substring(12, 2);

            //ht.Remove("rand");
            //ht.Remove("agreement");
            //ht.Remove("emailcode");
            //ht.Remove("confirm_password");

            //bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Personinfo", "User_ID", "", ht);
            //if (IsOk)
            //{
            //    try
            //    {
            //        //INSERT INTO UserMessage (ID,User_ID,MsgType,MsgTitle,MsgSender,MsgContent) VALUES ()
            //        StringBuilder sbinsert = new StringBuilder();
            //        sbinsert.AppendFormat("INSERT INTO UserMessage (ID,User_ID,MsgType,MsgTitle,MsgSender,MsgContent) VALUES ('{0}','{1}',1,'注册成功','48f3889c-af8d-401f-ada2-c383031af92d','{2},你于{3}成功注册内蒙古电力（集团）有限责任公司招聘平台')", CommonHelper.GetGuid, ht["User_ID"].ToString(), ht["name"].ToString(), datetime);
            //        DataFactory.SqlDataBase().ExecuteBySql(sbinsert);
            //        StringBuilder sb = new StringBuilder();
            //        sb.AppendFormat("{0}:<br/>", ht["name"].ToString());

            //        //为了你能够正常收到内蒙古电力(集团)有限责任公司的邮件，请将impc@vip.126.com加入通讯录
            //        sb.Append("您好，欢迎注册内蒙古电力（集团）有限责任公司招聘系统！<br/>");
            //        sb.AppendFormat("你的登录账号:{0},登录密码:{1},邮箱:{2}", ht["loginName"].ToString(), ht["password"].ToString(), ht["email"].ToString());
            //        sb.Append("<br/><br/><br/>");
            //        sb.Append("---------------------------------------------------------------------------<br/<br/>");
            //        sb.Append("内蒙古电力（集团）有限责任公司  人力资源部<br/>");
            //        sb.AppendFormat("{0}", datetime);

            //        SMTPManager.MailSending(ht["email"].ToString(), "注册成功-内蒙古电力（集团）有限责任公司", sb.ToString(), "");
            //    }
            //    catch (Exception)
            //    {
                 
            //    }
              
            //    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('注册成功，转向登录页面！'); window.location.href = '/UserCenter/Login.aspx';</script>");
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('注册失败，请刷新本页面重新注册！');</script>");
            //}
        }

        protected void btn_mail_valid_Click(object sender, EventArgs e)
        {
            if (ValidateUtil.IsEmail(email.Value.Trim()))
            {

                if (perdal.validmail(email.Value.Trim()) != 1)
                {
                    string dcode = CommonHelper.RndNum(6);
                    string datetime = DateTime.Now.ToString();
                    Hashtable ht = new Hashtable();
                    ht.Add("mail", email.Value.Trim());
                    ht.Add("dcode", dcode);
                    ht.Add("createdate", datetime);

                    DataFactory.SqlDataBase().Submit_AddOrEdit("SemdMail", "mail", "", ht);

                    string str = string.Format("内蒙古电力（集团）有限责任公司：\n {0}是您本次注册验证码，5分钟内有效。内蒙古电力（集团）有限责任公司工作人员绝不会向您索取此校验码，切勿告知他人。\n\n---------------------------------------------------------------------------<br/<br/>[内蒙古电力（集团）有限责任公司]<br/>{1}", dcode, datetime);
                    try
                    {
                        string sendresult = SMTPManager.MailSending(email.Value.Trim(), "邮箱验证码-内蒙古电力（集团）有限责任公司", str, "");
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('验证码发送成功！请查询邮箱。验证码5分钟内有效！');</script>");
                    }
                    catch (Exception)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('邮件发送失败，请重试！');</script>");
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('邮箱已存在，请更换邮箱注册！');</script>");
                }

            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('邮箱无效！');</script>");
            }
        }

    }
}
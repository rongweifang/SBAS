using Busines;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.User
{
    public partial class User_Contract : System.Web.UI.Page
    {
        private string Card_ID, Card_Name;

        private string ID0, ID1, ID2, ID3, ID4;

        protected void Page_Load(object sender, EventArgs e)
        {
            this.Card_ID = base.Request["Card_ID"];
            this.Card_Name = base.Request["Card_Name"];
            if (!string.IsNullOrEmpty(this.Card_ID.Trim()))
            {
               BindData();
            }
        }
        private void BindData()
        {
           int count = DataFactory.SqlDataBase().IsExist("Contract_MortGage", "Card_ID", this.Card_ID);
            Hashtable ht;
           if (count > 0)
            {
                ID0 = Card_ID;
                ht = DataFactory.SqlDataBase().GetHashtableById("Contract_MortGage", "Card_ID", this.Card_ID);
                if (ht.Count > 0 && ht != null)
                {
                    LB_Jie.Text = ht["CREATEDATE"].ToString();
                    LB_Jie2.Text = ht["MODIFYDATE"].ToString();
                    Btn_Jie.Text = "已创建";
                    Btn_Jie.CssClass = "btn btn-primary btn-xs";
                }
            }
           else
           {
               LB_Jie.Text = "-";
               Btn_Jie.Text = "创　建";
               Btn_Jie.CssClass = "btn btn-warning btn-xs";
           }
           
        }

        protected void Btn_Jie_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            ht["Card_Name"] = this.Card_Name;
           
            ht["Card_ID"] = this.Card_ID;
            if (string.IsNullOrEmpty(this.ID0))
            {
                ht["User_ID"] = RequestSession.GetSessionUser().UserId.ToString();
                ht["User_Name"] = RequestSession.GetSessionUser().UserName.ToString();
            }
            else
            {
                ht["ModifyUserID"] = RequestSession.GetSessionUser().UserId.ToString();
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["ModifyDate"] = DateTime.Now.ToString();
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_MortGage", "Card_ID", this.ID0, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }

        protected void Btn_Bao_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_Ya_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_Ka_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_Xin_Click(object sender, EventArgs e)
        {

        }
    }
}
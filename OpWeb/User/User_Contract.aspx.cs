using Busines;
using Busines.DAL;
using Busines.IDAO;
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
        private Contract_IDAO cidal = new Contract_Dal();
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
                Hashtable htt = DataFactory.SqlDataBase().GetHashtableById("Contract_MortGage", "Card_ID", this.Card_ID);
                string _UID = htt["UID"].ToString();

                int FingerNum = DataFactory.SqlDataBase().IsExist("Contract_Finger", "UID", _UID);

                if (FingerNum > 0)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','3000');</script>");
                }
                else
                {
                    ////保存指纹签名
                    //Hashtable hm = DataFactory.SqlDataBase().GetHashtableById("Contract_Finger_Temp", "ContractType", "Contract_Mortgage");
                    //hm.Remove("FTID");
                    //hm["UID"] = _UID;

                    //IsInitFinger

                    bool IsFinger = cidal.IsInitFinger(_UID, "Contract_Mortgage");
                    if (IsFinger)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','3000');</script>");
                    }
                    else
                    {
                        ShowMsgHelper.Alert_Error("指纹应用写入失败，请重新创建！");
                    }
                }
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
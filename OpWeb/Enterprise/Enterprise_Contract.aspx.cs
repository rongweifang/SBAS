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

namespace OpWeb.Enterprise
{
    public partial class Enterprise_Contract : System.Web.UI.Page
    {
        private string E_enterpriseID;

        bool IsExist = false;

        private Contract_IDAO cidal = new Contract_Dal();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.E_enterpriseID = base.Request["E_enterpriseID"];
            if (!string.IsNullOrEmpty(this.E_enterpriseID.Trim()))
            {
                IsExist = DataFactory.SqlDataBase().IsExist("Contract_LDZJ", "E_enterpriseID", this.E_enterpriseID) > 0 ? true : false;
                BindData();
            }
        }
        private void BindData()
        {
            if (IsExist)
            {
                Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_LDZJ", "E_enterpriseID", this.E_enterpriseID);
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

            ht["E_enterpriseID"] = this.E_enterpriseID;
            if (!IsExist)
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
            string EID = IsExist ? E_enterpriseID : "";
            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_LDZJ", "E_enterpriseID", EID, ht);
            if (IsOk)
            {
                Hashtable htt = DataFactory.SqlDataBase().GetHashtableById("Contract_LDZJ", "E_enterpriseID", EID);
                string _UID = htt["UID"].ToString();
                int FingerNum = DataFactory.SqlDataBase().IsExist("Contract_Finger", "UID", _UID);

                if (FingerNum > 0)
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','3000');</script>");
                }
                else
                {
                    bool IsFinger = cidal.IsInitFinger(_UID, "Contract_LDZJ");
                    if (IsFinger)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','3000');</script>");
                    }
                    else
                    {
                        ShowMsgHelper.Alert_Error("指纹应用写入失败，请重新创建！");
                    }
                }
                //ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('创建成功！');setTimeout('OpenClose()','3000');</script>");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}
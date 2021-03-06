﻿using Busines;
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
    public partial class User_Symbiosis : System.Web.UI.Page
    {
        private string Card_ID;
        private string _key;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["Card_ID"]))
            {
                return;
            }
            this.Card_ID = base.Request["Card_ID"].Trim();
            _key = DataFactory.SqlDataBase().IsExist("Base_User_LiveWith", "Card_ID", this.Card_ID) > 0 ? Card_ID : "";
            if (!base.IsPostBack)
            {
                this.InitData();
            }
        }

        private void InitData()
        {
            if (!string.IsNullOrEmpty(_key))
            {
                Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Base_User_LiveWith", "Card_ID", this.Card_ID);
                if (ht.Count > 0 && ht != null)
                {
                    _key = Card_ID;
                    ControlBindHelper.SetWebControls(this.Page, ht);
                }
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();

            ht = ControlBindHelper.GetWebControls(this.Page);
            ht["Card_ID"] = this.Card_ID;
            if (string.IsNullOrEmpty(this.UL_Name.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }


            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Base_User_LiveWith", "Card_ID", this._key, ht);
            if (IsOk)
            {
                string Url = PageHelper.UrlEncrypt(this.Card_ID);
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');setTimeout('OpenClose()','2000');</script>");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}
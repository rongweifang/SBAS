﻿using Busines;
using Common.DotNetBean;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class User_Pledge : System.Web.UI.Page
    {
        private string UID;
        private bool IsExist0 = false;
        private bool IsExist1 = false;
        private bool IsExist2 = false;
        private string key;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];
            IsExist0 = DataFactory.SqlDataBase().IsExist("Pledge_House", "UID", UID) > 0 ? true : false;
            IsExist1 = DataFactory.SqlDataBase().IsExist("Pledge_Vehicle", "UID", UID) > 0 ? true : false;
            IsExist2 = DataFactory.SqlDataBase().IsExist("Pledge_Sundries", "UID", UID) > 0 ? true : false;

            if (!IsPostBack)
            {
                if (IsExist0)
                {
                    BindData0();
                }
                if (IsExist1)
                {
                    BindData1();
                }
                if (IsExist2)
                {
                    BindData2();
                }
            }
        }

        private void BindData0()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Pledge_House", "UID", UID);
            if (ht.Count > 0)
            {
                ControlBindHelper.SetWebControls(this.table1, ht);
            }
        }
        private void BindData1()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Pledge_Vehicle", "UID", UID);
            if (ht.Count > 0)
            {
                ControlBindHelper.SetWebControls(this.table2, ht);
            }
        }
        private void BindData2()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Pledge_Sundries", "UID", UID);
            if (ht.Count > 0)
            {
                ControlBindHelper.SetWebControls(this.table3, ht);
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            // string tablenName = Append_value.Value.Equals("1")? "Pledge_House": Append_value.Value.Equals(2)? "Pledge_Vehicle" : Append_value.Value.Equals(3)? "Pledge_Sundries" : "Pledge_House";
            string tablenName = "Pledge_House";
           bool IsExist = false;
            if (Append_value.Value.Equals("1"))
            {
                ht = ControlBindHelper.GetWebControls(this.table1);
                //this.table2.cl
                IsExist = IsExist0;
                tablenName = "Pledge_House";
            }
            if (Append_value.Value.Equals("2"))
            {
                ht = ControlBindHelper.GetWebControls(this.table2);
                IsExist = IsExist1;
                tablenName = "Pledge_Vehicle";
            }
            if (Append_value.Value.Equals("3"))
            {
                ht = ControlBindHelper.GetWebControls(this.table3);
                IsExist = IsExist2;
                tablenName = "Pledge_Sundries";
            }

            // ht = ControlBindHelper.GetWebControls(this.Page);


            if (IsExist)
            {
                key = this.UID;
                ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["ModifyDate"] = DateTime.Now.ToString();
            }
            else
            {
                ht["CreateUser"] = RequestSession.GetSessionUser().UserName.ToString();
                ht["UID"] = UID;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit(tablenName, "UID", this.key, ht);
            if (IsOk)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}
using Busines;
using Common.DotNetBean;
using Common.DotNetUI;
using Common.DotNetData;
using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class Contract_Examine : System.Web.UI.Page
    {
        private string UID;
        private string ContractType;
        public StringBuilder sb = new StringBuilder();
        private List<string> checks=new List<string>();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]) || string.IsNullOrEmpty(base.Request["ContractType"]))
            {
                return;
            }
            this.UID = base.Request["UID"];
            this.ContractType = base.Request["ContractType"];

            InitData();
        }
        private void InitData()
        {
            StringBuilder sbsql = new StringBuilder();
            sbsql.AppendFormat("SELECT * FROM View_ContractSelect WHERE UID ='{0}'", UID);
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sbsql);
            if (!DataTableHelper.IsExistRows(dt))
            {
                sbsql.Clear();
                sbsql.AppendFormat("SELECT * FROM View_Select WHERE ContractType ='{0}'", ContractType);
                dt = DataFactory.SqlDataBase().GetDataTableBySQL(sbsql);
            }
            if (DataTableHelper.IsExistRows(dt))
            {
                string SL_ID = "";
                // <tr><th>&nbsp;</th><td>&nbsp;</td></tr>
                //      <label><input type = "checkbox" name="CheckboxGroup1" value="复选框" id="CheckboxGroup1_0" checked="checked">复选框</label>

                sb.Append(" <tr><th>&nbsp;</th><td>");
                foreach (DataRow dr in dt.Rows)
                {
                    if (!SL_ID.Equals(dr["SL_ID"].ToString()))
                    {
                        sb.Append(" </td></tr>");
                        sb.AppendFormat(" <tr><th>{0}</th><td>", dr["SL_Desc"].ToString());
                    }
                    //  sb.AppendFormat("<div style=\"padding-left:{5};display:{6};width:{7}\"><label><input type =\"checkbox\" name=\"{0}\" value=\"{1}\" id=\"{2}\" {3} runat=\"server\" />{4}</label></div>", dr["SL_PageID"].ToString(), 1, dr["SL_PageID"].ToString(), dr["Checked"].ToString().Equals("True") ? "checked=\"checked\"" : dr["Checked"].ToString().Equals("False") ? "" : dr["SL_Checked"].ToString().Equals("True") ? "checked=\"checked\"" : "", dr["SL_SubTitle"].ToString(), dr["SL_MarginLeft"].ToString(), dr["SL_IsBreak"].ToString().Equals("True") ? "block" : "inline", dr["SL_Width"].ToString());
                    sb.AppendFormat("<div style=\"padding-left:{5};display:{6};width:{7}\"><label><input type =\"checkbox\" name=\"{0}\" value=\"{1}\" id=\"{2}\" {3} runat=\"server\" />{4}</label></div>", dr["SL_PageID"].ToString(), 1, dr["SL_PageID"].ToString(), dr["Checked"].ToString().Equals("True") ? "checked=\"checked\"" : "" , dr["SL_SubTitle"].ToString(), dr["SL_MarginLeft"].ToString(), dr["SL_IsBreak"].ToString().Equals("True") ? "block" : "inline", dr["SL_Width"].ToString());
                    checks.Add(dr["SL_PageID"].ToString());
                    //if (!SL_ID.Equals(dr["SL_ID"].ToString()))
                    //{

                    //}
                    SL_ID = dr["SL_ID"].ToString();
                }
                sb.Append(" </td></tr>");
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            DataFactory.SqlDataBase().DeleteData("Contract_Selected", "UID", UID);
            Hashtable ht = new Hashtable();
            StringBuilder sbsql = new StringBuilder();
            sbsql.Clear();

            foreach (String sr in checks)
            {
                string chk = Request.Form[sr] == null ? "0" : "1";
                sbsql.AppendFormat("INSERT INTO Contract_Selected (UID,SL_PageID,SL_Checked) VALUES ('{0}','{1}','{2}');\n", UID, sr, chk);
            }
            int count = DataFactory.SqlDataBase().ExecuteBySql(sbsql);
            if (count > 0)
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }


            //            foreach (Control ct in this.Page.Controls)
            //            {

            ////(this.Page.FindControl("check" + i) as HtmlInputCheckBox).Checked.ToString();

            //                if (ct.GetType().ToString().Equals("System.Web.UI.WebControls.CheckBox"))
            //                {
            //                    CheckBox cb = (CheckBox)ct;

            //                        sbsql.AppendFormat("INSERT INTO Contract_Selected (UID,SL_SubID,SL_Checked) VALUES ('{0}','{1}','{2}');\n", UID, cb.ID, cb.Checked?"1":"0");

            //                }
            //            }
            //int count = DataFactory.SqlDataBase().ExecuteBySql(sbsql);
            //if (count > 0)
            //{
            //    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
            //}
            //else
            //{
            //    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            //}


            //int size = HttpContext.Current.Request.Params.Count;
            //for (int i = 0; i < size; i++)
            //{
            //    string id = HttpContext.Current.Request.Params.GetKey(i);
            //   // HtmlInputCheckBox check = this.Page.FindControl(id) as HtmlInputCheckBox;
            //    CheckBox chk = this.Page.FindControl(id) as CheckBox;
            //    if (chk != null)
            //    {

            //    }
            //}





            //ht = ControlBindHelper.GetWebControls(this.Page);
            //if (ht.Count > 0 && ht != null)
            //{
            //    //StringBuilder sbdel = new StringBuilder();
            //    //sbdel.AppendFormat("DELETE Contract_Selected WHERE UID='{0}'",UID);
            //    DataFactory.SqlDataBase().DeleteData("Contract_Selected", "UID", UID);

            //    StringBuilder sbsql = new StringBuilder();
            //    sbsql.Clear();
            //    foreach (KeyValuePair<string, string> key in ht)
            //    {
            //        //INSERT INTO Contract_Selected (UID,SL_SubID,SL_Checked) VALUES ()
            //        sbsql.AppendFormat("INSERT INTO Contract_Selected (UID,SL_SubID,SL_Checked) VALUES ('{0}','{1}','{2}');\n",UID,ht.Keys,ht.Values);
            //    }

            //    int count = DataFactory.SqlDataBase().ExecuteBySql(sbsql);
            //    if (count > 0)
            //    {
            //        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
            //    }
            //    else
            //    {
            //        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            //    }

            //}

            //ht["ModifyUserID"] = RequestSession.GetSessionUser().UserId.ToString();
            //ht["ModifyUser"] = RequestSession.GetSessionUser().UserName.ToString();
            //ht["ModifyDate"] = DateTime.Now.ToString();
            //if (string.IsNullOrEmpty(this.M_Address.Value.Trim()) || string.IsNullOrEmpty(this.M_Area.Value.Trim()) || string.IsNullOrEmpty(this.M_Price.Value.Trim()))
            //{
            //    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
            //    return;
            //}

            //bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("Contract_Mortgage", "UID", this.UID, ht);
            //if (IsOk)
            //{
            //    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');</script>");
            //}
            //else
            //{
            //    ShowMsgHelper.Alert_Error("操作失败！");
            //}
        }
    }
}
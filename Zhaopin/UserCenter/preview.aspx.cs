using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetCode;
using Common.DotNetData;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Windows.Forms;

namespace Zhaopin.UserCenter
{
    public partial class preview : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string cityfrom = string.Empty;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            if (!this.IsPostBack)
            {
                initData();
                if (peridal.IsUserCheck())
                {
                    this.Button1.Text = "已经确认";
                    this.Button1.Enabled = false;
                }
            }
        }
        public void initData()
        {
            DataTable dt = peridal.getEducation();
            ControlBindHelper.BindRepeaterList(dt, this.rp_Education);

            DataTable dtPaper = peridal.GetPaper();
            ControlBindHelper.BindRepeaterList(dtPaper, this.rp_Paper);

            DataTable dtResearch = peridal.GetResearch();
            ControlBindHelper.BindRepeaterList(dtResearch, this.rp_Research);

            DataTable dtAttachment = peridal.GetAttachment();
            ControlBindHelper.BindRepeaterList(dtAttachment, this.rp_Atta);

            DataTable dtAward = peridal.GetAward();
            ControlBindHelper.BindRepeaterList(dtAward, this.rp_Award);

            DataTable dtfamily = peridal.GetFamily();
            ControlBindHelper.BindRepeaterList(dtfamily, this.rp_family);

            DataTable dtwork = peridal.GetWork();
            ControlBindHelper.BindRepeaterList(dtwork, this.rp_Work);

            DataTable dt1 = peridal.GetLanguage();
            ControlBindHelper.BindRepeaterList(dt1, this.rp_Language);

            DataTable dt2 = peridal.GetComputerLevel();
            ControlBindHelper.BindRepeaterList(dt2, this.rp_Computer);

            DataTable dt3 = peridal.GetCertOther();
            ControlBindHelper.BindRepeaterList(dt3, this.rp_CertOther);

            DataTable dtinfo = peridal.GetUserInfo();

            Hashtable htt = new Hashtable();
            htt = DataTableHelper.DataRowToHashTable(dtinfo.Rows[0]);
            if (htt.Count > 0 && htt != null)
            {
                ControlBindHelper.SetWebControls(this.Page, htt);

                if (string.IsNullOrEmpty(htt["HEADPHOTO"].ToString()))
                {
                    this.blogimgsees.Src = "/themes/default/images/me_icon_04.gif";
                }
                else
                {
                    this.blogimgsees.Src = htt["HEADPHOTO"].ToString();
                }
                if (htt["HEALTHY"].ToString().Equals("1"))
                {
                    this.healthy.Text = "是";
                }
                else
                {
                    this.healthy.Text = "否";
                }
                if (!string.IsNullOrEmpty(htt["GRADDATE"].ToString()))
                {
                    this.gradDate.Text = Convert.ToDateTime(htt["GRADDATE"].ToString()).ToString("yyyy-MM-dd");
                }
                this.getfrom(htt["Z00HRSYD"].ToString());
                this.lb_cityfrom.Text = cityfrom;
            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT * FROM View_Step WHERE USER_ID='{0}'", RequestSession.GetSessionUser().UserId.ToString());
            DataTable dtuser = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            bool CanCheck = true;
            if (dtuser.Rows[0]["step1"].ToString().Equals("0"))
            {
                CanCheck = false;
            }
            if (dtuser.Rows[0]["step2"].ToString().Equals("0"))
            {
                CanCheck = false;
            }
            if (dtuser.Rows[0]["step3"].ToString().Equals("0"))
            {
                CanCheck = false;
            }
            //if (dtuser.Rows[0]["islock"].ToString().Equals("1"))
            //{
            //    CanCheck = false;
            //}
            if (CanCheck)
            {
                Hashtable ht = new Hashtable();
                ht = ControlBindHelper.GetWebControls(this.Page);
                ht["ISCHECK"] = "1";
                ht["MODIFYDATE"] = DateTime.Now.ToString();
                bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("View_UserCheck", "User_ID", RequestSession.GetSessionUser().UserId.ToString(), ht);
                if (IsOk)
                {
                    // MessageBox.Show("简历确认成功!");
                    // Response.Redirect("/UserCenter/preview.aspx");
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('简历确认成功！'); window.location.href = document.URL;</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('简历确认失败，请先完善个人简历！');</script>");
            }

        }

        private void getfrom(string cityid)
        {
            //cityfrom
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT CityID,CityName,ParentID ");
            strSql.Append("FROM Area_data ");
            strSql.Append("WHERE CityID=@CityID");

            SqlParam[] param = new SqlParam[]
            {
                new SqlParam("@CityID",cityid)
            };
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, param);
            if (DataTableHelper.IsExistRows(dt))
            {
                cityfrom = dt.Rows[0]["CityName"].ToString() + " " + cityfrom;
                if (dt.Rows[0]["ParentID"].ToString().Equals("1"))
                {
                    return;
                }
                else
                {
                    this.getfrom(dt.Rows[0]["ParentID"].ToString());
                }
            }
            else
            {
                return;
            }

        }

        protected void rp_Education_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                System.Web.UI.WebControls.Label lb_fullday = e.Item.FindControl("LB_fullDay") as System.Web.UI.WebControls.Label;
                if (lb_fullday != null)
                {
                    string text = lb_fullday.Text;
                    text = text.Replace("1", "是");
                    text = text.Replace("0", "否");
                    lb_fullday.Text = text;

                }
            }
        }


    }
}
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

namespace OpWeb.User
{
    public partial class UserInfoView : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string cityfrom = string.Empty;
        private string UserID;
        private string Currentid;

        private Hashtable CookieSelect;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.UserID = base.Request["key"];
            this.Currentid = base.Request["currentid"];
            this.Label1.Text = Currentid;
            if (!this.IsPostBack)
            {
                initData();
            }
        }
        public void initData()
        {
            if (Session["Select"] != null)
            {
                this.CookieSelect = (Hashtable)Session["Select"];
            }

            DataTable dt = peridal.getEducation("", UserID);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Education);

            DataTable dtPaper = peridal.GetPaper(UserID);
            ControlBindHelper.BindRepeaterList(dtPaper, this.rp_Paper);

            DataTable dtResearch = peridal.GetResearch(UserID);
            ControlBindHelper.BindRepeaterList(dtResearch, this.rp_Research);

            DataTable dtAttachment = peridal.GetAttachment(UserID);
            ControlBindHelper.BindRepeaterList(dtAttachment, this.rp_Atta);

            DataTable dtAward = peridal.GetAward(UserID);
            ControlBindHelper.BindRepeaterList(dtAward, this.rp_Award);

            DataTable dtfamily = peridal.GetFamily(UserID);
            ControlBindHelper.BindRepeaterList(dtfamily, this.rp_family);

            DataTable dtwork = peridal.GetWork(UserID);
            ControlBindHelper.BindRepeaterList(dtwork, this.rp_Work);

            DataTable dt1 = peridal.GetLanguage(UserID);
            ControlBindHelper.BindRepeaterList(dt1, this.rp_Language);

            DataTable dt2 = peridal.GetComputerLevel(UserID);
            ControlBindHelper.BindRepeaterList(dt2, this.rp_Computer);

            DataTable dt3 = peridal.GetCertOther(UserID);
            ControlBindHelper.BindRepeaterList(dt3, this.rp_CertOther);

            DataTable dtinfo = peridal.GetUserInfo(UserID);

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
                System.Web.UI.WebControls.Label isfirst = e.Item.FindControl("LB_fullDay") as System.Web.UI.WebControls.Label;
                if (isfirst != null)
                {
                    string text = isfirst.Text;
                    text = text.Replace("1", "是");
                    text = text.Replace("0", "否");
                    isfirst.Text = text;

                }
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int num = peridal.ChangeStatus(UserID, "1");
            if (num > 0)
            {
                ShowMsgHelper.ParmAlertMsg("操作成功！");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int num = peridal.ChangeStatus(UserID, "2");
            if (num > 0)
            {
                ShowMsgHelper.ParmAlertMsg("操作成功！");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            //下一个Currentid
            int nextid = int.Parse(this.Label1.Text) + 1;
            Hashtable ht = (Hashtable)Session["Select"];

            if (ht[nextid.ToString()]==null)
            {
                ShowMsgHelper.ParmAlertMsg("已经到最后一条！");
            }
            else
            {
                string nextuser = ht[nextid.ToString()].ToString();

                string url = string.Format("/User/UserInfoView.aspx?key={0}&&currentid={1}", nextuser, nextid);
                Response.Redirect(url);
            }
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            //上一个
            int nextid = int.Parse(this.Label1.Text) - 1;
            Hashtable ht = (Hashtable)Session["Select"];
            if (ht[nextid.ToString()] == null)
            {
                ShowMsgHelper.ParmAlertMsg("已经到第一条！");
            }
            else
            {
                string nextuser = ht[nextid.ToString()].ToString();

                string url = string.Format("/User/UserInfoView.aspx?key={0}&&currentid={1}", nextuser, nextid);
                Response.Redirect(url);
            }
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
            int num = peridal.AddFlag(RequestSession.GetSessionUser().UserId.ToString(), UserID);
            if (num > 0)
            {
                ShowMsgHelper.ParmAlertMsg("操作成功！");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}
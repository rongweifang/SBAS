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
    public partial class CompayApplyView : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string CompID;
        public string companyName;
        public string Introduction;
        public string notice;
        public string Treatment;
        public string BeginDate;
        public string EndDate;
        public string acceptNum;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
                this.Response.Redirect("/UserCenter/Login.aspx");

            this.CompID = SqlFilterHelper.Filter(base.Request["ID"]);
            if (CompID.Length > 40 || CompID.Length < 30)
            {
                Response.Redirect("/UserCenter/CompayApplyList.aspx");
            }

            if (!this.IsPostBack)
            {
                Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Company", "companyID", this.CompID);
                if (ht.Count > 0 && ht != null)
                {
                    companyName = ht["COMPANYNAME"].ToString();
                    acceptNum = ht["ACCEPTNUM"].ToString();
                    Introduction = StringCS.HtmlDiscode(ht["INTRODUCTION"].ToString());
                    notice = StringCS.HtmlDiscode(ht["NOTICE"].ToString());
                    Treatment = StringCS.HtmlDiscode(ht["TREATMENT"].ToString());
                    BeginDate = Convert.ToDateTime(ht["BEGINDATE"].ToString()).ToString("yyyy-MM-dd");
                    EndDate = Convert.ToDateTime(ht["ENDDATE"].ToString()).ToString("yyyy-MM-dd");
                    BindtSpecialty();
                }
                else
                {
                    Response.Redirect("/UserCenter/CompayApplyList.aspx");
                }
            }
        }
        private void BindtSpecialty()
        {
            //GetSpecialty//GetUserSpecialty
            DataTable dt = peridal.GetSpecialty(CompID);
            ControlBindHelper.BindRepeaterList(dt, this.rp_apply);
        }

        //protected void rp_apply_ItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
        //    {
        //        System.Web.UI.WebControls.Label LbApply = e.Item.FindControl("LbApply") as System.Web.UI.WebControls.Label;
        //        if (LbApply != null)
        //        {
        //            string text = LbApply.Text;


        //        }
        //    }
        //}
       
    }
}
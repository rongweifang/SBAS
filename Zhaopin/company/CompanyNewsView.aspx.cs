using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.company
{
    public partial class CompanyNewsView : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string NewsID;
        public string title;
        public string content;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.NewsID = SqlFilterHelper.Filter(base.Request["ID"]);
            if (!ValidateUtil.IsGuid(this.NewsID))
            {
                 Response.Redirect("/company/");
            }
            if (!this.IsPostBack)
            {
                Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Company", "companyID", this.NewsID);
                if (ht.Count > 0 && ht != null)
                {
                    this.title = ht["COMPANYNAME"].ToString();
                    this.content = StringCS.HtmlDiscode(ht["INTRODUCTION"].ToString());
                   // this.pubdate.Text = Convert.ToDateTime(ht["PUBDATE"].ToString()).ToString("yyyy-MM-dd");
                    // ControlBindHelper.SetWebControls(this.Page, ht);
                }
                else
                {
                    Response.Redirect("/company/");
                }
            }
        }
    }
}
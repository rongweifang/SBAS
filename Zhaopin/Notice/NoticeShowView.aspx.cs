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

namespace Zhaopin.Notice
{
    public partial class NoticeShowView : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string NewsID;
        public string title;
        public string content;
        public string pubdate;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.NewsID =SqlFilterHelper.Filter(base.Request["ID"]);
            if (!ValidateUtil.IsGuid(this.NewsID))
            {
                Response.Redirect("/Notice/");
            }
            if (!this.IsPostBack)
            {
                Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("News", "newsID", this.NewsID);
                if (ht.Count > 0 && ht != null)
                {
                    this.title = ht["TITLE"].ToString();
                    this.content = StringCS.HtmlDiscode(ht["CONTENT"].ToString());
                    this.pubdate = Convert.ToDateTime(ht["PUBDATE"].ToString()).ToString("yyyy-MM-dd");
                    // ControlBindHelper.SetWebControls(this.Page, ht);
                }
                else
                {
                    Response.Redirect("/Notice/");
                }
            }
        }
    }
}
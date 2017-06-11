using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
using Common.DotNetData;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.Manager
{
    public partial class NewsForm : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string NewsID;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.NewsID = base.Request["ID"];
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
     
            ht["TITLE"] = this.title.Value;
            ht["NEWSTYPEID"] = this.newsTypeID.Value;
            ht["PUBDATE"] = this.pubdate.Value;
            ht["CONTENT"] = StringCS.HtmlEncode(this.content.Value);
            if (string.IsNullOrEmpty(this.NewsID))
            {

                ht["NEWSID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("News", "newsID", this.NewsID, ht);
            if (IsOk)
            {
             
            }


        }
    }
}
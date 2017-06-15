using Busines;
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
    public partial class User_Photo : System.Web.UI.Page
    {
        private string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["key"]))
            {
                return;
            }
            this._key = base.Request["key"];

            if (!base.IsPostBack)
            {
                if (!string.IsNullOrEmpty(this._key))
                {
                    this.InitData();
                }
            }
        }

        private void InitData()
        {
            //Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Base_User", "Card_ID", this._key);
            //if (ht.Count > 0 && ht != null)
            //{
            //    ControlBindHelper.SetWebControls(this.Page, ht);
            //}
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>self.location='User_Photo2.aspx?Card_ID=';</script>");
        }

    }
}
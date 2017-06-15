using Busines;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.User
{
    public partial class User_Contract : System.Web.UI.Page
    {
        private string Card_ID;
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Card_ID = base.Request["Card_ID"];
            if (!string.IsNullOrEmpty(this.Card_ID.Trim()))
            {
               // BindData();
            }
        }
        private void BindData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("Contract_MortGage", "Card_ID", this.Card_ID);
            if (ht.Count > 0 && ht != null)
            {

            }
        }

        protected void Btn_Jie_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_Bao_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_Ya_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_Ka_Click(object sender, EventArgs e)
        {

        }

        protected void Btn_Xin_Click(object sender, EventArgs e)
        {

        }
    }
}
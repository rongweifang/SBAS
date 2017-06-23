using Busines;
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

namespace OpWeb.Contract
{
    public partial class Contract_Finger : System.Web.UI.Page
    {
        private string UID, ClassID;
        public string _Vis = "block";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]) || string.IsNullOrEmpty(base.Request["ClassID"]))
            {
                return;
            }
            this.UID = base.Request["UID"];
            this.ClassID = base.Request["ClassID"];

            if (!base.IsPostBack)
            {
                    this.InitData();
            }
        }


        private void InitData()
        {
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT * FROM Contract_Finger WHERE [UID]='{0}' AND ClassID='{1}'",this.UID,this.ClassID);
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            if (DataTableHelper.IsExistRows(dt))
            {
                ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
                this.FID.Value = dt.Rows[0]["FID"].ToString();
            }
            else
            {
                this.FReg.Visible = false;
                _Vis = "none";
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {

        }



    }
}
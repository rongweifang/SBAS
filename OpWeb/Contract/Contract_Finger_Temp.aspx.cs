using Busines;
using Common.DotNetUI;
using OpWeb.App_Code;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.Contract
{
    public partial class Contract_Finger_Temp : PageBase
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!base.IsPostBack)
            {
                this.DataBindGrid();
            }
        }

        private void DataBindGrid()
        {
            StringBuilder sb = new StringBuilder();
            sb.Append("SELECT CFT.*,BUC.UserClass,CT.ContractName FROM Contract_Finger_Temp CFT LEFT JOIN Base_User_Class BUC ON CFT.ClassID=BUC.ClassID LEFT JOIN Contract_Type CT ON CFT.ContractType=CT.ContractType");
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);

        }
    }
}
using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserCenter
{
    public partial class Default : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
                this.Response.Redirect("/UserCenter/Login.aspx");

            if (!this.IsPostBack)
            {
                BindApply();
                DataBindGrid();
                initdata();
            }
        }
        private void initdata()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.AppendFormat("SELECT LastTime,LastIP,LastWhere FROM Personinfo WHERE User_ID = '{0}'",RequestSession.GetSessionUser().UserId.ToString());

            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql);
            this.LbTime.Text = dt.Rows[0]["LastTime"].ToString();
            this.LbIP.Text = dt.Rows[0]["LastIP"].ToString();

            StringBuilder sbmsg = new StringBuilder();
            sbmsg.AppendFormat("SELECT COUNT(*) FROM [UserMessage] WHERE USER_ID='{0}' AND ISRead=0", RequestSession.GetSessionUser().UserId.ToString());

            this.LbMsg.Text = DataFactory.SqlDataBase().GetDataTableBySQL(sbmsg).Rows[0][0].ToString();
            }
        private void BindApply()
        {
            DataTable dt = peridal.GetApply();
            ControlBindHelper.BindRepeaterList(dt, this.rp_Apply);
        }
        private void DataBindGrid()
        {
            StringBuilder strSql = new StringBuilder();
            strSql.Append("SELECT Top 10 * FROM Company WHERE DeleteMark = 0  AND getdate() between BeginDate and EndDate");
            
            DataTable dt= DataFactory.SqlDataBase().GetDataTableBySQL(strSql, null);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
        }
    }
}
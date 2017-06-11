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
    public partial class activity : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
            if (!this.IsPostBack)
            {
                StringBuilder strSql = new StringBuilder();
                strSql.Append("SELECT * FROM View_UserMessage where ");
                strSql.Append(" User_ID=@User_ID ");
                SqlParam[] para = new SqlParam[]
			{
				new SqlParam("@User_ID", RequestSession.GetSessionUser().UserId.ToString())
			};

                DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(strSql, para);
                ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
            }
        }
    }
}
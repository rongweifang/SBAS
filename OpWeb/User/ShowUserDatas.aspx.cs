using System;
using System.Text;
using System.Collections.Generic;
using System.Data;
using Common.DotNetData;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Busines;

namespace OpWeb.User
{
    public partial class ShowUserDatas : System.Web.UI.Page
    {
        private string UPID;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UPID"]) )
            {
                return;
            }
            this.UPID = base.Request["UPID"];

            string SignData = "";
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT TOP 1 PhotoBase FROM UserPicture WHERE [UPID]='{0}' ", UPID);
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            if (DataTableHelper.IsExistRows(dt))
            {
                SignData = dt.Rows[0][0].ToString();
            }
            if (!string.IsNullOrEmpty(SignData))
            {
                try
                {
                    Response.ContentType = "image/BMP";
                    Response.BinaryWrite((Byte[])Convert.FromBase64String(SignData));
                }
                catch (Exception ex)
                {


                }
            }



        }
    }
}
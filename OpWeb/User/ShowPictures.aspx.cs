using Busines;
using Common.DotNetData;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.User
{
    public partial class ShowPictures : System.Web.UI.Page
    {
        private string UID, PictureCode,PictureType;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["UID"]) || string.IsNullOrEmpty(base.Request["PictureCode"]) || string.IsNullOrEmpty(base.Request["PictureType"]))
            {
                return;
            }
            this.UID = base.Request["UID"];
            this.PictureCode = base.Request["PictureCode"];
            this.PictureType = base.Request["PictureType"];


            string Sign = this.PictureType.Equals("FingerCode") ? "FingerImage" : this.PictureType.Equals("SignCode") ? "SignImage" : "";
            string SignData = "";
            StringBuilder sb = new StringBuilder();
            sb.AppendFormat("SELECT {0} FROM Contract_Finger WHERE [UID]='{1}' AND {2}='{3}'", Sign, this.UID, this.PictureType, this.PictureCode);
            DataTable dt = DataFactory.SqlDataBase().GetDataTableBySQL(sb);
            if (DataTableHelper.IsExistRows(dt))
            {
                SignData = dt.Rows[0][0].ToString();
            }
            if (!string.IsNullOrEmpty(SignData))
            {
                try
                {
                    // <img src="data:image/png;base64,。。。。。"  width="100" height="40" />
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
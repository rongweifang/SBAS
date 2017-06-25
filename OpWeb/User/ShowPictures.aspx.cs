using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace OpWeb.User
{
    public partial class ShowPictures : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string Sign = @"";


            //Response.ContentType = "image/BMP";
           // Response.BinaryWrite((Byte[])Convert.FromBase64String(Sign));
        }
    }
}
using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetFile;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Zhaopin.UserCenter
{
    public partial class PhotoUpload : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (RequestSession.GetSessionUser() == null)
            {
                Response.Redirect("/UserCenter/Login.aspx");
            }
        }

        protected void Button1_Click1(object sender, EventArgs e)
        {
            if (this.FileUpload1.HasFile)
            {
                string filename = "";
                string result = UploadHelper.UserFileUploadPhoto(this.FileUpload1, ref filename);
                if (result.Equals("上传成功"))
                {
                    Hashtable ht = new Hashtable();
                    ht["HEADPHOTO"] = peridal.GetUserWebPath() + filename;
                    bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("View_HeadPhoot", "User_ID", RequestSession.GetSessionUser().UserId.ToString(), ht);
                    if (IsOk)
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>window.opener=null;window.open('','_self');window.close();parent.location.reload();layer.msg('照片上传成功！');</script>");
                    }
                    else
                    {
                        ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
                    }
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('照片上传失败！'); </script>");
                    return;
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('请选择上传图片！');</script>");
            }
        }
    }
}
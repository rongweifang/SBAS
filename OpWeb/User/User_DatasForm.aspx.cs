using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetUI;
using OpWeb.App_Code;
using System;
using System.Text;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Common.DotNetCode;
using Common.DotNetData;

namespace OpWeb.User
{
    public partial class User_DatasForm : System.Web.UI.Page
    {
        // private string Card_ID;
        public string PictureData = string.Empty;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(base.Request["key"]))
            {
                return;
            }
            this.Card_ID.Value = base.Request["key"].Trim();
            if (!base.IsPostBack)
            {

            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            Hashtable ht = new Hashtable();
            ht["Card_ID"] = this.Card_ID.Value;
            ht["PhotoBase"] = PhotoBase.Value;
            ht["PhotoMemo"] = PhotoMemo.InnerText.Trim();
            ht["CreateUser"] = RequestSession.GetSessionUser().UserName.ToString();

            if (string.IsNullOrEmpty(this.PhotoBase.Value.Trim()))
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('信息不完整！');</script>");
                return;
            }

            if (ht.Count > 0)
            {
                bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("UserPicture", "Card_ID", "", ht);
                if (IsOk)
                {
                    this.Save.Enabled = false;
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存成功！');OpenClose();</script>");
                }
                else
                {
                    ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('操作失败！');</script>");
                }
            }
            else
            {
                ClientScript.RegisterStartupScript(Page.GetType(), "", "<script language=javascript>layer.msg('保存失败！');</script>");
            }
        }
    }
}
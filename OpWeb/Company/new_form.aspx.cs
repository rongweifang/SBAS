using Busines;
using Busines.DAL;
using Busines.IDAO;
using Common.DotNetCode;
using Common.DotNetUI;
using System;
using System.Collections;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace OpWeb.Company
{
    public partial class new_form : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        private string _key;
        protected void Page_Load(object sender, EventArgs e)
        {
            this._key = base.Request["key"];
            if (!base.IsPostBack)
            {
               // BindSelect();
                if (!string.IsNullOrEmpty(this._key))
                {
                    this.InitData();
                }
            }
        }
        //private void BindSelect()
        //{
        //    DataTable dt = DataFactory.SqlDataBase().GetDataTable("NewsType");
        //    ControlBindHelper.BindHtmlSelect(dt, this.newsTypeID, "newsTypeName", "newsTypeID", "选择分类");
        //}
        private void InitData()
        {
            Hashtable ht = DataFactory.SqlDataBase().GetHashtableById("News", "newsID", this._key);
            if (ht.Count > 0 && ht != null)
            {
                ControlBindHelper.SetWebControls(this.Page, ht);
                this.content.Value = StringHelper.FormatTextAreaCHG(ht["CONTENT"].ToString());
            }
        }
        protected void Save_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrEmpty(this.title.Value))
            {
                ShowMsgHelper.ParmAlertMsg("标题不能为空！");
                return;
            }
            if (string.IsNullOrEmpty(this.newsTypeID.Value))
            {
                ShowMsgHelper.ParmAlertMsg("新闻类型不能为空！");
                return;
            }
            if (string.IsNullOrEmpty(this.pubdate.Value))
            {
                ShowMsgHelper.ParmAlertMsg("发布日期不能为空！");
                return;
            }

            Hashtable ht = new Hashtable();
            // ht = ControlBindHelper.GetWebControls(this.Page);
            ht["title"] = this.title.Value;
            ht["newsTypeID"] = this.newsTypeID.Value;
            ht["pubdate"] = this.pubdate.Value;
            ht["istop"] = this.istop.Value;
            ht["content"] = StringHelper.FormatTextArea(this.content.Value);
            if (string.IsNullOrEmpty(this._key))
            {

                ht["newsID"] = CommonHelper.GetGuid;
            }

            bool IsOk = DataFactory.SqlDataBase().Submit_AddOrEdit("News", "newsID", this._key, ht);
            if (IsOk)
            {
                ShowMsgHelper.ParmAlertMsg("操作成功！");
            }
            else
            {
                ShowMsgHelper.Alert_Error("操作失败！");
            }
        }
    }
}
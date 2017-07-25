using Busines;
using Busines.DAL;
using Busines.IDAO;
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

namespace OpWeb.Company
{
    public partial class new_index : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PageControl1.pageHandler += new EventHandler(this.pager_PageChanged);
            if (!base.IsPostBack)
            {
             //   this.BindSelect();
            }
        }
        //private void BindSelect()
        //{
        //    DataTable dt = DataFactory.SqlDataBase().GetDataTable("NewsType");
        //    ControlBindHelper.BindHtmlSelect(dt, this.newsTypeID, "newsTypeName", "newsTypeID", "选择分类");
        //}
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }
        private void DataBindGrid()
        {
            int count = 0;
            StringBuilder SqlWhere = new StringBuilder();
            IList<SqlParam> IList_param = new List<SqlParam>();

            //if (!string.IsNullOrEmpty(this.newsTypeID.Value))
            //{
            //    SqlWhere.AppendFormat(" AND newsTypeID='{0}' ", this.newsTypeID.Value);
            //}

            if (!string.IsNullOrEmpty(this.txt_Search.Value))
            {
                SqlWhere.Append(" AND title like @obj ");
                IList_param.Add(new SqlParam("@obj", '%' + this.txt_Search.Value.Trim() + '%'));
            }

            DataTable dt = this.peridal.GetNewsListPage(SqlWhere, IList_param, this.PageControl1.PageIndex, this.PageControl1.PageSize, ref count);
            ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
            this.PageControl1.RecordCount = Convert.ToInt32(count);
            this.PageControl1.PageChecking();

        }
        protected void lbtSearch_Click(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }

        protected void rp_Item_ItemDataBound(object sender, RepeaterItemEventArgs e)
        {
            if (e.Item.ItemType == ListItemType.Item || e.Item.ItemType == ListItemType.AlternatingItem)
            {
                System.Web.UI.WebControls.Label LbDeleteMark = e.Item.FindControl("LbDeleteMark") as System.Web.UI.WebControls.Label;
                if (LbDeleteMark != null)
                {
                    string text = LbDeleteMark.Text;
                    text = text.Replace("1", "未发布");
                    text = text.Replace("0", "-");
                    LbDeleteMark.Text = text;

                }
                System.Web.UI.WebControls.Label LbnewsTypeID = e.Item.FindControl("LbnewsTypeID") as System.Web.UI.WebControls.Label;
                if (LbnewsTypeID != null)
                {
                    string text = LbnewsTypeID.Text;
                    text = this.getNewsType(text);
                    LbnewsTypeID.Text = text;

                }
            }
        }

        private string getNewsType(string TypeID)
        {
            StringBuilder struser = new StringBuilder();
            struser.AppendFormat("SELECT newsTypeName FROM NewsType WHERE newsTypeID='{0}'", TypeID);
            string UsergradDate = DataFactory.SqlDataBase().GetDataTableBySQL(struser).Rows[0][0].ToString();

            return UsergradDate;
        }
    }
}
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


namespace OpWeb.User
{
    public partial class Message_index : System.Web.UI.Page
    {
        private IMPC_Person_IDAO peridal = new IMPC_Person_DAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            this.PageControl1.pageHandler += new EventHandler(this.pager_PageChanged);
            if (!base.IsPostBack)
            {
                this.BindSelect();
            }
        }
        private void BindSelect()
        {
            DataTable dt = DataFactory.SqlDataBase().GetDataTable("Base_UserInfo");
            ControlBindHelper.BindHtmlSelect(dt, this.MsgSender, "User_Name", "User_ID", "发送人");

            DataTable dtMsgType = DataFactory.SqlDataBase().GetDataTable("UserMessageType");
            ControlBindHelper.BindHtmlSelect(dtMsgType, this.MsgType, "TypeName", "MsgType", "消息类型");

            DataTable dtISRead = DataFactory.SqlDataBase().GetDataTable("UserMessageStates");
            ControlBindHelper.BindHtmlSelect(dtISRead, this.ISRead, "ReadState", "ISRead", "消息状态");
        }
        protected void pager_PageChanged(object sender, EventArgs e)
        {
            this.DataBindGrid();
        }
        private void DataBindGrid()
        {
            int count = 0;
            StringBuilder SqlWhere = new StringBuilder();
            IList<SqlParam> IList_param = new List<SqlParam>();
            SqlWhere.Append(" WHERE MsgTitle<>'注册成功' ");
            if (!string.IsNullOrEmpty(this.MsgSender.Value))
            {
                SqlWhere.AppendFormat(" AND MsgSender='{0}' ", this.MsgSender.Value);
            }
            if (!string.IsNullOrEmpty(this.MsgType.Value))
            {
                SqlWhere.AppendFormat(" AND MsgType='{0}' ", this.MsgType.Value);
            }
            if (!string.IsNullOrEmpty(this.ISRead.Value))
            {
                SqlWhere.AppendFormat(" AND ISRead='{0}' ", this.ISRead.Value);
            }
            
            if (!string.IsNullOrEmpty(this.txt_Search.Value))
            {
                SqlWhere.Append(" AND U." + this.Searchwhere.Value + " like @obj ");
                IList_param.Add(new SqlParam("@obj", '%' + this.txt_Search.Value.Trim() + '%'));
            }

            DataTable dt = this.peridal.GetMessageListPage(SqlWhere, IList_param, this.PageControl1.PageIndex, this.PageControl1.PageSize, ref count);
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
                System.Web.UI.WebControls.Label LbDel = e.Item.FindControl("LbDel") as System.Web.UI.WebControls.Label;
                if (LbDel != null)
                {
                    string text = LbDel.Text;
                    text = text.Replace("0", "已删除");
                    text = text.Replace("1", "-");
                    LbDel.Text = text;

                }
            }
        }
    }
}
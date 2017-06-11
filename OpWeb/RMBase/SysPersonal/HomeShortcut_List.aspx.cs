using Busines.DAL;
using Busines.IDAO;
using Common.DotNetBean;
using Common.DotNetUI;
using OpWeb.App_Code;
using OpWeb;
using System;
using System.Data;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using OpWeb.UserControl;

namespace OpWeb.RMBase.SysPersonal
{
	public class HomeShortcut_List : PageBase
	{
		protected HtmlForm form1;
		protected LoadButton LoadButton1;
		protected Repeater rp_Item;
		private RM_System_IDAO sys_idao = new RM_System_Dal();
		protected void Page_Load(object sender, EventArgs e)
		{
			if (!base.IsPostBack)
			{
				this.InitBindData();
			}
		}
		private void InitBindData()
		{
			DataTable dt = this.sys_idao.GetHomeShortcut_List(RequestSession.GetSessionUser().UserId.ToString());
			ControlBindHelper.BindRepeaterList(dt, this.rp_Item);
		}
	}
}

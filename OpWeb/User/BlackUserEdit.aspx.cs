using Common.DotNetBean;
using Common.DotNetData;
using DataBase.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DataBase.Dal;
namespace OpWeb.User
{
    public partial class BlackUserEdit : System.Web.UI.Page
    {
        BlackUserService blackService = new BlackUserService();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) {
                BindUserData();
            }
        }
        private void BindUserData() {
            if (!string.IsNullOrWhiteSpace(this.Request["userId"])) {
                var blackUser = blackService.getUserById(this.Request["userId"]);
                if (blackUser == null) {
                    Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "alert('该用户不存在');OpenClose();", true);
                    return;
                }
                this.Card_ID.Value = blackUser.Card_Id;
                this.Card_Name.Value = blackUser.Card_Name;
                this.Card_Tel.Value = blackUser.U_Tel;
                this.Memo.Value = blackUser.MEMO;
            }
        }

        protected void Save_Click(object sender, EventArgs e)
        {
            this.lab_msg.InnerText = "";
            var cardId = this.Card_ID.Value;
            var cardName = this.Card_Name.Value;
            var tel = this.Card_Tel.Value;
            var memo = this.Memo.Value;
            var blackUserId = "";
            var currUser = RequestSession.GetSessionUser();
            if (currUser == null)
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "top.location.href='/Login.html';", true);
                return;
            }
            if (!string.IsNullOrWhiteSpace(this.Request["userId"]))
            {
                blackUserId = this.Request["userId"].ToString();
            }

            BlackUser bUser = new BlackUser()
            {
                AddDate = DateTime.Now,
                BlackID = blackUserId,
                Card_Id = cardId,
                Card_Name = cardName,
                CreateDate = DateTime.Now,
                FLAG = 0,
                MEMO = memo,
                STATE = 0,
                User_ID = currUser.UserId.ToString(),
                User_Name = currUser.UserName.ToString(),
                U_Tel = tel
            };
            if (blackService.checkUserExists(cardId, bUser.BlackID))
            {
                this.lab_msg.InnerText = "该用户已存在";
                return;
            }
            var execResult = 0;
            if (!string.IsNullOrWhiteSpace(bUser.BlackID))
            {
                execResult = blackService.editBlackUser(bUser);
            }
            else
            {
                execResult = blackService.addBlackUser(bUser);
            }
            if (execResult <= 0)
            {
                this.lab_msg.InnerText = "保存失败";
                return;
            }
            else
            {
                Page.ClientScript.RegisterStartupScript(Page.GetType(), "", "OpenClose();", true);
                return;
            }

        }
    }
}
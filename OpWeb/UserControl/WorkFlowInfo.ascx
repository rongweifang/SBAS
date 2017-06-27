<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkFlowInfo.ascx.cs" Inherits="OpWeb.UserControl.WorkFlowInfo" %>
<style>
    .activity_box {
        width: 100px;
        height: 50px;
        margin: 0 5px;
        border-radius: 5px;
        display: inline-block;
        line-height:50px;
        text-align:center;
        color:white;
        font-size:14px;
        font-weight:bold;
    }

    .curr_activity {
    }

    .passed_activity {
        background-color: #5a9bd5;
    }

    .unpassed_activity {
        background-color: gray;
    }

    .activity_arrow {
        padding: 5px;
        background-image: url("/Themes/Images/arrow.png");
        background-repeat: no-repeat;
        margin: 0 5px;
        width: 40px;
        height: 25px;
        display: inline-block;
        line-height:50px;
        margin-bottom:-20px;
    }
</style>
<div>
    <div id="steps">
        <%if (this.allActivity != null)
            {
                foreach (var itm in this.allActivity)
                {
        %>
        <div class="activity_box <%=itm.Step<=this.step?"passed_activity":"unpassed_activity" %>">
            <%=itm.ActName %>
        </div>
        <%if (itm.ActType != 3)
            {
        %>
        <div class="activity_arrow"></div>
        <%
            } %>

        <%
                }
            } %>
    </div>
    <div id="buttons" style="margin-top: 10px;">
        <asp:Button ID="btn_approve" runat="server" Text="通过" OnClick="btn_approve_Click"  Visible="false"/>
        <%--        <asp:Button  ID="btn_reject" runat="server" Text="拒绝"/>--%>
        <asp:Button ID="btn_return" runat="server" Text="退回" OnClick="btn_return_Click"  Visible="false"/>
        <asp:Button ID="btn_resubmit" runat="server" Text="重新提交"  OnClick="btn_resubmit_Click" Visible="false"/>
        <asp:Button ID="btn_cancel" runat="server" Text="撤销" OnClick="btn_cancel_Click"  Visible="false"/>
    </div>
</div>

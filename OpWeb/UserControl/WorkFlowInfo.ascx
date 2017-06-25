<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WorkFlowInfo.ascx.cs" Inherits="OpWeb.UserControl.WorkFlowInfo" %>
<style>
    .activity_box {
        width: 100px;
        height: 50px;
        margin: 0 5px;
        border-radius: 5px;
        display: inline-block;
    }
    .curr_activity {
    
    }
    .passed_activity {
        background-color:#5a9bd5;
    }
    .unpassed_activity {
    
    }
    .activity_arrow {
        padding:5px;
        background-image:url("/Themes/Images/arrow.png");
        background-repeat:no-repeat;
        margin:0 5px;
        width:40px;
        height:25px;
        display:inline-block;
    }
</style>
<div>
    <div id="steps">
        <div class="activity_box passed_activity"></div>
        <div class="activity_arrow"></div>
        <div class="activity_box passed_activity"></div>
    </div>
    <div id="buttons" style="margin-top:10px;">
        <asp:Button  ID="btn_approve" runat="server" Text="通过"/>
<%--        <asp:Button  ID="btn_reject" runat="server" Text="拒绝"/>--%>
        <asp:Button  ID="btn_return" runat="server" Text="退回"/>
        <asp:Button  ID="btn_resubmit" runat="server" Text="重新提交"/>
        <asp:Button  ID="btn_cancel" runat="server" Text="撤销"/>
    </div>
</div>
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="feedback_index.aspx.cs" Inherits="OpWeb.User.feedback_index" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户反馈</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        //回车键
        document.onkeydown = function (e) {
            if (!e) e = window.event; //火狐中是 window.event
            if ((e.keyCode || e.which) == 13) {
                var obtnSearch = document.getElementById("lbtSearch");
                obtnSearch.click();
            }
        }
        $(function () {
            // $(".div-body").PullBox({ dv: $(".div-body"), obj: $("#table1").find("tr") });
            divresize(90);
            FixedTableHeader("#table1", $(window).height() - 118);
        })
        function onReply()
        {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var url = "/User/Feedback_Form.aspx?ID="+key;
                top.openDialog(url, 'Feedback_Form', '用户反馈 - 回复', 500, 280, 50, 50);
            }
        }
        function onReadOver()
        {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var delparm = 'action=Feedback&module=用户反馈&ID=' + key;
                ReplyConfig('MessageSend.ashx', delparm)
            }
        }
        //删除
        function Delete() {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var delparm = 'action=Delete&module=用户反馈&tableName=Feedback&pkName=ID&pkVal=' + key;
                DeleteData('/Ajax/Common_Ajax.ashx', delparm)
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                用户反馈信息
            </div>
        </div>
        <div class="btnbarcontetn">
            <div style="float: left;">
                <select id="ISRead" class="Searchwhere" runat="server">
                    <option value="1">已查看</option>
                    <option value="0" selected="selected">未查看</option>
                </select>
                <select id="Searchwhere" class="Searchwhere" runat="server">
                    <option value="loginName">身份证</option>
                    <option value="name">姓名</option>
                    <option value="mobile">手机号</option>
                </select>
                <input type="text" id="txt_Search" class="txtSearch SearchImg" runat="server" style="width: 100px;" />
                <asp:LinkButton ID="lbtSearch" runat="server" class="button green" OnClick="lbtSearch_Click"><span class="icon-botton"
            style="background: url('../../Themes/images/Search.png') no-repeat scroll 0px 4px;">
        </span>查 询</asp:LinkButton>
            </div>
            <div style="text-align: right">
                <uc2:LoadButton ID="LoadButton1" runat="server" />
            </div>
        </div>
        <div class="div-body" style="min-width: 1170px">
            <table id="table1" class="grid" singleselect="false">
                <thead>
                    <tr>
                        <td style="width: 20px; text-align: left;">
                            <label id="checkAllOff" onclick="CheckAllLine()" title="全选"></label>
                        </td>
                        <td style="width: 80px; text-align: center;">提交人
                        </td>
                        <td style="width: 100px; text-align: center;">标题
                        </td>
                        <td style="width: 200px; text-align: center;">内容
                        </td>
                        <td style="width: 120px; text-align: center;">反馈时间
                        </td>
                        <td style="width: 50px; text-align: center;">状态
                        </td>
                        <td style="text-align: center;">回复</td>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rp_Item" runat="server" OnItemDataBound="rp_Item_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 20px; text-align: left;">
                                    <input type="checkbox" value="<%#Eval("ID")%>" name="checkbox" />
                                </td>
                                <td style="width: 80px; text-align: center;">
                                    <%#Eval("name")%>
                                </td>
                                <td style="width: 100px; text-align: center;">
                                    <%#Eval("Title")%>
                                </td>
                                <td style="width: 200px; text-align: center;">
                                    <%#Eval("Content")%>
                                </td>
                                <td style="width: 120px; text-align: center;"><%#Eval("CreateDate")%>
                                </td>
                                <td style="width: 50px; text-align: center;">
                                    <asp:Label ID="LbIsRead" runat="server" Text='<%#Eval("IsRead")%>'></asp:Label></td>
                                <td style="text-align: left;"><%#Eval("Reply")%>
                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            <% if (rp_Item != null)
                               {
                                   if (rp_Item.Items.Count == 0)
                                   {
                                       Response.Write("<tr><td colspan='8' style='color:red;text-align:center'>没有找到您要的相关数据！</td></tr>");
                                   }
                               } %>
                        </FooterTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
        </div>
        <uc1:PageControl ID="PageControl1" runat="server" />
    </form>
</body>
</html>

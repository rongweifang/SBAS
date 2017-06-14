<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message_index.aspx.cs" Inherits="OpWeb.User.Message_index" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户消息</title>
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

        //删除
        function Delete() {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var delparm = 'action=Virtualdelete&module=用户消息&tableName=UserMessage&pkName=ID&pkVal=' + key;
                delConfig('/Ajax/Common_Ajax.ashx', delparm)
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                用户消息列表
            </div>
        </div>
        <div class="btnbarcontetn">
            <div style="float: left;">

                <select id="MsgSender" class="Searchwhere" runat="server" style="width: 100px;">
                </select>
                <select id="MsgType" class="Searchwhere" runat="server" style="width: 80px;">
                </select>
                <select id="ISRead" class="Searchwhere" runat="server">
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
                        <td style="width: 80px; text-align: center;">发送人
                        </td>
                        <td style="width: 80px; text-align: center;">接收人
                        </td>
                        <td style="width: 80px; text-align: center;">类型
                        </td>
                        <td style="width: 90px; text-align: center;">标题
                        </td>

                        <td style="width: 120px; text-align: center;">发送时间
                        </td>
                        <td style="width: 120px; text-align: center;">阅读时间
                        </td>
                        <td style="width: 50px; text-align: center;">状态
                        </td>
                         <td style="width: 50px; text-align: center;">删除
                        </td>
                        <td style="text-align: center;">内容</td>
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
                                    <%#Eval("User_Name")%>
                                </td>
                                <td style="width: 80px; text-align: center;">
                                    <%#Eval("name")%>
                                </td>
                                <td style="width: 80px; text-align: center;">
                                    <%#Eval("TypeName")%>
                                </td>
                                <td style="width: 90px; text-align: center;">
                                    <%#Eval("MsgTitle")%>
                                </td>
                                <td style="width: 120px; text-align: center;"><%#Eval("SendDate")%>
                                </td>
                                <td style="width: 120px; text-align: center;"><%#Eval("ReadDate")%>
                                </td>
                                <td style="width: 50px; text-align: center;"><%#Eval("ReadState")%></td>
                                 <td style="width: 50px; text-align: center;">
                                     <asp:Label ID="LbDel" runat="server" Text='<%#Eval("DeleteMark")%>'></asp:Label></td>
                                <td style="text-align: left;"><%#Eval("MsgContent")%>
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

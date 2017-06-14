<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Message_Create.aspx.cs" Inherits="OpWeb.User.Message_Create" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>发送消息</title>
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
            divresize(110);
            FixedTableHeader("#table1", $(window).height() - 118);
        })

        function CHGMessageInfo() {
            $("#MessageInfo").val($("#MessageInfoTemp").val());
            $("#MessageTitle").val($("#MessageInfoTemp  option:selected").text());
        }
       
        function pushTemp() {
            var key = CheckboxValue();
           // if (IsDelData(key)) {
                //if ($("#MessageInfo").val() == "") {
                //    alert("请选择或输入信息模板！");
                //}
                //else {
            var delparm = 'action=createMessage&MessageInfo=' + escape($("#MessageInfo").val()) + '&ID=' + key + '&MsgType=' + $("#UserMessageType").val() + '&MsgTitle=' + $("#MessageTitle").val();//document.getElementById("MessageInfoTemp").options[document.getElementById("MessageInfoTemp").selectedIndex].text
                    delCreateMsg('MessageSend.ashx', delparm)
              //  }
            //}
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                发送消息列表
            </div>
        </div>
        <div class="btnbarcontetn">
            <div style="float: left;">
               <input type="hidden" id="AllUserID" runat="server" />
                <select id="AreaName" class="Searchwhere" runat="server">
                </select>
                <select id="EduBackName" class="Searchwhere" runat="server" style="width: 80px;">
                </select>
                <select id="EduTypeName" class="Searchwhere" runat="server">
                </select>
                <select id="CompanyID" class="Searchwhere" runat="server" style="width: 90px;">
                </select>
                <select id="specName" class="Searchwhere" runat="server" style="width: 90px;">
                </select>
                <select id="status" class="Searchwhere" runat="server">
                </select>
                <select id="Checks" class="Searchwhere" runat="server">
                </select>
                <select id="sexText" class="Searchwhere" runat="server">
                     <option value="">性别</option>
                      <option value="男">男</option>
                      <option value="女">女</option>
                </select>
                <select id="Searchwhere" class="Searchwhere" runat="server">
                    <option value="loginName">身份证</option>
                    <option value="name">姓名</option>
                    <option value="mobile">手机号</option>
                    <option value="SchoolName">院校</option>
                    <option value="EduBackName">最高学历</option>
                </select>
                <input type="text" id="txt_Search" class="txtSearch SearchImg" runat="server" style="width: 100px;" />
                <asp:LinkButton ID="lbtSearch" runat="server" class="button green" OnClick="lbtSearch_Click"><span class="icon-botton"
            style="background: url('../../Themes/images/Search.png') no-repeat scroll 0px 4px;">
        </span>查 询</asp:LinkButton>


            </div>
            <div style="text-align: right">消息类型：
                 <select id="UserMessageType" runat="server" style="width: 75px;">
                </select>&nbsp;&nbsp;
                消息标题：<input type="text" id="MessageTitle" class="txtSearch" style="width: 80px; height: 20px; margin-left: 3px;" runat="server" />
               
                <select id="MessageInfoTemp" runat="server" onchange="CHGMessageInfo()">
                </select>

                <input type="text" id="MessageInfo" class="txtSearch" style="width: 300px; height: 20px; margin-left: 3px;" runat="server" />
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
                        <td style="width: 80px; text-align: center;">用户姓名
                        </td>
                         <td style="width: 140px; text-align: center;">身份证号
                        </td>
                        <td style="width: 40px; text-align: center;">性别
                        </td>
                        <td style="width: 80px; text-align: center;">出生年月
                        </td>
                        <td style="width: 40px; text-align: center;">民族
                        </td>
                        <td style="width: 200px; text-align: center;">院校</td>
                        <td style="width: 100px; text-align: center;">最高学历
                        </td>
                        <td style="width: 200px; text-align: center;">申请单位
                        </td>
                        <td style="width: 50px; text-align: center;">状态
                        </td>
                        <td style="text-align: left;">申请专业
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rp_Item" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 20px; text-align: left;">
                                    <input type="checkbox" value="<%#Eval("User_ID")%>" name="checkbox" />
                                </td>
                                <td style="width: 80px; text-align: center;">
                                    <%#Eval("name")%>
                                </td>
                                 <td style="width: 140px; text-align: center;">
                                    <a href="javascript:void()"><%#Eval("loginName").ToString().Trim()%></a>
                                </td>
                                <td style="width: 40px; text-align: center;">
                                    <%#Eval("sexText")%>
                                </td>
                                <td style="width: 80px; text-align: center;">
                                    <%#Eval("birthday")%>
                                </td>
                                <td style="width: 40px; text-align: center;">
                                    <%#Eval("NationName")%>
                                </td>
                                <td style="width: 200px; text-align: center;"><%#Eval("SchoolName")%>
                                </td>
                                <td style="width: 100px; text-align: center;"><%#Eval("EduBackName")%>
                                </td>
                                <td style="width: 200px; text-align: center;"><%#Eval("companyName")%>
                                </td>
                                <td style="width: 50px; text-align: center;"><%#Eval("status")%>
                                </td>
                                <td>
                                    <%#Eval("specName")%>
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

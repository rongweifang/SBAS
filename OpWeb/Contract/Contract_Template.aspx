﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_Template.aspx.cs" Inherits="OpWeb.Contract.Contract_Template" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同模板管理</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
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
            divresize(60);
            FixedTableHeader("#table1", $(window).height() - 98);
        })

        function refresh() {
            location.reload();
        }

        //添加
        function add() {

            var url = "/Contract/Contract_TemplateForm.aspx";
            top.openDialog(url, 'Contract_TemplateForm', '合同模板管理 - 添加', 1000, 610, 50, 50);
        }
        //编辑
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Contract/Contract_TemplateForm.aspx?key=" + key;
                top.openDialog(url, 'Contract_TemplateForm', '合同模板管理 - 编辑', 1000, 610, 50, 50);
            }
        }
        //预览
        function detail() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Contract/Contract_PrintView.aspx?UID=" + key + "&documentType=1";
                top.openDialog(url, 'Contract_PrintView', '打印预览', 1000, 800, 50, 50);
            }
        }

        //删除
        function EditWarrantor(Card_ID) {
            if (IsEditdata(Card_ID)) {
                var url = "/User/User_Warrantor.aspx?Card_ID=" + Card_ID;
                top.openDialog(url, 'User_Warrantor', '保证人信息', 800, 630, 50, 50);
            }
        }


    </script>
</head>
<body>
    <form id="form1" runat="server">

        <div class="btnbarcontetn">
            <div style="float: left;">
                <select id="ContractType" class="select" runat="server" style="width: 140px; display: inline-block;"></select>&nbsp;&nbsp;<input type="text" id="txt_Search" class="txtSearch SearchImg" runat="server" style="width: 120px;" /><asp:LinkButton ID="lbtSearch" runat="server" class="button green" OnClick="lbtSearch_Click"><span class="icon-botton"
            style="background: url('../../Themes/images/Search.png') no-repeat scroll 0px 4px;">
        </span>查 询</asp:LinkButton>

            </div>
            <div style="text-align: right">
                <uc2:LoadButton ID="LoadButton1" runat="server" />
            </div>
        </div>
        <div class="div-body">
            <table id="table1" class="grid" singleselect="true">
                <thead>
                    <tr>
                        <td style="width: 20px; text-align: left;">
                            <label id="checkAllOff" onclick="CheckAllLine()" title="全选"></label>
                        </td>
                        <td style="width: 160px; text-align: center;">模板分类</td>
                        <td style="width: 60px; text-align: center;">模板页码</td>
                        <td style="width: 80px; text-align: center;">修改人</td>
                        <td>修改时间</td>
                    </tr>
                </thead>
                <tbody style="line-height: 35px;">
                    <asp:Repeater ID="rp_Item" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 20px; text-align: left;">
                                    <input type="checkbox" value="<%#Eval("CTID")%>" name="checkbox" />
                                </td>
                                <td style="width: 160px; text-align: center;">
                                    <%#Eval("ContractName")%>
                                </td>
                                <td style="width: 60px; text-align: center;">
                                    <%#Eval("CTPage")%>
                                </td>
                                <td style="width: 80px; text-align: center;"><%#Eval("ModifyUser")%></td>
                                <td><%#Eval("ModifyDate")%></td>
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

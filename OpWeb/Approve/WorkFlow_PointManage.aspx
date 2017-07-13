<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_PointManage.aspx.cs" Inherits="OpWeb.Approve.WorkFlow_PointManage" %>

<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>审批节点管理</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />


    <script type="text/javascript">
        //回车键
        document.onkeydown = function (e) {
            if (!e) e = window.event; //
            if ((e.keyCode || e.which) == 13) {
                var obtnSearch = document.getElementById("lbtSearch");
                obtnSearch.click();
            }
        }
        $(function () {
            divresize(60);
            FixedTableHeader("#table1", $(window).height() - 118);
        })

        function refresh() {
            location.reload();
        }

        //添加
        function add() {
            var url = "/Approve/WorkFlow_PointManageForm.aspx?FlowInfoId=<%=_key%>";
            top.openDialog(url, 'WorkFlow_PointManageForm', '审批节点管理-添加', 600, 300, 50, 50);
        }

        //编辑
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Approve/WorkFlow_PointManageForm.aspx?PID=" + key;
                top.openDialog(url, 'WorkFlow_PointManageForm', '审批节点管理-编辑', 600,300, 50, 50);
            }
        }


    </script>
</head>
<body class="gray-bg">
    <form id="form1" runat="server">
        <div class="btnbarcontetn">
            <div style="text-align: right">
                <uc2:LoadButton ID="LoadButton1" runat="server" />
            </div>
        </div>
        <div class="div-body">
            <table id="table1" class="grid" singleselect="false">
                <thead>
                    <tr>
                        <td style="width: 20px; text-align: left;">
                            <label id="checkAllOff" onclick="CheckAllLine()" title="全选"></label>
                        </td>
                        <td style="width: 80px; text-align: center;">序号</td>
                        <td style="width: 140px; text-align: center;">节点名称</td>
                        <td style="width: 140px; text-align: center;">审批角色</td>

                        <td>创建时间</td>
                    </tr>
                </thead>
                <tbody style="line-height: 35px;">
                    <asp:Repeater ID="rp_Item" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 20px; text-align: left;">
                                    <input type="checkbox" value="<%#Eval("ID")%>" name="checkbox" />
                                </td>
                                <td style="width: 80px; text-align: center;"><%#Eval("Step")%></td>
                                <td style="width: 140px; text-align: center;"><%#Eval("ActName")%></td>
                                <td style="width: 140px; text-align: center;"><%#Eval("Roles_Name")%></td>
                                <td><%#Eval("CreateTime")%></td>
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
    </form>
</body>
</html>

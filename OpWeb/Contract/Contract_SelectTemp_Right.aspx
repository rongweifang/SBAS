<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_SelectTemp_Right.aspx.cs" Inherits="OpWeb.Contract.Contract_SelectTemp_Right" %>

<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择项列表</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">

        $(function () {
            // $(".div-body").PullBox({ dv: $(".div-body"), obj: $("#table1").find("tr") });
            divresize(90);
            FixedTableHeader("#table1", $(window).height() - 118);
        })
        //添加
        function add() {
            var url = "/Contract/Contract_SelectTemp_RightForm.aspx?SL_ID=<%=SL_ID%>";
            top.openDialog(url, 'Contract_SelectTemp_RightForm', '选择项 - 添加', 700, 350, 50, 50);
        }
        //修改
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Contract/Contract_SelectTemp_RightForm.aspx?SL_ID=<%=SL_ID%>&key=" + key;
                top.openDialog(url, 'Contract_SelectTemp_RightForm', '选择项 - 编辑', 700, 350, 50, 50);
            }
        }
        function refresh() {
            location.reload();
        }

        //删除
        function Delete() {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var delparm = 'action=Virtualdelete&module=选择项管理&tableName=Contract_SelectSub&pkName=SL_SubID&pkVal=' + key;
                delConfig('/Ajax/Common_Ajax.ashx', delparm)
            }
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbarcontetn">
            <div style="float: left;">
                &nbsp;
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
                            <label id="checkAllOff" onclick="CheckAllLine()" title="全选">
                                &nbsp;</label>
                        </td>
                        <td style="width: 60px; text-align: center;">序号
                        </td>
                        <td style="width: 100px; text-align: center;">宽度
                        </td>
                        <td style="width: 50px; text-align: center;">左边距
                        </td>
                        <td>选项值
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rp_Item" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 20px; text-align: left;">
                                    <input type="checkbox" value="<%#Eval("SL_SubID")%>" name="checkbox" />
                                </td>
                                <td style="width: 60px; text-align: center;">
                                    <%#Eval("SL_Sub_Order")%>
                                </td>
                                <td style="width: 100px; text-align: center;">
                                    <%#Eval("SL_Width")%>
                                </td>
                                <td style="width: 50px; text-align: center;">
                                    <%#Eval("SL_MarginLeft")%>
                                </td>
                                <td>
                                    <%#Eval("SL_SubTitle")%>
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
    </form>
</body>
</html>

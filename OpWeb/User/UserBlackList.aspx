<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserBlackList.aspx.cs" Inherits="OpWeb.User.UserBlackList" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户信息</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/JS/jquery.min.js" type="text/javascript"></script>
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
            FixedTableHeader("#table1", $(window).height() - 118);
        })

        function refresh() {
            location.reload();
        }

        //添加
        function add() {
            var url = "/User/BlackUserEdit.aspx";
            top.openDialog(url, 'UserForm', '黑名单 - 添加', 800, 510, 50, 50);
        }
        //修改
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/User/BlackUserEdit.aspx?userId=" + key;
                top.openDialog(url, 'UserForm', '黑名单 - 编辑', 800, 510, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = CheckboxValue();
            if (!confirm("确定删除该记录吗？")) {
                return;
            }
            if (key == null || $.trim(key) == null) {
                alert("删除失败");
                return;
            }
            getAjax('/Handler/BlackUserHandler.ashx?op=deleteBlackUser&id='+key,"", function (rs) {
                if (parseInt(rs) <= 0) {
                    showTipsMsg("<span style='color:red'>删除失败！</span>", 4000, 5);
                }
                else {
                    windowload();
                }
            });
        }

        function saveSuccess(msg) {
            showTipsMsg("<span style='color:red'>" + msg + "</span>", 500, 4);
            window.setTimeout(windowload, 1000);
        }

        function Onflag() {
            //var key = CheckboxValue();
            //if (IsDelData(key)) {
            //    var parm = 'action=flag&user_ID=' + key;
            //    getAjax('Common_UserInfo.ashx', parm, function (rs) {
            //        if (parseInt(rs) > 0) {
            //            showTipsMsg("标记成功！在【用户管理】-【我的标记】里查看详细！", 2000, 4);
            //            windowload();
            //        }
            //        else {
            //            showTipsMsg("<span style='color:red'>标记失败，请稍后重试！</span>", 4000, 5);
            //        }
            //    });

            //}
        }
        $(document).ready(function () {
            $("#btn_refresh").click(function () {
                windowload();
            });
        });
    </script>


</head>
<body class="gray-bg">
    <div class="wrapper animated fadeInRight">
        <form id="form1" runat="server">

            <div class="btnbarcontetn">
                <div style="float: left;">
                    <input type="text" id="txt_Search" class="txtSearch SearchImg" runat="server" style="width: 180px;" />
                    <asp:LinkButton ID="lbtSearch" runat="server" class="button green" OnClick="lbtSearch_Click">
                        <span class="icon-botton"
            style="background: url('../../Themes/images/Search.png') no-repeat scroll 0px 4px;">
        </span>查 询</asp:LinkButton>
                    <input  type="button" value="刷新" class="button green" id="btn_refresh"/>
                </div>
                <div style="text-align: right">
                    <uc2:LoadButton ID="LoadButton1" runat="server" />
                </div>
            </div>
            <div class="div-body">
                <table id="table1" class="grid" singleselect="false">
                    <tbody style="line-height: 35px;">
                        <tr>
                            <td style="width: 20px; text-align: left;">
                                <label id="checkAllOff" onclick="CheckAllLine()" title="全选"></label>
                            </td>
                            <td style="width: 80px; text-align: center;">姓名</td>
                            <td style="width: 140px; text-align: center;">身份证号</td>
                            <td style="width: 100px; text-align: center;">联系电话</td>
                            <td style="width: 70px; text-align: center;">添加日期</td>
                        </tr>
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 20px; text-align: left;">
                                        <input id="CID" type="checkbox" value="<%#Eval("BlackID") %>" name="checkbox" />
                                    </td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("Card_Name") %></td>
                                    <td style="width: 140px; text-align: center;"><%#Eval("Card_Id") %></td>
                                    <td style="width: 100px; text-align: center;"><%#Eval("U_Tel") %></td>
                                    <td style="width: 70px; text-align: center;"><%#Eval("AddDate") %></td>
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
    </div>
</body>
</html>

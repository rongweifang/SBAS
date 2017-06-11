<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="Manage.User.UserList" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户信息</title>
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

        function recover() {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var parm = 'action=recover&user_ID=' + key;
                showConfirmMsg('注：您确认要【恢复】当前选中用户吗？', function (r) {
                    if (r) {
                        getAjax('Common_UserInfo.ashx', parm, function (rs) {
                            if (parseInt(rs) > 0) {
                                showTipsMsg("恢复成功！", 2000, 4);
                                windowload();
                            }
                            else {
                                showTipsMsg("<span style='color:red'>恢复失败，请稍后重试！</span>", 4000, 5);
                            }
                        });
                    }
                });
            }
        }

        function Onflag() {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var parm = 'action=flag&user_ID=' + key;
                getAjax('Common_UserInfo.ashx', parm, function (rs) {
                    if (parseInt(rs) > 0) {
                        showTipsMsg("标记成功！在【用户管理】-【我的标记】里查看详细！", 2000, 4);
                        windowload();
                    }
                    else {
                        showTipsMsg("<span style='color:red'>标记失败，请稍后重试！</span>", 4000, 5);
                    }
                });

            }
        }

        function detail() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/User/UserInfoView.aspx?key=" + key;
                top.openDialog(url, 'UserInfoView', '用户信息 - 查看', 700, 350, 50, 50);
            }
        }

        //锁 定
        function lock() {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var parm = 'action=lock&user_ID=' + key;
                showConfirmMsg('注：您确认要【锁 定】当前选中用户吗？', function (r) {
                    if (r) {
                        getAjax('Common_UserInfo.ashx', parm, function (rs) {
                            if (parseInt(rs) > 0) {
                                showTipsMsg("锁定成功！", 2000, 4);
                                windowload();
                            }
                            else {
                                showTipsMsg("<span style='color:red'>锁定失败，请稍后重试！</span>", 4000, 5);
                            }
                        });
                    }
                });
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div class="btnbartitle">
            <div>
                用户信息列表
            </div>
        </div>
        <div class="btnbarcontetn">
            <div style="float: left;">

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
                        <td style="width: 80px; text-align: center;">用户姓名
                        </td>
                        <td style="width: 140px; text-align: center;">身份证号
                        </td>
                        <td style="width: 40px; text-align: center;">性别
                        </td>
                        <td style="width: 80px; text-align: center;">院校所在地
                        </td>
                        <td style="width: 200px; text-align: center;">院校</td>
                        <td style="width: 100px; text-align: center;">最高学历
                        </td>
                        <td style="width: 80px; text-align: center;">教育类型
                        </td>
                        <td style="width: 70px; text-align: center;">毕业时间
                        </td>
                        <td style="width: 50px; text-align: center;">确认简历
                        </td>
                        <td style="width: 160px; text-align: center;">申请专业
                        </td>
                        <td style="width: 50px; text-align: center;">状态
                        </td>
                        <td>注册时间
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
                                    <%#Eval("AreaName")%>
                                </td>
                                <td style="width: 200px; text-align: center;"><%#Eval("SchoolName")%>
                                </td>
                                <td style="width: 100px; text-align: center;"><%#Eval("EduBackName")%>
                                </td>
                                <td style="width: 80px; text-align: center;"><%#Eval("EduTypeName")%>
                                </td>
                                <td style="width: 70px; text-align: center;"><%#Eval("gradDate")%>
                                </td>
                                <td style="width: 50px; text-align: center;"><%#Eval("Checks")%>
                                </td>
                                <td style="width: 160px; text-align: center;"><%#Eval("specName")%>
                                </td>
                                <td style="width: 50px; text-align: center;"><%#Eval("status")%>
                                </td>
                                <td>
                                    <%#Eval("createdate")%>
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

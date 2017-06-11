<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Specialty_index.aspx.cs" Inherits="Manage.Company.Specialty_index" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>专业信息</title>
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

        //添加
        function add() {
            var url = "/Company/Specialty_form.aspx";
            top.openDialog(url, 'Specialty_form', '专业信息 - 添加', 700, 620, 50, 50);
        }
        //修改
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Company/Specialty_form.aspx?key=" + key;
                top.openDialog(url, 'Specialty_form', '专业信息 - 编辑', 700, 620, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var delparm = 'action=Virtualdelete&module=专业信息&tableName=Specialty&pkName=ID&pkVal=' + key;
                delConfig('/Ajax/Common_Ajax.ashx', delparm)
            }
        }

        function recover() {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var parm = 'action=recover&tableName=Company&pkName=companyID&pkVal=' + key;
                showConfirmMsg('注：您确认要【恢复】当前选中项吗？', function (r) {
                    if (r) {
                        getAjax('/Ajax/Common_Ajax.ashx', parm, function (rs) {
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
                var parm = 'action=Virtualdelete&module=公司信息&tableName=Company&pkName=companyID&pkVal=' + key;
                showConfirmMsg('注：您确认要【锁 定】当前选中用户吗？', function (r) {
                    if (r) {
                        getAjax('/Ajax/Common_Ajax.ashx', parm, function (rs) {
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
                专业信息列表
            </div>
        </div>
        <div class="btnbarcontetn">
            <div style="float: left;">
                <select id="companyName" class="Searchwhere" runat="server">
                </select>
                <select id="specName" class="Searchwhere" runat="server">
                </select>
                <select id="isLock" class="Searchwhere" runat="server">
                    <option value="">状态</option>
                    <option value="0">正常</option>
                    <option value="1">锁定</option>
                </select>
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
                        <td style="width: 300px; text-align: center;">公司名称
                        </td>
                        <td style="width: 150px; text-align: center;">专业名称
                        </td>
                        <td style="width: 150px; text-align: center;">起止时间
                        </td>
                        <td style="width: 100px; text-align: center;">最低学历
                        </td>
                        <td style="width: 50px; text-align: center;">招聘人数
                        </td>
                        <td style="width: 50px; text-align: center;">申请人数
                        </td>
                        <td>状态
                        </td>

                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rp_Item" runat="server" OnItemDataBound="rp_Item_ItemDataBound">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 20px; text-align: left;">
                                    <input type="checkbox" value="<%#Eval("ID")%>" name="checkbox" />
                                </td>
                                <td style="width: 300px; text-align: left;">
                                    <%#Eval("companyName")%>
                                </td>
                                <td style="width: 150px; text-align: left;">
                                    <%#Eval("specName")%>
                                </td>
                                <td style="width: 150px; text-align: left;">
                                    <%#Common.DotNetCode.CommonHelper.GetFormatDateTime(Eval("beginDate"),"MM月dd")%> 至 <%#Common.DotNetCode.CommonHelper.GetFormatDateTime(Eval("endDate"),"MM月dd")%>
                                </td>
                                <td style="width: 100px; text-align: left;">
                                    <%#Eval("name")%>
                                </td>
                                <td style="width: 50px; text-align: left;">
                                    <%#Eval("acceptNum")%>
                                </td>
                                <td style="width: 50px; text-align: left;">
                                    <asp:Label ID="lbNum" runat="server" Text='<%#Eval("ID")%>'></asp:Label> 
                                </td>
                                <td><asp:Label ID="lblock" runat="server" Text='<%#Eval("isLock")%>'></asp:Label> 
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


<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Company_index.aspx.cs" Inherits="OpWeb.Company.Company_index" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>公司信息</title>
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
            var url = "/Company/Company_form.aspx";
            top.openDialog(url, 'Company_form', '企业信息 - 添加', 700, 630, 50, 50);
        }
        //修改
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Company/Company_form.aspx?key=" + key;
                top.openDialog(url, 'Company_form', '企业信息 - 编辑', 700, 630, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = CheckboxValue();
            if (IsDelData(key)) {
                var delparm = 'action=Virtualdelete&module=企业信息&tableName=Company&pkName=companyID&pkVal=' + key;
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
                var url = "/Company/Company_View.aspx?key=" + key;
                top.openDialog(url, 'Company_View', '企业信息 - 查看', 700, 350, 50, 50);
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
                客户信息列表
            </div>
        </div>
        <div class="btnbarcontetn">
            <div style="float: left;">
                <select id="Searchwhere" class="Searchwhere" runat="server">
                    <option value="companyName">公司名称</option>
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
                        <td style="width: 300px; text-align: center;">公司名称
                        </td>

                        <td style="width: 50px; text-align: center;">状态
                        </td>
                        <td style="width: 130px; text-align: center;">招聘开始时间
                        </td>
                        <td style="width: 130px; text-align: center;">招聘结束时间
                        </td>
                        <td>创建时间
                        </td>
                    </tr>
                </thead>
                <tbody>
                    <asp:Repeater ID="rp_Item" runat="server">
                        <ItemTemplate>
                            <tr>
                                <td style="width: 20px; text-align: left;">
                                    <input type="checkbox" value="<%#Eval("companyID")%>" name="checkbox" />
                                </td>
                                <td style="width: 300px; text-align: left;">
                                    <%#Eval("companyName")%>
                                </td>
                                <td style="width: 50px; text-align: center;"><%#Eval("DeleteMark")%>
                                </td>
                                 <td style="width: 130px; text-align: center;"><%#Eval("BeginDate")%>
                                </td>
                                 <td style="width: 130px; text-align: center;"><%#Eval("EndDate")%>
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


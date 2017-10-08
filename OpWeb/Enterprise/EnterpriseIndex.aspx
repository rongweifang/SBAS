<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseIndex.aspx.cs" Inherits="OpWeb.Enterprise.EnterpriseIndex" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户信息</title>
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
            FixedTableHeader("#table1", $(window).height() - 118);
        })

        function refresh() {
            location.reload();
        }

        //添加
        function add() {
            var url = "/Enterprise/EnterpriseForm.aspx";
            top.openDialog(url, 'EnterpriseForm', '企业客户管理 - 添加', 820, 510, 50, 50);
        }
        //修改
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Enterprise/EnterpriseForm.aspx?key=" + key;
                top.openDialog(url, 'EnterpriseForm', '企业客户管理 - 编辑', 820, 510, 50, 50);
            }
        }
        //主要经营人
        function EditEnterpriseOperator(E_enterpriseID) {
            if (IsEditdata(E_enterpriseID)) {
                var url = "/Enterprise/EnterpriseOperator.aspx?E_enterpriseID=" + E_enterpriseID;
                top.openDialog(url, 'EnterpriseOperator', '主要经营人', 800, 500, 50, 50);
            }
        }
        //附加信息
        function EditEnterpriseMore(E_enterpriseID) {
            if (IsEditdata(E_enterpriseID)) {
                var url = "/Enterprise/EnterpriseMore.aspx?E_enterpriseID=" + E_enterpriseID;
                top.openDialog(url, 'EnterpriseMore', '附加信息管理 ', 800, 400, 50, 50);
            }
        }
        //本社开户
        function EditEnterpriseAccount(E_enterpriseID) {
            if (IsEditdata(E_enterpriseID)) {
                var url = "/Enterprise/EnterpriseAccount.aspx?E_enterpriseID=" + E_enterpriseID;
                top.openDialog(url, 'EnterpriseAccount', '开户信息 ', 800, 380, 50, 50);
            }
        }
        //分支机构
        function EditEnterpriseBranch(E_enterpriseID) {
            if (IsEditdata(E_enterpriseID)) {
                var url = "/Enterprise/EnterpriseBranch.aspx?E_enterpriseID=" + E_enterpriseID;
                top.openDialog(url, 'EnterpriseBranch', '分支机构信息', 800, 560, 50, 50);
            }
        }
       
        //签订合同
        function EditContract(E_enterpriseID) {
            if (IsEditdata(E_enterpriseID)) {
                var url = "/Enterprise/Enterprise_Contract.aspx?E_enterpriseID=" + E_enterpriseID;
                top.openDialog(url, 'Enterprise_Contract', '合同管理', 780, 330, 50, 50);
            }
        }
        //照片管理
        function EditPhoto(E_enterpriseID) {
            if (IsEditdata(E_enterpriseID)) {
                var url = "/Enterprise/EnterprisePhoto.aspx?E_enterpriseID=" + E_enterpriseID;
                top.openDialog(url, 'EnterprisePhoto', '证件采集', 800, 560, 50, 50);
            }
        }

    </script>


</head>
<body class="gray-bg">
    <div class="wrapper animated fadeInRight">
        <form id="form1" runat="server">

            <div class="btnbarcontetn">
                <div style="float: left;">
                    <input type="text" id="txt_Search" class="txtSearch SearchImg" runat="server" style="width: 180px;" /><asp:LinkButton ID="lbtSearch" runat="server" class="button green" OnClick="lbtSearch_Click"><span class="icon-botton"
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
                            <td style="width: 200px; text-align: center;">企业名称</td>
                            <td style="width: 100px; text-align: center;">经营期限至</td>
                            <td style="width: 80px; text-align: center;">联系人</td>
                            <td style="width: 100px; text-align: center;">联系电话</td>
                            <td style="width: 70px; text-align: center;">经营人</td>
                            <td style="width: 60px; text-align: center;">附加信息</td>
                            <td style="width: 70px; text-align: center;">本社开户</td>
                            <td style="width: 70px; text-align: center;">分支机构</td>
                            <td style="width: 60px; text-align: center;">证件采集</td>
                            <td style="width: 70px; text-align: center;">签订合同</td>
                            <td style="width: 120px; text-align: center;">企业状态</td>
                            <td style="width: 120px;">编辑人</td>
                            <td>&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody style="line-height: 35px;">
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 20px; text-align: left;">
                                        <input id="EID" type="checkbox" value="<%#Eval("E_enterpriseID")%>" name="checkbox" />
                                    </td>
                                    <td style="width: 200px; text-align: center;"><%#Eval("E_enterpriseName")%></td>
                                    <td style="width: 100px; text-align: center;"><%#Eval("E_openTo")%></td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("E_LinkMan")%></td>
                                    <td style="width: 100px; text-align: center;"><%#Eval("E_LinkPhone")%></td>
                                    <td style="width: 70px; text-align: center;">
                                        <a onclick="EditEnterpriseOperator('<%#Eval("E_enterpriseID")%>')">
                                            <img src="../img/App_User_Group.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <a onclick="EditEnterpriseMore('<%#Eval("E_enterpriseID")%>')">
                                            <img src="../img/format_indent.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 70px; text-align: center;">
                                        <a onclick="EditEnterpriseAccount('<%#Eval("E_enterpriseID")%>')">
                                            <img src="../img/account_card.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 70px; text-align: center;">
                                        <a onclick="EditEnterpriseBranch('<%#Eval("E_enterpriseID")%>')">
                                            <img src="../img/group_55.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <a onclick="EditPhoto('<%#Eval("E_enterpriseID")%>')">
                                            <img src="../img/SCAN_47.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 70px; text-align: center;">
                                        <a onclick="EditContract('<%#Eval("E_enterpriseID")%>','<%#Eval("E_enterpriseName")%>')">
                                            <img src="../img/contract_740.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 120px; text-align: center;"><%#Eval("E_enterpriseStatus")%></td>
                                    <td style="width: 120px;"><%#Eval("CreateDate")%></td>
                                    <td>&nbsp;</td>
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

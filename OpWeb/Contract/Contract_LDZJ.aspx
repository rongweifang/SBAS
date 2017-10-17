<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_LDZJ.aspx.cs" Inherits="OpWeb.Contract.Contract_LDZJ" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>企事业单位流动资金借款</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>

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


        //编辑
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Contract/Contract_LDZJForm.aspx?UID=" + key;
                top.openDialog(url, 'Contract_LDZJForm', '合同管理 - 流动资金借款合同', 1000, 610, 50, 50);
            }
        }
        //打印预览
        function detail() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Contract/Contract_LDZJPrintView.aspx?UID=" + key + "&documentType=Contract_LDZJ";
                // window.open(url);
                top.openDialog(url, 'Contract_LDZJPrintView', '企事业流动资金借款合同-打印预览', 710, 800, 50, 50);
            }
        }
        //财务信息
        function EditFinance(UID) {
            if (IsEditdata(UID)) {
                var url = "/Contract/Contract_LDZJFinance.aspx?UID=" + UID;
                top.openDialog(url, 'Contract_LDZJFinance', '财务指标', 970, 630, 50, 50);
            }
        }

        //质押凭证
        function EditPG(UID) {
            if (IsEditdata(UID)) {
                var url = "/Contract/Contract_LDZJPGInfo.aspx?UID=" + UID;
                top.openDialog(url, 'Contract_LDZJPGInfo', '质押凭证 ', 738, 545, 50, 50);
            }
        }
        //抵押凭证
        function EditMG(UID) {
            if (IsEditdata(UID)) {
                var url = "/Contract/Contract_LDZJMGInfo.aspx?UID=" + UID;
                top.openDialog(url, 'Contract_LDZJMGInfo', '抵押凭证 ', 758, 545, 50, 50);
            }
        }
        //保证资料
        function EditGT(UID) {
            if (IsEditdata(UID)) {
                var url = "/Contract/Contract_LDZJGTInfo.aspx?UID=" + UID;
                top.openDialog(url, 'Contract_LDZJGTInfo', '保证资料 ', 800, 510, 50, 50);
            }
        }
        //function submitaudit() {
        //    var key = CheckboxValue();
        //    if (IsEditdata(key)) {
        //        var parm = 'action=SUBMIT&ContractId=' + key + '&ContractType=Contract_Mortgage';
        //        getAjax('/frame/ApproveDispose.ashx', parm, function (rs) {
        //            if (rs == "TRUE") {

        //                layer.msg('提交成功！');
        //                return false;
        //            }
        //            else {
        //                layer.msg('提交失败，请重试！');
        //                return false;
        //            }
        //        });
        //    }
        //}


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
                            <td style="width: 200px; text-align: center;">借款人全称</td>
                            <td style="width: 80px; text-align: center;">借款金额</td>
                            <td style="width: 80px; text-align: center;">借款期限</td>
                            <td style="width: 100px; text-align: center;">担保方式</td>
                            <td style="width: 70px; text-align: center;">财务信息</td>
                            <td style="width: 60px; text-align: center;">质押凭证</td>
                            <td style="width: 70px; text-align: center;">抵押凭证</td>
                            <td style="width: 60px; text-align: center;">操作员</td>
                            <td style="width: 70px; text-align: center;">审批状态</td>
                            <td style="width: 70px; text-align: center;">合同状态</td>
                            <td style="width: 120px;">创建日期</td>
                            <td>&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody style="line-height: 35px;">
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 20px; text-align: left;">
                                        <input id="UUID" type="checkbox" value="<%#Eval("UID")%>" name="checkbox" />
                                    </td>
                                    <td style="width: 200px; text-align: center;"><%#Eval("E_enterpriseName")%></td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("E_Loan")%>万元</td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("M_Loan_Years")%>年</td>
                                    <td style="width: 100px; text-align: center;"><%#Eval("E_GuaranteeType")%> </td>
                                    <td style="width: 70px; text-align: center;">
                                        <a onclick="EditFinance('<%#Eval("UID")%>')">
                                            <img src="../img/data_64.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <a onclick="EditPG('<%#Eval("UID")%>')">
                                            <img src="../img/data_48.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 70px; text-align: center;">
                                        <a onclick="EditMG('<%#Eval("UID")%>')">
                                            <img src="../img/data_70.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                   
                                    <td style="width: 60px; text-align: center;">
                                        <%#Eval("User_Name")%>
                                    </td>
                                    <td style="width: 70px; text-align: center;">
                                        <%#Eval("Approve_State")%>
                                    </td>
                                    <td style="width: 70px; text-align: center;"><%#Eval("State")%></td>
                                    <td style="width: 120px; overflow: hidden;"><%#Eval("CreateDate")%></td>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MortgageData_Index.aspx.cs" Inherits="OpWeb.Mortgage.MortgageData_Index" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>按揭数据</title>
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

        function detail() {
            var key = CheckboxValue();
            vDetail(key);
        }
        function vDetail(key) {
            if (IsEditdata(key)) {
                var url = "/Mortgage/MortgageData_Detail.aspx?UID=" + key;
                top.openDialog(url, 'MortgageData_Detail', '按揭明细', 600, 590, 50, 50);

            }
        }
        function submitaudit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var parm = '';
                getAjax('/frame/ApproveDispose.ashx', parm, function (rs) {
                    if (rs == "TRUE") {

                        layer.msg('提交成功！');
                        return false;
                    }
                    else if (rs == "EXIST") {
                        layer.msg('提交失败：审批已存在，请勿重复提交！');
                        return false;
                    }
                    else {
                        layer.msg('提交失败，请重试！');
                        return false;
                    }
                });
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
                            <td style="width: 80px; text-align: center;">姓名</td>
                            <td style="width: 140px; text-align: center;">身份证号</td>
                            <td style="width: 80px; text-align: center;">授信金额</td>
                            <td style="width: 100px; text-align: center;">还款方式</td>
                            <td style="width: 80px; text-align: center;">年利率</td>
                            <td style="width: 100px; text-align: center;">贷款期数</td>
                            <td style="width: 90px; text-align: center;">当前期数</td>
                            <td style="width: 100px; text-align: center;">还款金额</td>
                            <td style="width: 60px; text-align: center;">操作员</td>
                            <td style="width: 120px;">发放日期</td>
                            <td>&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody style="line-height: 35px;">
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 20px; text-align: left;">
                                        <input id="UID" type="checkbox" value="<%#Eval("ContractID")%>" name="checkbox" />
                                    </td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("Card_Name")%></td>
                                    <td style="width: 140px; text-align: center;"><%#Eval("Card_ID")%></td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("M_Loan")%></td>
                                    <td style="width: 100px; text-align: center;"><%#Eval("M_Replay_Type")%></td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("M_Rate_Year")%></td>
                                    <td style="width: 100px; text-align: center;"><%#Eval("M_Loan_Months")%></td>
                                    <td style="width: 90px; text-align: center;"><%#Eval("Loan_M")%></td>
                                    <td style="width: 100px; text-align: center;"><%#Eval("PerPay")%></td>
                                    <td style="width: 60px; text-align: center;">
                                        <%#Eval("User_Name")%>
                                    </td>
                                    <td style="width: 120px; overflow: hidden;"><%#Eval("Loan_StartDate")%></td>
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

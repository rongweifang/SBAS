<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_PrintList.aspx.cs" Inherits="OpWeb.Contract.Contract_PrintList" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同提交审核打印</title>
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
                var url = "/Contract/Contract_PrintForm.aspx?HUID=" + key;
                top.openDialog(url, 'Contract_PrintForm', '合同编辑',1000, 590, 50, 50);
            }
        }
        //打印
        function printer() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Contract/Contract_Print.aspx?HUID=" + key;
                window.open(url);
               
            }
        }
        function submitaudit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var parm = 'action=SUBMIT&HUID=' + key;
                getAjax('/frame/ApproveDispose.ashx', parm, function (rs) {
                    if (rs == "TRUE") {

                        layer.msg('提交成功！');
                        return false;
                    }
                    else if (rs == "EXIST")
                    {
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
                            <td style="width: 160px; text-align: center;">借款人全称</td>
                            <td style="width: 140px; text-align: center;">证件号码</td>
                            <td style="width: 80px; text-align: center;">授信金额(万)</td>
                            <td style="width: 100px; text-align: center;">贷款期数</td>
                            <td style="width: 200px; text-align: center;">起止日期</td>
                            <td style="width: 160px; text-align: center;">合同类型</td>
                            <td style="width: 60px; text-align: center;">操作员</td>
                            <td style="width: 120px;">创建日期</td>
                            <td>&nbsp;</td>
                        </tr>
                    </thead>
                    <tbody style="line-height: 35px;">
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 20px; text-align: left;">
                                        <input id="UUID" type="checkbox" value="<%#Eval("HUID")%>" name="checkbox" />
                                    </td>
                                    <td style="width: 160px; text-align: center;"><%#Eval("Card_Name")%></td>
                                    <td style="width: 140px; text-align: center;"><%#Eval("Card_ID")%></td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("M_Loan_Cap")%></td>
                                    <td style="width: 100px; text-align: center;"><%#Eval("M_Loan_Months")%></td>
                                    <td style="width: 200px; text-align: center;"><%#Eval("M_Reply_Begin","{0:yyyy年M月d日}")%> 至 <%#Eval("M_Reply_End","{0:yyyy年M月d日}")%></td>
                                    <td style="width: 160px; text-align: center;">
                                        <%#Eval("ContractName")%>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <%#Eval("CreateUser")%>
                                    </td>
                                   
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

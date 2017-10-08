<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_OneCard.aspx.cs" Inherits="OpWeb.Contract.Contract_OneCard" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>富民一卡通</title>
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

        //编辑
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Contract/Contract_OneCardForm.aspx?UID=" + key;
                top.openDialog(url, 'Contract_OneCardForm', '合同管理 - 富民一卡通', 1000, 610, 50, 50);
            }
        }
        //打印预览
        function detail() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Contract/Contract_OneCardView.aspx?UID=" + key + "&documentType=Contract_OneCard";
                top.openDialog(url, 'Contract_OneCardView', '富民一卡通合同-打印预览', 710, 800, 50, 50);
                //window.open(url);
                //top.Urlhref(url, 'Contract_PrintView', '按揭合同-打印预览', 1000, 800, 50, 50);
            }
        }

        //抵押人
        function EditGuarantee(UID) {
            if (IsEditdata(UID)) {
                var url = "/Contract/User_Guarantee.aspx?UID= " + UID;
                top.openDialog(url, 'User_Guarantee', '保证信息', 700, 630, 50, 50);
            }
        }
        //抵押物品
        function EditPledge(UID) {
            if (IsEditdata(UID)) {
                var url = "/Contract/User_Pledge.aspx?UID=" + UID;
                top.openDialog(url, 'User_Pledge', '抵押信息', 800, 280, 50, 50);
            }
        }

        //面谈记录EditInterview
        function EditInterview(UID)
        {
            if (IsEditdata(UID)) {
                var url = "/Contract/User_Interview.aspx?UID=" + UID;
                top.openDialog(url, 'User_Interview', '面谈记录', 900, 630, 50, 50);
            }
        }

        function EditUFinger(UID, ClassID) {
            if (IsEditdata(UID)) {
                var url = "/Contract/Contract_Finger.aspx?UID=" + UID + "&ClassID=" + ClassID;
                top.openDialog(url, 'Contract_Finger', '指纹签名', 970, 630, 50, 50);
            }
        }

    </script>
</head>
<body class="gray-bg">
    <div class="wrapper animated fadeInRight">
        <form id="form1" runat="server">
            <div class="btnbarcontetn">
                <div style="float: left;">
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
                            <td style="width: 80px; text-align: center;">授信金额(万)</td>
                            <td style="width: 100px; text-align: center;">结算方式</td>
                             <td style="width: 100px; text-align: center;">授信期限</td>
                            <td style="width: 70px; text-align: center;">指纹签名</td>
                            <td style="width: 60px; text-align: center;">配偶签名</td>
                            <td style="width: 60px; text-align: center;">抵押物品</td>
                            <td style="width: 60px; text-align: center;">保证/抵押</td>
                            <td style="width: 60px; text-align: center;">面谈记录</td>
                            <td style="width: 60px; text-align: center;">操作员</td>
                            <td style="width: 70px; text-align: center;">审批状态</td>
                            <td style="width: 70px; text-align: center;">合同状态</td>
                            <td style="min-width: 100px; overflow: hidden;">创建日期</td>
                        </tr>
                    </thead>
                    <tbody style="line-height: 35px;">
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 20px; text-align: left;">
                                        <input type="checkbox" value="<%#Eval("UID")%>" name="checkbox" />
                                    </td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("Card_Name")%></td>
                                    <td style="width: 140px; text-align: center;"><%#Eval("Card_ID")%></td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("M_Loan")%></td>
                                    <td style="width: 100px; text-align: center;"><%#Eval("M_Replay_Type")%></td>
                                    <td style="width: 100px; text-align: center;"> <%#Eval("M_Reply_End","{0:yyyy年M月d日}")%></td>
                                    <td style="width: 70px; text-align: center;">
                                        <a onclick="EditUFinger('<%#Eval("UID")%>',1)">
                                            <img src="../img/fingerprint_default.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <a onclick="EditUFinger('<%#Eval("UID")%>',2)">
                                            <img src="../img/pen_128.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <a onclick="EditPledge('<%#Eval("UID")%>')">
                                            <img src="../img/matte_square.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <a onclick="EditGuarantee('<%#Eval("UID")%>')">
                                            <img src="../img/matte_35.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <a onclick="EditInterview('<%#Eval("UID")%>')">
                                            <img src="../img/interview_35.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <%#Eval("User_Name")%>
                                    </td>
                                    <td style="width: 70px; text-align: center;">
                                        <%#Eval("Approve_State")%>
                                    </td>
                                    <td style="width: 70px; text-align: center;"><%#Eval("State")%></td>
                                    <td style="min-width: 100px; overflow: hidden;"><%#Eval("CreateDate")%></td>
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

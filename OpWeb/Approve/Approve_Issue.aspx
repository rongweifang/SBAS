<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Approve_Issue.aspx.cs" Inherits="OpWeb.Approve.Approve_Issue" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>贷款发放</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/js/jquery.min.js?v=2.1.4" type="text/javascript"></script>
    <!-- 全局js -->
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
    <!-- jQuery Validation plugin javascript-->

    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script src="/js/plugins/layer/laydate/laydate.js"></script>
    <style>
        .IssueInfo {
            font-size: 14px;
            margin-top: 25px;
            padding-bottom: 40px;
        }
        .form-group {
            text-align:center;
        }
        .form-control {
            height:40px;
        }
        .IssueInfo ul {
            list-style: none;
        }
        .IssueInfo li {
            line-height: 35px;
            vertical-align:central;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="IssueInfo">
                <ul>
                    <li>贷款人：<span style="color: red; font-weight: bold"><%=Card_Name %></span></li>
                    <li>身份证号：<span style="color: red; font-weight: bold"><%=Card_ID %></span></li>
                    <li>贷款金额：<span style="color: red; font-weight: bold"><%=M_Loan %></span></li>
                    <li>贷款期数：<span style="color: red; font-weight: bold"><%=M_Loan_Months %></span></li>
                    <li>还款方式：<span style="color: red; font-weight: bold"><%=M_Replay_Type %></span></li>
                    <li><span style="height:30px;float:left; padding-top:8px;">贷款发放日期：</span><input id="Loan_StartDate" name="Loan_StartDate" class="form-control layer-date" placeholder="年-月-日" onclick="laydate({ istime: true, format: 'YYYY-MM-DD' })" runat="server" /></li>
                </ul>
            </div>
            <div class="form-group">
                <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">确　　定</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_Examine.aspx.cs" Inherits="OpWeb.Contract.Contract_Examine" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>审查报告</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <div style="height: 560px; overflow: scroll">
            <table border="0" cellpadding="0" cellspacing="0" class="frm">
                <%=sb.ToString() %>
            </table>
        </div>
        <div class="frmbottom">

            <asp:LinkButton ID="Save" runat="server" class="l-btn"
                OnClick="Save_Click"><span class="l-btn-left">
            <img src="/Themes/Images/disk.png" alt="" />保 存</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>

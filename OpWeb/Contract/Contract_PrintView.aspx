<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_PrintView.aspx.cs" Inherits="OpWeb.Contract.Contract_PrintView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同预览</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <!-- 全局js -->
    <script src="/JS/jquery.min.js?v=3.2.1" type="text/javascript"></script>
    <script src="/Themes/Scripts/jquery.PrintArea.js" type="text/javascript"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />

    <script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    
    <link href="/css/ContactTemp.css" rel="stylesheet" />
    <link href="/css/ContractPrint.css" media="print" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="PrintBody">
            <%=PageContent %>
        </div>
        <div style="clear: both"></div>
        <div class="form-group">
            <div class="col-sm-8 col-sm-offset-3">
                <button id="Btn_Print" type="button" class="btn btn-w-m btn-primary">打  印</button>&nbsp;
                <button id="Btn_Close" type="button" class="btn btn-w-m btn-warning">取  消</button>
            </div>
        </div>
    </form>
    <script type="text/javascript">
        $(function () {
            $("#Btn_Print").click(function () { $("#PrintBody").printArea(); });
            $("#Btn_Close").click(function () { OpenClose(); });
        });
    </script>
</body>
</html>

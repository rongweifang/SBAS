<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_Print.aspx.cs" Inherits="OpWeb.Contract.Contract_Print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同预览打印</title>
    <link href="/css/ContactTemp.css" rel="stylesheet" />
    <link href="/css/ContractPrint.css" media="print" rel="stylesheet" />
    <%=CssUrl %>
</head>
<body>
    <div id="ViewBody">
        <%=PageContent %>
    </div>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_PrintViewA3.aspx.cs" Inherits="OpWeb.Contract.Contract_PrintViewA3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同预览</title>
    
    <link href="/css/ContactTemp.css" rel="stylesheet" />
    <link href="/css/ContractPrint.css" media="print" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <div id="PrintBody">
            <%=PageContent %>
        </div>
    </form>
</body>
</html>

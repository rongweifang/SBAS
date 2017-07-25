<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_PrintView.aspx.cs" Inherits="OpWeb.Contract.Contract_PrintView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同预览</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/ContactTemp.css" rel="stylesheet" />
    <link href="/css/ContractPrint.css" media="print" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>

    <style>
        #ViewBody {
            width: 100%;
            height: 730px;
            overflow-y: scroll;
            overflow-x: hidden;
            padding-left: 18px;
            padding-right: 18px;
        }
    </style>
</head>
<body style="overflow: hidden;">
    <form id="form1" runat="server">
        <div id="ViewBody">
            <%=PageContent %>
        </div>
        <div style="height: 40px; text-align: center; width: 100%; padding-top: 15px">
            <asp:LinkButton ID="Btn_A4" runat="server" class="btn btn-w-m btn-primary" OnClick="Btn_A4_Click">预览A4</asp:LinkButton>&nbsp;
                 <asp:LinkButton ID="Btn_A3" runat="server" class="btn btn-w-m btn-primary" OnClick="Btn_A3_Click">预览A3</asp:LinkButton>&nbsp;
                 <asp:LinkButton ID="Btn_Create" runat="server" class="btn btn-w-m btn-warning" OnClick="Btn_Create_Click">生成合同</asp:LinkButton>
        </div>
    </form>

</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_SelectListForm.aspx.cs" Inherits="OpWeb.Contract.Contract_SelectListForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同选择项管理</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>

</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>合同类型：
                </th>
                <td>
                    <select id="ContractType" class="select" runat="server" style="width: 87%">
                    </select>
                </td>
            </tr>
            <tr>
                <th>标　　题：
                </th>
                <td>
                    <input id="SL_Desc" runat="server" type="text" class="txt" datacol="yes" err="应用标题"
                        checkexpession="NotNull" style="width: 85%" />
                </td>
            </tr>
            <tr>
                <th>排　　序：
                </th>
                <td>
                    <input id="SL_Order" runat="server" type="text" class="txt" datacol="yes" err="显示排序"
                        checkexpession="Num" style="width: 85%" />
                </td>
            </tr>
            <tr>
                <th>调用代码：
                </th>
                <td>
                    <input id="SL_Code" runat="server" type="text" class="txt" datacol="yes" err="调用代码"
                        checkexpession="NotNull" style="width: 85%" />
                </td>
            </tr>
            <tr>
                <th>备　　注：
                </th>
                <td>
                    <textarea id="SL_Memo" class="txtRemark" runat="server" style="width: 85.5%; height: 50px;"></textarea>
                </td>
            </tr>
        </table>
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

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_Finger_TempForm.aspx.cs" Inherits="OpWeb.Contract.Contract_Finger_TempForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>指纹应用设置表单</title>
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
                <th>应用合同：
                </th>
                <td>
                    <select id="ContractType" class="select" runat="server" style="width: 87%">
                    </select>
                </td>
            </tr>
            <tr>
                <th>应用名称：
                </th>
                <td>
                    <input id="FingerName" runat="server" type="text" class="txt" datacol="yes" err="应用名称"
                        checkexpession="NotNull" style="width: 85%" />
                </td>
            </tr>
            <tr>
                <th>指纹代码：
                </th>
                <td>
                    <input id="FingerCode" runat="server" type="text" class="txt" datacol="yes" err="指纹代码"
                        checkexpession="NotNull" style="width: 85%" />
                </td>
            </tr>
            <tr>
                <th>签名代码：
                </th>
                <td>
                    <input id="SignCode" runat="server" type="text" class="txt" datacol="yes" err="签名代码"
                        checkexpession="Num" style="width: 85%" />
                </td>
            </tr>
             <tr>
                <th>显示页码：
                </th>
                <td> <input id="CTPage" runat="server" type="text" class="txt" datacol="yes" err="显示页码"
                        checkexpession="Num" style="width: 85%" />
                   </td>
            </tr>
            <tr>
                <th>采 集 人：
                </th>
                <td>
                    <select id="ClassID" class="select" runat="server" style="width: 87%" name="UserType">
                    </select></td>
            </tr>
            <tr>
                <th>备　　注：
                </th>
                <td>
                    <textarea id="Memo" class="txtRemark" runat="server" style="width: 85.5%; height: 50px;"></textarea>
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

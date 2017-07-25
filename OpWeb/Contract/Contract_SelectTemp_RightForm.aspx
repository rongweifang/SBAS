<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_SelectTemp_RightForm.aspx.cs" Inherits="OpWeb.Contract.Contract_SelectTemp_RightForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>选择项管理</title>
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
                <th>选项ID：</th>
                <td>
                    <input id="SL_PageID" runat="server" type="text" class="txt" datacol="yes" err="应用标题"
                        checkexpession="NotNull" style="width: 85%" /></td>
            </tr>
            <tr>
                <th>选 择 项：
                </th>
                <td>
                    <input id="SL_SubTitle" runat="server" type="text" class="txt" datacol="yes" err="应用标题"
                        checkexpession="NotNull" style="width: 85%" />
                </td>
            </tr>
            <tr>
                <th>排　　序：
                </th>
                <td>
                    <input id="SL_Sub_Order" runat="server" type="text" class="txt" datacol="yes" err="显示排序"
                        checkexpession="Num" style="width: 85%" />
                </td>
            </tr>
            <tr>
                <th>宽　　度：
                </th>
                <td>
                    <input id="SL_Width" runat="server" type="text" class="txt" datacol="yes" err="显示宽度"
                        checkexpession="NotNull" style="width: 85%" value="auto"/>
                </td>
            </tr>
            <tr>
                <th>左 边 距：
                </th>
                <td>
                    <input id="SL_MarginLeft" runat="server" type="text" class="txt" datacol="yes" err="左边路"
                        checkexpession="NotNull" style="width: 85%" value="15px" />
                </td>
            </tr>
            <tr>
                <th>是否换行：
                </th>
                <td>
                    <label>
                        <input name="SL_IsBreak" type="radio" id="SL_IsBreak_0" value="1" checked="true" runat="server"/>
                        换行</label>
                    <label>
                        <input type="radio" name="SL_IsBreak" value="0" id="SL_IsBreak_1"  checked="false" runat="server"/>
                        不换行</label>
                </td>
            </tr>
            <tr>
                <th>默认选中：
                </th>
                <td>
                    <label>
                        <input name="SL_Checked" type="radio" id="SL_Checked_0" value="1" checked="true" runat="server"/>
                        默认选中</label>
                    <label>
                        <input type="radio" name="SL_Checked" value="0" id="SL_Checked_1" runat="server"/>
                        不选中</label>
                </td>
            </tr>
            <tr>
                <th>备　　注：
                </th>
                <td>
                    <textarea id="SL_Sub_Memo" class="txtRemark" runat="server" style="width: 85.5%; height: 50px;"></textarea>
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

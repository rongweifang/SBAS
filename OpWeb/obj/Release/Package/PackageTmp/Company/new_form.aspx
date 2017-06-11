<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="new_form.aspx.cs" Inherits="Manage.Company.new_form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>新闻信息表单</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/Themes/scripts/jwysiwyg/jquery.wysiwyg.css" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script type="text/javascript" src="/Themes/scripts/jwysiwyg/jquery.wysiwyg.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <style type="text/css">
        .auto-style1 {
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>新闻名称：
                </th>
                <td>
                    <input id="title" runat="server" type="text" class="txt" datacol="yes" err="新闻名称" checkexpession="NotNull" style="width: 85%" />
                </td>
            </tr>
            <tr>
                <th>新闻类型：
                </th>
                <td>
                    <select id="newsTypeID" name="newsTypeID" class="required validate-selection" runat="server">
                        <option value="1">公司公告</option>
                        <option value="2">招聘动态</option>
                        <option value="3">公司新闻</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>新闻发布时间：
                </th>
                <td>
                    <input type="text" id="pubdate" class="txt" runat="server" style="width: 115px;"
                        onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd' })" />&nbsp;&nbsp;&nbsp;
                </td>
            </tr>
            <tr>
                <th>是否发布：
                </th>
                <td>
                    <select id="istop" class="select" runat="server" style="width: 206px">
                        <option value="1">不发布</option>
                        <option value="0">发布</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>新闻内容：
                </th>
                <td>
                    <textarea id="content" class="txtRemark" runat="server" style="width: 535px; height: 410px;"></textarea>
                </td>
            </tr>

        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Save" runat="server" class="l-btn" OnClick="Save_Click"><span class="l-btn-left">
            <img src="/Themes/Images/disk.png" alt="" />保 存</span></asp:LinkButton>
            <a id="Close" class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span
                class="l-btn-left">
                <img src="/Themes/Images/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>


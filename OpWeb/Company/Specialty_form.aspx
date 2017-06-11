<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Specialty_form.aspx.cs" Inherits="OpWeb.Company.Specialty_form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>专业信息表单</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/Themes/scripts/jwysiwyg/jquery.wysiwyg.css" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
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
                <th>专业名称：
                </th>
                <td>
                    <input id="specName" runat="server" type="text" class="txt" datacol="yes" err="专业名称" checkexpession="NotNull" style="width: 85%" />
                </td>
            </tr>
             <tr>
                <th>需求人数：
                </th>
                <td>
                    <input id="acceptNum" runat="server" type="text" class="txt" datacol="yes" err="专业名称" checkexpession="NotNull" style="width:70px;" />
                </td>
            </tr>
            <tr>
                <th>所属公司：
                </th>
                <td>
                    <select id="CompanyID" name="CompanyID" class="required validate-selection" runat="server">
                       
                    </select> &nbsp;&nbsp;&nbsp;&nbsp;最低学历：<select id="EduBack" name="EduBack" class="required validate-selection" runat="server">
                       
                    </select>
                </td>
            </tr>
            <tr>
                <th>招聘开始时间：
                </th>
                <td>
                    <input type="text" id="BeginDate" class="txt" runat="server" style="width: 115px;"
                        onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd' })" value="2015-5-12" />&nbsp;&nbsp;&nbsp;招聘结束时间：<input type="text" id="endDate" class="txt" runat="server" style="width: 115px;"
                            onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd' })" value="2015-5-18"/>
                </td>
            </tr>
            <tr>
                <th>是否发布：
                </th>
                <td>
                    <select id="isLock" class="select" runat="server" style="width: 206px">
                        <option value="1">不发布</option>
                        <option value="0">发布</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>专业范围：
                </th>
                <td>
                    <textarea id="acceptLevel" class="txtRemark" runat="server" style="width: 535px; height: 420px;"></textarea>
                </td>
            </tr>
          
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Save" runat="server" class="l-btn"  OnClick="Save_Click"><span class="l-btn-left">
            <img src="/Themes/Images/disk.png" alt="" />保 存</span></asp:LinkButton>
            <a id="Close" class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span
                class="l-btn-left">
                <img src="/Themes/Images/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SpecialtyForm.aspx.cs" Inherits="Zhaopin.Manager.SpecialtyForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" />
    <link href="/themes/index/css/job.css" rel="stylesheet" />
    <script src="/scripts/prototype_for_validation.js" type="text/javascript"></script>
    <script src="/scripts/effects.js" type="text/javascript"></script>
    <script src="/scripts/validation_cn.js" type="text/javascript"></script>
    <script src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script src="/scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
    <script type="text/javascript" src="/scripts/jquery.form.js"></script>
    <script src="/scripts/jquery.blockUI.js" type="text/javascript"></script>
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <link href="/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/Scripts/ShowMsg/msgbox.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/ShowMsg/msgbox.js" type="text/javascript"></script>
    <script src="/Scripts/FunctionJS.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
      <table width="100%" border="0">
        <tr>
          <td width="24%"><strong>专业名称</strong></td>
          <td width="76%"><label for="specName"></label>
          <input name="specName" type="text" id="specName" size="50" runat="server"/></td>
        </tr>
        <tr>
          <td><strong>需求人数</strong></td>
          <td><label for="acceptNum"></label>
          <input type="text" name="acceptNum" id="acceptNum" runat="server"/></td>
        </tr>
        <tr>
          <td><strong>所属公司</strong></td>
          <td><label for="CompanyID"></label>
            <select name="CompanyID" id="CompanyID" runat="server">
          </select></td>
        </tr>
        <tr>
          <td><strong>是否取消</strong></td>
          <td>&nbsp;</td>
        </tr>
        <tr>
          <td><strong>专业范围</strong></td>
          <td><label for="acceptLevel"></label>
          <textarea name="acceptLevel" cols="60" rows="7" id="acceptLevel" runat="server"/></textarea></td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>
              <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="保存" />
            </td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </table>
    
    </div>
    </form>
</body>
</html>

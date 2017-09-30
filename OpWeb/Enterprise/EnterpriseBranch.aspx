<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseBranch.aspx.cs" Inherits="OpWeb.Enterprise.EnterpriseBranch" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>分支机构</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/js/jquery.min.js?v=2.1.4" type="text/javascript"></script>
    <!-- 全局js -->
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
    <!-- jQuery Validation plugin javascript-->
    <script src="/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/plugins/validate/messages_zh.min.js"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>

</head>
<body>
    <form id="signupForm" runat="server">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>分支机构</h5>
            </div>
            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td>
                                <label class="control-label">机构名称：</label></td>
                            <td colspan="3">
                                <input id="AccountType" name="AccountType" class="form-control" type="text" runat="server" />                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">母公司出资额：</label></td>
                            <td>
                                <input id="AccountBalance" name="AccountBalance" class="form-control" type="text" runat="server" /></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">分公司出资：</label></td>
                            <td>
                                <input id="OtherLoan" name="OtherLoan" class="form-control" type="text" runat="server" /></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">保  存</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                </div>
            </div>

        </div>

    </form>
</body>
</html>

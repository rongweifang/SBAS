<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseAccount.aspx.cs" Inherits="OpWeb.Enterprise.EnterpriseAccount" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>开户信息</title>
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
                <h5>企业开户信息</h5>
            </div>
            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td>
                                <label class="control-label">在信用社开户种类：</label></td>
                            <td>
                                 <select class="form-control" id="AccountType" name="AccountType" runat="server">
                                            <option selected>一般账户</option>
                                            <option>基本户</option>
                                            <option>专用账户</option>
                                        </select>

                            </td>
                            <td>
                                <label class="control-label">账户号码：</label></td>
                            <td>
                                <input id="AccountNO" name="AccountNO" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">已在信用社贷款金额：</label></td>
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
                                <label class="control-label">其它机构贷款金额：</label></td>
                            <td>
                                <input id="OtherLoan" name="OtherLoan" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">贷款卡编码：</label></td>
                            <td>
                                <input id="OtherNO" name="OtherNO" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td>
                                <label class="control-label">责任信贷员<br/>（客户经理）：</label></td>
                            <td>
                                <input id="E_Manager" name="E_Manager" class="form-control" type="text" runat="server" /></td>
                            <td>
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
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

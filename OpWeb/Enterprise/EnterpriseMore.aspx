<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseMore.aspx.cs" Inherits="OpWeb.Enterprise.EnterpriseMore" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>法定代表人信息</title>
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
            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td>
                                <label class="control-label">年度信用等级：</label></td>
                            <td>
                                <input id="E_Rating" name="E_Rating" class="form-control" type="text" runat="server" /></td>
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
                                <label class="control-label">贷款是否需要董事会决议 ：</label></td>
                            <td>
                                <input id="E_Decision" name="E_Decision" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">决议人数：</label></td>
                            <td>
                                <input id="E_DecisionS" name="E_DecisionS" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">主 营 业 务：</label></td>
                            <td>
                                <input id="E_business" name="E_business" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">生产经营许可证号：</label></td>
                            <td>
                                <input id="E_Certificate" name="E_Certificate" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">最大出资人：</label></td>
                            <td>
                                <input id="E_Sponsor" name="E_Sponsor" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">出资金额：</label></td>
                            <td>
                                <div class="input-group">
                                    <input id="E_Contributive" name="E_Contributive" class="form-control" type="text" runat="server" />
                                    <span class="input-group-addon">万</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">贷款卡编号 ：</label></td>
                            <td>
                                <input id="E_LoanCard" name="E_LoanCard" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">年检时间：</label></td>
                            <td>
                                <input id="E_ASDate" name="E_ASDate" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td></td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">企业历史沿革 ：</label></td>
                            <td colspan="3">
                                <input id="E_Evolution" name="E_Evolution" class="form-control" type="text" runat="server" /></td>
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

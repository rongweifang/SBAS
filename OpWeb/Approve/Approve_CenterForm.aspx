<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Approve_CenterForm.aspx.cs" Inherits="OpWeb.Approve.Approve_CenterForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>我的审批</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
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
<body class="gray-bg">
    <form class="form-horizontal m-t" id="signupForm" runat="server">
        <div class="ibox float-e-margins">

            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td width="120">
                                <label class="control-label">姓　　名：</label></td>
                            <td width="250"></td>
                            <td width="120">
                                <label class="control-label">身份证号：</label>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 15px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">贷款金额：</label></td>
                            <td></td>
                            <td>
                                <label class="control-label">贷款期数：</label></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 15px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">我的意见：</label></td>
                            <td colspan="3">
                                <input id="Operat" name="Operat" class="form-control" type="text" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px;">
                                <asp:RadioButton ID="RB1" runat="server" Text="同意" GroupName="ApproveSelect" Checked="True" />&nbsp;&nbsp;
                                <asp:RadioButton ID="RB2" runat="server" Text="不同意" GroupName="ApproveSelect" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-3">
                        <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">提交审批</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                    </div>
                </div>
            </div>
        </div>

    </form>

    <script>
        $.validator.setDefaults({
            highlight: function (element) {
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            success: function (element) {
                element.closest('.form-group').removeClass('has-error').addClass('has-success');
            },
            errorElement: "span",
            errorPlacement: function (error, element) {
                if (element.is(":radio") || element.is(":checkbox")) {
                    error.appendTo(element.parent().parent().parent());
                } else {
                    error.appendTo(element.parent());
                }
            },
            errorClass: "help-block m-b-none",
            validClass: "help-block m-b-none"
        });


    </script>

</body>
</html>

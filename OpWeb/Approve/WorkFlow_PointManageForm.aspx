<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_PointManageForm.aspx.cs" Inherits="OpWeb.Approve.WorkFlow_PointManageForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>审批节点管理</title>
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
<body class="gray-bg">
    <form class="form-horizontal m-t" id="signupForm" runat="server">
        <div class="ibox float-e-margins">

            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td width="100" height="42">
                                <label class="control-label">节点名称：</label></td>
                            <td width="240">
                                <input id="ActName" name="ActName" class="form-control" type="text" runat="server" />
                            </td>
                            <td width="100">
                                <label class="control-label">排　　序：</label></td>
                            <td width="120">
                                <input id="Step" name="Step" class="form-control valid" type="text" aria-required="true" aria-invalid="false" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">角色权限：</label></td>
                            <td colspan="3">
                                <select class="form-control" id="RoleId" name="RoleId" runat="server">
                                </select>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4" align="center">
                                <div class="form-group">
                                    <div class="col-sm-8 col-sm-offset-3">
                                        <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">确  定</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                                    </div>
                                </div>
                            </td>
                        </tr>
                    </tbody>
                </table>

            </div>
        </div>

    </form>
</body>
</html>

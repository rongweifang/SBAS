<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ModifyCustomType.aspx.cs" Inherits="OpWeb.RMBase.SysBase.ModifyCustomType" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户类型</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/JS/jquery.min.js" type="text/javascript"></script>
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
                            <td width="100">
                                <label class="control-label">名　　称：</label></td>
                            <td width="140">
                                <input id="type_Name" name="type_Name" maxlength="50" class="form-control" type="text" runat="server" />
                            </td>
                            <td width="100">
                                <label class="control-label">编号：</label></td>
                            <td width="220">
                                <input id="type_ID" name="type_ID" maxlength="20" class="form-control valid" type="text" aria-required="true" aria-invalid="false" runat="server" />
                            </td>
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
                    <div class="col-sm-8 col-sm-offset-3" style="text-align:center">
                        <asp:LinkButton ID="Save" runat="server" OnClientClick="return checkData();" class="btn btn-w-m btn-primary" OnClick="Save_Click">保  存</asp:LinkButton>&nbsp;
                          <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                        <label id="lab_msg" runat="server" style="color:red;"></label>
                    </div>
                </div>
            </div>
        </div>

    </form>


    <script type="text/javascript">
        function checkData() {
            var name = $("#type_Name").val();
            var cardId = $("#type_ID").val();
            if ($.trim(name) == "") {
                alert("类型名称不能为空");
                return false;
            }
            if ($.trim(cardId) == "") {
                alert("类型编号不能为空");
                return false;
            }
            return true;
        }
    </script>

</body>
</html>

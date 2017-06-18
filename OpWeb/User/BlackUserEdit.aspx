<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="BlackUserEdit.aspx.cs" Inherits="OpWeb.User.BlackUserEdit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户基本信息</title>
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
                                <label class="control-label">姓　　名：</label></td>
                            <td width="140">
                                <input id="Card_Name" name="Card_Name" maxlength="50" class="form-control" type="text" runat="server" />
                            </td>
                            <td width="100">
                                <label class="control-label">身份证号：</label></td>
                            <td width="220">
                                <input id="Card_ID" name="Card_ID" maxlength="20" class="form-control valid" type="text" aria-required="true" aria-invalid="false" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td><span class="help-block m-b-none"><i class="fa fa-info-circle"></i>身份证号不能为空</span></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">电&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 话：</label></td>
                            <td>
                                <input id="Card_Tel" name="Card_Tel" maxlength="20" class="form-control" type="text" runat="server" />

                            </td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">备&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 注：</label></td>
                            <td colspan="3">
                                <textarea id="Memo" name="Memo" maxlength="300" runat="server" class="form-control" rows="5"></textarea>
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
                        <asp:LinkButton ID="Save" runat="server" OnClientClick="return checkData();" class="btn btn-w-m btn-primary"  OnClick="Save_Click">保  存</asp:LinkButton>&nbsp;
                          <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                        <label id="lab_msg" runat="server" style="color:red;"></label>
                    </div>
                </div>
            </div>
        </div>

    </form>


    <script type="text/javascript">
        function checkData() {
            var name = $("#Card_Name").val();
            var cardId = $("#Card_ID").val();
            if ($.trim(name) == "") {
                alert("用户名不能为空");
                return false;
            }
            var reg = /(^\d{15}$)|(^\d{18}$)|(^\d{17}(\d|X|x)$)/;
            if (!reg.test(cardId)) {
                alert("身份证输入不合法");
                return false;
            }
            return true;
        }
    </script>

</body>
</html>

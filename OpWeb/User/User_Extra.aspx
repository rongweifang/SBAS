<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Extra.aspx.cs" Inherits="OpWeb.User.User_Extra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户基本信息2/3</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</head>
<body class="gray-bg">
    <form class="form-horizontal m-t" id="signupForm" runat="server">
        <div class="ibox float-e-margins">

            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td width="120">
                                <label class="control-label">婚烟状况：</label></td>
                            <td width="250">

                                <select class="form-control m-b" id="U_Marry" name="U_Marry" runat="server">
                                    <option>已婚</option>
                                    <option>未婚</option>
                                    <option>离婚</option>
                                    <option>丧偶</option>

                                </select>

                            </td>
                            <td width="120">
                                <label class="control-label">学　　历：</label></td>
                            <td>
                                <select class="form-control m-b" id="U_Education" name="U_Education" runat="server">
                                    <option>小学</option>
                                    <option>初中</option>
                                    <option>高中</option>
                                    <option>大专</option>
                                    <option>硕士研究生</option>
                                    <option>博士研究生</option>
                                    <option>本科</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">工作单位：</label></td>
                            <td>
                                <input id="U_Company" name="U_Company" class="form-control" type="text" runat="server" />

                            </td>
                            <td>
                                <label class="control-label">行政职务：</label></td>
                            <td>
                                <input id="U_Duties" name="U_Duties" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">单位地址：</label></td>
                            <td colspan="3">
                                <input id="U_CompanyAddress" name="U_CompanyAddress" class="form-control" type="text" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style1"></td>
                            <td colspan="3" class="auto-style1"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">单位电话：</label></td>
                            <td>
                                <input id="U_CompanyTel" name="U_CompanyTel" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">单位邮编：</label></td>
                            <td>
                                <input id="U_CompanyZip" name="U_CompanyZip" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">月收入金额：</label></td>
                            <td>
                                <input id="U_Income" name="U_Income" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">个人公积金帐号：</label></td>
                            <td>
                                <input id="U_Accumulation" name="U_Accumulation" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">现居住面积：</label></td>
                            <td>
                                <input id="U_Area" name="U_Area" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">产权情况：</label></td>
                            <td>
                                <input id="U_PropertyRight" name="U_PropertyRight" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">父母住址:</label></td>
                            <td colspan="3">
                                <input id="U_ParentAddress" name="U_ParentAddress" class="form-control" type="text" runat="server" /></td>
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
                        <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">完　成</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                    </div>
                </div>
            </div>
        </div>

    </form>
    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
    <!-- jQuery Validation plugin javascript-->
    <script src="/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/plugins/validate/messages_zh.min.js"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
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

        $().ready(function () {
            // validate the comment form when it is submitted
            $("#commentForm").validate();

            // validate signup form on keyup and submit
            var icon = "<i class='fa fa-times-circle'></i> ";
            $("#signupForm").validate({
                rules: {
                    Card_ID: "required"
                },
                messages: {
                    Card_ID: icon + "身份证号不能为空"
                }
            });
        });
    </script>

</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Symbiosis.aspx.cs" Inherits="OpWeb.User.User_Symbiosis" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>共同居住人</title>
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
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</head>
<body class="gray-bg">
    <form class="form-horizontal m-t" id="signupForm" runat="server">
        <div class="ibox float-e-margins">


            <div class="alert alert-info">
                <table width="100%" border="0" style="text-align: center; background: #FFF; padding: 5px;">
                    <tbody>
                        <tr style="height: 4px;">
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">姓　　名：</label></td>
                            <td>
                                <input id="UL_Name" name="UL_Name" class="form-control" type="text" runat="server" />

                            </td>
                            <td>
                                <label class="control-label">年　　龄：</label></td>
                            <td>
                                <input id="UL_Age" name="UL_Age" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">性　　别：</label></td>
                            <td>
                                <select class="form-control m-b" name="UL_Sex" id="UL_Sex" runat="server">
                                    <option selected></option>
                                    <option>男</option>
                                    <option>女</option>
                                </select></td>
                        </tr>

                        <tr style="height: 4px;">
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">与申请人关系：</label></td>
                            <td>
                                <input id="UL_Releation" name="UL_Releation" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">月收入金额：</label></td>
                            <td>
                                <input id="UL_Income" name="UL_Income" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">月收入来源：</label></td>
                            <td>
                                <input id="UL_Earn" name="UL_Earn" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr style="height: 4px;">
                            <td colspan="6"></td>
                        </tr>
                    </tbody>
                </table>

            </div>

            <div class="alert alert-info">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center; background: #FFF">
                    <tbody>
                        <tr style="height: 4px;">
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">姓　　名：</label></td>
                            <td>
                                <input id="UL_Name1" name="UL_Name1" class="form-control" type="text" runat="server" />

                            </td>
                            <td>
                                <label class="control-label">年　　龄：</label></td>
                            <td>
                                <input id="UL_Age1" name="UL_Age1" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">性　　别：</label></td>
                            <td>
                                <select class="form-control m-b" name="UL_Sex1" id="UL_Sex1" runat="server">
                                    <option selected></option>
                                    <option>男</option>
                                    <option>女</option>
                                </select></td>
                        </tr>
                        <tr style="height: 4px;">
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">与申请人关系：</label></td>
                            <td>
                                <input id="UL_Releation1" name="UL_Releation1" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">月收入金额：</label></td>
                            <td>
                                <input id="UL_Income1" name="UL_Income1" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">月收入来源：</label></td>
                            <td>
                                <input id="UL_Earn1" name="UL_Earn1" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr style="height: 4px;">
                            <td colspan="6"></td>
                        </tr>
                    </tbody>
                </table>

            </div>

            <div class="alert alert-info">

                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center; background: #FFF">
                    <tbody>
                        <tr style="height: 4px;">
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">姓　　名：</label></td>
                            <td>
                                <input id="UL_Name2" name="UL_Name2" class="form-control" type="text" runat="server" />

                            </td>
                            <td>
                                <label class="control-label">年　　龄：</label></td>
                            <td>
                                <input id="UL_Age2" name="UL_Age2" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">性　　别：</label></td>
                            <td>
                                <select class="form-control m-b" name="UL_Sex2" id="UL_Sex2" runat="server">
                                    <option selected></option>
                                    <option>男</option>
                                    <option>女</option>
                                </select></td>
                        </tr>
                        <tr style="height: 4px;">
                            <td colspan="6"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">与申请人关系：</label></td>
                            <td>
                                <input id="UL_Releation2" name="UL_Releation2" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">月收入金额：</label></td>
                            <td>
                                <input id="UL_Income2" name="UL_Income2" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">月收入来源：</label></td>
                            <td>
                                <input id="UL_Earn2" name="UL_Earn2" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr style="height: 4px;">
                            <td colspan="6"></td>
                        </tr>
                    </tbody>
                </table>
            </div>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">完　成</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
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

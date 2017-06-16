<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_MortgageForm.aspx.cs" Inherits="OpWeb.Contract.Contract_MortgageForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
                            <td>
                                <label class="control-label">购房地址：</label></td>
                            <td >
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                </asp:DropDownList>
                            </td>
                            <td ><label class="control-label">楼　　层：</label></td>
                            <td><input id="U_Company4" name="U_Company4" class="form-control" type="text" runat="server" /></td>
                            <td><label class="control-label">合同号：</label></td>
                            <td><input id="U_Duties2" name="U_Duties2" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">用　　途：</label></td>
                            <td>
                                <input id="U_Company" name="U_Company" class="form-control" type="text" runat="server" />

                            </td>
                            <td>
                                <label class="control-label">房屋形式：</label></td>
                            <td><input id="U_Company2" name="U_Company2" class="form-control" type="text" runat="server" /></td>
                            <td><label class="control-label">房屋类型：</label></td>
                            <td>
                                <input id="U_Duties" name="U_Duties" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">建筑面积：</label></td>
                            <td><input id="U_Company3" name="U_Company3" class="form-control" type="text" runat="server" /></td>
                            <td> <label class="control-label">单位售价：</label></td>
                            <td>&nbsp;</td>
                            <td> <label class="control-label">住房总金额：</label></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">已付购房款：</label></td>
                            <td>
                                <input id="U_CompanyTel" name="U_CompanyTel" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">借款金额：</label></td>
                            <td>&nbsp;</td>
                            <td><label class="control-label">贷款占总价比例：</label></td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                          <td><label class="control-label">贷款利率：</label></td>
                          <td>&nbsp;</td>
                          <td><label class="control-label">利率上浮：</label></td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">分期数：</label></td>
                            <td>
                                <input id="U_Income" name="U_Income" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">开始日期：：</label></td>
                            <td>&nbsp;</td>
                            <td><label class="control-label">结束日期：</label></td>
                            <td>&nbsp;</td>
                        </tr>
                       <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                          <td> <label class="control-label">还款方式：</label></td>
                          <td><input id="U_Area4" name="U_Area4" class="form-control" type="text" runat="server" /></td>
                          <td> <label class="control-label">还款账号：</label></td>
                          <td><input id="U_Area3" name="U_Area3" class="form-control" type="text" runat="server" /></td>
                          <td> <label class="control-label">开户行：</label></td>
                          <td><input id="U_Area5" name="U_Area5" class="form-control" type="text" runat="server" /></td>
                        </tr>
                      <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">抵押物类型：</label></td>
                            <td>
                                <input id="U_Area" name="U_Area" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">土地性质：</label></td>
                            <td>&nbsp;</td>
                            <td><label class="control-label">房屋结构：</label></td>
                            <td>
                                <input id="U_PropertyRight" name="U_PropertyRight" class="form-control" type="text" runat="server" /></td>
                        </tr>
                       <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                       
                        <tr>
                            <td>
                                <label class="control-label">抵押物价值:</label></td>
                            <td>&nbsp;</td>
                            <td><label class="control-label">产权证号：</label></td>
                            <td><input id="U_Area2" name="U_Area2" class="form-control" type="text" runat="server" /></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                         <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                         <tr>
                           <td><label class="control-label">合同份数：</label></td>
                           <td>&nbsp;</td>
                           <td><label class="control-label">持有人：</label></td>
                           <td>&nbsp;</td>
                           <td><label class="control-label">合同签署日期：</label></td>
                           <td>&nbsp;</td>
                         </tr>
                          <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                           <td><label class="control-label">合同签署地点：</label></td>
                           <td>&nbsp;</td>
                           <td>&nbsp;</td>
                           <td>&nbsp;</td>
                           <td>&nbsp;</td>
                           <td>&nbsp;</td>
                      </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                          <td><label class="control-label">家庭月收入</label></td>
                          <td>&nbsp;</td>
                          <td><label class="control-label">每月拟还款</label></td>
                          <td>&nbsp;</td>
                          <td><label class="control-label">占家庭月收入比例</label></td>
                          <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 25px;"></td>
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

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

    <script language="javascript" type="text/javascript">
        var obj;
        penwidth = 3;
        width = 420;
        height = 180;
        linespace = 55;
        lineNum = height / linespace;

        function PenInit() {
            obj = document.getElementById("HWPenSign");
            obj.HWSetBkColor(0xE0F8E0);
            obj.HWSetCtlFrame(2, 0x000000);
            obj.HWSetSeparatorLine(lineNum, 0x000000);
            obj.HWInitialize();
        }

        function SignConfirm() {
            var stream;
            stream = obj.HWGetBase64Stream(3);
            if (stream == "") {
                layer.msg('请签名！！');
                return false;
            }
            else {
                $('#SignBase').val(stream);
                return true;
            }
            
            //if (isIE()) {

            //    FReg.SignBase.value = stream;
            //}
            //else {
            //    document.getElementById('SignBase').value = stream;
            //}
        }
        function loads() {
            
            PenInit();
        }
        function unloads() {
            obj.HWFinalize();
        }

    </script>
</head>
<body class="gray-bg" onload="loads()" onunload="unloads()">

    <div class="ibox float-e-margins">

        <div class="ibox-content">
            <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                <tbody>
                    <tr>
                        <td width="120">
                            <label class="control-label">姓　　名：</label></td>
                        <td width="250">
                            <asp:Label ID="LB_Name" runat="server" Text=""></asp:Label>
                        </td>
                        <td width="120">
                            <label class="control-label">身份证号：</label>
                        </td>
                        <td>
                            <asp:Label ID="LB_Card" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 15px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">贷款金额：</label></td>
                        <td>
                            <asp:Label ID="LB_Loan" runat="server" Text=""></asp:Label>
                        </td>
                        <td>
                            <label class="control-label">贷款期数：</label></td>
                        <td>
                            <asp:Label ID="LB_Months" runat="server" Text=""></asp:Label>
                        </td>
                    </tr>


                    <tr>
                        <td colspan="4" style="height: 5px;">&nbsp;
                        </td>
                    </tr>
                    <tr>

                        <td colspan="4">
                            <div class="panel panel-info">
                                <div class="panel-heading">
                                    <i class="fa fa-info-circle"></i>签名区域
                                </div>
                                <div class="panel-body">
                                    <div style="width: 100%; height: 180px; text-align: center;">
                                        <object id="HWPenSign" name="HWPenSign" classid="clsid:E8F5278C-0C72-4561-8F7E-CCBC3E48C2E3" width="420" height="180"></object>
                                    </div>

                                </div>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 15px;"></td>
                    </tr>
                    <form class="form-horizontal m-t" id="signupForm" runat="server">
                        <tr>
                            <td>
                                <label class="control-label">我的意见：</label></td>
                            <td colspan="3">
                                <input id="Operat" name="Operat" class="form-control" style="height: 55px;" type="text" runat="server" />
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
                                <asp:RadioButton ID="RB1" runat="server" Text="审核通过" GroupName="ApproveSelect" Checked="True" />&nbsp;&nbsp;
                                <asp:RadioButton ID="RB2" runat="server" Text="审核不通过" GroupName="ApproveSelect" />
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4">
                                <div class="form-group">
                                    <div class="col-sm-8 col-sm-offset-3">
                                        <input type="hidden" id="SignBase" runat="server" />
                                        <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click" OnClientClick="return SignConfirm();">提交审批</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="obj.HWClearPenSign()">清除签名</button>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                                    </div>
                                </div>

                            </td>

                        </tr>
                    </form>
                </tbody>
            </table>

        </div>
    </div>



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

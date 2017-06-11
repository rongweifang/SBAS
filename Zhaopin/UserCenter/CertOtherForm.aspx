<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CertOtherForm.aspx.cs" Inherits="Zhaopin.UserCenter.CertOtherForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心 - 简历登记 - 语言能力、计算机能力及其他</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" />
    <link href="/themes/index/css/job.css" rel="stylesheet" />

    <script src="/scripts/prototype_for_validation.js" type="text/javascript"></script>
    <script src="/scripts/effects.js" type="text/javascript"></script>
    <script src="/scripts/validation_cn.js" type="text/javascript"></script>
    <script src="/scripts/jquery.js" type="text/javascript"></script>
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <script src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script src="/scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
    <script type="text/javascript" src="/scripts/jquery.form.js"></script>
    <script src="/scripts/jquery.blockUI.js" type="text/javascript"></script>
    <link href="/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/Scripts/ShowMsg/msgbox.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/ShowMsg/msgbox.js" type="text/javascript"></script>
    <script src="/Scripts/FunctionJS.js" type="text/javascript"></script>
    <style type="text/css">
        <!--
        /* 外语能力 */
        .form01 {
            width: 350px;
            height: 50px;
            float: left;
        }

        .form02 {
            width: 130px;
            text-align: right;
            height: 50px;
            float: left;
        }

        .form03 {
            width: 170px;
            float: left;
        }

        .form04 {
            width: 600px;
            height: 50px;
            float: left;
        }

        .form05 {
            width: 440px;
            float: left;
        }

        .form06 {
            width: 640px;
            height: 50px;
            float: left;
        }

        .form07 {
            width: 600px;
            height: 50px;
            float: left;
        }

        .form08 {
            width: 600px;
            height: 80px;
            float: left;
        }

        .form03two {
            float: left;
        }

        .form09 {
            width: 170px;
            float: left;
        }

        .form10 {
            width: 600px;
            height: 88px;
            float: left;
        }

        .form11 {
            width: 130px;
            text-align: right;
            height: 40px;
            float: left;
        }

        .form13 {
            width: 170px;
            float: left;
            height: 50px;
        }

        table {
            width: 738px;
        }
        -->
    </style>
    <script>
        $(document).ready(function () {
            $("#GetDate").datepicker({ dateFormat: 'yy-mm-dd' });
        });

        function chkAwardCerSubmit() {
            var Compform = new Validation("Compform");

            if (!Compform.validate()) {
                return false;
            }
        }
    </script>


</head>
<body>
    <form id="Compform" name="Compform" runat="server">
        <div class="line" id="awardCerAddId">
            <div class="columnbj">
                <div class="Form_left">
                    <ul class="gray30">
                        <li>
                            <div class="form01">
                                <div class="form02">证书名称：</div>
                                <div class="form03">
                                    <input id="CertName" name="CertName" type="text" class="required validate-specialchar input" value="" maxlength="20" runat="server" /><div style="display: none;">提示信息</div>
                                </div>
                                <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                            </div>
                        </li>

                        <li>
                            <div class="form01">
                                <div class="form02">证书获得时间：</div>
                                <div class="form03">
                                    <input id="GetDate" name="GetDate" type="text" value="" class="required input" readonly="true" runat="server" />
                                </div>
                                <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                            </div>
                        </li>
                        <li>
                            <div class="form01">
                                <div class="form02">发证单位：</div>
                                <div class="form13">
                                    <div>
                                        <input id="CertBody" name="CertBody" type="text" class="required validate-specialchar input" value="" maxlength="20" runat="server" />
                                    </div>
                                    <div class="gray02">发证单位名称在20个汉字以内</div>
                                </div>
                                <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                            </div>
                        </li>
                        <li>
                            <div class="form06">
                                <div class="form02">级别：</div>
                                <div class="form03">
                                    <div>
                                        <input id="CertLevel" name="CertLevel" type="text" class="validate-specialchar input" value="" maxlength="20" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form01">
                                <div class="form02">成绩：</div>
                                <div class="form03">
                                    <input id="Grades" name="Grades" type="text" class="float-range-0-1000 input" value="" maxlength="5" runat="server" />
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form01">
                                <div class="form02">证书编号：</div>
                                <div class="form03">
                                    <input id="CertNO" name="CertNO" type="text" class="validate-alphanum input" value="" maxlength="20" runat="server" />
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form04">
                                <div class="form02">上传证书：</div>
                                <div class="form05">
                                    <div style="width: 320px; overflow: hidden;">
                                        <div style="width: 269px; float: left;">
                                            <asp:FileUpload ID="FileUpload1" class="validate-file-pdf-jpg-jpeg input2" runat="server" />
                                        </div>
                                        <div style="float: left;"></div>
                                    </div>
                                    <div style="overflow: hidden;" class="gray02">文件类型为[pdf,jpg,jpeg]其中之一,大小在1024K之内</div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form10">
                                <div class="form02">备注：</div>
                                <div class="form05">
                                    <div>
                                        <textarea id="Memo" name="Memo" class="max-length-50 validate-specialchartextarea input3" value="" maxlength="50" runat="server"></textarea>
                                    </div>
                                    <div class="gray02">50个汉字以内</div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form07">
                                <div class="form02">&nbsp;&nbsp;</div>
                                <div class="form05">
                                    <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btnsubmit" OnClientClick="chkAwardCerSubmit();" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>

            </div>
        </div>
    </form>


</body>
</html>

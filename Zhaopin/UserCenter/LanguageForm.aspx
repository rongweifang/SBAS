<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LanguageForm.aspx.cs" Inherits="Zhaopin.UserCenter.LanguageForm" %>

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

</head>
<body>
    <form id="languageform" name="languageform" runat="server">
        <div class="line" id="languageAddId">
            <div class="columnbj">
                <div class="Form_left">
                    <ul class="gray30">
                        <li>
                            <div class="form06">
                                <div class="form02">语种名称：</div>
                                <div class="form03two">
                                    <div style="padding-top: 4px;">
                                        <select id="LanguageName" name="LanguageName" class="required validate-selection" onchange="changeLanguageLevle();" runat="server">
                                        </select>
                                    </div>
                                </div>
                                <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                            </div>
                        </li>
                        <li id="LanguageLevelEN">
                            <div class="form06">
                                <div class="form02">外语水平级别：</div>
                                <div class="form03two">
                                    <div style="padding-top: 4px;">
                                        <select id="LanguageLevel" name="LanguageLevel" onchange="noRange(this.value);" class="required validate-selection" runat="server">
                                        </select>&nbsp;
                                    </div>
                                </div>
                                <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                                <div class="gray02">外语水平级别为大学英语四级、大学英语六级、英语专业四级及英语专业八级时，成绩及其证书编号必须填写</div>
                            </div>
                        </li>
                        <li id="frmGetDate" style="display:block">
                            <div class="form01">
                                <div class="form02">证书获得时间：</div>
                                <div class="form03">
                                    <div>
                                        <input id="GetDate" name="GetDate" type="text" value="" class="required input" readonly="true" runat="server" />
                                    </div>
                                    <div class="gray02">
                                        <!-- img src="/themes/default/images/me_icon_03.png" style="padding-top:5px;" -->
                                    </div>
                                </div>
                                <div id="GetDate_required" style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                            </div>
                        </li>
                        <li id="frmCertbody" style="display:block">
                            <div class="form01" style="overflow: hidden;">
                                <div class="form02">认证机构：</div>
                                <div class="form03">
                                    <div>
                                        <input id="Certbody" name="Certbody" type="text" class="required validate-specialchar input" value="" maxlength="20" runat="server" />
                                    </div>
                                    <div class="gray02">认证机构名称在20个汉字以内</div>
                                </div>
                                <div id="Certbody_required" style="float: left; color: red">&nbsp;&nbsp;*</div>
                            </div>
                        </li>
                        <li id="frmCertResults" style="display:block">
                            <div class="form01">
                                <div class="form02">成绩：</div>
                                <div class="form03">
                                    <div>
                                        <input id="CertResults" name="CertResults" type="text" class="required validate-specialchar input" value="" maxlength="5" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li id="frmCertNO" style="display:block">
                            <div class="form01">
                                <div class="form02">证书编号：</div>
                                <div class="form03">
                                    <div>
                                        <input id="CertNO" name="CertNO" type="text" class="validate-specialchar input" value="" maxlength="20" runat="server" />
                                    </div>
                                    <div class="gray02">
                                        <!-- img src="/themes/default/images/me_icon_02.png" style="padding-top:5px;"-->
                                    </div>
                                </div>
                                <!--    <div style="color:red;width:20px;float:left;">&nbsp;&nbsp;*</div>-->
                            </div>
                        </li>
                        <li id="frmFile" style="display:block">
                            <div class="form04">
                                <div class="form02">上传证书或成绩单：</div>
                                <div class="form05">
                                    <div style="width: 320px; overflow: hidden;">
                                        <div style="width: 269px; float: left;">
                                            <asp:FileUpload ID="FileUpload1" class="validate-file-pdf-jpeg-jpg input2" runat="server" />
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
                                    <div style="overflow: hidden;" class="gray02">50个汉字以内</div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form07">
                                <div class="form02">&nbsp;&nbsp;</div>
                                <div class="form05">
                                    <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btnsubmit" OnClientClick="return chkLanguageSubmit();" OnClick="Button1_Click" />
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
    <script>
        $(document).ready(function () {
            $("#GetDate").datepicker({ dateFormat: 'yy-mm-dd' });

        });
        var languageform = new Validation("languageform");
        function chkLanguageSubmit() {
            if (($("#LanguageLevel").val() == '11' || $("#LanguageLevel").val() == '12' || $("#LanguageLevel").val() == '21' ||
                $("#LanguageLevel").val() == '22') && ($("#CertResults").val() == "" || $("#CertNO").val() == "")) {
                if ($("#CertResults").val() == "") { $.alert("请输入成绩"); return false; }
                else if ($("#CertNO").val() == "") { $.alert("请输入证书编号"); return false; }
            }
            if (!languageform.validate()) {
                return false;
            }
        }

        function changeLanguageLevle() {
            var LanguageName = $('#LanguageName').val();
            if (LanguageName == '1') {
                document.getElementById("LanguageLevelEN").style.display = "inline";
            } else {
                $('#LanguageLevel').val("");
                document.getElementById("LanguageLevelEN").style.display = "none";
            }
        }

        //外语水平级别为“其他”或“未获得外语等级”时，证书获得时间、认证机构为非必填
        function noRange(rangeValue) {
            if (rangeValue == "90" || rangeValue == "99") {
                $("#GetDate").attr("class", "input");
                $("#Certbody").attr("class", "validate-specialchar input");
                $("#CertResults").attr("class", "validate-specialchar input");

                $("#frmGetDate").attr("style", "display:none;");
                $("#frmCertbody").attr("style", "display:none;");
                $("#frmCertResults").attr("style", "display:none;");
                $("#frmCertNO").attr("style", "display:none;");
                $("#frmFile").attr("style", "display:none;");
                //
                //
                //
                //
                //
                $("#GetDate_required").attr("style", "color:red;width:20px;float:left;display:none;");
                $("#Certbody_required").attr("style", "float:left;color:red;display:none;");
            } else {
                $("#GetDate").attr("class", "required input");
                $("#Certbody").attr("class", "required validate-specialchar input");
                $("#CertResults").attr("class", "required validate-specialchar input");
                $("#GetDate_required").attr("style", "color:red;width:20px;float:left;");
                $("#Certbody_required").attr("style", "float:left;color:red;");

                $("#frmGetDate").attr("style", "display:block;");
                $("#frmCertbody").attr("style", "display:block;");
                $("#frmCertResults").attr("style", "display:block;");
                $("#frmCertNO").attr("style", "display:block;");
                $("#frmFile").attr("style", "display:block;");
            }
        }
        function reNoRange() {
            var enVal = $('#LanguageLevel').val();
            if (enVal == "90" || enVal == "99") {
                noRange('99');
            }
        }
    </script>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ResearchForm.aspx.cs" Inherits="Zhaopin.UserCenter.ResearchForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心 - 简历登记 - 科研项目</title>
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
        /* 学术成果情况 */
        .form01 {
            width: 580px;
            height: 50px;
            float: left;
        }

        .form02 {
            width: 115px;
            text-align: right;
            height: 50px;
            float: left;
        }

        .form03 {
            width: 170px;
            float: left;
        }

        .form04 {
            width: 580px;
            height: 50px;
            float: left;
        }

        .form05 {
            width: 450px;
            float: left;
        }

        .form06 {
            width: 320px;
            height: 50px;
            float: left;
        }

        .form07 {
            width: 580px;
            height: 50px;
            float: left;
        }

        .form08 {
            width: 580px;
            height: 90px;
            float: left;
        }

        .form11 {
            float: left;
            width: 170px;
        }

        .form12 {
            float: left;
            width: 170px;
            height: 50px;
        }

        .form13 {
            width: 150px;
            float: left;
        }

        .form14 {
            width: 115px;
            text-align: right;
            height: 60px;
            float: left;
        }

        .form15 {
            float: left;
            width: 65px;
        }

        .form16 {
            float: left;
            width: 130px;
        }

        .form17 {
            float: left;
            width: 270px;
        }

        .gray26, .gray26 a:link, .gray26 a:visited {
            font-size: 12px;
            line-height: 26px;
            font-weight: normal;
            color: #338d89;
            text-decoration: none;
        }

        table {
            width: 738px;
        }

        #ResearchForm {
            height: 342px;
            width: 660px;
            background-color: #EEE;
            padding-top: 8px;
        }
        -->
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#BeginDate").datepicker({ dateFormat: 'yy-mm-dd' });
            $("#EndDate").datepicker({ dateFormat: 'yy-mm-dd' });
        });
    </script>
</head>
<body>
    <form id="ResearchFrm" runat="server">
        <div id="ResearchForm">
            <ul class="gray30">
                <li>
                    <div class="form06">
                        <div class="form02">项目级别：</div>
                        <div class="form16">
                            <div>
                                <select id="ResearchLevel" name="ResearchLevel" class="required validate-selection" style="width: 132px;" runat="server">
                                </select>
                            </div>
                        </div>
                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                    </div>
                    <div class="form06">
                        <div class="form02">项目编号：</div>
                        <div class="form11">
                            <input id="ReseNO" name="ReseNO" type="text" class="required validate-alphanum input" value="" maxlength="40" runat="server" />
                        </div>
                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                    </div>
                </li>

                <li>
                    <div class="form04">
                        <div class="form02">项目名称：</div>
                        <div class="form17">
                            <input id="ReseName" name="ReseName" type="text" class="required validate-specialchar input2" value="" maxlength="40" runat="server" />
                        </div>
                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                    </div>
                </li>
                <li>
                    <div class="form06">
                        <div class="form02">开始时间：</div>
                        <div style="width: 180px; float: left;">
                            <div style="width: 130px; float: left;">
                                <input id="BeginDate" name="BeginDate" style="width: 130px;" type="text" value="" class="required validate-date input" readonly="true" runat="server" />
                            </div>
                            <div style="color: red; width: 20px; float: left; overflow: hidden;">&nbsp;&nbsp;*</div>
                        </div>
                    </div>
                    <div class="form06">
                        <div class="form02">结束时间：</div>
                        <div tyle="width:130px; float:left;">
                            <div style="width: 130px; float: left;">
                                <input id="EndDate" name="EndDate" style="width: 130px;" type="text" value="" class="required validate-date great-than-BeginDate input" readonly="true" runat="server" />
                            </div>
                            <div style="color: red; width: 20px; float: left; overflow: hidden;">&nbsp;&nbsp;*</div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="form04">
                        <div class="form02">项目所属单位：</div>
                        <div class="form11">
                            <input id="ResaCompany" name="ResaCompany" type="text" class="required validate-specialchar input" value="" maxlength="20" runat="server" />
                        </div>
                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                    </div>
                </li>

                <li>
                    <div class="form08">
                        <div class="form02">承担的主要工作：</div>
                        <div class="form05">
                            <div>
                                <textarea id="ReseJob" name="ReseJob" class="max-length-100 validate-specialchartextarea input3" value="" maxlength="100" runat="server"></textarea>
                            </div>
                            <div class="gray02">100个汉字以内</div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="form07">
                        <div class="form02">&nbsp;&nbsp;</div>
                        <div class="form05" style="padding-top: 8px;">
                            <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btnsubmit" OnClick="Button1_Click" OnClientClick="return chkResearchFrmSubmit();" />
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </form>
    <script>
        function chkResearchFrmSubmit() {
            var ResearchFrm = new Validation("ResearchFrm");
            if (!ResearchFrm.validate()) {
                return false;
            }
        }
    </script>
</body>
</html>

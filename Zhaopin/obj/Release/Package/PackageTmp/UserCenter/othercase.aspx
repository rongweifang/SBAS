<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="othercase.aspx.cs" Inherits="Zhaopin.UserCenter.othercase" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/employee_process.ascx" TagPrefix="uc1" TagName="employee_process" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>个人中心 - 简历登记 - 其他情况说明</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet">
    <link href="/themes/index/css/job.css" rel="stylesheet">
    <script src="/scripts/prototype_for_validation.js" type="text/javascript"></script>
    <script src="/scripts/effects.js" type="text/javascript"></script>
    <script src="/scripts/validation_cn.js" type="text/javascript"></script>
    <script src="/scripts/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script src="/scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
    <script type="text/javascript" src="/scripts/jquery.form.js"></script>
    <script src="/scripts/jquery.blockUI.js" type="text/javascript"></script>
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <link href="/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/Scripts/ShowMsg/msgbox.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/ShowMsg/msgbox.js" type="text/javascript"></script>
    <script src="/Scripts/FunctionJS.js" type="text/javascript"></script>
    <style type="text/css">
        <!--
        /* 其他情况说明 */
        .form08 {
            width: 600px;
            height: 165px;
            float: left;
        }
        -->
    </style>
    <script type="text/javascript">
        function checkWord(len, evt) {
            if (evt == null)
                evt = window.event;
            var src = evt.srcElement ? evt.srcElement : evt.target;
            var str = src.value;
            myLen = 0;
            i = 0;
            for (; (i < str.length) && (myLen <= len) ; i++) {
                if (str.charCodeAt(i) > 0 && str.charCodeAt(i) < 128)
                    myLen++;
                else
                    myLen += 2;
            }
            if (myLen > len) {
                //alert("您输入超过限定长度");
                src.value = str.substring(0, i - 1);
            }
        }
    </script>
</head>
<body>
    <uc1:head runat="server" ID="head" />
    <div class="location">
        <div class="location_left">
            <a href="/UserCenter/">个人中心</a> &gt;简历登记
        </div>
    </div>
    <div class="clearit"></div>
    <div class="content">
        <uc1:employee_left runat="server" ID="employee_left" />
        <div class="right">
            <uc1:employee_process runat="server" ID="employee_process" />
            <div class="clearit"></div>
            <form name="employeeform" id="employeeform" runat="server">
                <div class="line top_10">
                    <div class="column_long_long">其他情况说明<font style="color: #338d89; font-size: 12px; font-weight: normal;">&nbsp;(非必填)</font></div>
                </div>
                <div class="line">
                    <div class="columnbj">
                        <div class="Form_left">
                            <ul class="gray30">
                                <li>
                                    <div class="form08">
                                        <div class="gray02">如果有其他未说明事宜，请填写：</div>
                                        <div>
                                            <textarea id="UserMemo" name="UserMemo" class="max-length-200 validate-specialchartextarea input4" maxlength="70" runat="server">无</textarea>
                                        </div>
                                        <div style="overflow: hidden;" class="gray02">200个汉字以内</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form07">
                                        <div class="form05">
                                            <asp:Button ID="Button1" CssClass="btnsubmit" runat="server" Text="保存" OnClientClick="chkOthercaseSubmit();" OnClick="Button1_Click" />
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="clearit"></div>
            </form>
        </div>
    </div>
    <div class="clearit"></div>
    <script type="text/javascript">

        function chkOthercaseSubmit() {
            var employeeform = new Validation("employeeform");
            if (employeeform.validate()) {
            }
        }
    </script>
    <uc1:foot runat="server" ID="foot" />
</body>
</html>

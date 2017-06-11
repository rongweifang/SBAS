<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="degree_authcode.aspx.cs" Inherits="Zhaopin.UserCenter.degree_authcode" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>学籍认证 - 个人设置 - 个人中心</title>
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
        .form01 {
            width: 280px;
            height: 60px;
            float: left;
        }

        .form02 {
            width: 110px;
            text-align: right;
            height: 50px;
            float: left;
        }

        .form03 {
            width: 170px;
            float: left;
        }

        .form04 {
            width: 560px;
            height: 50px;
            float: left;
        }

        .form05 {
            width: 450px;
            float: left;
        }

        .form06 {
            width: 480px;
            height: 50px;
            float: left;
        }

        .form07 {
            width: 560px;
            height: 50px;
            float: left;
        }

        .form08 {
            width: 560px;
            height: 80px;
            float: left;
        }

        .form09 {
            width: 470px;
            float: left;
        }
        -->
    </style>



</head>


<body>
    <form id="employeeForm" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="location">
            <div class="location_left">
                <a href="/UserCenter/">个人中心</a> &gt;学籍认证
            </div>
        </div>
        <div class="clearit"></div>
        <div class="content">
            <uc1:employee_left runat="server" ID="employee_left" />
            <div class="right">

                <div class="righttopbj">
                    <div class="righttopbj_left"></div>
                    <div class="righttopbj_text">学籍认证</div>
                    <div class="righttopbj_right"></div>
                </div>
                <div class="clearit"></div>
                <div class="line">
                    <div class="columnbj">
                        <div class="Form_left">
                            <ul class="gray30">
                                <li>
                                    <div class="form06">
                                        <div class="form02">学籍认证码：</div>
                                        <div>
                                            <div>
                                                <input id="DegreeAuthcode" name="DegreeAuthcode" type="text" class="required validate-specialchar input" maxlength="30" onblur="chkDegreeAuthcode(this.value)" value="" runat="server" /><span style="color: red; padding-left: 5px;">*</span>
                                            </div>
                                            <div id="DegreeAuthcodeErr" style="color: red; width: 300px; margin-top: -10px;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form06">
                                        <div class="form02">有效期至：</div>
                                        <div>
                                            <div>
                                                <input id="DegreeOverdate" name="DegreeOverdate" type="text" class="required input" readonly="readonly" value="" runat="server" /><span style="color: red; padding-left: 5px;">*</span>
                                                <div id="DegreeOverdateErr" style="color: red; width: 300px; margin-top: -10px;"></div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <input id="XXWMessage" name="XXWMessage" type="hidden" runat="server" />
                                </li>
                                <li>
                                    <input id="XXWphoto" name="XXWphoto" type="hidden" runat="server" />
                                </li>
                                <li>
                                    <div class="form07">
                                        <div class="form02">&nbsp;&nbsp;</div>
                                        <div class="form05">
                                            <asp:Button ID="Button1" CssClass="btnsubmit" runat="server" OnClientClick="chkSubmit()" Text="保存" OnClick="Button1_Click" />
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div id="xxw" style="display: none">
                </div>
                <div class="right_foot"></div>

            </div>
        </div>
        <div class="clearit"></div>
    </form>
    <uc1:foot runat="server" ID="foot" />
    <script type="text/javascript">
        $(document).ready(function () {
            $("#DegreeOverdate").datepicker({ dateFormat: 'yy-mm-dd' });

        });
        var frm = $("#employeeForm");
        function chkSubmit() {
            var employeeForm = new Validation("employeeForm");
            if (!employeeForm.validate()) {
                return false;
            }
        }
        function chkDegreeAuthcode(value1) {
            if (value1 == "") {
                document.getElementById("DegreeAuthcodeErr").innerHTML = "学籍认证码不能为空！";
                document.getElementById("DegreeAuthcodeErr").style.color = "red";
                return false;
            } else {
                document.getElementById('DegreeAuthcodeErr').innerHTML = "";
                return true;
            }
        }

        function chkDegreeOverdate(value2) {
            if (value2 == "") {
                document.getElementById("DegreeOverdateErr").innerHTML = "有效期不能为空！";
                document.getElementById("DegreeOverdateErr").style.color = "red";
                return false;
            } else {
                var nowTime = '2015-04-14 22:27:57';//当前时间
                var nowArr = nowTime.substring(0, 10).split('-');
                var dNow = new Date(nowArr[0], nowArr[1], nowArr[2]);//日期类型当前时间

                var endArr = value2.substring(0, 10).split('-');
                var dEnd = new Date(endArr[0], endArr[1], endArr[2]);//所填有效期
                if (dNow >= dEnd) {
                    document.getElementById("DegreeOverdateErr").innerHTML = "有效期必须大于当前时间！";
                    document.getElementById("DegreeOverdateErr").style.color = "red";
                    return false;
                }
                document.getElementById('DegreeOverdateErr').innerHTML = "";
                return true;
            }
        }
    </script>
</body>
</html>

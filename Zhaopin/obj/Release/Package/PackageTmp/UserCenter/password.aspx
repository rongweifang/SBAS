<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="password.aspx.cs" Inherits="Zhaopin.UserCenter.password" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>修改密码 - 个人设置 - 个人中心</title>
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
    <script type="text/javascript">
        function chckOrigPass(origPass) {
            if (origPass == "") {
                document.getElementById("origPassErr").innerHTML = "原密码不能为空！";
                document.getElementById("origPassErr").style.color = "red";
                return false;
            } else if (origPass.length < 8 || origPass.length > 20) {
                document.getElementById("origPassErr").innerHTML = "原密码必须大于8位，小于20位";
                document.getElementById("origPassErr").style.color = "red";
                return false;
            } else {
                document.getElementById('origPassErr').innerHTML = "";
                return true;
            }
        }
        function chckRpassword(rpassword) {
            var newpassword = document.getElementById("newpassword").value;
            if (rpassword == "") {
                document.getElementById('rpassErr').innerHTML = "确认密码不能为空！";
                document.getElementById('rpassErr').style.color = "red";
            } else if (rpassword.length < 8 || rpassword.length > 20) {
                document.getElementById('rpassErr').innerHTML = "原密码必须大于8位，小于20位！";
                document.getElementById('rpassErr').style.color = "red";
            } else if (rpassword != newpassword) {
                document.getElementById('rpassErr').innerHTML = "确认密码与新密码不同，请重新填写确认密码！";
                document.getElementById('rpassErr').style.color = "red";
            } else {
                document.getElementById('rpassErr').innerHTML = "";
            }
        }
        function chkSubmit() {
            var employeeForm = new Validation("employeeForm");
            var origPass = document.getElementById("origPass").value;
            var newpassword = document.getElementById("newpassword").value;
            var rpassword = document.getElementById("rpassword").value;
            if (origPass == "") {
                document.getElementById("origPassErr").innerHTML = "原密码不能为空！";
                return false;
            }
            if (!checkpassword(newpassword)) {
                return false;
            }
            if (origPass.length < 8 || origPass.length > 20) {
                document.getElementById("origPassErr").innerHTML = "原密码必须大于8位，小于20位！";
                return false;
            }
            if (newpassword == "") {
                document.getElementById('passErr').innerHTML = "新密码不能为空！";
                return false;
            }
            if (newpassword.length < 8 || newpassword.length > 20) {
                document.getElementById('passErr').innerHTML = "原密码必须大于8位，小于20位！";
                return false;
            }
            if (rpassword == "") {
                document.getElementById('rpassErr').innerHTML = "确认密码不能为空！";
                return false;
            }
            if (rpassword.length < 8 || rpassword.length > 20) {
                document.getElementById('rpassErr').innerHTML = "原密码必须大于8位，小于20位！";
                return false;
            }
            if (rpassword != newpassword) {
                document.getElementById('rpassErr').innerHTML = "确认密码与新密码不同，请重新填写确认密码！";
                return false;
            }
        }
        function resetValue() {
            employeeForm.reset();
            document.getElementById("origPassErr").innerHTML = " ";
            document.getElementById('passErr').innerHTML = " ";
            document.getElementById('rpassErr').innerHTML = " ";
        }
        function checkpassword(newpassword) {
            document.getElementById("passErr").innerHTML = "";
            if (newpassword == "") {
                document.getElementById("passErr").innerHTML = "请输入新密码！";
                document.getElementById("passErr").style.color = 'red';
                return false;
            }
            if (newpassword.length < 8 || newpassword.length > 20) {
                document.getElementById("passErr").innerHTML = "密码长度只能在8-20位字符之间！";
                document.getElementById("passErr").style.color = 'red';
                // document.registerForm.newpassword.focus();
                return false;
            }
            var oneChar
            newpassword = newpassword.toString();
            newpassword = newpassword.toUpperCase();
            for (var i = 0; i < newpassword.length; i++) {
                oneChar = newpassword.charAt(i);
                if (oneChar < "0" || oneChar > "9") {//非数字
                    if (oneChar < "A" || oneChar > "Z") {//非字母
                        if (oneChar != "_" && oneChar != "-") {
                            document.getElementById("passErr").innerHTML = "密码只能由英文、数字及'_'、'-'组成！";
                            document.getElementById("passErr").style.color = 'red';
                            return false;
                        }
                    }
                }//end if
            }//end for
            return true;
        }
    </script>
</head>


<body>


    <form id="employeeForm" name="employeeForm" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="location">
            <div class="location_left">
                <a href="/UserCenter/">个人中心</a> &gt;修改密码
            </div>
        </div>
        <div class="clearit"></div>
        <div class="content">
            <uc1:employee_left runat="server" ID="employee_left" />
            <div class="right">
                <div class="righttopbj">
                    <div class="righttopbj_left"></div>
                    <div class="righttopbj_text">修改密码</div>
                    <div class="righttopbj_right"></div>
                </div>
                <div class="clearit"></div>
                <div class="line">
                    <div class="columnbj">
                        <div class="Form_left">
                            <ul class="gray30">
                                <li>
                                    <div class="form06">
                                        <div class="form02">原密码：</div>
                                        <div>
                                            <div>
                                                <input id="origPass" name="origPass" type="password" class="input" maxlength="16" onblur="chckOrigPass(this.value)" runat="server" /><span style="color: red; padding-left: 5px;">*</span>
                                            </div>
                                            <div id="origPassErr" style="color: red; width: 300px; margin-top: -10px;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form06">
                                        <div class="form02">新密码：</div>
                                        <div>
                                            <div>
                                                <input id="newpassword" name="newpassword" type="password" class="input" maxlength="16" onblur="checkpassword(this.value)" runat="server" /><span style="color: red; padding-left: 5px;">*</span>
                                            </div>
                                            <div id="passErr" style="color: red; width: 300px; margin-top: -10px;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form06">
                                        <div class="form02">确认新密码：</div>
                                        <div>
                                            <div>
                                                <input id="rpassword" name="rpassword" type="password" class="input" maxlength="16" onblur="chckRpassword(this.value)" runat="server" /><span style="color: red; padding-left: 5px;">*</span>
                                            </div>
                                            <div id="rpassErr" style="color: red; width: 300px; margin-top: -10px;"></div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form07">
                                        <div class="form02">&nbsp;&nbsp;</div>
                                        <div class="form05">
                                            <asp:Button ID="Button1" runat="server" CssClass="btnsubmit" Text="保存" OnClick="Button1_Click" OnClientClick="chkSubmit();" />
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="right_foot"></div>
            </div>
        </div>
        <div class="clearit"></div>
        <uc1:foot runat="server" ID="foot" />
    </form>



</body>
</html>

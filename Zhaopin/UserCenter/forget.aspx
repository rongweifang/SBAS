<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="forget.aspx.cs" Inherits="Zhaopin.UserCenter.forget" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>找回密码 - 内蒙古电力（集团）有限责任公司招聘平台</title>
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
     <link href="/themes/default/css/style.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        <!--
        #tips {
            width: 332px;
            height: 15px;
            padding: 2px 18px 5px 5px;
            margin: -11px 0 0 381px;
            z-index: 2px;
            border: #e3c67f 1px solid;
            color: #c49138;
            background: #fff6bf;
            clear: both;
            position: absolute;
        }

            #tips img {
                position: absolute;
                right: 0;
                top: 0;
            }
        -->
    </style>

    <script type="text/javascript">
        var aCity = { 11: "北京", 12: "天津", 13: "河北", 14: "山西", 15: "内蒙古", 21: "辽宁", 22: "吉林", 23: "黑龙江", 31: "上海", 32: "江苏", 33: "浙江", 34: "安徽", 35: "福建", 36: "江西", 37: "山东", 41: "河南", 42: "湖北", 43: "湖南", 44: "广东", 45: "广西", 46: "海南", 50: "重庆", 51: "四川", 52: "贵州", 53: "云南", 54: "西藏", 61: "陕西", 62: "甘肃", 63: "青海", 64: "宁夏", 65: "新疆", 71: "台湾", 81: "香港", 82: "澳门", 91: "国外" };
        //邮件判断  和注册页的不太一样
        function checkEmail(email) {
            document.getElementById("emailerr").innerHTML = "";
            document.getElementById("emailerr").innerHTML.color = "red";
            if (email == "") {
                document.getElementById("emailerr").innerHTML = "请输入邮箱！";
                document.getElementById("emailerr").style.color = 'red';
                return false;
            }
            //真实姓名
            if (!checkname(document.getElementById("name").value)) {
                return false;
            }
            //身份证号码
            if (!checkloginName(document.getElementById("loginName").value)) {
                return false;
            } else {
                if (email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
                    document.getElementById("emailerr").innerHTML = "邮箱格式不正确！";
                    document.getElementById("emailerr").style.color = 'red';
                    return false;
                }
            }
            //ajax判断
            var email = document.getElementById("email").value;
            var name = document.getElementById("name").value;
            var loginName = document.getElementById("loginName").value;
            var url = "/html/forget_cheEmail/" + email + "/" + name + "/" + loginName;
            url = encodeURI(url);
            return $.post(url, null, callbackEmail);
        }
        function callbackEmail(content) {
            if (content != "had") {
                document.getElementById("emailerr").innerHTML = "该email不存在!";
                document.getElementById("emailerr").style.color = 'red';
                return false;
            } else {
                return true;
            }
        }
        //图型ajax验证
        //验证码判断 
        function checkRand(rand) {
            document.getElementById("randerr").innerHTML = "";
            if (true) {
                if (rand == "") {
                    document.getElementById("randerr").innerHTML = "请输入验证码！";
                    document.getElementById("randerr").style.color = 'red';
                    return false;
                } else {
                    var rand = document.getElementById("rand").value;
                    var url = "/html/che_loginRand/" + rand;
                    url = encodeURI(url);
                    return $.post(url, null, callbackRand);
                }
            } else {
                return true;
            }
        }
        function callbackRand(content) {
            if (content != "had") {
                return true;
            } else {
                document.getElementById("randerr").innerHTML = "验证码输入不正确!";
                document.getElementById("randerr").style.color = 'red';
                return false;
            }
        }
        function chkSubmit() {
            if (!checkEmail(document.getElementById("email").value)) {
                return false;
            };
            if (!checkname(document.getElementById("name").value)) {
                return false;
            }
            if (!checkloginName(document.getElementById("loginName").value)) {
                return false;
            }
            if (!checkRand(document.getElementById("rand").value)) {
                return false;
            };

            //添加“使找回按钮失效”代码
        }
        //重新获取验证码
        function changeCode() {
            obj = document.getElementById("change_code");
            var timeNum = new Date().getTime();
            obj.src = "/servlet/AuthImageServlet?t=" + timeNum;
        }
        //真实姓名
        function checkname(realname) {
            //创建正则表达式
            var re = /^[\u2e80-\ufe4f]{1,9}[·]{0,1}[\u2e80-\ufe4f]{1,9}$/; //可输入汉字以及点号
            if (realname == "") {
                document.getElementById("nameerr").innerHTML = "请输入真实姓名！";
                document.getElementById("nameerr").style.color = 'red';
                return false;
            } else if (realname.search(re) == -1) {
                document.getElementById("nameerr").innerHTML = "请采用身份证姓名！";
                document.getElementById("nameerr").style.color = 'red';
                return false;
                //2-20个汉字，无空格
            } else if (realname.length < 2 || realname.length > 8) {
                document.getElementById("nameerr").innerHTML = "请采用身份证姓名！";
                document.getElementById("nameerr").style.color = 'red';
                return false;
            } else {
                document.getElementById("nameerr").innerHTML = "";
                return true;
            }
        }
        //身份证号判断
        function checkloginName(loginName) {
            document.getElementById("loginNameerr").innerHTML = "";
            if (loginName == "") {
                document.getElementById("loginNameerr").innerHTML = "请输入身份证号码！";
                document.getElementById("loginNameerr").style.color = 'red';
                return false;
            } else if (!checkID(loginName)) {
                document.getElementById("loginNameerr").innerHTML = "身份证号码填写有误！";
                document.getElementById("loginNameerr").style.color = 'red'
                return false;
            } else if (document.getElementById("name").value == "") {
                document.getElementById("nameerr").innerHTML = "请输入真实姓名！";
                document.getElementById("nameerr").style.color = 'red';
                return false;
            } else {
                //ajax判断
                var name = document.getElementById("name").value;
                var loginName = document.getElementById("loginName").value;
                var url = "/html/forget_cheLoginName/" + name + "/" + loginName;
                url = encodeURI(url);
                return $.post(url, null, callbackNameAndLoginName);
            }
        }
        function callbackNameAndLoginName(content) {
            if (content != "had") {
                document.getElementById("loginNameerr").innerHTML = "姓名或身份证号错误！";
                document.getElementById("loginNameerr").style.color = 'red';
                return false;
            } else {
                return true;
            }
        }

        //==========身份证验证js代码开始==========
        function checkID(sId) {
            var iSum = 0;
            var info = "";
            if (sId == "") {
                document.getElementById("loginNameerr").innerHTML = "身份证号码不能为空！";
                return false;
            }
            if (sId.length == 15) {
                isIDCard1 = /^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$/;
                if (!isIDCard1.test(sId)) {
                    document.getElementById("loginNameerr").innerHTML = "身份证非法！";
                    document.getElementById("loginNameerr").style.color = 'red';
                    return false;
                }
                if (aCity[parseInt(sId.substr(0, 2))] == null) {
                    document.getElementById("loginNameerr").innerHTML = "身份证存在非法地区！";
                    document.getElementById("loginNameerr").style.color = 'red';
                    return false;
                }
                sBirthday = "19" + sId.substr(6, 2) + "-" + Number(sId.substr(8, 2)) + "-" + Number(sId.substr(10, 2));
                var d = new Date(sBirthday.replace(/-/g, "/"))
                if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())) {
                    document.getElementById("loginNameerr").innerHTML = "身份证存在非法生日！";
                    document.getElementById("loginNameerr").style.color = 'red';
                    return false;
                }
                return true;
            }
            if (sId.length == 18) {
                if (!/^\d{17}(\d|x)$/i.test(sId)) {
                    document.getElementById("loginNameerr").innerHTML = "身份证非法！";
                    document.getElementById("loginNameerr").style.color = 'red';
                }
                sId = sId.replace(/x$/i, "a");
                if (aCity[parseInt(sId.substr(0, 2))] == null) {
                    document.getElementById("loginNameerr").innerHTML = "身份证存在非法地区！";
                    document.getElementById("loginNameerr").style.color = 'red';
                    return false;
                }
                sBirthday = sId.substr(6, 4) + "-" + Number(sId.substr(10, 2)) + "-" + Number(sId.substr(12, 2));
                var d = new Date(sBirthday.replace(/-/g, "/"))
                if (sBirthday != (d.getFullYear() + "-" + (d.getMonth() + 1) + "-" + d.getDate())) {
                    document.getElementById("loginNameerr").innerHTML = "身份证存在非法生日！";
                    document.getElementById("loginNameerr").style.color = 'red';
                    return false;
                }
                for (var i = 17; i >= 0; i--) iSum += (Math.pow(2, i) % 11) * parseInt(sId.charAt(17 - i), 11)
                if (iSum % 11 != 1) {
                    document.getElementById("loginNameerr").innerHTML = "身份证非法！";
                    document.getElementById("loginNameerr").style.color = 'red';
                    return false;
                }
                return true;
            }
            document.getElementById("loginNameerr").innerHTML = "身份证非法！";
            document.getElementById("loginNameerr").style.color = 'red';
            return false;
            return true;
        }

        function returnLoginPage() {
            top.location.href = "login.aspx";
        }

        //==========身份证验证js代码结束==========
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrap_forgot">

            <div id="head_02"></div>
            <div id="login_win">
                <div id="back_home">
                    <a href="/">返回首页</a>
                </div>

                <div id="content">
                    <div class="list_02" id="d_userInfo" runat="server" style="margin: 0 auto; width: 450px;">
                        <div>
                            <span>忘记密码？请输入您注册时填写的邮箱，我们会把密码邮件发送到您的邮箱！</span>
                        </div>
                        <dl>
                            <dt>真实姓名：
                            </dt>
                            <dd>
                                <input id="name" runat="server" name="name" type="text" value="" maxlength="20" onblur="checkname(this.value);this.style.border='#A0A0A0 1px solid';" tabindex="1" title="请采用身份证姓名" onfocus="this.style.border='#006F6B 2px solid';"/>
                            </dd>
                            <dt class="error"></dt>
                            <dd class="long_02_error" runat="server" id="nameerr"></dd>

                            <dt>身份证号码：
                            </dt>
                            <dd>
                                <input id="loginName" runat="server" name="loginName" value="" maxlength="18" onblur="checkloginName(this.value);this.style.border='#A0A0A0 1px solid';" oncontextmenu="return false" onpaste="return false" type="text" tabindex="2" title="请填写有效的身份证号" onfocus="this.style.border='#006F6B 2px solid';"/>
                            </dd>
                            <dt class="error"></dt>
                            <dd class="long_02_error" id="loginNameerr"></dd>

                            <dt>电子邮箱：
                            </dt>
                            <dd>
                                <input name="email" runat="server" id="email" type="text" tabindex="3" onblur="checkEmail(this.value);this.style.border='#A0A0A0 1px solid';" value="" onfocus="this.style.border='#006F6B 2px solid';" />
                            </dd>
                            <dt class="error"></dt>
                            <dd class="long_02_error" id="emailerr"></dd>

                            <dt>验证码：
                            </dt>
                            <dd>
                                <input name="rand" runat="server" id="rand" type="text" onblur="checkRand(this.value);this.style.border='#A0A0A0 1px solid';" tabindex="4" autocomplete="off" class="verify" onfocus="this.style.border='#006F6B 2px solid';" />
                                &nbsp;
									<img src="/Ajax/Verify_code.ashx" id="Verify_codeImag" width="59" height="20" alt="点击切换验证码"
                                        title="点击切换验证码" style="margin-top: 0px; vertical-align: top; cursor: pointer;"
                                        onclick="ToggleCode(this.id, '/Ajax/Verify_code.ashx');return false;" /><span>  点击图片切换验证码
                                        </span>
                            </dd>
                            <dt class="error"></dt>
                            <dd class="long_02_error" id="randerr"></dd>

                            <dt>&nbsp;
                            </dt>
                            <dd>
                                <asp:Button ID="Button1" runat="server" Text="找回密码" CssClass="btn_reg" OnClick="Button1_Click1" OnClientClick="return chkSubmit();"/>
                            </dd>
                        </dl>
                    </div>
                    <div class="list_02" id="tipMsg" runat="server"  style="margin: 0 auto; width: 450px; color: red; height: 300px; display:none;">
                        您的找回密码已发送的您的邮箱
                    </div>
                </div>
            </div>
            <div id="foot_02">
            </div>
        </div>
    </form>
</body>
</html>

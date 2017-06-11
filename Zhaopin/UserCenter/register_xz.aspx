<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register_xz.aspx.cs" Inherits="Zhaopin.UserCenter.register_xz" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户注册</title>
    <link href="/themes/default/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
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

</head>
<body>
    <form id="registerForm" runat="server">
        <div id="wrap_reg">
            <div id="head_03"></div>
            <div id="login_win">
                <div id="back_home">
                    <a href="/">招聘平台</a> &gt; 用户注册
                </div>
                <div class="list_01">
                    <dl>
                        <dt>姓&nbsp;&nbsp;名：</dt>
                        <dd>
                            <input id="name" name="name" type="text" value="" maxlength="10" onblur="checkname(this.value);this.style.border='#A0A0A0 1px solid';" tabindex="1" title="请采用身份证姓名" style="border: 1px solid rgb(160, 160, 160);" runat="server" />
                            <span style="color: red; padding-left: 5px;">*</span>
                        </dd>
                        <dd class="long_01">
                            <span>请采用身份证姓名</span>
                        </dd>
                        <dt class="error"></dt>
                        <dd class="error" id="nameerr" style="color: red;"></dd>
                        <dd class="long_01_error"></dd>
                        <dt>身份证号：
                        </dt>
                        <dd>
                            <input id="loginName" name="loginName" value="" maxlength="18" onblur="checkloginName(this.value);this.style.border='#A0A0A0 1px solid';" ondragenter="return false" oncontextmenu="return false" onpaste="return false" type="text" tabindex="2" title="请填写有效的身份证号" onfocus="this.style.border='#006F6B 2px solid';" runat="server" />
                            <span style="color: red; padding-left: 5px;">*</span>
                        </dd>
                        <dd class="long_01">
                            <span>身份证号为登录使用，注册之后不可更改</span>
                        </dd>
                        <dt class="error"></dt>
                        <dd class="long_02 error" id="loginNameerr"></dd>

                        <dt>电子邮箱：</dt>
                        <dd>
                            <input id="email" name="email" type="text" tabindex="3" value="" maxlength="30" onblur="checkEmail(this.value);this.style.border='#A0A0A0 1px solid';" title="请输入常用邮箱，将用于找回密码" onfocus="this.style.border='#006F6B 2px solid';" runat="server" />
                            <span style="color: red; padding-left: 5px;">*</span>

                        </dd>
                        <dd class="long_01">
                            <asp:Button ID="btn_mail_valid" runat="server" Text="验证邮箱" class="btn_mail_valid" Style="color: #FFF; width: 70px; line-height: 22px; padding: 0px;display:none;" OnClick="btn_mail_valid_Click" />
                            你将会收到由impc@vip.126.com发出的邮件
                        </dd>
                         <dt></dt>
                        <dd class="long_02" style="color:sienna">
                           为了你能够正常收到内蒙古电力(集团)有限责任公司的邮件，请将impc@vip.126.com加入通讯录
                        </dd>
                           <dt class="error"></dt>
                        <dd class="error" id="emailerr" ></dd>
                        <dd class="long_01_error" ></dd>
                        <dt style="display:none;">邮箱验证码：</dt>
                        <dd style="display:none;">
                            <input id="emailcode" name="emailcode" type="text" tabindex="4" value="" maxlength="10" onblur="checkEmailcode(this.value);this.style.border='#A0A0A0 1px solid';" title="请登录邮箱查收验证码" onfocus="this.style.border='#006F6B 2px solid';" runat="server" />
                            <span style="color: red; padding-left: 5px;">*</span>

                        </dd>
                        <dd class="long_01" style="display:none;">
                            <span>请登录邮箱查收验证码</span>
                        </dd>
                      
                     
                          <dt class="error" style="display:none;"></dt>
                        <dd class="error" id="emailcodeerr" style="display:none;"></dd>
                        <dd class="long_01_error" style="display:none;"></dd>
                        <dt>手机号码：
                        </dt>
                        <dd>
                            <input id="mobile" name="mobile" value="" maxlength="11" onblur="checkMobile(this.value);this.style.border='#A0A0A0 1px solid';" type="text" tabindex="5" title="请输入您的手机号码" onfocus="this.style.border='#006F6B 2px solid';" runat="server" />
                            <span style="color: red; padding-left: 5px;">*</span>
                        </dd>
                        <dd class="long_01"></dd>
                        <dt class="error"></dt>
                        <dd class="error" id="mobileerr"></dd>
                        <dd class="long_01_error"></dd>
                        <dt>密码：</dt>
                        <dd>
                            <input id="password" name="password" value="" type="password" maxlength="26" onblur="checkpassword(this.value);this.style.border='#A0A0A0 1px solid';" ondragenter="return false" oncontextmenu="return false" onpaste="return false" tabindex="6" title="密码至少8个字符，可以使用字母、数字或符号" onfocus="this.style.border='#006F6B 2px solid';" runat="server" />
                            <span style="color: red; padding-left: 5px;">*</span>
                        </dd>
                        <dd class="long_01"><span>密码至少8个字符，可以使用字母、数字或符号</span></dd>
                        <dt class="error"></dt>
                        <dd class="error" id="passworderr"></dd>
                        <dd class="long_01_error"></dd>
                        <dt>确认密码：</dt>
                        <dd>
                            <input id="confirm_password" name="confirm_password" value="" maxlength="25" onblur="checkConfirm_password(this.value);this.style.border='#A0A0A0 1px solid';" ondragenter="return false" oncontextmenu="return false" onpaste="return false" type="password" tabindex="7" title="请再次输入密码" onfocus="this.style.border='#006F6B 2px solid';" runat="server" />
                            <span style="color: red; padding-left: 5px;">*</span>
                        </dd>
                        <dd class="long_01"><span>密码至少8个字符，可以使用字母、数字或符号</span></dd>
                        <dt class="error"></dt>
                        <dd class="error" id="confirm_passworderr"></dd>
                        <dd class="long_01_error"></dd>
                        <dt>验证码：
                        </dt>
                        <dd>
                            <input id="rand" name="rand" onblur="checkRand(this.value);this.style.border='#A0A0A0 1px solid';" autocomplete="off" type="text" tabindex="8" maxlength="4" onfocus="this.style.border='#006F6B 2px solid';" class="verify" runat="server" />
                            <img src="/Ajax/Verify_code.ashx" id="Verify_codeImag" width="59" height="20" alt="点击切换验证码"
                                title="点击切换验证码" style="margin-top: 0px; vertical-align: top; cursor: pointer;"
                                onclick="ToggleCode(this.id, '/Ajax/Verify_code.ashx');return false;" />
                        </dd>
                        <dd class="long_01">
                            <span>点击图片切换验证码</span>
                        </dd>
                        <dt class="error"></dt>
                        <dd class="error" id="randerr"></dd>
                        <dd class="long_01_error"></dd>
                        <dt></dt>
                        <dd class="long_02">
                            <span>
                                <input id="agreement" name="agreement" type="checkbox" style="padding-top: 6px;" value="1" tabindex="9" class="checkbox" runat="server" />我已阅读并同意 <a class="book" target="_blank" href="/UserCenter/reg_agreement.aspx">《内蒙古电力（集团）有限责任公司人力资源招聘平台注册须知》</a></span>
                        </dd>
                        <dt class="error"></dt>
                        <dd class="long_02 error" id="agreementerr"></dd>
                        <dt>&nbsp;
                        </dt>
                        <dd class="long_02">
                            <asp:Button ID="btn_submit" runat="server" Text="立即注册" class="btn_reg" TabIndex="10" Style="color: #FFF;" OnClick="btn_submit_Click" OnClientClick="return chkRegisterSubmit();" />
                            已注册过的用户，请点击&nbsp;&nbsp;
                      <span class="btn_login"><a href="/UserCenter/login.aspx" style="color: #559F9C; text-decoration: none;">登&nbsp;&nbsp;&nbsp;录</a></span></dd>
                    </dl>
                </div>
            </div>
        </div>

        <div id="foot">
            <a href="http://www.impc.com.cn">内蒙古电力（集团）有限责任公司</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="/help/">联系我们</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">收藏本站</a><br>
        </div>
    </form>
    <script type="text/javascript">
        var xhr;
        var aCity = { 11: "北京", 12: "天津", 13: "河北", 14: "山西", 15: "内蒙古", 21: "辽宁", 22: "吉林", 23: "黑龙江", 31: "上海", 32: "江苏", 33: "浙江", 34: "安徽", 35: "福建", 36: "江西", 37: "山东", 41: "河南", 42: "湖北", 43: "湖南", 44: "广东", 45: "广西", 46: "海南", 50: "重庆", 51: "四川", 52: "贵州", 53: "云南", 54: "西藏", 61: "陕西", 62: "甘肃", 63: "青海", 64: "宁夏", 65: "新疆", 71: "台湾", 81: "香港", 82: "澳门", 91: "国外" }

        function createXHR() {
            if (window.XMLHttpRequest) { // Mozilla, Safari, ...
                xhr = new XMLHttpRequest();
            } else if (window.ActiveXObject) { // IE
                try {
                    xhr = new ActiveXObject("Microsoft.XMLHTTP");
                } catch (e) {
                    try {
                        xhr = new ActiveXObject("Msxml2.XMLHTTP");
                    } catch (e2) {
                        alert("您的浏览器有问题！");
                    }
                }
            }
        }
        var registerForm = new Validation("registerForm");
        //提交触发
        function chkRegisterSubmit() {
            //真实姓名
            if (!checkname(document.getElementById("name").value)) {
                return false;
            };
            //身份证号码
            if (!checkloginName(document.getElementById("loginName").value)) {
                return false;
            };
            //电子邮箱
            if (!checkEmail(document.getElementById("email").value)) {
                return false;
            };
            //邮箱验证码
           // if (!checkEmailcode(document.getElementById("emailcode").value)) {
             //   return false;
         //   };
            //手机号码
            if (!checkMobile(document.getElementById("mobile").value)) {
                return false;
            };
            //密码
            if (!checkpassword(document.getElementById("password").value)) {
                return false;
            };
            //密码确认
            if (!checkConfirm_password(document.getElementById("confirm_password").value)) {
                return false;
            };
            //验证码
            if (!checkRand(document.getElementById("rand").value)) {
                return false;
            };

            //同意
            if (!document.getElementById("agreement").checked) {
                document.getElementById("agreementerr").innerHTML = "抱歉，您必须在同意《内蒙古电力（集团）有限责任公司人力资源招聘平台注册须知》后，才能注册！";
                document.getElementById("agreementerr").style.color = 'red';
                return false;
            }
        }
        function checkname(realname) {
            var re = /^[\u2e80-\ufe4f]{1,9}[·]{0,1}[\u2e80-\ufe4f]{1,9}$/;
            if (realname == "") {
                document.getElementById("nameerr").innerHTML = "请输入真实姓名！";
                document.getElementById("nameerr").style.color = 'red';
                return false;
            } else if (realname.search(re) == -1) {
                document.getElementById("nameerr").innerHTML = "请采用身份证姓名！";
                document.getElementById("nameerr").style.color = 'red';
                return false;
            } else if (realname.length < 2 || realname.length > 11) {
                document.getElementById("nameerr").innerHTML = "请采用身份证姓名！";
                document.getElementById("nameerr").style.color = 'red';
                return false;
            } else {
                document.getElementById("nameerr").innerHTML = "";
                return true;
            }
        }
        function checkloginName(loginName) {
            document.getElementById("loginNameerr").innerHTML = "";
            if (loginName == "") {
                document.getElementById("loginNameerr").innerHTML = "请输入身份证号码！";
                document.getElementById("loginNameerr").style.color = 'red';
                return false;
            } else if (!checkID(loginName)) {
                document.getElementById("loginNameerr").innerHTML = "身份证号码填写有误！";
                document.getElementById("loginNameerr").style.color = 'red';
                return false;
            } else if (document.getElementById("name").value == "") {
                document.getElementById("nameerr").innerHTML = "请输入真实姓名！";
                document.getElementById("nameerr").style.color = 'red';
                return false;
            } else {
                var flag = false;
                var name = $("#name").val();
                var loginName = $("#loginName").val();
                var parm = 'action=validname&name=' + escape(name) + '&loginName=' + escape(loginName);
                getAjax('/Ajax/Common_UserValidate.ashx', parm, function (rs) {
                    if (parseInt(rs) == 1) {
                        document.getElementById("loginNameerr").innerHTML = "该用户已存在,姓名:" + name + "身份证号码:" + loginName + "&nbsp;&nbsp;&nbsp;<a href='/UserCenter/account_appeal.aspx' style='color:#0066CC;' target='_blank'>帐号申诉</a>";
                        document.getElementById("loginNameerr").style.color = 'red';
                        flag = false;
                    }
                    else {
                        flag = true;
                    }
                });
                return flag;
            }
        }
        function checkID(sId) {
            var iSum = 0
            var info = ""
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

        function checkpassword(password) {
            document.getElementById("passworderr").innerHTML = "";
            if (password == "") {
                document.getElementById("passworderr").innerHTML = "请输入密码！";
                document.getElementById("passworderr").style.color = 'red';
                return false;
            }
            if (password.length < 8 || password.length > 25) {
                document.getElementById("passworderr").innerHTML = "密码至少8个字符，可以使用字母、数字或符号！";
                document.getElementById("passworderr").style.color = 'red';
                return false;
            }
            var oneChar
            password = password.toString();
            password = password.toUpperCase();
            for (var i = 0; i < password.length; i++) {
                oneChar = password.charAt(i);
                if (oneChar < "0" || oneChar > "9") {//非数字
                    if (oneChar < "A" || oneChar > "Z") {//非字母
                        if (oneChar != "_" && oneChar != "-") {
                            document.getElementById("passworderr").innerHTML = "密码只能由英文、数字及'_'、'-'组成！";
                            document.getElementById("passworderr").style.color = 'red';
                            return false;
                        }
                    }
                }
            }
            return true;
        }
        function checkConfirm_password(confirm_password) {
            document.getElementById("confirm_passworderr").innerHTML = "";
            if (confirm_password == "") {
                document.getElementById("confirm_passworderr").innerHTML = "请确认密码！";
                document.getElementById("confirm_passworderr").style.color = 'red';
                return false;
            } else if (document.getElementById("password").value != confirm_password) {
                document.getElementById("confirm_passworderr").innerHTML = "两次输入的密码不一致！";
                document.getElementById("confirm_passworderr").style.color = 'red';
                return false;
            } else {
                document.getElementById("confirm_passworderr").innerHTML = "";
                return true;
            }
        }
        //邮件判断 并不能重复
        function checkEmail(email) {
            email = email.toLowerCase();
            $("#email").val(email);
            document.getElementById("emailerr").innerHTML = "";
            document.getElementById("emailerr").innerHTML.color = "red";
            if (email == "") {
                document.getElementById("emailerr").innerHTML = "请输入邮箱！";
                document.getElementById("emailerr").style.color = 'red';
                return false;
            } else if (email.search(/^\w+((-\w+)|(\.\w+))*\@[A-Za-z0-9]+((\.|-)[A-Za-z0-9]+)*\.[A-Za-z0-9]+$/) == -1) {
                document.getElementById("emailerr").innerHTML = "邮箱格式不正确！";
                document.getElementById("emailerr").style.color = 'red';
                return false;
            } else {
                var flag = false;
                var email = $("#email").val();
                var parm = 'action=validmail&email=' + escape(email);
                getAjax('/Ajax/Common_UserValidate.ashx', parm, function (rs) {
                    if (parseInt(rs) == 1) {
                        document.getElementById("emailerr").innerHTML = "该email已存在!";
                        document.getElementById("emailerr").style.color = 'red';
                        flag = false;
                    }
                    else {
                        flag = true;
                    }
                });
                return flag;
            }
        }

        function checkEmailcode(emailcode) {
            $("#emailcode").val(emailcode);
            document.getElementById("emailcodeerr").innerHTML = "";
            document.getElementById("emailcodeerr").innerHTML.color = "red";
            if (emailcode == "") {
                document.getElementById("emailcodeerr").innerHTML = "请输入邮箱验证码！";
                document.getElementById("emailcodeerr").style.color = 'red';
                return false;
            }
            else {
                var flag = false;
                var mobile = $("#emailcode").val();
                var email = $("#email").val();
                var parm = 'action=validemailcode&email=' + email + '&emailcode=' + escape(emailcode);
                getAjax('/Ajax/Common_UserValidate.ashx', parm, function (rs) {
                    if (parseInt(rs) == 1) {
                        document.getElementById("emailcodeerr").innerHTML = "邮箱验证码输入错误!";
                        document.getElementById("emailcodeerr").style.color = 'red';
                        flag = false;
                    }
                    else {
                        flag = true;
                    }
                });
                return flag;
            }
        }
        //手机号
        function checkMobile(mobile) {
            $("#mobile").val(mobile);
            document.getElementById("mobileerr").innerHTML = "";
            document.getElementById("mobileerr").innerHTML.color = "red";
            if (mobile == "") {
                document.getElementById("mobileerr").innerHTML = "请输入手机号码！";
                document.getElementById("mobileerr").style.color = 'red';
                return false;
            } else if (!(/^1[3|4|5|8|7][0-9]\d{8}$/.test(mobile))) {
                document.getElementById("mobileerr").innerHTML = "手机号码格式不正确！";
                document.getElementById("mobileerr").style.color = 'red';
                return false;
            } else {
                var flag = false;
                var mobile = $("#mobile").val();
                var parm = 'action=validmobile&mobile=' + escape(mobile);
                getAjax('/Ajax/Common_UserValidate.ashx', parm, function (rs) {
                    if (parseInt(rs) == 1) {
                        document.getElementById("mobileerr").innerHTML = "该手机号已存在!";
                        document.getElementById("mobileerr").style.color = 'red';
                        flag = false;
                    }
                    else {
                        flag = true;
                    }
                });
                return flag;
            }
        }

        function checkRand(rand) {
            document.getElementById("randerr").innerHTML = "";
            if (true) {
                if (rand == "") {
                    document.getElementById("randerr").innerHTML = "请输入验证码！";
                    document.getElementById("randerr").style.color = 'red';
                    return false;
                } else {
                    var rand = $("#rand").val();
                    var flag = false;
                    var parm = 'action=validrand&rand=' + escape(rand);
                    getAjax('/Ajax/Common_UserValidate.ashx', parm, function (rs) {
                        if (parseInt(rs) == 1) {
                            document.getElementById("randerr").innerHTML = "验证码输入不正确!";
                            document.getElementById("randerr").style.color = 'red';
                            flag = false;
                        }
                        else {
                            flag = true;
                        }
                    });
                    return flag;
                }
            }
        }
        function accountappeal() {
            window.location = "/UserCenter/account_appeal.aspx";
        }
    </script>
    <div style="display: none">
        <script type="text/javascript">var cnzz_protocol = (("https:" == document.location.protocol) ? " https://" : " http://"); document.write(unescape("%3Cspan id='cnzz_stat_icon_1254989109'%3E%3C/span%3E%3Cscript src='" + cnzz_protocol + "s11.cnzz.com/stat.php%3Fid%3D1254989109' type='text/javascript'%3E%3C/script%3E"));</script>
        <script>
            var _hmt = _hmt || [];
            (function () {
                var hm = document.createElement("script");
                hm.src = "//hm.baidu.com/hm.js?1472b8e4203a740c9c6e9ff75a48e07d";
                var s = document.getElementsByTagName("script")[0];
                s.parentNode.insertBefore(hm, s);
            })();
        </script>
    </div>
</body>

</html>

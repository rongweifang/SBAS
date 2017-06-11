<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="Zhaopin.UserCenter.login" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户登录 - 招聘平台-内蒙古电力（集团）有限责任公司</title>
    <link href="/themes/default/css/style.css" rel="stylesheet" type="text/css" />
    <script src="/scripts/jquery.js" type="text/javascript"></script>
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <script src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script src="/Scripts/FunctionJS.js" type="text/javascript"></script>
</head>
<body>
    <form id="loginForm" runat="server">
        <div id="wrap_login">
            <div id="head_02"></div>
            <div id="login_win">
                <div id="back_home">
                    <a href="/">招聘平台</a> &gt; 用户登录 
                </div>
                <div class="left">
                    <div class="list_02">
                        <dl>
                            <dt>真实姓名：</dt>
                            <dd>
                                <input id="name" name="name" type="text" value="" maxlength="20" onblur="this.style.border='#A0A0A0 1px solid';checkname(this.value)" tabindex="1" title="请输入注册时填写的姓名" onfocus="this.style.border='#006F6B 2px solid';" style="border: 1px solid rgb(160, 160, 160);" runat="server" />
                            </dd>
                            <dt class="error"></dt>
                            <dd class="long_02_error" id="nameerr" style="color: red;"></dd>
                            <dt>身份证号码：</dt>
                            <dd>
                                <input id="loginName" name="loginName" value="" maxlength="18" autocomplete="off" onblur="checkloginName(this.value);this.style.border='#A0A0A0 1px solid';" ondragenter="return false" oncontextmenu="return false" type="text" tabindex="2" title="请输入注册时填写的身份证号码" onfocus="this.style.border='#006F6B 2px solid';" runat="server" />
                            </dd>
                            <dt class="error"></dt>
                            <dd class="long_02_error" id="loginNameerr"></dd>
                            <dt>密码：</dt>
                            <dd>
                                <input id="password" name="password" value="" type="password" maxlength="26" onblur="checkpassword(this.value);this.style.border='#A0A0A0 1px solid';" ondragenter="return false" oncontextmenu="return false" onpaste="return false" tabindex="3" title="密码至少8个字符，由字母、数字或符号组成，请区分大小写" onfocus="this.style.border='#006F6B 2px solid';" runat="server" />
                                <input id="passwordHidden" name="passwordHidden" type="hidden" runat="server" />
                                <span><a href="/UserCenter/forget.aspx">忘记密码？</a></span></dd>
                            <dt class="error"></dt>
                            <dd class="long_02_error" id="passworderr"></dd>
                            <dt>验证码：</dt>
                            <dd>
                                <input name="rand" id="rand" maxlength="4" type="text" tabindex="4" class="verify" autocomplete="off" runat="server" />

                                <img src="/Ajax/Verify_code.ashx" id="Verify_codeImag" width="59" height="20" alt="点击切换验证码"
                                    title="点击切换验证码" style="margin-top: 0px; vertical-align: top; cursor: pointer;"
                                    onclick="ToggleCode(this.id, '/Ajax/Verify_code.ashx');return false;" /><span>  点击图片切换验证码</span></dd>
                            <dt class="error"></dt>
                            <dd class="long_02_error" id="randerr" runat="server"></dd>
                            <dt>&nbsp;</dt>
                            <dd>
                                <asp:Button ID="btn_Login" runat="server" Text="登  录" class="btn_reg" Style="color: #FFF;" OnClick="btn_Login_Click" OnClientClick="return chkLoginSubmit();" />
                            </dd>
                        </dl>
                    </div>
                </div>
                <div class="right">
                    <span><a href="/UserCenter/register_xz.aspx">没有开通，免费注册</a></span><br />
                    <br />

                    <span class="btn_reg_new" style="cursor: pointer;"><a href="/UserCenter/register_xz.aspx" style="color: #FFF">新用户注册</a></span>

                </div>
            </div>
            <div id="foot">
                <a href="http://www.impc.com.cn">内蒙古电力（集团）有限责任公司</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="/content/">联系我们</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">收藏本站</a><br>
            </div>
        </div>
        <script type="text/javascript">
            var xhr;
            var aCity = { 11: "北京", 12: "天津", 13: "河北", 14: "山西", 15: "内蒙古", 21: "辽宁", 22: "吉林", 23: "黑龙江", 31: "上海", 32: "江苏", 33: "浙江", 34: "安徽", 35: "福建", 36: "江西", 37: "山东", 41: "河南", 42: "湖北", 43: "湖南", 44: "广东", 45: "广西", 46: "海南", 50: "重庆", 51: "四川", 52: "贵州", 53: "云南", 54: "西藏", 61: "陕西", 62: "甘肃", 63: "青海", 64: "宁夏", 65: "新疆", 71: "台湾", 81: "香港", 82: "澳门", 91: "国外" };
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
            function chkLoginSubmit() {
                if (!checkname(document.getElementById("name").value)) {
                    return false;
                };
                if (!checkloginName(document.getElementById("loginName").value)) {
                    return false;
                };
                if (!checkpassword(document.getElementById("password").value)) {
                    return false;
                };
                if (!checkRand(document.getElementById("rand").value)) {
                    return false;
                };
            }
            function checkname(realname) {
                var re = /^[\u2e80-\ufe4f]{1,9}[·]{0,1}[\u2e80-\ufe4f]{1,9}$/;
                if (realname == "") {
                    document.getElementById("nameerr").innerHTML = "请输入注册时填写的姓名！";
                    document.getElementById("nameerr").style.color = 'red';
                    return false;
                } else if (realname.search(re) == -1) {
                    document.getElementById("nameerr").innerHTML = "请输入注册时填写的姓名！";
                    document.getElementById("nameerr").style.color = 'red';
                    return false;
                } else if (realname.length < 2 || realname.length > 11) {
                    document.getElementById("nameerr").innerHTML = "请输入注册时填写的姓名！";
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
                    document.getElementById("loginNameerr").style.color = 'red'
                    return false;
                } else {
                    return true;
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
                    document.getElementById("passworderr").innerHTML = "密码长度至少8个字符！";
                    document.getElementById("passworderr").style.color = 'red';
                    return false;
                }
                var oneChar
                password = password.toString();
                password = password.toUpperCase();
                for (var i = 0; i < password.length; i++) {
                    oneChar = password.charAt(i);
                    if (oneChar < "0" || oneChar > "9") {
                        if (oneChar < "A" || oneChar > "Z") {
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
                                flag=false;
                            }
                            else {
                                flag= true;
                            }
                        });
                        return flag;
                    }
                }
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
    </form>
</body>
</html>

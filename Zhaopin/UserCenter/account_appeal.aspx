<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="account_appeal.aspx.cs" Inherits="Zhaopin.UserCenter.account_appeal" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>帐号申诉</title>
    <style type="text/css" >
        <!--
        body, img, ul {
            margin: 0px;
            padding: 0px;
        }

        body {
            background-color: #fff;
        }

        .logo {
            width: 690px;
            margin: 10px auto;
            padding-top: 90px;
        }

        .clearit {
            clear: both;
        }

        .content_top {
            width: 665px;
            height: 40px;
            background-color: #006F6B;
            margin-top: 0px;
            margin-right: auto;
            margin-bottom: 0px;
            margin-left: auto;
            padding-left: 25px;
            font-size: 14px;
            font-weight: bold;
            line-height: 35px;
        }

        .content {
            width: 688px;
            overflow: hidden;
            padding-top: 10px;
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-top-style: solid;
            border-right-style: solid;
            border-bottom-style: none;
            border-left-style: solid;
            border-top-color: #006F6B;
            border-right-color: #006F6B;
            border-bottom-color: #006F6B;
            border-left-color: #006F6B;
            margin-top: 0px;
            margin-right: auto;
            margin-bottom: 0px;
            margin-left: auto;
        }

        .content_foot {
            width: 690px;
            height: 27px;
            background: url(/themes/default/images/login_04.gif);
            margin-top: 0px;
            margin-right: auto;
            margin-bottom: 0px;
            margin-left: auto;
        }

        .foot {
            width: 690px;
            text-align: center;
            font-size: 12px;
            line-height: 24px;
            color: #4e8c7c;
            font-family: Arial, Helvetica, sans-serif;
            margin-top: 0px;
            margin-right: auto;
            margin-bottom: 0px;
            margin-left: auto;
        }

        .forget_text {
            width: 100%;
            text-align: center;
            font-size: 12px;
            line-height: 20px;
            color: #999999;
        }

        .forget_texttwo {
            width: 100%;
            text-align: center;
            font-size: 12px;
            line-height: 20px;
            color: #999999;
        }

        .forget_lite {
            width: 370px;
            margin: 0px auto;
            overflow: hidden;
        }

            .forget_lite ul {
                list-style: none;
            }

                .forget_lite ul li {
                    width: 100%;
                    height: 45px;
                    overflow: hidden;
                    padding: 5px 0px;
                }

        .form01 {
            width: 100px;
            text-align: right;
            float: left;
            line-height: 26px;
            font-size: 12px;
            color: #4e8c7c;
        }

        .form02 {
            width: 250px;
            height: 45px;
            float: left;
        }

        .form03 {
            width: 200px;
            line-height: 26px;
            font-size: 12px;
            color: #c0c0c0;
        }

        .input {
            width: 165px;
            height: 22px;
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-top-style: solid;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            border-top-color: #b9b9b9;
            border-right-color: #d4d4d4;
            border-bottom-color: #e2e2e2;
            border-left-color: #d4d4d4;
            line-height: 22px;
        }

        .input02 {
            width: 75px;
            height: 22px;
            border-top-width: 1px;
            border-right-width: 1px;
            border-bottom-width: 1px;
            border-left-width: 1px;
            border-top-style: solid;
            border-right-style: solid;
            border-bottom-style: solid;
            border-left-style: solid;
            border-top-color: #b9b9b9;
            border-right-color: #d4d4d4;
            border-bottom-color: #e2e2e2;
            border-left-color: #d4d4d4;
            line-height: 22px;
        }

        .white, .white a:link, .white a:visited {
            font-size: 12px;
            font-weight: normal;
            color: #FFFFFF;
            text-decoration: none;
        }

            .white a:hover {
                font-size: 14px;
                font-weight: bold;
                color: #FFFF00;
                text-decoration: none;
            }

        .bule, .bule a:link, .bule a:visited {
            font-size: 12px;
            line-height: 24px;
            font-weight: normal;
            color: #0066CC;
            text-decoration: underline;
        }

            .bule a:hover {
                font-size: 12px;
                line-height: 24px;
                font-weight: normal;
                color: #666666;
                text-decoration: none;
            }

        .foot a {
            font-size: 12px;
            color: #006F6B;
            text-decoration: none;
        }
        -->
    </style>
</head>
<body>
    <form id="loginForm" runat="server">
        <div class="logo">
            <img src="/themes/default/images/main/logo.gif">
        </div>
        <div class="content_top white">
            <a href="/">返回首页</a>
        </div>
        <div class="content" style="height: 200px">
            <!--帐号申诉开始-->
            <div style="width: 918px; padding: 25px 25px 350px 25px; overflow: hidden; font-size: 12px; line-height: 30px; color: #0a7671;">
                如果您忘记身份证号、密码等，可以通过申诉进行找回，您可以通过以下方式进行找回：<br />
                1.将身份证复印件发送到impc@vip.126.com电子邮箱中，备注请说明找回原因。<br />
                2.可以通过拨打客服电话进行找回。
            </div>
            <!--帐号申诉开始容结束-->
        </div>
        <div class="content_foot"></div>
        <div class="foot"><a href="http://www.impc.com.cn">内蒙古电力（集团）有限责任公司</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="/help/">联系我们</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#">收藏本站</a><br>
        </div>
    </form>
</body>
</html>

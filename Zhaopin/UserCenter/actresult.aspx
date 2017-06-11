<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="actresult.aspx.cs" Inherits="Zhaopin.UserCenter.actresult" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>结果查询 - 我的消息 - 个人中心</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet">
    <link href="/themes/index/css/job.css" rel="stylesheet">
    <script language="JavaScript" src="/scripts/prototype_for_validation.js" type="text/javascript"></script>
    <script language="JavaScript" src="/scripts/effects.js" type="text/javascript"></script>
    <script language="JavaScript" src="/scripts/validation_cn.js" type="text/javascript"></script>
    <script language="JavaScript" src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script language="JavaScript" src="/scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
    <script type="text/javascript" src="/scripts/jquery.form.js"></script>
    <script language="JavaScript" src="/scripts/jquery.blockUI.js" type="text/javascript"></script>
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
    <script type="text/javascript" src="/scripts/RSA.js"></script>
    <script type="text/javascript" src="/scripts/BigInt.js"></script>
    <script type="text/javascript" src="/scripts/Barrett.js"></script>
</head>


<body>
    <form id="form1" runat="server">
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
                    <div class="righttopbj_text">成绩查询</div>
                    <div class="righttopbj_right"></div>
                </div>
                <div class="clearit"></div>
                <div class="line">
                    <div class="columnbj">
                        <div class="Form_left">
                            <ul class="gray30">
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="right_foot"></div>
            </div>
        </div>
        <div class="clearit"></div>
    </form>
    <uc1:foot runat="server" ID="foot" />
</body>
</html>

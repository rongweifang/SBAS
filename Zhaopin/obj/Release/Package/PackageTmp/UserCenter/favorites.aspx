<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="favorites.aspx.cs" Inherits="Zhaopin.UserCenter.favorites" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>我的收藏 - 我的求职 - 个人中心</title>
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
        /* 我的收藏 */
        .favoritesbj {
            width: 738px;
            height: 31px;
            background: url(/themes/default/images/me_icon_25.gif);
            border: solid 1px #c4c4c4;
            border-bottom: none;
            border-top: none;
        }

        .button01 {
            margin: 4px 0px 0px 4px;
            float: left;
            width: 59px;
            height: 23px;
            background: url(/themes/default/images/me_icon_26.gif);
        }

        .button02 {
            margin: 4px 0px 0px 4px;
            float: left;
            width: 59px;
            height: 23px;
        }
        -->
    </style>
    <script type="text/javascript">
        function deleteFavorites(favoriteId, bulletinId) {
            $.confirm("确定要删除该项收藏吗？", function () {
              
            });
        }
    </script>
</head>

<body>
    <form id="form1" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="location">
            <div class="location_left">
               <a href="/UserCenter/">个人中心</a> &gt;我的收藏
            </div>
            <div class="location_right"><a href="#" onclick="document.location.href='/'">返回首页</a></div>
        </div>
        <div class="clearit"></div>
        <div class="content">
            <uc1:employee_left runat="server" ID="employee_left" />
            <div class="right">
                <div class="righttopbj">
                    <div class="righttopbj_left"></div>
                    <div class="righttopbj_text">我的收藏</div>
                    <div class="righttopbj_right"></div>
                </div>

                <div class="right_foot"></div>
            </div>
        </div>
        <div class="clearit"></div>
    </form>
    <uc1:foot runat="server" ID="foot" />

</body>
</html>

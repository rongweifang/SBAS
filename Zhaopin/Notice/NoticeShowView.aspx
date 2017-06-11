<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NoticeShowView.aspx.cs" Inherits="Zhaopin.Notice.NoticeShowView" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/PageControl.ascx" TagPrefix="uc1" TagName="PageControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title><%=title %>-公司公告-招聘平台-内蒙古电力（集团）有限责任公司</title>
    <link href="/themes/default/css/style_others.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/job.css" rel="stylesheet" type="text/css" />
    <script src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:head runat="server" ID="head" />
        <div id="wrap">

            <div id="location">
                <div class="left"> <a href="/Notice/">公司公告</a>&gt;<%=title %></div>
            </div>
            <div id="main_content">

                <div class="list">
                    <div class="detail" _extended="true">
                        <h1 style="font-size: 18pt" _extended="true"><%=title %></h1>
                        <h2 _extended="true">发表日期：<%=pubdate %></h2>
                        <div style="padding-bottom: 5px; text-indent: 2em; padding-top: 20px; padding-left: 48px; padding-right: 48px" _extended="true">
                            <%=content %>
                        </div>
                        <div class="clear_line"></div>
                    </div>
                    <div class="clear_line"></div>
                </div>
            </div>
            <uc1:foot runat="server" ID="foot" />
    </form>
</body>
</html>

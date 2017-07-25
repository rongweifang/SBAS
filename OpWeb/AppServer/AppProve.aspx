<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppProve.aspx.cs" Inherits="OpWeb.AppServer.AppProve" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>已审批事项</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.flexslider.js"></script>
    <script src="js/effects.js"></script>
    <script src="js/jquery.tabify.js"></script>

    <script type="text/javascript">
        var $ = jQuery.noConflict();
        $(function () {
            $('#tabsmenu').tabify();
           
            $(".trigger").click(function () {
                $(this).toggleClass("active").next().slideToggle("slow");
                return false;
            });
        });
    </script>
    <!-- Hide Mobiles Browser Navigation Bar -->
    <script type="text/javascript">
        window.addEventListener("load", function () {
            // Set a timeout...
            setTimeout(function () {
                // Hide the address bar!
                window.scrollTo(0, 1);
            }, 0);
        });
    </script>
</head>
<body id="page">
    <form id="form1" runat="server">
        <div id="pagecontainer">

            <div id="header" class="black_gradient">
               
            </div>

            <div class="content">
                <div class="toogle_wrap">
                    <div class="toggle_container">
                        <%=sb.ToString() %>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>

        <div id="bottom_nav">
            <div class="icons_nav">
                <div class="paginated">
                    <ul class="slides">
                        <li>
                            <a href="Main.aspx" class="icon">
                                <img src="images/icons/icon_contact.png" alt="" title="" border="0" /><span>首页</span></a>
                            <a href="AppContract.aspx" class="icon">
                                <img src="images/icons/icon_services.png" alt="" title="" border="0" /><span>待审批</span></a>
                            <a href="AppProve.aspx" class="icon">
                                <img src="images/icons/icon_photos.png" alt="" title="" border="0" /><span>已审批</span></a>
                            <a href="MyCenter.aspx" class="icon">
                                <img src="images/icons/icon_clients.png" alt="" title="" border="0" /><span>我的</span></a>
                        </li>

                    </ul>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

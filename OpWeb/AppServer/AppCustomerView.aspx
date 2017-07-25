<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppCustomerView.aspx.cs" Inherits="OpWeb.AppServer.AppCustomerView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" charset="utf-8" content="width=device-width,initial-scale=1.0,maximum-scale=1.0,minimum-scale=1.0,user-scalable=1.0" />
    <script src="js/app.js"></script>
    <script type="text/javascript">
        var phoneWidth = parseInt(window.screen.width);
        var phoneScale = phoneWidth / 640;
        var ua = navigator.userAgent;
        if (/Android (\d+\.\d+)/.test(ua)) {
            var version = parseFloat(RegExp.$1);
            if (version > 2.3) {
                document.write('<meta name="viewport" content="width=640, minimum-scale = ' + phoneScale + ', maximum-scale = ' + phoneScale + ', target-densitydpi=device-dpi">');
            } else {
                document.write('<meta name="viewport" content="width=640, target-densitydpi=device-dpi">');
            }
        } else {
            document.write('<meta name="viewport" content="width=640, user-scalable=no, target-densitydpi=device-dpi">');
        }
        alert($(window).With());
    </script>
    <title>预览</title>
    <style>
        html, body {
            width: 100%;
            height: 100%;
            margin: 0;
            padding: 0;
            position: relative;
            overflow: hidden;
            font-family: Arial;
        }

        .viewport {
            width: <%=pageNum*100 %>%;
            height: 100%;
            display: -webkit-box;
            overflow: hidden;
            -webkit-transform: translate3d(0,0,0);
            backface-visibility: hidden;
            position: relative;
        }

        .PageBody {
            -webkit-box-flex: 1;
            width: 0;
            overflow: hidden;
        }

            .PageBody div {
                font-size: 0.7em;
            }

        .PageNum {
            width: 100%;
            text-align: center;
            line-height: 35px;
        }

        .MPage3 td {
            font-size: 0.5em;
            width: auto;
        }

        .pagenumber {
            display: -webkit-box;
            position: absolute;
            bottom: 2em;
            left: 35%;
            height: 2em;
            width: 30%;
        }

            .pagenumber div {
                -webkit-box-flex: 1;
                width: 0;
                position: relative;
            }

            .pagenumber .now:after {
                background: rgba(255,255,255,1) !important;
            }

            .pagenumber div:after {
                content: "";
                width: 8px;
                height: 8px;
                background: rgba(255,255,255,0.5);
                border-radius: 2em;
                position: absolute;
                top: 50%;
                left: 50%;
                margin-top: -0.2em;
                margin-left: -0.2em;
            }

        h1 {
            text-align: center;
            font-family: Microsoft YaHei,Arial;
            color: #000;
            font-size: 1.2em;
            font-weight: normal;
            padding: 1em 0;
            margin: 0;
        }

        button {
            width: 40%;
            margin: auto;
            height: 3em;
            background: #fff6de;
            line-height: 3rem;
            color: #000;
            padding: 0;
            border: none;
            display: block;
        }

        @media screen and (max-width: 360px) {
            html, body {
                font-size: 15px;
            }
        }

        @media screen and (min-width: 360px) and (max-width: 400px) {
            html, body {
                font-size: 16px;
            }
        }

        @media screen and (min-width: 400px) and (max-width: 460px) {
            html, body {
                font-size: 18px;
            }
        }

        @media screen and (min-width: 460px) {
            html, body {
                font-size: 24px;
            }
        }

        .MPage5 p {
            line-height: 150%;
            margin: 0;
            padding: 0;
        }

        .MPage6 td, .MPage6 p {
            line-height: 150%;
            margin: 0;
            padding: 0;
        }

        .MPage7 td, .MPage7 p {
            line-height: 130%;
            margin: 0;
            font-size: 0.6em;
            padding: 0;
            width: auto;
        }

        .MPage8 td, .MPage8 p {
            margin: 0;
            font-size: 0.7em;
            padding: 0;
            width: auto;
        }

        .MPage9 td, .MPage9 p {
            line-height: 150%;
            margin: 0;
            font-size: 0.7em;
            padding: 0;
            width: auto;
        }

        .MPage10 td, .MPage10 p {
            line-height: 130%;
            margin: 0;
            font-size: 0.7em;
            padding: 0;
            width: auto;
        }

        .MPage11 td, .MPage11 p {
            margin: 0;
            font-size: 0.7em;
            padding: 0;
            width: auto;
            clear: both;
            overflow:hidden;
        }

        .MPage11 label {
            float: left;
            display: inline;
        }

        .MPage11 u,.MPage11 span {
            width: auto;
            float: left;
            display: inline;
        }
        .MPage12 p,.MPage13 p,.MPage14 p,.MPage15 p,.MPage16 p ,.MPage17 p,.MPage18 p,.MPage19 p,.MPage20 p {
            line-height: 140%;
            margin: 0;
           
            padding: 0;
            width: auto;
        }
    </style>
    <script type="text/javascript">
        var html = document.querySelector('html');
        var rem = html.offsetWidth / 6.4;
        html.style.fontSize = rem + "px";



    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="viewport" class="viewport">
            <%=PageContent %>
        </div>
        <div class="pagenumber">
            <%=sbDiv.ToString() %>
        </div>
    </form>
</body>
</html>

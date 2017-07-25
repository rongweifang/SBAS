<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppCustomerFile.aspx.cs" Inherits="OpWeb.AppServer.AppCustomerFile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
     <meta name="viewport" content="width=device-width,initial-scale=1.0, minimum-scale=1.0, maximum-scale=1.0, user-scalable=no" />
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
    </script>
    <title>客户资料管理</title>
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/blueimp/css/blueimp-gallery.min.css" rel="stylesheet" />

    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script type="text/javascript">
        var html = document.querySelector('html');
        var rem = html.offsetWidth / 6.4;
        html.style.fontSize = rem + "px";
    </script>
    <style>
        .lightBoxGallery img {
            margin: 5px;
            width: 160px;
            max-height: 100px;
        }
    </style>
</head>
<body class="gray-bg">

    <div class="lightBoxGallery">
        <%=SM.ToString() %>

        <div id="blueimp-gallery" class="blueimp-gallery">
            <div class="slides"></div>
            <h3 class="title"></h3>
            <a class="prev">‹</a>
            <a class="next">›</a>
            <a class="close">×</a>
            <a class="play-pause"></a>
            <ol class="indicator"></ol>
        </div>
    </div>


  
    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>

  

    <!-- blueimp gallery -->
    <script src="/js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>


</body>
</html>

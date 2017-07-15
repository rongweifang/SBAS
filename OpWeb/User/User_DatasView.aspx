<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_DatasView.aspx.cs" Inherits="OpWeb.User.User_DatasView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>客户资料管理</title>
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/blueimp/css/blueimp-gallery.min.css" rel="stylesheet" />

    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />

    <style>
        .lightBoxGallery img {
            margin: 5px;
            width: 160px;
            max-height:100px;
        }
    </style>
</head>
<body class="gray-bg">
    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-lg-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
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
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>

    <!-- blueimp gallery -->
    <script src="/js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>

    <form id="form1" runat="server">
        <div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Finger.aspx.cs" Inherits="OpWeb.User.User_Finger" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>指纹采集</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <style type="text/css">
        .HandSelect {
            margin: 0px;
            padding: 5px;
        }

            .HandSelect ul {
                margin: 0px;
                padding: 0px;
                background: #f5e0cd;
            }

                .HandSelect ul li {
                    float: left;
                    list-style: none;
                    background: #f5e0cd;
                }

        .OperatPanel {
            padding: 5px;
            text-align: center;
        }

            .OperatPanel .FingerResult {
                float: left;
                width: 500px;
                padding-top: 5px;
                text-align: center;
            }

            .OperatPanel ul {
                padding-top: 20px;
                margin: 0px;
                float: right;
                width: 250px;
            }

                .OperatPanel ul li {
                    list-style: none;
                    line-height: 30px;
                    margin-top: 8px;
                }
    </style>
    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
    <!-- jQuery Validation plugin javascript-->
    <script src="/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/plugins/validate/messages_zh.min.js"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script language="javascript">

        var nBrowseType = 0;
        var Sys = {};
        var ua = navigator.userAgent.toLowerCase();
        var s;
        (s = ua.match(/msie ([\d.]+)/)) ? Sys.ie = s[1] :
            (s = ua.match(/firefox\/([\d.]+)/)) ? Sys.firefox = s[1] :
            (s = ua.match(/chrome\/([\d.]+)/)) ? Sys.chrome = s[1] :
            (s = ua.match(/opera.([\d.]+)/)) ? Sys.opera = s[1] :
            (s = ua.match(/version\/([\d.]+).*safari/)) ? Sys.safari = s[1] : 0;

        var BrowserStr;
        if (Sys.ie)
            BrowserStr = "(" + "IE " + Sys.ie + ")";
        else if (Sys.firefox)
            BrowserStr = "(" + "FireFox " + Sys.firefox + ")";
        else if (Sys.chrome)
            BrowserStr = "(" + "Chrome " + Sys.chrome + ")";
        else if (Sys.opera)
            BrowserStr = "(" + "Opera " + Sys.opera + ")";
        else if (Sys.safari)
            BrowserStr = "(" + "Safari " + Sys.safari + ")";
        else
            BrowserStr = "UnKonwn"


        function isIE() { //ie?
            if (!!window.ActiveXObject || "ActiveXObject" in window)
                return true;
            else
                return false;
        }


        function InitNetSsVerify() {
            if (isIE()) {
                TLFPAPICtrl.InitInstance("12345678912345678912345678912345");//初始化
                TLFPAPICtrl.SetFingerHasEnroll("<%=FingerList.ToString()%>")//设置显示已经注册哪些手指
                TLFPAPICtrl.SetHexFlg(1);//设置输出十六进制可见字符格式数据。
                TLFPAPICtrl.SetFPVersion(0);
            }
            else {
                document.getElementById('pluginobj').focus();
                pluginobj.InitInstance("12345678912345678912345678912345");//初始化
                pluginobj.SetFingerHasEnroll("<%=FingerList.ToString()%>")//设置显示已经注册哪些手指
                pluginobj.SetHexFlg("1");//设置输出十六进制可见字符格式数据。
                pluginobj.SetFPVersion("0");

            }
        }

        function InitFingerInfo() { //重新设置已注册手指
            if (isIE()) {
                TLFPAPICtrl.InitInstance("12345678912345678912345678912345");//初始化
                TLFPAPICtrl.SetHexFlg(1);//设置输出十六进制可见字符格式数据。
                TLFPAPICtrl.ShowPopupWindow();//弹出窗口
            }
            else {
                document.getElementById('pluginobj').focus();
                pluginobj.InitInstance("12345678912345678912345678912345");//初始化
                pluginobj.SetHexFlg("1");//设置输出十六进制可见字符格式数据。
                pluginobj.ShowPopupWindow();//弹出窗口
            }
        }


        function ParseOcxTemplate() {
            if (isIE()) {
                tp = FReg.U_FingerData.value;
                packData = TLFPAPICtrl.ParseOcxTemplate(tp);//IE浏览器获取指纹信息数据
                FReg.U_FingerOCX.value = packData;
            }
            else {
                tp = document.getElementById('U_FingerData').value;
                packData = pluginobj.ParseOcxTemplate(tp);//其他浏览器获取指纹信息数据
                document.getElementById('U_FingerOCX').value = packData;
            }
        }


        function HasGotFeatureEvent() {
            if (isIE()) {
                tp = TLFPAPICtrl.GetFingerPrintData();//IE浏览器获取指纹信息数据
                FReg.U_FingerData.value = tp;

                packData = TLFPAPICtrl.ParseOcxTemplate(tp);//IE浏览器获取指纹信息数据
                FReg.U_FingerOCX.value = packData;

            }
            else {
                tp = pluginobj.GetFingerPrintData();//其他浏览器获取指纹信息数据
                document.getElementById('U_FingerData').value = tp;

                packData = TLFPAPICtrl.ParseOcxTemplate(tp);//IE浏览器获取指纹信息数据
                document.getElementById('U_FingerOCX').value = packData;
            }
        }


        function addEvent(name, func)//其他浏览器添加事件
        {
            if (isIE()) {
                TLFPAPICtrl.focus();
            }
            else {
                var obj = document.getElementById('pluginobj');
                if (window.addEventListener) {
                    obj.addEventListener(name, func, false);
                }
                else {
                    obj.attachEvent(name, func);
                }
            }
        }
    </script>
</head>
<body onload="InitNetSsVerify();addEvent('GotFeatureEvent',HasGotFeatureEvent);">
    <div class="HandSelect">
        <div class="panel panel-default">
            <div class="panel-heading">
                【<b>选择手指</b>】--点击手指分别录入
            </div>
            <div class="panel-body">
                <div style="width: 100%; text-align: center;">
                    <object id='TLFPAPICtrl' name='TLFPAPICtrl' width="350" height="228" classid="CLSID:57FA9034-0DC3-4882-A932-DDDA228FEE05">
                        <param name="Token" value="12345678912345678912345678912345" />
                        <param name="CtrlType" value="register" />
                        <!—修改CtrlType此持久化参数值即可实现嵌入式与弹出式转换-->
                    <embed id="pluginobj" type="application/mozilla-TLFPAPICtrl-plugin" width="350" height="228"
                        token="12345678912345678912345678912345" ctrltype="register"><!—修改CtrlType此持久化参数值即可实现嵌入式与弹出式转换-->
                    </embed>
                    </object>
                    <script for="TLFPAPICtrl" event="GotFeatureEvent()" language="javascript">
                        HasGotFeatureEvent();
                    </script>
                </div>
                <div style="clear: both"></div>
                <div class="OperatPanel">
                    <form id="FReg" runat="server">
                        <input type="hidden" id="U_FingerData" runat="server" />
                        <input type="hidden" id="U_FingerOCX" runat="server" />
                        <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">确　定</asp:LinkButton>&nbsp;
                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取　消</button>
                    </form>
                </div>
            </div>

        </div>
    </div>
</body>
</html>

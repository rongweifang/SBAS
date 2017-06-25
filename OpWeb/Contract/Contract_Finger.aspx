<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_Finger.aspx.cs" Inherits="OpWeb.Contract.Contract_Finger" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>指纹录入</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
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
            BrowserStr = "UnKonwn";

        function isIE() { //ie?
            if (!!window.ActiveXObject || "ActiveXObject" in window)
                return true;
            else
                return false;
        }

        function InitNetSsVerify() {
            if (isIE()) {
                TLFPAPICtrl.InitInstance("12345678912345678912345678912345");//初始化
                //TLFPAPICtrl.SetFingerHasEnroll("L2R2")//设置显示已经注册哪些手指
                TLFPAPICtrl.SetHexFlg(1);//设置输出十六进制可见字符格式数据。
                TLFPAPICtrl.SetFPVersion(0);//设置SDK可见字符格式数据。
            }
            else {
                document.getElementById('pluginobj').focus();
                pluginobj.InitInstance("12345678912345678912345678912345");//初始化
                //pluginobj.SetFingerHasEnroll("L2R2")//设置显示已经注册哪些手指
                pluginobj.SetHexFlg("1");//设置输出十六进制可见字符格式数据。
                pluginobj.SetFPVersion("0");//设置SDK可见字符格式数据。
            }
        }
        //function InitFingerInfo() { //重新设置已注册手指
        //    if (isIE()) {
        //        TLFPAPICtrl.InitInstance("12345678912345678912345678912345");//初始化
        //        TLFPAPICtrl.SetFingerHasEnroll("L2R2")//设置显示已经注册哪些手指
        //        TLFPAPICtrl.SetHexFlg(1);//设置输出十六进制可见字符格式数据。
        //        TLFPAPICtrl.ShowPopupWindow();//弹出窗口
        //    }
        //    else {
        //        document.getElementById('pluginobj').focus();
        //        pluginobj.InitInstance("12345678912345678912345678912345");//初始化
        //        pluginobj.SetFingerHasEnroll("L2R2")//设置显示已经注册哪些手指
        //        pluginobj.SetHexFlg("1");//设置输出十六进制可见字符格式数据。
        //        pluginobj.ShowPopupWindow();//弹出窗口
        //    }
        //}
        
        function HasGotFeatureEvent() {
            if (isIE()) {
                tp = TLFPAPICtrl.GetFingerPrintData();//IE浏览器获取指纹信息数据
                img = TLFPAPICtrl.GetFingerPrintImage();
              
                FReg.FingerBase.value = tp;
                FReg.FingerImage.value = img;
            }
            else {
                tp = pluginobj.GetFingerPrintData();//其他浏览器获取指纹信息数据
                img = pluginobj.GetFingerPrintImage();
                document.getElementById('FingerBase').value = tp;
                document.getElementById('FingerImage').value = img;
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
    <script language="javascript" type="text/javascript">
        var obj;
        penwidth = 3;
        width = 420;
        height = 180;
        linespace = 55;
        lineNum = height / linespace;

        function PenInit() {
            obj = document.getElementById("HWPenSign");
            obj.HWSetBkColor(0xE0F8E0);
            obj.HWSetCtlFrame(2, 0x000000);
            obj.HWSetSeparatorLine(lineNum, 0x000000);
            obj.HWInitialize();
        }

        function SignConfirm() {
            var stream;
            stream = obj.HWGetBase64Stream(3);

            if (isIE()) {

                FReg.SignBase.value = stream;
            }
            else {
                document.getElementById('SignBase').value = stream;
            }
        }
        function loads()
        {
            addEvent('GotFeatureEvent', HasGotFeatureEvent);
            InitNetSsVerify();
            PenInit();
        }
        function unloads() {
            obj.HWFinalize();
        }
        function ChangeSelect(fid, fname) {
            $('#FID').val(fid);
            $('#LB_Finger').empty();
            $('#LB_Sign').empty();
            $('#LB_Finger').prepend(fname);
            $('#LB_Sign').prepend(fname);
            unloads();
            loads();
        }
    </script>
</head>
<body onload="loads()" onunload="unloads()">

    <div class="col-sm-12" style="height: 190px;">
        <asp:Repeater ID="rp_Item" runat="server">
            <ItemTemplate>
                <div class="file-box">
                    <div class="file">
                        <div class="file-name"><%#Eval("FingerName") %></div>
                        <div class="image">
                            <a onclick="ChangeSelect('<%#Eval("FID") %>','<%#Eval("FingerName") %>')">
                                <img alt="image" src="/img/Default_Fingerprint.png" width="100" height="100" /></a>
                        </div>
                        <div class="Sign">
                            <a onclick="ChangeSelect('<%#Eval("FID") %>','<%#Eval("FingerName") %>')">
                                <img src="data:image/png;base64,<%#Eval("SignBase").ToString()==""?"iVBORw0KGgoAAAANSUhEUgAAAGQAAAAoCAYAAAAIeF9DAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6NDFCMTQ2RUUyNDRGMTFFNzhEOURBNEVCN0YxRDcxOTIiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6NDFCMTQ2RUYyNDRGMTFFNzhEOURBNEVCN0YxRDcxOTIiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo0MUIxNDZFQzI0NEYxMUU3OEQ5REE0RUI3RjFENzE5MiIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDo0MUIxNDZFRDI0NEYxMUU3OEQ5REE0RUI3RjFENzE5MiIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PgniI+EAAAOXSURBVHja7FrRcdpAEBUZ/0fuQK7AcgUWn3xFVBBRgaECTAWCCoQrAH/xiVKBzxWgDnIdEGnm7fjlIjskOSRF3M7sAJLQifd23+6tPTgej56z7tgnB4EjxJkjxBHizBHSD7tqYpHRaPSvt5iWflv6qnTVFli73e5iMiT84FxQelp6fKa1/dLnWMdJFoB+KT2jYxG9T/E6K10jW2xadf/H0g94H8FbIeiqZTJ8IiIB4AmOXyNzJDMe6Nqi9K2F9TOs59EzxERGjkBQl5IhGcDnWlGRMsFrashaBcwShNgmY40gGBuZOr+UDElq6sLakCauLROc985ABt/7Cx2X4Oh9DQkR/QUiXn78N7wGiExNclGBuLGg7SmRUa1/R2SEqCdMlO57hkQAtgJjSATEAL1qb19RIxb4zgHX+RaykpsCbqMrMvZ07tFSneo0IaLJiqTJA/AKYE1xjqViYKmBSEmGbvH5c+lPRj2zKY+dlqwcWTE0OhcFufJJVvYWMsK0ivgbI/Kl5Q2JrFbI6NLG0KeOag1gIgBla0OoUa8kK5+M8yKh6zaB6AohKSJ0iQi9QxT7qDfpGdbU1D5vsaZqG4guEJLApeWVaJ3Bc9SVjUUJ80kSJ9h76C5EZtuEhCimBSQkRjYc4A9UcwTE0MKaB7xvXaK6RIi0v2u0vXt8nuJzQW1vTo2AzL3+prbEWCenljtB57fBuSP8O477TYIyaOKfHGrG7wkyQUA+4IcLOQp7BB6ZaNqTBFQHtt5pY/k5OippGmJjk6lBlPLeBoxyvJK0vI/jdynSGe09RDquIVsLuETv3vt5Erwy7pd4v06LzUx8oY3eBEQE1HKPaY61wPOY9Sbq28YwAmgiR2uj5ZQoDtHxaJorMQlLABtjU2cSLpkUYL3I2IdU9kySN6wp6H5NR6b7REiMzFDGxitA4V6BFJ+AnAHMAlJi7hmWH6w3NVpl6doUtbnZb56XbdxUS9wUIdt3xh8+wEtoXBLjx6c0xvhTU97bkPC1ZialKcsSkBviee6NedeyJiB6V9TZRFY0pEqKfgYwZmeU0P0J192IpDZR1Nv+i6GZASHqxrQGNGWZnBwenbibb8S6QEgIUL7WbPpCI6KfLcvHAvdVuK+GxOl3intvCQlpfuXXFOzciMwI195bJiRnSeqCtUVIQRGqTgB5ccaI7QwZjRV1Z//HLMuZI8QR4swR4ghx5ghxhDhzhFym/RBgAJJ5COOVqGTTAAAAAElFTkSuQmCC":Eval("SignBase") %>" width="100" height="40" /></a>
                        </div>
                    </div>
                </div>
            </ItemTemplate>
        </asp:Repeater>

    </div>
    <div style="clear: both"></div>
    <div style="width: 100%; padding-top: 10px; display: <% =_Vis%>;">
        <div class="col-sm-4" style="width: 340px; float: left">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <i class="fa fa-info-circle"></i>指纹采集区域-<span id="LB_Finger"><%=FistFingerName %></span>
                </div>
                <div class="panel-body">
                    <div style="text-align: center; height: 180px; width: 100%; vertical-align: middle;">
                        <object id='TLFPAPICtrl' name='TLFPAPICtrl' width="97" height="104" classid="CLSID:57FA9034-0DC3-4882-A932-DDDA228FEE05">
                            <param name="Token" value="12345678912345678912345678912345" />
                            <param name="CtrlType" value="Verify" />
                            <!—修改CtrlType此持久化参数值即可实现嵌入式与弹出式转换-->
                                <embed id="pluginobj" type="application/mozilla-TLFPAPICtrl-plugin" width="97" height="104"
                                    token="12345678912345678912345678912345" ctrltype="Verify"><!—修改CtrlType此持久化参数值即可实现嵌入式与弹出式转换-->
                                </embed>
                        </object>
                        <script for="TLFPAPICtrl" event="GotFeatureEvent()" language="javascript">
                            HasGotFeatureEvent();
                        </script>
                    </div>
                    <div style="width: 100%; text-align: center; margin-top: 15px">
                        <button type="button" class="btn btn-w-m btn-warning" onclick="InitNetSsVerify()">清除指纹</button>
                    </div>
                </div>
            </div>
        </div>
        <div class="col-sm-4" style="width: 610px; float: right">
            <div class="panel panel-info">
                <div class="panel-heading">
                    <i class="fa fa-info-circle"></i>签名区域-<span id="LB_Sign"><%=FistFingerName %></span>
                </div>
                <div class="panel-body">
                    <div style="width: 100%; height: 180px; text-align: center;">
                        <object id="HWPenSign" name="HWPenSign" classid="clsid:E8F5278C-0C72-4561-8F7E-CCBC3E48C2E3" width="420" height="180"></object>
                    </div>
                    <div style="width: 100%; text-align: center; margin-top: 15px;">
                        <button type="button" class="btn btn-w-m btn-warning" onclick="obj.HWClearPenSign()">清除签名</button>&nbsp;
                      <button type="button" class="btn btn-w-m btn-success" onclick="SignConfirm()" style="display: none;">确　　定</button>
                    </div>
                </div>
            </div>
        </div>
        <div style="clear: both"></div>
    </div>
    <form id="FReg" runat="server">
        <div style="width: 100%; text-align: center">
            <input type="hidden" id="FID" runat="server" />
            <input type="hidden" id="FingerBase" runat="server" />
            <input type="hidden" id="SignBase" runat="server" />
            <input type="hidden" id="FingerImage" runat="server" />
            <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click" OnClientClick="SignConfirm()">保　存</asp:LinkButton>&nbsp;
         <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取　消</button>
        </div>
    </form>
</body>
</html>

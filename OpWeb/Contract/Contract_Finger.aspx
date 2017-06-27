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
                                 <img src="data:image/png;base64,<%#Eval("FingerImage").ToString()==""?"iVBORw0KGgoAAAANSUhEUgAAAGQAAABkCAYAAABw4pVUAAAAGXRFWHRTb2Z0d2FyZQBBZG9iZSBJbWFnZVJlYWR5ccllPAAAAyJpVFh0WE1MOmNvbS5hZG9iZS54bXAAAAAAADw/eHBhY2tldCBiZWdpbj0i77u/IiBpZD0iVzVNME1wQ2VoaUh6cmVTek5UY3prYzlkIj8+IDx4OnhtcG1ldGEgeG1sbnM6eD0iYWRvYmU6bnM6bWV0YS8iIHg6eG1wdGs9IkFkb2JlIFhNUCBDb3JlIDUuMy1jMDExIDY2LjE0NTY2MSwgMjAxMi8wMi8wNi0xNDo1NjoyNyAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczp4bXBNTT0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL21tLyIgeG1sbnM6c3RSZWY9Imh0dHA6Ly9ucy5hZG9iZS5jb20veGFwLzEuMC9zVHlwZS9SZXNvdXJjZVJlZiMiIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENTNiAoV2luZG93cykiIHhtcE1NOkluc3RhbmNlSUQ9InhtcC5paWQ6MUQyMTlDQTEyNDRGMTFFN0ExNkRDQThBMTUxMkVEM0EiIHhtcE1NOkRvY3VtZW50SUQ9InhtcC5kaWQ6MUQyMTlDQTIyNDRGMTFFN0ExNkRDQThBMTUxMkVEM0EiPiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDoxRDIxOUM5RjI0NEYxMUU3QTE2RENBOEExNTEyRUQzQSIgc3RSZWY6ZG9jdW1lbnRJRD0ieG1wLmRpZDoxRDIxOUNBMDI0NEYxMUU3QTE2RENBOEExNTEyRUQzQSIvPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/Pq1RKeUAACXXSURBVHjarJ1p0F1F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+wJQyFmoeYcddujQc4gingeZWlaKMPoEoYhiuAMuI93M34g7lTrI+elPf5rH32233bo3vvGNGUHcj3G7WkioFYEe4q6+vgT26f424GKSKGkLfRHNylqcaKyZ1/KqGRwgoxeuvPLK7vbbb8+LB7j8DzAB9i677NK94hWvyEBC/oOEKI4i5cfxNYnlHBNGf/jDH7pf/OIXmTseeOCBPA7ym7a33nprt3Llyu6AAw7oDj744FntAFwGwlv5+aHfrbSE65EIEzFtOUkTfpYGDlwzCWshiJZo6nMPYpH+r7766u6KK67ImUjkOtewoJCle++9d7fXXntlMcI9o6Xoklao3XtR1LkuELx8+fJuzz33zGPec889mRDQVSCLcXnue9/7Xr72tre9rdt3333zs4ixWri8FkIZE1z1bxEy/fvZSb86ZMhbbsWfWnpnakl0X//617OIYhIAAkCz4De84Q2ZOl/ykpfke4qdKEajM6io6usuEOhXHYIYA7A8A6cdeOCBGeA///nPu2uvvba76667cp/M8f777+++/OUvZw5++9vfnttLDDX/pET5rWhFi7gnrUDefByjUnsplUWxwK9+9auZOuEUAADQQcBhhx2Ww9KILa5BtX39oykLt6xZsyYDCZ0AoGOGDm4A0YyhSFLZKxJ5DtG5YsWKLBZvu+227vLLL8/6Rt327W9/O2f6jjvuuBwMZE4tidAKD7Xy+bGWgGuTVmavZUcPmXOKC4CC7AYZyHEWB3C495a3vKV705velK8BWClRceMctKIQdXffffcMEXrfZjB1DhkTIsAIwJx/8YtfnPWC6QQdRPpAn8GdtPn+97+f9QlzA6EofcY68cQTs1GBXqkFEFt6s5YO6MM9GzwlxTg2DVpLxggggAJHXHjhhdnKYZEsEEC9613vynKdtpH6SsgHkFAxMh5gAvRWzgQugItwKgEqVI9hgH5iTPUlbUEMHEHE4thjj80IRL/RB4Ry7733dueee273/ve/PzuVkXuHzNshnVNqN1eLopaw3Io/9Z8jbMFiLrjgggwcxBGOGtbTqaeemoGjbIf6ESEAAIrtEwlIQxwBSONSjEWfAJsvSKONjh7trJwB6ChrdAPA7juX9O88DjrooO4DH/hARhA6jL5/97vf5XVgPkNUffegFExshV5K1702aYWJW9is2eN8WQym5TnnnJPlMpwC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":Eval("FingerImage") %>" width="100" height="100" /></a>
                     
                                <%--<img alt="image" src="/img/Default_Fingerprint.png" width="100" height="100" /></a>--%>
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

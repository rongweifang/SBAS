<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppCustomer.aspx.cs" Inherits="OpWeb.AppServer.AppCustomer" %>

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
    <title>待审批事项</title>
    <link rel="stylesheet" href="style.css" type="text/css" media="screen" />
    <script src="js/jquery.min.js"></script>
    <script src="js/jquery.flexslider.js"></script>
    <script src="js/effects.js"></script>
    <script src="js/jquery.tabify.js"></script>

    <style>
        #signature {
            border: 1px dotted black;
            background-color: lightgrey;
            padding-top: 15px;
            padding-bottom: 15px;
            height: 160%;
            width: 160%;
        }

        .toggle_container li {
            line-height: 230%;
        }

        .btn {
            height: 30px;
            padding-left: 10px;
            padding-right: 10px;
            background: #3d9db3;
            border: none;
            color: white;
        }

        .btnSubmit {
            width: 32.5%;
            height: 100%;
            border: none;
            background: #3d9db3;
        }
    </style>

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
    <script type="text/javascript">
        var html = document.querySelector('html');
        var rem = html.offsetWidth / 6.4;
        html.style.fontSize = rem + "px";
    </script>
</head>
<body id="page">
    <form id="form1" runat="server">
        <div id="pagecontainer">

            <div id="header" class="black_gradient">
                <a class="call_button">我的审批</a>
            </div>
            <div style="clear: both"></div>
            <div class="content">
                <div class="toogle_wrap">
                    <div class="toggle_container">
                        <ul>
                            <li>
                                <label class="control-label">我的意见：</label></li>
                            <li>
                                <textarea name="Operat" rows="4" id="Operat" runat="server" style="width: 97%"></textarea>
                            </li>
                            <li>签名区域</li>
                            <li>
                                <div id="signature"></div>
                                <input id="SignBase" type="hidden" value="" runat="server" /></li>
                            <li style="padding-top: 15px; text-align: center">
                                <button type="button" class="btn btn-w-m btn-warning" onclick="ClearSign();">清除签名</button>&nbsp;
                                <asp:Button ID="Btn_NoPass" runat="server" class="btn btn-w-m btn-warning" OnClientClick="return CheckSign();" Text="不通过" OnClick="Btn_NoPass_Click" />&nbsp;
                                <asp:Button ID="Btn_Pass" class="btn btn-w-m btn-primary" runat="server" OnClientClick="return CheckSign();" Text="审批通过" OnClick="Btn_Pass_Click" /></li>
                        </ul>
                    </div>
                </div>
                <div class="clear"></div>
            </div>
        </div>

        <div id="bottom_nav">
            <div class="icons_nav">
                <div class="paginated" style="padding: 0; margin: 0;">
                    <ul class="slides" style="padding: 0; margin: 0;">
                        <li style="height: 40px; padding: 0; margin: 0;">
                            <button type="button" class="btnSubmit" onclick="window.open('AppCustomerView.aspx?UID=<%=UID %>');">合同详细</button>
                            <button type="button" class="btnSubmit" onclick="window.open('AppCustomerFile.aspx?Card_ID=<%=Card_ID %>');">文件资料</button>
                            <button type="button" class="btnSubmit" onclick="window.open('AppContract.aspx');">返&nbsp;&nbsp;回</button>


                        </li>
                    </ul>
                </div>
            </div>
        </div>
        <script src="libs/jSignature.min.noconflict.js"></script>
        <script>

            $(document).ready(function () {

                var $sigdiv = $("#signature").jSignature({ 'UndoButton': true });
            });

            function ClearSign() {
                var $sigdiv = $("#signature");
                $sigdiv.jSignature("reset");
            }
            function CheckSign() {

                if ($("#Undo").css("display") == 'none') {
                    layer.msg('签名未识别，请重新签名');
                    return false;
                }
                else {
                    var $sigdiv = $("#signature");
                    var datapair = $sigdiv.jSignature("getData", "default")
                    $("#SignBase").val(datapair);
                }


            }
        </script>
    </form>
</body>
</html>

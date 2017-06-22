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
</head>
<body>
    <form id="form1" runat="server">
        <div class="HandSelect">
            <div class="panel panel-default">
                <div class="panel-heading">
                    【<b>选择手指</b>】--点击手指分别录入
              </div>
                <div class="panel-body">
                    <ul>
                        <li><img src="../img/Hand_L_1.png" width="104" height="403" alt=""/></li>
                        <li><img src="../img/Hand_L_2.png" width="68" height="403" alt=""/></li>
                        <li><img src="../img/Hand_L_3.png" width="57" height="403" alt=""/></li>
                        <li><img src="../img/Hand_L_4.png" width="52" height="403" alt=""/></li>
                        <li><img src="../img/Hand_L_5.png" width="82" height="403" alt=""/></li>
						<li><img src="../img/Hand_R_1.png" width="100" height="403" alt=""/></li>
                   <li><img src="../img/Hand_R_2.png" width="49" height="403" alt=""/></li>
                   <li><img src="../img/Hand_R_3.png" width="66" height="403" alt=""/></li>
                   <li><img src="../img/Hand_R_4.png" width="64" height="403" alt=""/></li>
                   <li><img src="../img/Hand_R_5.png" width="84" height="403" alt=""/></li>
                    </ul>
                </div>

            </div>
        </div>
        <div style="clear: both"></div>
        <div class="OperatPanel">
            <div class="FingerResult">
                <object id='TLFPAPICtrl' name='TLFPAPICtrl' width="350" height="228" classid="CLSID:57FA9034-0DC3-4882-A932-DDDA228FEE05">
                    <param name="Token" value="12345678912345678912345678912345" />
                    <param name="CtrlType" value="register" />
                    <!—修改CtrlType此持久化参数值即可实现嵌入式与弹出式转换-->
                    <embed id="pluginobj" type="application/mozilla-TLFPAPICtrl-plugin" width="350" height="228"
                        token="12345678912345678912345678912345" ctrltype="register"><!—修改CtrlType此持久化参数值即可实现嵌入式与弹出式转换-->
                    </embed>
                </object>
            </div>
            <ul>
                <li>
                    <button type="button" class="btn btn-w-m btn-success">确　定</button></li>
                <li>
                    <button type="button" class="btn btn-w-m btn-warning">取　消</button></li>
            </ul>
            <div style="clear:both"></div>
        </div>
    </form>
</body>
</html>

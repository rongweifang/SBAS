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

</head>
<body>
    <form id="form1" runat="server">
        <div class="col-sm-12" style="height:190px;">
            <asp:Repeater ID="rp_Item" runat="server">
                <ItemTemplate>
                    <div class="file-box">
                        <div class="file">
                            <div class="file-name"><%#Eval("FingerName") %></div>
                            <div class="image">
                                <img alt="image" src="/img/Default_Fingerprint.png" width="100" height="100" />
                            </div>
                            <div class="Sign">
                                <img alt="image" src="/img/Default_Signature.png" width="100" height="40" />
                            </div>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:Repeater>

        </div>
        <div style="clear: both"></div>
        <div style="width: 100%; padding-top: 10px;">
            <div class="col-sm-4" style="width: 340px; float:left">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <i class="fa fa-info-circle"></i>指纹采集区域
                    </div>
                    <div class="panel-body" style="height: 360px;">
                        <div style="text-align: center;width: 100%;padding-top: 50px;padding-bottom: 50px;">
                        	<object id='TLFPAPICtrl' name='TLFPAPICtrl' width="97" height="104" classid="CLSID:57FA9034-0DC3-4882-A932-DDDA228FEE05">
        <param name="Token" value="12345678912345678912345678912345" />
        <param name="CtrlType" value="Verify" />
        <!—修改CtrlType此持久化参数值即可实现嵌入式与弹出式转换-->
<embed id="pluginobj" type="application/mozilla-TLFPAPICtrl-plugin" width="97" height="104" 
 Token="12345678912345678912345678912345" CtrlType="Verify"><!—修改CtrlType此持久化参数值即可实现嵌入式与弹出式转换-->
</embed>
</object>

                        </div>
                        <div style="width: 100%; text-align: center;margin-top: 91px ">
                        	  <button type="button" class="btn btn-w-m btn-primary">打开设备</button>
                        	   <button type="button" class="btn btn-w-m btn-info">保存指纹</button>
                        </div>
                    </div>

                </div>
            </div>
            <div class="col-sm-4" style="width: 610px;float:right">
                <div class="panel panel-info">
                    <div class="panel-heading">
                        <i class="fa fa-info-circle"></i>签名区域
                    </div>
                    <div class="panel-body" style="height: 360px;">
                        <div style="width: 100%;text-align: center;padding-top: 10px;padding-bottom: 10px;">
                        	<object id="HWPenSign"
                    name="HWPenSign"
                    classid="clsid:E8F5278C-0C72-4561-8F7E-CCBC3E48C2E3"
                    width="500"
                    height="275">
              </object>
                        	
                        </div>
                        <div style="width: 100%; text-align: center;">
                        	 <button type="button" class="btn btn-w-m btn-primary">打开设备</button>
                       	    <button type="button" class="btn btn-w-m btn-warning">清除签名</button>
                        	   <button type="button" class="btn btn-w-m btn-info">保存签名</button>
                        	
                        </div>
                    </div>

                </div>
            </div>
        </div>

    </form>
</body>
</html>

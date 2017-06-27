﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Photo.aspx.cs" Inherits="OpWeb.User.User_Photo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>身份证拍照</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <style type="text/css">
        .CamMenu {
            line-height: 35px;
            margin: 10px;
            padding: 8px;
            padding-left: 15px;
        }

            .CamMenu li {
                list-style: none;
                margin-top: 10px;
            }
    </style>
    <script type="text/javascript">

        var fingerTempl;
        var fingerflag;
        var faceTempl;
        var faceflag;

        function Load() {
            show.InitFingerMgr();
            show.InitFaceMgr();
            show.OpenIdCard();
            show.SetGetFingerTemplTimes(1);
            OpenDevice1();
        }

        function OpenDevice1() {
            show.CloseDevice();
            show.OpenDevice(1);
            show.OpenVideo();
        }

        function Unload() {
            CloseDevice();
            show.CloseIdCard();
            show.DeinitFaceMgr();
            show.DeinitFingerMgr();
        }

        function CloseDevice() {
            show.CloseDevice();
        }
        function Deskew() {
            show.Deskew();
        }
        function UnDeskew() {
            show.UnDeskew();
        }

        function Base64_Front() {
            var name = show.GetTempFileName(".jpg");
            show.Capture(name);
            //alert(show.GetBase64(name));
            $("#ID01").val(show.GetBase64(name));
            $("#ID01_IMG").attr('src', 'data:image/jpg;base64,' + show.GetBase64(name));
            show.DeleteFile(name);
        }
        function Base64_Reverse() {
            var name = show.GetTempFileName(".jpg");
            show.Capture(name);
            $("#ID02").val(show.GetBase64(name));
            $("#ID02_IMG").attr('src', 'data:image/jpg;base64,' + show.GetBase64(name));
            show.DeleteFile(name);
        }
        //reverse
    </script>

</head>
<body onload="Load();OpenDevice1()" onunload="Unload()">
    <table width="690" border="0" cellspacing="3" cellpadding="3">
        <tbody>
            <tr>
                <td width="500" height="375" style="background: #fcf8e3">
                    <object id="show" classid="clsid:E77E4CC8-E879-4A72-850A-B824742EC5B7" width="500" height="375">
                    </object>
                </td>
                <td>
                    <ul class="CamMenu">
                        <li>
                            <button type="button" class="btn btn-w-m btn-primary" onclick="OpenDevice1()">打开设备 </button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-w-m btn-primary" onclick="Deskew()">纠偏裁边 </button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-w-m btn-primary" onclick="UnDeskew()">取消纠裁 </button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-w-m btn-primary" onclick="Base64_Front()">拍照-正面</button></li>
                        <li>
                            <button type="button" class="btn btn-w-m btn-primary" onclick="Base64_Reverse()">拍照-背面</button></li>
                    </ul>
                </td>
            </tr>

            <tr>
                <td colspan="2" style="padding-left: 150px">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left: 150px">
                    <table width="360" border="0" cellspacing="3" cellpadding="3">
                        <tbody>
                            <tr>
                                <td height="120" width="20" style="text-align: center">身份证正面</td>
                                <td width="160" style="background: #F5F5F5">
                                    <img id="ID01_IMG" src="<%=ID01Data %>" width="160" height="120" /></td>
                                <td width="20" style="text-align: center">身份证背面</td>
                                <td width="160" style="background: #F5F5F5">
                                    <img id="ID02_IMG" src="<%=ID02Data %>" width="160" height="120" /></td>
                            </tr>
                        </tbody>
                    </table>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center; padding-top: 10px;">
                    <form id="form1" runat="server">
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <input type="hidden" id="ID01" runat="server"/>
                                <input type="hidden" id="ID02" runat="server"/>
                                <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">下一步</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                            </div>
                        </div>
                    </form>
                </td>
            </tr>
        </tbody>
    </table>


</body>
</html>

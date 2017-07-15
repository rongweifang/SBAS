<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_DatasForm.aspx.cs" Inherits="OpWeb.User.User_DatasForm" %>

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
    <!-- 全局js -->
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
    <script type="text/javascript">

        function OpenDevice1() {
            show.CloseDevice();
            show.OpenDevice(1);
            show.OpenVideo();
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
        function RotateLeft() {
            show.RotateLeft();
        }
        function RotateRight() {
            show.RotateRight();
        }

        function Base64_Front() {
            var name = show.GetTempFileName(".jpg");
            show.Capture(name);
            $("#PhotoBase").val(show.GetBase64(name));
            $("#PhotoBase_IMG").attr('src', 'data:image/jpg;base64,' + show.GetBase64(name));
            show.DeleteFile(name);
        }

    </script>

</head>
<body onload="OpenDevice1()" onunload="CloseDevice()">
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
                            <button type="button" class="btn btn-w-m btn-primary" onclick="RotateLeft()">向左旋转 </button>
                        </li>
                         <li>
                            <button type="button" class="btn btn-w-m btn-primary" onclick="RotateRight()">向右旋转 </button>
                        </li>
                        <li>
                            <button type="button" class="btn btn-w-m btn-primary" onclick="Base64_Front()">拍　　照</button></li>
                        <li></li>
                    </ul>
                </td>
            </tr>

            <tr>
                <td colspan="2" style="padding-left: 150px">&nbsp;</td>
            </tr>
            <form id="form1" runat="server">
                <tr>
                    <td colspan="2" style="padding-left: 150px">
                        <table width="360" border="0" cellspacing="3" cellpadding="3">
                            <tbody>
                                <tr>
                                    <td height="120" width="20" style="text-align: center">拍照结果</td>
                                    <td width="160" style="background: #F5F5F5">
                                        <img id="PhotoBase_IMG" src="<%=PictureData %>" width="160" height="120" /></td>
                                    <td height="120" width="20" style="text-align: center">照片描述</td>
                                    <td width="160" style="background: #F5F5F5">
                                        <textarea id="PhotoMemo" runat="server" style="width: 155px; height: 115px;"></textarea></td>
                                </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 10px;">

                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <input type="hidden" id="PhotoBase" runat="server" /><input type="hidden" id="Card_ID" runat="server" />
                                <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">保  存</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                            </div>
                        </div>

                    </td>
                </tr>
            </form>
        </tbody>
    </table>
</body>
</html>

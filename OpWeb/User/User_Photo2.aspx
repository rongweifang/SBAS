<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Photo2.aspx.cs" Inherits="OpWeb.User.User_Photo2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>现场拍照</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
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

        function OpenDevice() {
            show.CloseDevice();
            show.OpenDevice(2);
            show.OpenVideo();
        }

        function CloseDevice() {
            show.CloseDevice();
        }

        function Base64_Photo() {
            var name = show.GetTempFileName(".jpg");
            show.Capture(name);
            //alert(show.GetBase64(name));

            //$('input:SPhoto:checked').val();
            //$("input[type='radio']:checked").val();
            //$("input[name='SPhoto']:checked").val();

            var sl = $("input[name='SPhoto']:checked").val();

            $("#" + sl + "").val(show.GetBase64(name));
            $("#" + sl + "_IMG").attr('src', 'data:image/jpg;base64,' + show.GetBase64(name));
            show.DeleteFile(name);
        }

    </script>
</head>
<body onload="OpenDevice()" onunload="CloseDevice()">

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
                            <button type="button" class="btn btn-w-m btn-danger" onclick="OpenDevice1()">打开设备</button></li>

                    </ul>

                    <ul class="CamMenu" style="border: #7E7C7C thick">
                        <li></li>
                        <li>
                            <label>
                                <input type="radio" value="SceneHead" name="SPhoto" />
                                <i></i>现场拍照</label></li>
                        <li>
                            <label>
                                <input type="radio" checked="" value="SceneWorker" name="SPhoto" />
                                <i></i>工作人员合影</label></li>
                        <li>
                            <label>
                                <input type="radio" value="SceneGroup" name="SPhoto" />
                                <i></i>夫妻合影</label></li>

                    </ul>
                    <ul class="CamMenu">
                        <li>
                            <button type="button" class="btn btn-w-m btn-primary" onclick="Base64_Photo()">拍　　照</button></li>
                    </ul>
                </td>
            </tr>

            <tr>
                <td colspan="2" style="padding-left: 150px">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2" style="padding-left: 70px">
                    <table width="500" border="0" cellspacing="3" cellpadding="3">
                        <tbody>
                            <tr>
                                <td height="120" width="20" style="text-align: center">现场拍照</td>
                                <td width="160" style="background: #F5F5F5">
                                    <img id="SceneHead_IMG" src="<%=SceneHeadData %>" width="160" height="120" /></td>
                                <td width="20" style="text-align: center">工作人员</td>
                                <td width="160" style="background: #F5F5F5">
                                    <img id="SceneWorker_IMG" src="<%=SceneWorkerData %>" width="160" height="120" /></td>
                                <td width="20" style="text-align: center">夫妻合影</td>
                                <td width="160" style="background: #F5F5F5">
                                    <img id="SceneGroup_IMG" src="<%=SceneGroupData %>" width="160" height="120" /></td>
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
                                <input type="hidden" id="SceneHead" runat="server" />
                                <input type="hidden" id="SceneWorker" runat="server" />
                                <input type="hidden" id="SceneGroup" runat="server" />
                                <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">完　成</asp:LinkButton>&nbsp;
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

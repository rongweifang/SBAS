<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PhotoUpload.aspx.cs" Inherits="Zhaopin.UserCenter.PhotoUpload" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
     <title>个人中心 - 简历登记 - 个人信息</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/job.css" rel="stylesheet" type="text/css" />
    <script src="/scripts/prototype_for_validation.js" type="text/javascript"></script>
    <script src="/scripts/effects.js" type="text/javascript"></script>
    <script src="/scripts/validation_cn.js" type="text/javascript"></script>
    <script src="/scripts/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script src="/scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
    <script type="text/javascript" src="/scripts/jquery.form.js"></script>
    <script src="/scripts/jquery.blockUI.js" type="text/javascript"></script>
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <link href="/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/Scripts/ShowMsg/msgbox.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/ShowMsg/msgbox.js" type="text/javascript"></script>
    <script src="/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.selectbox.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="viewPhoto" class="ui-dialog-content ui-widget-content" style="padding:10px;">
                <div class="upload_photos">
                    <ul>
                        <li>选择照片：<asp:FileUpload ID="FileUpload1" runat="server" class="validate-file-png-jpg input2" />
                            <br />
                            <br />
                        </li>
                        <li class="gray">请上传格式为.jpg，尺寸为240*320像素，大小在0-60K之间的<br>
                            本人照片。照片必须是近期正面免冠彩色头像，着正式服装，要求人像清晰。
                        </li>
                        <li style="text-align: center;">
                            <asp:Button ID="Button1" runat="server" Text="上传" CssClass="btnsubmit" OnClick="Button1_Click1" />
                        </li>
                    </ul>
                </div>

            </div>
    </form>
</body>
</html>

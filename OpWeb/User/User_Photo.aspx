<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Photo.aspx.cs" Inherits="OpWeb.User.User_Photo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>身份证拍照</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
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
</head>
<body>
    <form id="form1" runat="server">
        <table width="690" border="0" cellspacing="3" cellpadding="3">
            <tbody>
                <tr>
                    <td width="500" height="375" style="background: #fcf8e3">&nbsp;</td>
                    <td>
                        <ul class="CamMenu">
                            <li>
                                <button type="button" class="btn btn-w-m btn-primary">打开设备</button></li>
                            <li>
                                <button type="button" class="btn btn-w-m btn-primary">纠偏裁边</button></li>
                            <li>
                                <button type="button" class="btn btn-w-m btn-primary">取消纠裁</button></li>
                            <li>
                                <button type="button" class="btn btn-w-m btn-primary">拍照-正面</button></li>
                            <li>
                                <button type="button" class="btn btn-w-m btn-primary">拍照-背面</button></li>
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
                                    <td width="160" style="background: #F5F5F5">&nbsp;</td>
                                    <td width="20" style="text-align: center">身份证背面</td>
                                    <td width="160" style="background: #F5F5F5">&nbsp;</td>
                                </tr>

                            </tbody>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; padding-top: 10px;">
                        <div class="form-group">
                            <div class="col-sm-8 col-sm-offset-3">
                                <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">下一步</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                            </div>
                        </div>
                    </td>
                </tr>
            </tbody>
        </table>

    </form>
</body>
</html>

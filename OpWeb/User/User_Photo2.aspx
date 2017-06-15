<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Photo2.aspx.cs" Inherits="OpWeb.User.User_Photo2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>现场拍照</title>
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
                                <button type="button" class="btn btn-w-m btn-danger">打开设备</button></li>

                        </ul>

                        <ul class="CamMenu" style="border: #7E7C7C thick">
                            <li></li>
                            <li>
                                <label>
                                    <input type="radio" value="option1" name="a">
                                    <i></i>现场拍照</label></li>
                            <li>
                                <label>
                                    <input type="radio" checked="" value="option2" name="a">
                                    <i></i>工作人员合影</label></li>
                            <li>
                                <label>
                                    <input type="radio" value="option1" name="a">
                                    <i></i>夫妻合影</label></li>

                        </ul>
                        <ul class="CamMenu">
                            <li>
                                <button type="button" class="btn btn-w-m btn-primary">拍　　照</button></li>
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
                                    <td width="160" style="background: #F5F5F5">&nbsp;</td>
                                    <td width="20" style="text-align: center">工作人员</td>
                                    <td width="160" style="background: #F5F5F5">&nbsp;</td>
                                    <td width="20" style="text-align: center">夫妻合影</td>
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
                                <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">完　成</asp:LinkButton>&nbsp;
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

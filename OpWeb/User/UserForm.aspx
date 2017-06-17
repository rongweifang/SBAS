<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="OpWeb.User.UserForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户基本信息</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
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
</head>
<body class="gray-bg">
    <form class="form-horizontal m-t" id="signupForm" runat="server">
        <div class="ibox float-e-margins">

            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td width="100">
                                <label class="control-label">姓　　名：</label></td>
                            <td width="140">
                                <input id="Card_Name" name="Card_Name" class="form-control" type="text" runat="server" />
                            </td>
                            <td width="100">
                                <label class="control-label">身份证号：</label></td>
                            <td width="220">
                                <input id="Card_ID" name="Card_ID" class="form-control valid" type="text" aria-required="true" aria-invalid="false" runat="server" />
                            </td>
                            <td colspan="2" rowspan="5">
                                <img src="../img/CardHead.jpg" width="102" height="126" alt="" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td></td>
                            <td>&nbsp;</td>
                            <td><span class="help-block m-b-none"><i class="fa fa-info-circle"></i>身份证号不能为空</span></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">性　　别：</label></td>
                            <td>
                                <input id="Card_Sex" name="Card_Sex" class="form-control" type="text" runat="server" />

                            </td>
                            <td>
                                <label class="control-label">民　　族：</label></td>
                            <td>
                                <input id="Card_Nation" name="Card_Nation" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">年　　龄：</label></td>
                            <td>
                                <input id="U_Age" name="U_Age" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">出生年月：</label></td>
                            <td>

                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input id="Card_Year" name="Card_Year" class="form-control" type="text" style="width: 80px;" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input id="Card_Month" name="Card_Month" class="form-control" style="width: 45px;" type="text" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input id="Card_Day" name="Card_Day" class="form-control" style="width: 45px;" type="text" runat="server" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="3">&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">身份证有效期：</label></td>
                            <td colspan="3">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="text-align: center">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input id="Card_Apply_Year" name="Card_Apply_Year" class="form-control" type="text" style="width: 80px;" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input id="Card_Apply_Month" name="Card_Apply_Month" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input id="Card_Apply_Day" name="Card_Apply_Day" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                            <td>至 </td>
                                            <td>
                                                <input id="Card_Valid_Year" name="Card_Valid_Year" class="form-control" type="text" style="width: 80px;" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input id="Card_Valid_Month" name="Card_Valid_Month" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input id="Card_Valid_Day" name="Card_Valid_Day" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </td>
                            <td colspan="2" rowspan="7">
                                <button class="btn btn-primary dim btn-large-dim" type="button" runat="server" title="扫描身份证">
                                    <i class="fa fa-money"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">户籍地址：</label></td>
                            <td colspan="3">
                                <input id="Card_Address" name="Card_Address" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td colspan="3">&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">居住地址：</label></td>
                            <td colspan="3">
                                <input id="U_Address" name="U_Address" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">联系电话:</label></td>
                            <td>
                                <input id="U_Tel" name="U_Tel" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">邮    编：</label></td>
                            <td>
                                <input id="U_Zip" name="U_Zip" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-3">
                        <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">下一步</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                    </div>
                </div>
            </div>
        </div>

    </form>
   

    

</body>
</html>

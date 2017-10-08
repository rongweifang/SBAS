<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_PledgeForm3.aspx.cs" Inherits="OpWeb.Contract.User_PledgeForm3" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>抵押品信息</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>

    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
</head>
<body>
    <form id="form1" runat="server">
        <%--房产抵押--%>
         <table id="table3" border="0" cellpadding="0" cellspacing="0" class="frm" runat="server">
                <tr>
                    <th>抵押物名称:
                    </th>
                    <td>
                        <input id="PS_Name" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>单位:
                    </th>
                    <td>
                        <input id="PS_Unit" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>数量:
                    </th>
                    <td>
                        <input id="PS_Count" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>抵押品到期日:
                    </th>
                    <td>
                        <input id="PS_Expire" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>评估价:
                    </th>
                    <td>
                        <input id="PS_Assess" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>抵押价:
                    </th>
                    <td>
                        <input id="PS_Value" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>抵押率:
                    </th>
                    <td>
                        <input id="PS_Rate" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th></th>
                    <td></td>
                </tr>
            </table>
        <div class="form-group">
            <div class="col-sm-8 col-sm-offset-3">
                <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">完　成</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
            </div>
        </div>
    </form>
</body>
</html>

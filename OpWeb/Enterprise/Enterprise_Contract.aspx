<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Enterprise_Contract.aspx.cs" Inherits="OpWeb.Enterprise.Enterprise_Contract" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>创建合同</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
     <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
     <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/js/content.js?v=1.0.0"></script>

    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
</head>
<body class="gray-bg">
    <form id="form1" runat="server">
        <table class="table table-striped table-hover">
            <tbody>
                 <tr>
                    <td class="client-avatar">
                      
                    </td>
                    <td><a data-toggle="tab" href="#contact-1" class="client-link">合同名称</a>
                    </td>
                    <td class="contact-type"><i class="fa fa-clock-o"></i>
                    </td>
                    <td>
                       创建时间</td>
                    <td  class="contact-type">&nbsp;</td>
                    <td >修改时间</td>
                    <td >
                      操作
                    </td>
                </tr>
                <tr>
                    <td class="client-avatar">
                        <img alt="image" src="/img/Contract_Qi.png" />
                    </td>
                    <td><a data-toggle="tab" href="#contact-1" class="client-link">企事业单位流动资金借款合同书</a>
                    </td>
                    <td class="contact-type"><i class="fa fa-clock-o"></i>
                    </td>
                    <td>
                        <asp:Label ID="LB_Jie" runat="server" Text=""></asp:Label></td>
                    <td class="client-status">&nbsp;</td>
                    <td class="client-status"><asp:Label ID="LB_Jie2" runat="server" Text=""></asp:Label></td>
                    <td class="client-status">
                       <asp:Button ID="Btn_Jie" class="btn btn-primary btn-xs" runat="server" Text="创　建" OnClick="Btn_Jie_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="client-avatar">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="contact-type"><i class="fa fa-clock-o"></i>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td class="client-status">&nbsp;</td>
                    <td class="client-status"> &nbsp;</td>
                    <td class="client-status">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="client-avatar">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="contact-type">
                    </td>
                    <td>
                        &nbsp;</td>
                    <td class="client-status">&nbsp;</td>
                    <td class="client-status">&nbsp;</td>
                    <td class="client-status">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="client-avatar">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="contact-type">
                    </td>
                    <td>
                        &nbsp;</td>
                    <td class="client-status">&nbsp;</td>
                    <td class="client-status">&nbsp;</td>
                    <td class="client-status">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="client-avatar">
                        &nbsp;</td>
                    <td>&nbsp;</td>
                    <td class="contact-type">
                    </td>
                    <td>
                        &nbsp;</td>
                    <td class="client-status">&nbsp;</td>
                    <td class="client-status">&nbsp;</td>
                    <td class="client-status">
                        &nbsp;</td>
                </tr>
            </tbody>
        </table>
        <div class="form-group">
            <div class="col-sm-8 col-sm-offset-3">
                <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
            </div>
        </div>
    </form>
   

</body>
</html>

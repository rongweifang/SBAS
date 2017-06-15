<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Contract.aspx.cs" Inherits="OpWeb.User.User_Contract" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>创建合同</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
</head>
<body class="gray-bg">
    <form id="form1" runat="server">
        <table class="table table-striped table-hover">
            <tbody>
                <tr>
                    <td class="client-avatar">
                        <img alt="image" src="/img/Contract_Jie.png" />
                    </td>
                    <td><a data-toggle="tab" href="#contact-1" class="client-link">按揭贷款合同</a>
                    </td>
                    <td class="contact-type"><i class="fa fa-clock-o"></i>
                    </td>
                    <td>
                        <asp:Label ID="LB_Jie" runat="server" Text=""></asp:Label></td>
                    <td class="client-status">
                       <asp:Button ID="Btn_Jie" class="btn btn-primary btn-xs" runat="server" Text="创　建" OnClick="Btn_Jie_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="client-avatar">
                        <img alt="image" src="/img/Contract_Bao.png" />
                    </td>
                    <td><a data-toggle="tab" href="#contact-2" class="client-link">个人保证担保贷款合同</a>
                    </td>
                    <td class="contact-type"><i class="fa fa-clock-o"></i>
                    </td>
                    <td>
                        <asp:Label ID="LB_Bao" runat="server" Text=""></asp:Label></td>
                    <td class="client-status">
                        <asp:Button ID="Btn_Bao" class="btn btn-primary btn-xs" runat="server" Text="已创建" OnClick="Btn_Bao_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="client-avatar">
                        <img alt="image" src="/img/Contract_Ya.png" />
                    </td>
                    <td><a data-toggle="tab" href="#contact-3" class="client-link">抵（质）押借款合同 </a>
                    </td>
                    <td class="contact-type"><i class="fa fa-clock-o"></i>
                    </td>
                    <td>
                        <asp:Label ID="LB_Ya" runat="server" Text=""></asp:Label></td>
                    <td class="client-status">
                        <asp:Button ID="Btn_Ya" class="btn btn-primary btn-xs" runat="server" Text="已创建" OnClick="Btn_Ya_Click" /></td>
                </tr>
                <tr>
                    <td class="client-avatar">
                        <img alt="image" src="/img/Contract_Ka.png" />
                    </td>
                    <td><a data-toggle="tab" href="#contact-4" class="client-link">富民一卡通</a>
                    </td>
                    <td class="contact-type"><i class="fa fa-clock-o"></i>
                    </td>
                    <td>
                        <asp:Label ID="LB_Ka" runat="server" Text=""></asp:Label></td>
                    <td class="client-status">
                        <asp:Button ID="Btn_Ka" class="btn btn-warning btn-xs" runat="server" Text="创　建" OnClick="Btn_Ka_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="client-avatar">
                        <img alt="image" src="/img/Contract_Xin.png" />
                    </td>
                    <td><a data-toggle="tab" href="#contact-2" class="client-link">农户小额信用借款</a>
                    </td>
                    <td class="contact-type"><i class="fa fa-clock-o"></i>
                    </td>
                    <td>
                        <asp:Label ID="LB_Xin" runat="server" Text=""></asp:Label></td>
                    <td class="client-status">
                       <asp:Button ID="Btn_Xin" class="btn btn-primary btn-xs" runat="server" Text="已创建" OnClick="Btn_Xin_Click" /></td>
                </tr>
            </tbody>
        </table>
        <div class="form-group">
            <div class="col-sm-8 col-sm-offset-3">
                <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
            </div>
        </div>
    </form>
    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>

    <script src="/js/content.js?v=1.0.0"></script>

    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>

</body>
</html>

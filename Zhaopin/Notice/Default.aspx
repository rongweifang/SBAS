<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Zhaopin.Notice.Default" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/PageControl.ascx" TagPrefix="uc1" TagName="PageControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>公司公告-招聘平台-内蒙古电力（集团）有限责任公司</title>
    <link href="/themes/default/css/style_others.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/job.css" rel="stylesheet" type="text/css" />
    <script src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <uc1:head runat="server" ID="head" />
        <div id="wrap">
            
            <div id="location">
                <div class="left"> <a href="/Notice">公司公告</a></div>
            </div>
            <div id="main_content">

                <div class="list">
                    <ul>
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <li><span class="l">• <a href="/Notice/NoticeShowView.aspx?id=<%#Eval("newsID")%>" target="_blank"><%#Eval("title")%></a></span><span class="r">[  <%#Convert.ToDateTime(Eval("pubdate")).ToString("yyyy-MM-dd")%>]</span></li>
                            </ItemTemplate>
                            <FooterTemplate>
                                <% if (rp_Item != null)
                                   {
                                       if (rp_Item.Items.Count == 0)
                                       {
                                           Response.Write("<div style='color:red;text-align:center'>没有找到您要的相关数据！</div>");
                                       }
                                   } %>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ul>
                    <div class="clear_line"></div>
                    <uc1:PageControl runat="server" id="PageControl" />
                </div>
                <div class="clear_line"></div>
               
            </div>
        </div>
         <uc1:foot runat="server" ID="foot" />
    </form>
</body>
</html>

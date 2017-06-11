<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Zhaopin.news.Default" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/PageControl.ascx" TagPrefix="uc1" TagName="PageControl" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>招聘动态-招聘平台-内蒙古电力（集团）有限责任公司</title>
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
                <div class="left"><a href="/news/">招聘动态</a></div>
            </div>
            <div id="main_content">

                <div class="list">
                    <ul>
                                <li><span class="l">• <a href="/news/gonggao717_0.html" target="_blank">内蒙古电力（集团）有限责任公司2015年第二次招聘高校毕业生考试总成绩（设面试专业）分数线公告</a></span><span class="r">[2015-07-17]</span></li>
                                <li><span class="l">• <a href="/news/gonggao717_1.html" target="_blank">内蒙古电力（集团）有限责任公司2015年第二次招聘高校毕业生考试通过人员资格复审及后续工作安排</a></span><span class="r">[2015-07-17]</span></li>
                                <li><span class="l">• <a href="/news/gonggao713_1.html" target="_blank">内蒙古电力（集团）有限责任公司2015年第二次招聘高校毕业生笔试分数线及面试安排（设面试专业）</a></span><span class="r">[2015-07-13]</span></li>
                                <li><span class="l">• <a href="/news/gonggao713_0.html" target="_blank">内蒙古电力（集团）有限责任公司2015年第二次招聘高校毕业生考试分数线公告（不设面试专业）</a></span><span class="r">[2015-07-13]</span></li>
                                <li><span class="l">• <a href="/news/gonggao706.html" target="_blank">通知</a></span><span class="r">[2015-07-06]</span></li>
                                <li><span class="l">• <a href="/news/gonggao629.html" target="_blank">内蒙古电力(集团)有限责任公司2015年第二次招聘高校毕业生报名时间调整公告</a></span><span class="r">[2015-06-29]</span></li>
                                <li><span class="l">• <a href="/news/zhaopingonggao.html" target="_blank">内蒙古电力(集团)有限责任公司2015年第二次招聘高校毕业生公告</a></span><span class="r">[2015-06-24]</span></li>
                    </ul>
                    <ul style="display: none">
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <li><span class="l">• <a href="/news/NewsShowView.aspx?id=<%#Eval("newsID")%>" target="_blank"><%#Eval("title")%></a></span><span class="r">[ <%#Convert.ToDateTime(Eval("pubdate")).ToString("yyyy-MM-dd")%>]</span></li>
                            </ItemTemplate>
                            <FooterTemplate>
                                <% if (rp_Item != null)
                                   {
                                       if (rp_Item.Items.Count == 0)
                                       {
                                           Response.Write("<div style='color:red;text-align:center'>没有数据！</div>");
                                       }
                                   } %>
                            </FooterTemplate>
                        </asp:Repeater>
                    </ul>
                    <div class="clear_line"></div>
                    <div style="display: none">
                        <uc1:PageControl runat="server" ID="PageControl" />
                    </div>
                </div>
                <div class="clear_line"></div>
            </div>
        </div>
        <uc1:foot runat="server" ID="foot" />
    </form>
</body>
</html>

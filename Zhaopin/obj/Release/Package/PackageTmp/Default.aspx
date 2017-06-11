<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Zhaopin.Default" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="Keywords" content="招聘平台,内蒙古电力(集团)有限责任公司,校园招聘" />
    <meta name="description" content="内蒙古电力(集团)有限责任公司招聘平台." />
    <title>内蒙古电力(集团)有限责任公司招聘平台</title>
    <link href="/themes/index/css/css.css" rel="stylesheet" />
    <link href="/themes/index/css/job.css" rel="stylesheet" />
    <link type="text/css" href="/themes/new/css/style.css" rel="stylesheet" />

</head>
<body>
    <form id="form1" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="main">
            <div class="indexbanner"></div>
            <div class="newslist">

                <div class="newsbox">
                    <div class="newstitle"><a href="/company/">企业简介</a></div>
                    <ul>
                        <asp:Repeater ID="rp_CNews" runat="server">
                            <ItemTemplate>
                                <li><span><%#Convert.ToDateTime(Eval("BeginDate")).ToString("yyyy-MM-dd") %></span><a href="/company/CompanyNewsView.aspx?ID=<%#Eval("companyID") %>" title="<%#Eval("companyName") %>"><%#StringCS.CutString(Eval("companyName").ToString(),60,false) %></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>
                <div class="newsbox">
                    <div class="newstitle"><a href="/news/">招聘动态</a></div>
                    <ul>
                        <li><span>2015-07-17</span><a href="/news/gonggao717_0.html" title="内蒙古电力（集团）有限责任公司2015年第二次招聘高校毕业生考试总成绩（设面试专业）分数线公告">2015年第二次招聘高校毕业生考试总成绩（设面试专业）分数线公告</a></li>
                        <li><span>2015-07-17</span><a href="/news/gonggao717_1.html" title="内蒙古电力（集团）有限责任公司2015年第二次招聘高校毕业生考试通过人员资格复审及后续工作安排">2015年第二次招聘高校毕业生考试通过人员资格复审及后续工作安排</a></li>
                         <li><span>2015-07-13</span><a href="/news/gonggao713_1.html" title="内蒙古电力（集团）有限责任公司2015年第二次招聘高校毕业生笔试分数线及面试安排（设面试专业）">2015年第二次招聘高校毕业生笔试分数线及面试安排（设面试专业）</a></li>
                       
                        <asp:Repeater ID="rp_News" runat="server">
                            <ItemTemplate>
                                <li><span><%#Convert.ToDateTime(Eval("pubdate")).ToString("yyyy-MM-dd") %></span><a href="/news/zhaopingonggao.html" title="<%#Eval("title") %>"><%#StringCS.CutString(Eval("title").ToString(),50,false) %></a></li>
                            </ItemTemplate>
                        </asp:Repeater>
                    </ul>
                </div>

            </div>
        </div>

        <uc1:foot runat="server" ID="foot" />
    </form>
</body>
</html>

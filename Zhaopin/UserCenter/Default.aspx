<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Zhaopin.UserCenter.Default" %>

<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/employee_foot.ascx" TagPrefix="uc1" TagName="employee_foot" %>
<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心 - 内蒙古电力（集团）有限责任公司 - 招聘平台</title>
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
    <style type="text/css">
        <!--
        /* 会员信息 */
        .me_info {
            width: 100%;
            height: 182px;
            background: url(/themes/default/images/welcom_bg.gif) no-repeat;
        }

        .me_info_content {
            float: left;
            width: 720px;
            height: 182px;
        }

        .info_text {
            float: left;
            padding-top: 25px;
            padding-right: 0px;
            padding-bottom: 0px;
            padding-left: 20px;
            width: 100%;
        }

        .info_button {
            float: left;
            width: 161px;
            padding-left: 15px;
            ;
        }
        /* 最近工作申请 */
        .newswork {
            width: auto;
            text-indent: 15px;
            height: 26px;
            color: #fff;
            line-height: 26px;
            border: #006f6b 1px solid;
            border-bottom: none;
            background: url(/themes/default/images/me_loc_bg.gif) repeat-x;
            margin-top: 10px;
        }

        .newswork_text {
            float: left;
        }

        .newswork_moer {
            float: right;
            padding-top: 0px;
        }
        /* 招聘信息最新动态 */
        .jobnews {
            width: 100%;
        }

        .job {
            width: 100%;
        }

        .text_list {
            border: solid 1px #c4c4c4;
            height: 250px;
            padding-top: 5px;
            padding-right: 10px;
            padding-bottom: 5px;
            padding-left: 10px;
        }

            .text_list ul li {
                width: 98%;
                overflow: hidden;
                background: url(/themes/default/images/me_left_05.gif) left no-repeat;
                padding-left: 10px;
            }

            * + html .text_list ul li {
                height: 20px;
            }

        .news {
            width: 364px;
            float: right;
            padding-left: 11px;
        }

        .white {
            color: #fff;
        }

        a.white {
            color: #fff;
        }
        -->
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="location">
            <div class="location_left">
                <a href="/UserCenter/">个人中心</a>
            </div>
        </div>
        <div class="clearit"></div>
        <div class="content">
            <uc1:employee_left runat="server" ID="employee_left" />
            <div class="right">
                <div class="me_info">
                    <div class="me_info_content">
                        <div class="info_text gray">
                            您好，<span style="color: #006f6b; font-weight: bold;"><%= Common.DotNetBean.RequestSession.GetSessionUser().UserName.ToString() %></span>，欢迎您回来！<br />
                            上一次登录时间：<asp:Label ID="LbTime" runat="server" Text=" "></asp:Label>
                            <br />
                            上一次登录IP：<asp:Label ID="LbIP" runat="server" Text=" "></asp:Label><br />
                            您有 <a href="/UserCenter/activity.aspx"><span style="color: #006f6b; font-weight: bold;">
                                <asp:Label ID="LbMsg" runat="server" Text=" "></asp:Label>
                                条 </span></a>未读消息<br />
                            请您仔细填写个人简历，给自己机会成为内蒙古电力（集团）有限责任公司的一员！<br />
                        </div>
                    </div>
                </div>
                <div class="clearit"></div>
                <div class="newswork">
                    <div class="newswork_text">我的工作申请</div>
                </div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>单位名称</td>
                            <td>申报专业</td>
                            <td bgcolor="#f2f2f2">申请日期 </td>
                        </tr>
                        <asp:Repeater ID="rp_Apply" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("companyName") %></td>
                                    <td><%#Eval("specName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("applyDate")).ToString("yyyy-MM-dd")%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <div class="jobnews">
                    <div class="job">
                        <div class="newswork">
                            <div class="newswork_text">招聘信息</div>
                            <div class="newswork_moer"><a class="white" href="/UserCenter/CompayApplyList.aspx" title="更多招聘信息">更多...</a>&nbsp;&nbsp;</div>
                        </div>
                        <div class="text_list">

                            <ul class="gray">
                                <asp:Repeater ID="rp_Item" runat="server">
                                    <ItemTemplate>
                                        <li><span class="l" style="float: left;"><a href="/UserCenter/CompayApplyView.aspx?id=<%#Eval("companyID")%>" target="_blank"><%#Eval("companyName")%></a></span><span class="gray02" style="float: right; color: #949494;">[ <%#Convert.ToDateTime(Eval("BeginDate")).ToString("yyyy-MM-dd") %>]</span></li>
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
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <div class="clearit"></div>
        <uc1:employee_foot runat="server" ID="user_foot" />
    </form>
</body>
</html>

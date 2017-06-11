<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activity.aspx.cs" Inherits="Zhaopin.UserCenter.activity" %>

<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/employee_foot.ascx" TagPrefix="uc1" TagName="employee_foot" %>
<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet">
    <link href="/themes/index/css/job.css" rel="stylesheet">
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
            width: 510px;
            padding: 25px 0px 0px 20px;
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
            width: 364px;
            float: left;
        }

        .text_list {
            border: solid 1px #c4c4c4;
            height: 188px;
            padding: 5px 10px;
        }

            .text_list ul li {
                width: 330px;
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
    <script>
        function ReadMessage(msgTitle, msgID) {
            layer.open({
                type: 2,
                title: msgTitle,
                maxmin: false,
                shadeClose: true, //点击遮罩关闭层
                area: ['738px', '720px'],
                content: '/UserCenter/activityView.aspx?ID=' + msgID
            });
        }
    </script>
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
                <div class="righttopbj">
                    <div class="righttopbj_text">我的消息</div>
                </div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>状态</td>
                            <td>消息类型</td>
                            <td>消息标题</td>
                            <td>发送时间</td>
                             <td>阅读时间</td>
                        </tr>
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray" onclick='ReadMessage("[<%#Eval("TypeName") %>]-<%#Eval("MsgTitle") %>","<%#Eval("ID") %>")' style="cursor: pointer">
                                    <td><img src='/themes/default/images/active-<%#Eval("ISRead") %>.png' width="16" height="16"><%#Eval("ReadState") %></td>
                                    <td><%#Eval("TypeName") %></td>
                                    <td><%#Eval("MsgTitle") %></td>
                                    <td><%#Eval("SendDate") %></td>
                                    <td><%#Eval("ReadDate") %></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
                <div class="right_foot"></div>
            </div>
        </div>
        <div class="clearit"></div>
        <uc1:employee_foot runat="server" ID="user_foot" />
    </form>
</body>
</html>

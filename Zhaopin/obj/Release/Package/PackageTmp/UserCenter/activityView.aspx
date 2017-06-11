<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="activityView.aspx.cs" Inherits="Zhaopin.UserCenter.activityView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title><%=MsgTitle %></title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" />
    <link href="/themes/index/css/job.css" rel="stylesheet" />
    <script src="/scripts/prototype_for_validation.js" type="text/javascript"></script>
    <script src="/scripts/effects.js" type="text/javascript"></script>
    <script src="/scripts/validation_cn.js" type="text/javascript"></script>
    <script src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
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
        /* 外语能力 */
        .form01 {
            width: 350px;
            height: 50px;
            float: left;
        }

        .form02 {
            width: 130px;
            text-align: right;
            height: 50px;
            float: left;
        }

        .form03 {
            width: 170px;
            float: left;
        }

        .form04 {
            width: 600px;
            height: 50px;
            float: left;
        }

        .form05 {
            width: 440px;
            float: left;
        }

        .form06 {
            width: 640px;
            height: 50px;
            float: left;
        }

        .form07 {
            width: 600px;
            height: 50px;
            float: left;
        }

        .form08 {
            width: 600px;
            height: 80px;
            float: left;
        }

        .form03two {
            float: left;
        }

        .form09 {
            width: 170px;
            float: left;
        }

        .form10 {
            width: 600px;
            height: 88px;
            float: left;
        }

        .form11 {
            width: 130px;
            text-align: right;
            height: 40px;
            float: left;
        }

        .form13 {
            width: 170px;
            float: left;
            height: 50px;
        }

        table {
            width: 738px;
        }
        -->
    </style>
</head>
<body>
    <form id="form1" runat="server">
     <div class="line" id="awardCerAddId" style="height:670px;">
            <div class="columnbj">
                <div class="Form_left">
                    <ul class="gray30">
                        <li>
                            <div class="form01">
                                <div class="form02">消息名称：</div>
                                <div class="form03">
                                  <%=MsgTitle %>
                                </div>
                                <div style="color: red; width: 20px; float: left;">&nbsp;</div>
                            </div>
                        </li>

                        <li>
                            <div class="form01">
                                <div class="form02">消息类型：</div>
                                <div class="form13">
                                    <div><%=TypeName %></div>
                                </div>
                                <div style="color: red; width: 20px; float: left;">&nbsp;</div>
                            </div>
                        </li>
                        <li>
                            <div class="form06">
                                <div class="form02">发送时间：</div>
                                <div class="form03">
                                    <div><%=SendDate %></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form10">
                                <div class="form02">内容：</div>
                                <div class="form05" >
                                    
                                </div>
                            </div>
                        </li>
                        <li><div style="font-size:18px;height:420px;"><%=StringCS.HtmlDiscode(MsgContent) %></div></li>
                    </ul>
                </div>

            </div>
        </div>
    </form>
</body>
</html>

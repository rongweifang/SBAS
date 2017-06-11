<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="apply.aspx.cs" Inherits="Zhaopin.UserCenter.apply" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>




<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>我的工作申请 - 我的求职 - 个人中心</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet">
    <link href="/themes/index/css/job.css" rel="stylesheet">
    <script language="JavaScript" src="/scripts/prototype_for_validation.js" type="text/javascript"></script>
    <script language="JavaScript" src="/scripts/effects.js" type="text/javascript"></script>
    <script language="JavaScript" src="/scripts/validation_cn.js" type="text/javascript"></script>
    <script language="JavaScript" src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script language="JavaScript" src="/scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
    <script type="text/javascript" src="/scripts/jquery.form.js"></script>
    <script language="JavaScript" src="/scripts/jquery.blockUI.js" type="text/javascript"></script>
    <style type="text/css">
        <!--
        .js {
            background-color: #fcffe7;
            border: solid 1px #bdd7f4;
            width: 350px;
            height: 60px;
        }
        -->
        .gray26, .gray26 a:link, .gray26 a:visited {
            font-size: 12px;
            line-height: 26px;
            font-weight: normal;
            color: #338d89;
            text-decoration: none;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="location">
            <div class="location_left">
                <a href="/UserCenter/">个人中心</a> &gt;我的工作申请
            </div>
        </div>
        <div class="clearit"></div>
        <div class="content">
            <uc1:employee_left runat="server" ID="employee_left" />
            <div class="right">
                <div class="righttopbj_long">

                    <div class="righttopbj_text">
                        我的工作申请
                    </div>
                    <div class="righttopbj_right"></div>
                </div>
                <div class="line">
                    <div style="padding: 10px;">
                        <div style="color: red;">注意：每位应聘者在本次招聘中只能选择一个专业。</div>
                        <div style="color: red;"></div>
                    </div>
                </div>

                <div class="line">
                    <table width="738px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                        <tbody>
                            <tr bgcolor="#f2f2f2" align="center" class="black">
                                <td>单位名称</td>
                                <td>申报专业</td>
                                <td bgcolor="#f2f2f2">申请日期</td>
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
                </div>
            </div>

        </div>
        <div class="clearit"></div>
    </form>
    <uc1:foot runat="server" ID="foot" />
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="attachment.aspx.cs" Inherits="Zhaopin.UserCenter.attachment" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/employee_process.ascx" TagPrefix="uc1" TagName="employee_process" %>





<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心 - 简历登记 - 上传电子附件</title>

    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css">
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css">
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css">
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css">
    <link href="/themes/index/css/css.css" rel="stylesheet">
    <link href="/themes/index/css/job.css" rel="stylesheet">
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css">
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
        /* 上传电子附件 */
        .form01 {
            width: 280px;
            height: 60px;
            float: left;
        }

        .form02 {
            width: 110px;
            text-align: right;
            height: 50px;
            float: left;
        }

        .form03 {
            width: 170px;
            float: left;
        }

        .form04 {
            width: 560px;
            height: 50px;
            float: left;
        }

        .form05 {
            width: 450px;
            float: left;
        }

        .form06 {
            width: 280px;
            height: 50px;
            float: left;
        }

        .form07 {
            width: 560px;
            height: 50px;
            float: left;
        }

        .form08 {
            width: 560px;
            height: 80px;
            float: left;
        }

        .gray26, .gray26 a:link, .gray26 a:visited {
            font-size: 12px;
            line-height: 26px;
            font-weight: normal;
            color: #338d89;
            text-decoration: none;
        }

        .form11 {
            float: left;
            width: 160px;
        }

        .form12 {
            width: 150px;
            float: left;
        }

        .form13 {
            width: 580px;
            height: 90px;
            float: left;
        }

        .form14 {
            width: 300px;
            height: 50px;
            float: left;
        }

        .form15 {
            float: left;
            width: 366px;
        }

        table {
            width: 738px;
        }

        .auto-style1 {
            height: 25px;
        }
        -->
    </style>
    <script type="text/javascript">
        //删除
        function Delete(key) {
            if (IsDelData(key)) {
                var delparm = 'action=del&type=attachment&ID=' + key;
                delConfig('/Ajax/Common_UserRecord.ashx', delparm)
            }
        }
    </script>
</head>
<body>
    <uc1:head runat="server" ID="head" />
    <div class="location">
        <div class="location_left">
            <a href="/UserCenter/">个人中心</a> &gt;简历登记
        </div>
    </div>
    <div class="clearit"></div>
    <div class="content">
        <uc1:employee_left runat="server" ID="employee_left" />
        <div class="right">
            <uc1:employee_process runat="server" ID="employee_process" />
            <div class="clearit"></div>

            <form name="attatchmentform" id="attatchmentform" runat="server">
                <div class="line top_10">
                    <div class="column_long_long">上传电子附件<font style="color: #338d89; font-size: 12px; font-weight: normal;">&nbsp;(非必填)</font></div>
                </div>
                <div class="line">
                    <div style="padding: 10px;">
                        <div class="gray26">
                            身份证扫描件只用上传一次，包含正反面。
                        </div>
                    </div>

                    <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                        <tbody>
                            <tr bgcolor="#f2f2f2" align="center" class="black">
                                <td class="auto-style1">附件类型</td>
                                <td class="auto-style1">附件大小</td>
                                <td class="auto-style1">上传时间</td>
                                <td width="170px" class="auto-style1">操作</td>
                            </tr>
                            <asp:Repeater ID="rp_Item" runat="server">
                                <ItemTemplate>
                                    <tr bgcolor="#FFFFFF" align="center" class="gray">
                                        <td><%#Eval("AttaName") %></td>
                                        <td><%#Eval("AttaSize") %>KB </td>
                                        <td><%#Convert.ToDateTime(Eval("CreateDate")).ToString("yyyy-MM-dd")%></td>
                                        <td>
                                            <span class="btn_operate" onclick='Urlhref("/UserCenter/attachment.aspx?ID=<%#Eval("AttaID") %>")'>编辑</span>
                                            <span class="btn_operate"><a href="<%#Eval("AttaPath") %>" target="_blank" style="color: white">预览</a></span>
                                            <span class="btn_operate" onclick='Delete("<%#Eval("AttaID") %>")'>删除</span>
                                        </td>
                                    </tr>
                                </ItemTemplate>
                            </asp:Repeater>
                        </tbody>
                    </table>


                    <div class="line">
                        <div class="btn_operate" style="margin: 3px">
                            <asp:Label ID="lb_title" runat="server" Text="新增"></asp:Label>
                        </div>
                    </div>
                    <div class="line" id="attatchmentAddId" style="">
                        <div class="columnbj">
                            <div class="Form_left">
                                <ul class="gray30">
                                    <li>
                                        <div class="form14">
                                            <div class="form02">附件类型：</div>
                                            <div class="form11">
                                                <div style="padding-top: 4px;">
                                                    <select id="AttachmentType" name="AttachmentType" class="required validate-selection" runat="server">
                                                    </select>
                                                </div>
                                            </div>
                                            <div style="color: red; width: 20px; float: left; margin-left: 9px; _margin-left: 0px;">&nbsp;&nbsp;*</div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form04" style="overflow: hidden;">
                                            <div class="form02">上传证书：</div>
                                            <div class="form15">
                                                <div style="width: 350px; overflow: hidden;">
                                                    <div style="width: 275px; float: left;">
                                                        <asp:FileUpload ID="FileUpload1" runat="server" class="required validate-file-jpg-jpeg-pdf" />
                                                    </div>
                                                    <div style="color: red; width: 20px; float: left;">*</div>
                                                </div>
                                                <div style="overflow: hidden; width: 366px" class="gray02">文件类型为[pdf,jpg,jpeg]其中之一,大小为1024K之内</div>
                                            </div>
                                        </div>
                                    </li>
                                    <li>
                                        <div class="form07">
                                            <div class="form02">&nbsp;&nbsp;</div>
                                            <div class="form05">
                                                <asp:Button ID="Button1" runat="server" CssClass="btnsubmit" OnClientClick="chkAttatchmentSubmit()" OnClick="Button1_Click" Text="提交" />
                                            </div>
                                        </div>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                    <div class="clearit"></div>
                    <div class="right_foot"></div>
                </div>
            </form>
        </div>
    </div>
    <div class="clearit"></div>
    <uc1:foot runat="server" ID="foot" />

    <script type="text/javascript">
        function chkAttatchmentSubmit() {
            var attatchmentform = new Validation("attatchmentform");
            if (attatchmentform.validate()) {
            }
        }
    </script>
</body>
</html>

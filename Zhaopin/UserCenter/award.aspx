<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="award.aspx.cs" Inherits="Zhaopin.UserCenter.award" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/employee_process.ascx" TagPrefix="uc1" TagName="employee_process" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心 - 简历登记 - 获奖情况</title>
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
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <script src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script src="/scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
    <script type="text/javascript" src="/scripts/jquery.form.js"></script>
    <script src="/scripts/jquery.blockUI.js" type="text/javascript"></script>
    <link href="/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/Scripts/ShowMsg/msgbox.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/ShowMsg/msgbox.js" type="text/javascript"></script>
    <script src="/Scripts/FunctionJS.js" type="text/javascript"></script>


    <style type="text/css">
        <!--
        /* 计算机能力 */
        .form01 {
            width: 650px;
            height: 50px;
            float: left;
        }

        .form02 {
            width: 110px;
            text-align: right;
            height: 50px;
            float: left;
        }

        .form03 {
            width: 500px;
            float: left;
        }

        .form04 {
            width: 650px;
            height: 50px;
            float: left;
        }

        .form05 {
            width: 500px;
            float: left;
        }

        .form06 {
            width: 280px;
            height: 50px;
            float: left;
        }

        .form07 {
            width: 650px;
            height: 50px;
            float: left;
        }

        .form08 {
            width: 650px;
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
            width: 170px;
        }

        .form12 {
            width: 150px;
            float: left;
        }

        .form13 {
            width: 650px;
            height: 90px;
            float: left;
        }

        .form14 {
            float: left;
            width: 65px;
        }

        table {
            width: 738px;
        }
        -->
    </style>
    <script type="text/javascript">

        $(document).ready(function () {
            $("#GetDate").datepicker({ dateFormat: 'yy-mm-dd' });

        });


        //删除
        function Delete(key) {
            if (IsDelData(key)) {
                var delparm = 'action=del&type=award&ID=' + key;
                delConfig('/Ajax/Common_UserRecord.ashx', delparm)
            }
        }
    </script>
</head>

<body>
    <form id="awardform" runat="server">
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

                <div class="line top_10">
                    <div class="column_long">获奖情况<font style="color: #338d89; font-size: 12px; font-weight: normal;">&nbsp;(非必填)</font></div>
                </div>
                <div class="line">
                    <div style="padding: 10px;">
                        <div class="gray26">在“奖励名称”中明确说明奖励级别。</div>
                    </div>
                </div>

                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>奖励名称</td>
                            <td>奖励级别</td>
                            <td>获得时间</td>
                            <td>发证单位</td>
                            <td width="110px">操作</td>
                        </tr>
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("AwardName") %></td>
                                    <td><%#Eval("LevelName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("GetDate")).ToString("yyyy-MM-dd")%></td>
                                    <td><%#Eval("AwardCompany") %></td>
                                    <td>
                                        <span class="btn_operate" onclick='Urlhref("/UserCenter/award.aspx?ID=<%#Eval("AwardID") %>")'>编辑</span>
                                        <span class="btn_operate" onclick='Delete("<%#Eval("AwardID") %>")'>删除</span>
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
                <div class="line" id="awardAddId" style="">
                    <div class="columnbj">
                        <div class="Form_left">
                            <ul class="gray30">
                                <li>
                                    <div class="form01">
                                        <div class="form02">奖励名称：</div>
                                        <div class="form11">
                                            <input id="AwardName" name="AwardName" type="text" class="required validate-specialchar input" value="" maxlength="20" runat="server" />
                                        </div>
                                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                                    </div>
                                </li>

                                <li>
                                    <div class="form01">
                                        <div class="form02">奖励级别：</div>
                                        <div class="form14">
                                            <div style="padding-top: 4px;">
                                                <select id="AwardLevel" name="AwardLevel" class="required validate-selection" runat="server">
                                                </select>
                                            </div>
                                        </div>
                                        <div style="color: red; float: left; margin-left: 110px; _margin-left: 5px;">*</div>
                                    </div>
                                </li>

                                <li>
                                    <div class="form01">
                                        <div class="form02">证书获得时间：</div>
                                        <div class="form11">
                                            <input id="GetDate" name="GetDate" type="text" value="" class="required input" runat="server" readonly="true" />
                                        </div>
                                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form01">
                                        <div class="form02">发证单位：</div>
                                        <div class="form11">
                                            <input id="AwardCompany" name="AwardCompany" type="text" class="required validate-specialchar input" value="" maxlength="20" runat="server" />
                                        </div>
                                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                                    </div>
                                </li>

                                <li>
                                    <div class="form01">
                                        <div class="form02">证书编号：</div>
                                        <div class="form03">
                                            <div>
                                                <input id="AwardNO" name="AwardNO" type="text" class="validate-alphanum input" value="" maxlength="20" runat="server" />
                                            </div>
                                            <div class="gray02"></div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form04">
                                        <div class="form02">上传证书：</div>
                                        <div class="form05">
                                            <div style="width: 320px; overflow: hidden;">
                                                <asp:FileUpload ID="AwardUrl" runat="server" class="validate-file-pdf-jpeg-jpg input2" />
                                            </div>
                                            <div style="overflow: hidden;" class="gray02">文件类型为[pdf,jpeg,jpg]其中之一,大小为1024K之内</div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form13">
                                        <div class="form02">备注：</div>
                                        <div class="form05">
                                            <div>
                                                <textarea style="width: 300px;" id="Memo" name="Memo" class="max-length-50 validate-specialchartextarea input3" maxlength="50" runat="server"></textarea>
                                            </div>
                                            <div style="overflow: hidden;" class="gray02">50个汉字以内</div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form07">
                                        <div class="form02">&nbsp;&nbsp;</div>
                                        <div class="form05">
                                            <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btnsubmit" OnClick="Button1_Click" OnClientClick="chkawardformSubmit();" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>

                    </div>
                </div>
                <div class="clearit"></div>
            </div>
        </div>
        <div class="clearit"></div>
    </form>
    <script>

        function chkawardformSubmit() {
            var awardform = new Validation("awardform");
            if (!awardform.validate()) {
                return false;
            }
        }
    </script>
    <uc1:foot runat="server" ID="foot" />

</body>
</html>

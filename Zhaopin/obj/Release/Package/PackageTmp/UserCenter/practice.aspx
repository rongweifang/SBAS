<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="practice.aspx.cs" Inherits="Zhaopin.UserCenter.practice" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/employee_process.ascx" TagPrefix="uc1" TagName="employee_process" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心 - 简历登记 - 主要社会实践或工作经历</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css">
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css">
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css">
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css">
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
        /* 主要社会实践或工作经历 */
        .form01 {
            width: 280px;
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
            height: 90px;
            float: left;
        }

        .form09 {
            width: 400px;
            float: left;
        }

        .form10 {
            width: 170px;
            float: left;
        }

        .form11 {
            float: left;
        }

        .form12 {
            float: left;
            width: 170px;
        }

        .form13 {
            float: left;
            width: 80px;
        }
        -->
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#BeginDate").datepicker({ dateFormat: 'yy-mm-dd' });
            $("#EndDate").datepicker({ dateFormat: 'yy-mm-dd' });

        });
        //删除
        function Delete(key) {
            if (IsDelData(key)) {
                var delparm = 'action=del&type=work&ID=' + key;
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
            <form name="practiceform" id="practiceform" runat="server">
                <div class="line top_10">
                    <div class="column_long_long_long">主要社会实践或工作经历<font style="color: #338d89; font-size: 12px; font-weight: normal;">&nbsp;(非必填)</font></div>
                </div>

                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>单位</td>
                            <td>岗位</td>
                            <td>工作形式</td>
                            <td>时间</td>
                            <td width="110px">操作</td>
                        </tr>
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("CompName") %></td>
                                    <td><%#Eval("Job") %></td>
                                    <td><%#Eval("TypeName") %> </td>
                                    <td><%#Convert.ToDateTime(Eval("BeginDate")).ToString("yyyy-MM-dd")%>至<%#Convert.ToDateTime(Eval("EndDate")).ToString("yyyy-MM-dd")%></td>
                                    <td valign="middle">
                                        <span class="btn_operate" onclick='Urlhref("/UserCenter/practice.aspx?ID=<%#Eval("WorkID") %>")'>编辑</span>
                                        <span class="btn_operate" onclick='Delete("<%#Eval("WorkID") %>")'>删除</span>
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
                <div class="line" id="practiceAddId" style="">
                    <div class="columnbj">
                        <div class="Form_left">
                            <ul class="gray30">
                                <li>
                                    <div style="width: 300px; height: 50px; float: left;">
                                        <div style="width: 110px; text-align: right; height: 50px; float: left;">开始时间：</div>
                                        <div style="width: 180px; float: left;">
                                            <div style="width: 150px; float: left;">
                                                <input id="BeginDate" name="BeginDate" type="text" style="width: 150px;" value="" class="required validate-date input" readonly="true" runat="server" />
                                            </div>
                                            <div style="color: red; width: 20px; overflow: hidden;">&nbsp;&nbsp;&nbsp;*</div>
                                        </div>
                                    </div>
                                    <div style="width: 300px; height: 50px; float: left;">
                                        <div style="width: 110px; text-align: right; height: 50px; float: left;">结束时间：</div>
                                        <div style="width: 180px; float: left;">
                                            <div style="width: 150px; float: left;">
                                                <input id="EndDate" name="EndDate" type="text" style="width: 150px;" value="" class="required validate-date great-than-equal-BeginDate input" readonly="true" runat="server" />
                                            </div>
                                            <div style="color: red; width: 20px; overflow: hidden;">&nbsp;&nbsp;&nbsp;*</div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form07" style="overflow: hidden;">
                                        <div class="form02">单位名称：</div>
                                        <div class="form12">
                                            <input style="width: 150px;" id="CompName" name="CompName" type="text" class="required validate-specialchar input" value="" maxlength="60" runat="server" />
                                        </div>
                                        <div style="color: red; width: 20px; float: left; margin-left: -10px;">*</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form07" style="overflow: hidden;">
                                        <div class="form02">职务(岗位)：</div>
                                        <div class="form12">
                                            <input style="width: 150px;" id="Job" name="Job" type="text" class="required validate-specialchar input" value="" maxlength="40" runat="server" />
                                        </div>
                                        <div style="color: red; width: 20px; float: left; margin-left: -10px;">*</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form06" style="overflow: hidden;">
                                        <div class="form02">工作形式：</div>
                                        <div class="form13">
                                            <div style="padding-top: 4px;">
                                                <select id="WorkType" name="WorkType" class="required validate-selection" style="width: 155px;" runat="server">
                                                </select>
                                            </div>
                                        </div>
                                        <div style="color: red; width: 10px; float: left; margin-left: 80px; _margin-left: 5px;">*</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form08">
                                        <div class="form02">具体工作要点：</div>
                                        <div class="form05">
                                            <div>
                                                <textarea id="WorkPlace" name="WorkPlace" class="max-length-60 validate-specialchar input3" value="" maxlength="60" runat="server"></textarea>
                                            </div>
                                            <div class="gray02">60个汉字以内</div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form07">
                                        <div class="form02">工作内容：</div>
                                        <div class="form09">
                                            <input style="width: 150px;" id="WorkDescription" name="WorkDescription" type="text" class="validate-specialchar input" value="" maxlength="40" runat="server" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form07">
                                        <div class="form02">&nbsp;&nbsp;</div>
                                        <div class="form05">
                                            <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btnsubmit" OnClick="Button1_Click" OnClientClick="return chkPracticeSubmit();" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </form>
            <div class="clearit"></div>

        </div>
    </div>
    <!--会员中心主内容结束-->
    <div class="clearit"></div>
    <uc1:foot runat="server" ID="foot" />
    <script type="text/javascript">
        function chkPracticeSubmit() {
            var practiceform = new Validation("practiceform");
            if (!practiceform.validate()) {
                return false;
            }
        }
    </script>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="family.aspx.cs" Inherits="Zhaopin.UserCenter.family" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/employee_process.ascx" TagPrefix="uc1" TagName="employee_process" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心 - 简历登记 - 主要家庭成员</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css">
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css">
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css">
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css">
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css">
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
        /* 主要家庭成员 */
        .form01 {
            width: 280px;
            height: 50px;
            float: left;
        }

        .form02 {
            width: 90px;
            text-align: right;
            height: 50px;
            float: left;
        }

        .form03 {
            width: 160px;
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
            width: 160px;
            float: left;
        }

        .form011 {
            width: 300px;
            height: 50px;
            float: left;
        }

        table {
            width: 738px;
        }
        -->
    </style>
    <script type="text/javascript">

        //删除
        function Delete(key) {
            if (IsDelData(key)) {
                var delparm = 'action=del&type=family&ID=' + key;
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
            <div class="line top_10">
                <div class="column_long_long">主要家庭成员<font style="color: #338d89; font-size: 12px; font-weight: normal;">&nbsp;(非必填)</font></div>
            </div>
            <form name="familyMemberForm" id="familyMemberForm" runat="server">
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td width="81px">称谓</td>
                            <td>姓名</td>
                            <td>工作单位</td>
                            <td>职务/岗位</td>
                            <td width="110px">操作</td>
                        </tr>
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>

                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("CallName") %></td>
                                    <td><%#Eval("Name") %></td>
                                    <td><%#Eval("WorkPlace") %></td>
                                    <td><%#Eval("Job") %></td>
                                    <td>
                                        <span class="btn_operate" onclick='Urlhref("/UserCenter/family.aspx?ID=<%#Eval("ID") %>")'>编辑</span>
                                        <span class="btn_operate" onclick='Delete("<%#Eval("ID") %>")'>删除</span>
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
                <div id="familyMemberAddId" class="line">
                    <div class="columnbj">
                        <div class="Form_left">
                            <ul class="gray30">
                                <li>
                                    <div class="form06">
                                        <div class="form02">称谓：</div>
                                        <div class="form03" style="width: 190px;">
                                            <div style="padding-top: 4px; float: left; width: 170px;">
                                                <select id="CallType" name="CallType" class="required validate-selection" runat="server" onchange="showCallMemo();">
                                                </select>
                                            </div>
                                            <div style="color: red; width: 10px; height: 10px; float: left; margin-left: 5px;">*</div>
                                        </div>
                                    </div>
                                    <div class="form011" id="txt_CallMemo" style="display:none">
                                        <div class="form03" style="width: 175px;">
                                            <div>
                                             
                                            </div>
                                        </div>
                                        <div style="color: red; width: 10px; height: 10px; float: left; align-content: center;">*</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form011">
                                        <div class="form02">姓名：</div>
                                        <div class="form03" style="width: 175px;">
                                            <div>
                                                <input id="Name" name="Name" type="text" class="required validate-name input" value="" maxlength="40" runat="server" />
                                            </div>
                                        </div>
                                        <div style="color: red; width: 10px; height: 10px; float: left; align-content: center;">*</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form04">
                                        <div class="form02">工作单位：</div>
                                        <div class="form05">
                                            <div>
                                                <input id="WorkPlace" name="WorkPlace" type="text" class="validate-specialchar input2" value="" maxlength="40" runat="server" />
                                            </div>
                                            <div class="gray02">40个汉字以内</div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form01">
                                        <div class="form02">职务/岗位：</div>
                                        <div class="form03">
                                            <div>
                                                <input id="Job" name="Job" type="text" class="validate-specialchar input" value="" maxlength="40" runat="server" />
                                            </div>
                                            <div class="gray02">40个汉字以内</div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form07">
                                        <div class="form02">&nbsp;&nbsp;</div>
                                        <div class="form05">
                                            <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btnsubmit" OnClick="Button1_Click" OnClientClick="chkFamilyMemberSubmit('0');" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </form>
            <!--主要家庭成员结束-->
            <div class="clearit"></div>
        </div>
    </div>
    <!--会员中心主内容结束-->
    <div class="clearit"></div>
    <script type="text/javascript">
        var familyMemberForm = new Validation("familyMemberForm");
        function chkFamilyMemberSubmit(familyAddFlag) {
            $('#familyAddFlag').val(familyAddFlag);
            if (!familyMemberForm.validate()) {
                return false;
            }
        }
        function showCallMemo()
        {

        }
    </script>
    <uc1:foot runat="server" ID="foot" />
</body>
</html>

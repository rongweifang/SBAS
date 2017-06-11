<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="language.aspx.cs" Inherits="Zhaopin.UserCenter.language" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/employee_process.ascx" TagPrefix="uc1" TagName="employee_process" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心 - 简历登记 - 语言能力、计算机能力及其他</title>
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
            width: 600px;
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
    <script type="text/javascript">
        //添加
        function addlanguage() {
            layer.open({
                type: 2,
                title: '外语能力 - 添加',
                maxmin: false,
                shadeClose: true, //点击遮罩关闭层
                area: ['738px', '583px'],
                content: '/UserCenter/LanguageForm.aspx'
            });

        }
        function editlanguage(key) {
            if (IsEditdata(key)) {
                layer.open({
                    type: 2,
                    title: '外语能力 - 编辑',
                    maxmin: false,
                    shadeClose: true, //点击遮罩关闭层
                    area: ['738px', '583px'],
                    content: '/UserCenter/LanguageForm.aspx?ID=' + key
                });
            }
        }
        function Deletelanguage(key) {
            if (IsDelData(key)) {
                var delparm = 'action=del&type=Language&ID=' + key;
                delConfig('/Ajax/Common_UserRecord.ashx', delparm)
            }
        }
        function addComputer() {
            layer.open({
                type: 2,
                title: '计算机能力 - 添加',
                maxmin: false,
                shadeClose: true, //点击遮罩关闭层
                area: ['738px', '588px'],
                content: '/UserCenter/ComputerForm.aspx'
            });
        }
        function editComputer(key) {
            if (IsEditdata(key)) {
                layer.open({
                    type: 2,
                    title: '计算机能力 - 编辑',
                    maxmin: false,
                    shadeClose: true, //点击遮罩关闭层
                    area: ['738px', '588px'],
                    content: '/UserCenter/ComputerForm.aspx?ID=' + key
                });
            }
        }
        function DeleteComputer(key) {
            if (IsDelData(key)) {
                var delparm = 'action=del&type=Computer&ID=' + key;
                delConfig('/Ajax/Common_UserRecord.ashx', delparm)
            }
        }
        function addCertOther() {
            layer.open({
                type: 2,
                title: '其它资格证书 - 添加',
                maxmin: false,
                shadeClose: true, //点击遮罩关闭层
                area: ['738px', '583px'],
                content: '/UserCenter/CertOtherForm.aspx'
            });
        }
        function editCertOther(key) {
            if (IsEditdata(key)) {
                layer.open({
                    type: 2,
                    title: '其它资格证书 - 编辑',
                    maxmin: false,
                    shadeClose: true, //点击遮罩关闭层
                    area: ['738px', '583px'],
                    content: '/UserCenter/CertOtherForm.aspx?ID=' + key
                });
            }
        }
        function DeleteCertOther(key) {
            if (IsDelData(key)) {
                var delparm = 'action=del&type=CertOther&ID=' + key;
                delConfig('/Ajax/Common_UserRecord.ashx', delparm)
            }
        }
    </script>


</head>
<body>
    <form id="LanguageForm" runat="server">
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
                    <div class="column">外语能力</div>
                </div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>语种名称</td>
                            <td>等级</td>
                            <td>获得时间</td>
                            <td>级别</td>
                            <td width="110px">操作</td>
                        </tr>
                        <asp:Repeater ID="rp_Language" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("LangName") %></td>
                                    <td><%#Eval("LangLevel") %> </td>
                                    <td><%#Convert.ToDateTime(Eval("GetDate")).ToString("yyyy-MM-dd")%></td>
                                    <td><%#Eval("CertResults") %></td>
                                    <td>
                                        <span class="btn_operate" onclick='editlanguage("<%#Eval("ID") %>")'>编辑</span>
                                        <span class="btn_operate" onclick='Deletelanguage("<%#Eval("ID") %>")'>删除</span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <div class="line">
                    <div class="btn_operate" style="margin: 8px">
                        <a href="javascript:void(0)" onclick="addlanguage();">新增</a>
                    </div>
                </div>
                <div class="line top_10">
                    <div class="column">计算机能力</div>
                </div>

                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>证书名称</td>
                            <td>获得时间</td>
                            <td>级别</td>
                            <td width="110">操作</td>
                        </tr>
                        <asp:Repeater ID="rp_Computer" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("CertName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("GetDate")).ToString("yyyy-MM-dd")%></td>
                                    <td><%#Eval("Grade") %></td>
                                    <td>
                                        <span class="btn_operate" onclick='editComputer("<%#Eval("ID") %>")'>编辑</span>
                                        <span class="btn_operate" onclick='DeleteComputer("<%#Eval("ID") %>")'>删除</span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <div class="line">
                    <div class="btn_operate" style="margin: 8px">
                        <a href="javascript:void(0)" onclick="addComputer();">新增</a>
                    </div>
                </div>
                <div class="line top_10">
                    <div class="column_long">其他资格证书</div>
                </div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>证书名称</td>
                            <td>获得时间</td>
                            <td>分数</td>
                            <td width="110">操作</td>
                        </tr>
                         <asp:Repeater ID="rp_CertOther" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("CertName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("GetDate")).ToString("yyyy-MM-dd")%></td>
                                    <td><%#Eval("Grades") %></td>
                                    <td>
                                        <span class="btn_operate" onclick='editCertOther("<%#Eval("ID") %>")'>编辑</span>
                                        <span class="btn_operate" onclick='DeleteCertOther("<%#Eval("ID") %>")'>删除</span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>


                <div class="line">
                    <div class="btn_operate" style="margin: 8px">
                        <a href="javascript:void(0)" onclick="addCertOther();">新增</a>
                    </div>
                </div>

                <div class="clearit"></div>
            </div>
        </div>
        <div class="clearit"></div>
        <uc1:foot runat="server" ID="foot" />
    </form>
</body>
</html>

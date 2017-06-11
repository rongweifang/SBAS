<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="academy.aspx.cs" Inherits="Zhaopin.UserCenter.academy" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/employee_process.ascx" TagPrefix="uc1" TagName="employee_process" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>个人中心 - 简历登记 - 学术成果</title>
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

    <script type="text/javascript">
        //添加
        function add() {
            layer.open({
                type: 2,
                title: '论文信息 - 添加',
                maxmin: false,
                shadeClose: true, //点击遮罩关闭层
                area: ['660px', '390px'],
                content: '/UserCenter/PaperForm.aspx'
            });
        }
        //修改
        function edit(key) {
            if (IsEditdata(key)) {
                layer.open({
                    type: 2,
                    title: '论文信息 - 编辑',
                    maxmin: false,
                    shadeClose: true, //点击遮罩关闭层
                    area: ['660px', '390px'],
                    content: '/UserCenter/PaperForm.aspx?ID=' + key
                });
            }
        }
        //删除
        function Delete(key) {
            if (IsDelData(key)) {
                var delparm = 'action=del&type=paper&ID=' + key;
                delConfig('/Ajax/Common_UserRecord.ashx', delparm)
            }
        }
        //关闭
        function AllClose() {
            OpenClose();
        }

        //添加
        function addResearch() {
            layer.open({
                type: 2,
                title: '科研项目 - 添加',
                maxmin: false,
                shadeClose: true, //点击遮罩关闭层
                area: ['660px', '390px'],
                content: '/UserCenter/ResearchForm.aspx'
            });
        }
        //修改
        function editResearch(key) {
            if (IsEditdata(key)) {
                layer.open({
                    type: 2,
                    title: '科研项目 - 编辑',
                    maxmin: false,
                    shadeClose: true, //点击遮罩关闭层
                    area: ['660px', '390px'],
                    content: '/UserCenter/ResearchForm.aspx?ID=' + key
                });
            }
        }
        //删除
        function DeleteResearch(key) {
            if (IsDelData(key)) {
                var delparm = 'action=del&type=Research&ID=' + key;
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
            <form name="academyform" id="academyform" runat="server">
                <div class="line top_10">
                    <div class="column_long_long">论文发表情况<font style="color: #338d89; font-size: 12px; font-weight: normal;">&nbsp;(非必填)</font></div>
                </div>
                <div class="line">
                    <div style="padding: 10px;">
                        <div class="gray26">填写学术论文成果，建议按重要级别从高到低，5条以内。</div>
                    </div>
                </div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>论文名称</td>
                            <td>期刊名称或收录机构名称</td>
                            <td>级别</td>
                            <td>时间</td>
                            <td width="110px">操作</td>
                        </tr>
                        <asp:Repeater ID="rp_Paper" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("PaperName") %></td>
                                    <td><%#Eval("Press") %></td>
                                    <td><%#Eval("LevelName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("Pubdate")).ToString("yyyy-MM-dd")%></td>
                                    <td>
                                        <span class="btn_operate" onclick='edit("<%#Eval("PaperID") %>")'>编辑</span>
                                        <span class="btn_operate" onclick='Delete("<%#Eval("PaperID") %>")'>删除</span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <div class="line">
                    <div class="btn_operate" style="margin: 8px">
                        <a href="javascript:void(0)" onclick="add();">新增</a>
                    </div>
                </div>
                <div class="line top_10">
                    <div class="column_long_long">科研项目情况<font style="color: #338d89; font-size: 12px; font-weight: normal;">&nbsp;(非必填)</font></div>
                </div>
                <div class="line">
                    <div style="padding: 10px;">
                        <div class="gray26">科研项目成果，建议按重要级别从高到低，5条以内。</div>
                    </div>
                </div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>项目名称</td>
                            <td>项目所属单位</td>
                            <td>级别</td>
                            <td>时间</td>
                            <td width="110">操作</td>
                        </tr>
                        <asp:Repeater ID="rp_Research" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("ReseName") %></td>
                                    <td><%#Eval("ResaCompany") %></td>
                                    <td><%#Eval("LevelName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("BeginDate")).ToString("yyyy-MM-dd")%>至<%#Convert.ToDateTime(Eval("EndDate")).ToString("yyyy-MM-dd")%></td>
                                    <td>
                                        <span class="btn_operate" onclick='editResearch("<%#Eval("ReseID") %>")'>编辑</span>
                                        <span class="btn_operate" onclick='DeleteResearch("<%#Eval("ReseID") %>")'>删除</span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <div class="line">
                    <div class="btn_operate" style="margin: 8px">
                        <a href="javascript:void(0)" onclick="addResearch();">新增</a>
                    </div>

                </div>
            </form>
            <div class="clearit"></div>
        </div>
    </div>
    <uc1:foot runat="server" ID="foot" />
</body>
</html>

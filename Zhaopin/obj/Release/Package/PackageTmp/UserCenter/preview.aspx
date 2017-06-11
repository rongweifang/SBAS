<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="preview.aspx.cs" Inherits="Zhaopin.UserCenter.preview" %>

<%@ Register Src="~/UserControl/employee_foot.ascx" TagPrefix="uc1" TagName="employee_foot" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>个人中心 - 简历登记 - 简历预览及确认</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet">
    <link href="/themes/index/css/job.css" rel="stylesheet">
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
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
    <script type="text/javascript" src="/scripts/jquery.selectbox.js"></script>
    <style type="text/css">
        <!--
        /* 简历预览 */
        .preview {
            width: 100%;
            height: 33px;
            padding-top: 17px;
            background: url(/themes/default/images/me_icon_16.gif);
        }

        .preview_left {
            font-size: 0;
        }

        .preview_text {
            width: 150px;
            padding-left: 20px;
            float: left;
            font-size: 14px;
            font-weight: bold;
            color: #006f6b;
        }

        .preview_right {
            font-size: 0;
        }

        .black26 {
            font-size: 12px;
            line-height: 26px;
            font-weight: normal;
            color: #000;
            text-decoration: none;
        }

        .gray26, .gray26 a:link, .gray26 a:visited {
            font-size: 12px;
            line-height: 26px;
            font-weight: normal;
            color: #a3a3a3;
            text-decoration: none;
        }

            .gray26 a:hover {
                font-size: 12px;
                line-height: 26px;
                font-weight: normal;
                color: #0033CC;
                text-decoration: none;
            }

        /* 基本信息 */
        .basic_left {
            float: left;
            width: 585px;
            overflow: hidden;
            padding: 15px 0px 15px 10px;
        }

        .form01 {
            width: 250px;
            height: 60px;
            float: left;
        }

        .form02 {
            width: 75px;
            text-align: right;
            height: 50px;
            float: left;
        }

        .form03 {
            width: 160px;
            float: left;
        }

        .form04 {
            width: 500px;
            height: 60px;
            float: left;
        }

        .form05 {
            width: 425px;
            float: left;
        }

        .form06 {
            width: 250px;
            height: 40px;
            float: left;
        }

        .basic_photos {
            float: left;
            border: solid 1px #ccc;
            width: 102px;
            height: 126px;
            margin-top: 15px;
        }

        .photos {
            width: 102px;
            height: 126px;
            background: url(/upload/photoAttachment/20150414/562c4071fb804a0f95f5ba1b91c4247b.jpg);
        }

        table {
            width: 738px;
        }

        .basic_left table {
            width: 620px;
        }

        .auto-style1 {
            height: 25px;
        }
        -->
    </style>

</head>

<body>


    <form id="form1" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="location">
            <div class="location_left">
                <a href="/UserCenter/">个人中心</a> &gt;简历预览及确认
            </div>
        </div>
        <div class="clearit"></div>
        <div class="content">


            <uc1:employee_left runat="server" ID="employee_left" />
            <div class="right">
                <div class="preview">
                    <div class="preview_text">简历预览及确认</div>
                </div>
                <div class="clearit"></div>
                <!--基本信息开始-->
                <div class="line top_10">
                    <div class="column02">
                        <div style="float: left;">个人信息</div>
                    </div>
                    <div class="clearit"></div>
                    <div class="columnbj">
                        <div class="basic_left">
                            <table border="0" cellspacing="0" cellpadding="0" class="black26">
                                <tbody>
                                    <tr>
                                        <td width="120" align="right">姓名：</td>
                                        <td width="180">
                                            <asp:Label ID="name" runat="server" Text=""></asp:Label></td>
                                        <td width="100" align="right">性别：</td>
                                        <td width="180">
                                            <asp:Label ID="SEXNAME" runat="server"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right">身份证号码：</td>
                                        <td>
                                            <asp:Label ID="loginname" runat="server" Text=""></asp:Label></td>
                                        <td align="right">出生日期：</td>
                                        <td>
                                            <asp:Label ID="birthday" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>

                                        <td align="right">生源地：</td>
                                        <td>
                                            <asp:Label ID="lb_cityfrom" runat="server" Text=""></asp:Label></td>
                                        <td align="right"></td>
                                        <td></td>
                                    </tr>
                                    <tr>
                                        <td align="right">(预计)毕业时间：</td>
                                        <td>
                                            <asp:Label ID="gradDate" runat="server" Text=""></asp:Label></td>
                                        <td align="right">毕业生类型：</td>
                                        <td>
                                            <asp:Label ID="gradtypeNAME" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right">身高：</td>
                                        <td>
                                            <asp:Label ID="height" runat="server" Text=""></asp:Label>CM</td>
                                        <td align="right">体重：</td>
                                        <td>
                                            <asp:Label ID="weight" runat="server" Text=""></asp:Label>KG
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">民族：</td>
                                        <td>
                                            <asp:Label ID="NATIONNAME" runat="server" Text=""></asp:Label></td>
                                        <td align="right">政治面貌：</td>
                                        <td>
                                            <asp:Label ID="polityNAME" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right">婚姻情况：</td>
                                        <td colspan="3">
                                            <asp:Label ID="marriageNAME" runat="server" Text=""></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right">健康情况：</td>
                                        <td colspan="3">
                                            <asp:Label ID="healthy" runat="server" Text=""></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="right">手机：</td>
                                        <td>
                                            <asp:Label ID="mobile" runat="server" Text="Label"></asp:Label></td>
                                        <td align="right">电子邮箱：</td>
                                        <td>
                                            <asp:Label ID="email" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right">通信地址：</td>
                                        <td colspan="3">
                                            <asp:Label ID="Address" runat="server" Text="Label"></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td align="right">邮政编码：</td>
                                        <td>
                                            <asp:Label ID="zipcode" runat="server" Text="Label"></asp:Label></td>
                                        <td align="right"></td>
                                        <td></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="basic_photos">
                            <div>
                                <img id="blogimgsees" src="" width="102" height="126" runat="server" />
                            </div>
                        </div>
                    </div>
                </div>
                <div class="line top_10">
                    <div class="column02">
                        <div style="float: left;">学习经历</div>
                    </div>
                </div>
                <div class="clearit"></div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>起止时间</td>
                            <td>学历/学位</td>
                            <td>学校名称</td>
                            <td>所学专业</td>
                            <td>是否全日制</td>

                        </tr>
                        <asp:Repeater ID="rp_Education" runat="server" OnItemDataBound="rp_Education_ItemDataBound">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Convert.ToDateTime(Eval("BeginDate")).ToString("yyyy-MM-dd")%>至<%#Convert.ToDateTime(Eval("EndDate")).ToString("yyyy-MM-dd")%></td>
                                    <td><%#Eval("eduBackName") %>/<%#Eval("degreeName") %></td>
                                    <td><%#Eval("SchoolName") %></td>
                                    <td><%#Eval("specialty") %></td>
                                    <td>
                                        <asp:Label ID="LB_fullDay" runat="server" Text='<%#Eval("IsFullDay") %>'></asp:Label></td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>


                    </tbody>
                </table>
                <div class="line top_10">
                    <div class="column02">
                        <div style="float: left;">外语能力</div>
                    </div>
                </div>
                <div class="clearit"></div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>语种名称</td>
                            <td>等级</td>
                            <td>获得时间</td>
                            <td>分数</td>
                            <td>证书/成绩单</td>
                        </tr>

                        <asp:Repeater ID="rp_Language" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("LangName") %></td>
                                    <td><%#Eval("LangLevel") %> </td>
                                    <td><%#Convert.ToDateTime(Eval("GetDate")).ToString("yyyy-MM-dd")%></td>
                                    <td><%#Eval("CertResults") %></td>
                                      <td><%#Convert.IsDBNull(Eval("CertFilePath")) ? "" : "<a href='"+Eval("CertFilePath") +"' target='_blank'>预览</a>"%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <div class="line top_10">
                    <div class="column02">
                        <div style="float: left;">计算机能力</div>
                    </div>
                </div>
                <div class="clearit"></div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>证书名称</td>
                            <td>获得时间</td>
                            <td>级别</td>
                            <td>证书编号</td>
                            <td>成绩</td>
                            <td>证书/成绩单</td>
                        </tr>
                        <asp:Repeater ID="rp_Computer" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("CertName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("GetDate")).ToString("yyyy-MM-dd")%></td>
                                    <td><%#Eval("Grade") %></td>
                                    <td><%#Eval("CertNO") %></td>
                                    <td><%#Eval("CertLevel") %></td>
                                    <td><%#Convert.IsDBNull(Eval("CertPath")) ? "" : "<a href='"+Eval("CertPath") +"' target='_blank'>预览</a>"%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <div class="line top_10">
                    <div class="column02">
                        <div style="float: left;">资格证书</div>
                    </div>
                </div>
                <div class="clearit"></div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>证书名称</td>
                            <td>获得时间</td>
                            <td>分数</td>
                            <td>证书编号</td>
                            <td>级别</td>
                             <td>证书/成绩单</td>
                        </tr>
                        <asp:Repeater ID="rp_CertOther" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("CertName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("GetDate")).ToString("yyyy-MM-dd")%></td>
                                    <td><%#Eval("Grades") %></td>
                                    <td><%#Eval("CertNO") %></td>
                                    <td><%#Eval("CertLevel") %></td>
                                     <td><%#Convert.IsDBNull(Eval("CertPath")) ? "" : "<a href='"+Eval("CertPath") +"' target='_blank'>预览</a>"%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <div class="line top_10">
                    <div class="column02_long">
                        <div style="float: left;">主要家庭成员</div>
                    </div>
                </div>
                <div class="clearit"></div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td width="81px">称谓</td>
                            <td>姓名</td>
                            <td>工作单位</td>
                            <td>职务/岗位</td>
                        </tr>
                        <asp:Repeater ID="rp_family" runat="server">
                            <ItemTemplate>

                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("CallName") %></td>
                                    <td><%#Eval("Name") %></td>
                                    <td><%#Eval("WorkPlace") %></td>
                                    <td><%#Eval("Job") %></td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <!--主要家庭成员结束-->

                <!--主要社会实践或工作经历开始-->
                <div class="line top_10">
                    <div class="column02_long_long">
                        <div style="float: left;">主要社会实践或工作经历</div>
                    </div>
                </div>
                <div class="clearit"></div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>单位</td>
                            <td>岗位</td>
                            <td>工作形式</td>
                            <td>时间</td>
                        </tr>
                        <asp:Repeater ID="rp_Work" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("CompName") %></td>
                                    <td><%#Eval("Job") %></td>
                                    <td><%#Eval("TypeName") %> </td>
                                    <td><%#Convert.ToDateTime(Eval("BeginDate")).ToString("yyyy-MM-dd")%>至<%#Convert.ToDateTime(Eval("EndDate")).ToString("yyyy-MM-dd")%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <!--主要社会实践或工作经历结束-->

                <!--学术成果情况开始-->
                <div class="line top_10">
                    <div class="column02_long">
                        <div style="float: left;">论文发表情况</div>
                    </div>
                </div>
                <div class="clearit"></div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>论文名称</td>
                            <td>期刊名称或收录机构名称</td>
                            <td>级别</td>
                            <td>时间</td>
                        </tr>
                        <asp:Repeater ID="rp_Paper" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("PaperName") %></td>
                                    <td><%#Eval("Press") %></td>
                                    <td><%#Eval("LevelName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("Pubdate")).ToString("yyyy-MM-dd")%></td>

                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
                <!--学术成果情况结束-->

                <!--科研项目成果开始-->
                <div class="line top_10">
                    <div class="column02_long">
                        <div style="float: left;">科研项目情况</div>
                    </div>
                </div>
                <div class="clearit"></div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>项目名称</td>
                            <td>项目所属单位</td>
                            <td>级别</td>
                            <td>时间</td>
                        </tr>
                        <asp:Repeater ID="rp_Research" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("ReseName") %></td>
                                    <td><%#Eval("ResaCompany") %></td>
                                    <td><%#Eval("LevelName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("BeginDate")).ToString("yyyy-MM-dd")%>至<%#Convert.ToDateTime(Eval("EndDate")).ToString("yyyy-MM-dd")%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <!--科研项目成果结束-->

                <!--获奖情况开始-->
                <div class="line top_10">
                    <div class="column02">
                        <div style="float: left;">获奖情况</div>
                    </div>
                </div>
                <div class="clearit"></div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>证书名称</td>
                            <td>证书级别</td>
                            <td>获得时间</td>
                            <td>发证单位</td>
                            <td>证书编号</td>
                             <td>证件扫描</td>
                        </tr>
                        <asp:Repeater ID="rp_Award" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("AwardName") %></td>
                                    <td><%#Eval("LevelName") %></td>
                                    <td><%#Convert.ToDateTime(Eval("GetDate")).ToString("yyyy-MM-dd")%></td>
                                    <td><%#Eval("AwardCompany") %></td>
                                    <td><%#Eval("AwardNO") %></td>
                                    <td><%#Convert.IsDBNull(Eval("AwardUrl")) ? Eval("AwardUrl") : "<a href='"+Eval("AwardUrl") +"' target='_blank'>预览</a>"%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>

                    </tbody>
                </table>
                <!--获奖情况结束-->

                <!--上传电子附件开始-->
                <div class="line top_10" style="display:none;">
                    <div class="column02_long">
                        <div style="float: left;">上传电子附件</div>
                    </div>
                </div>
                <div class="clearit"></div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;display:none;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>附件类型</td>
                            <td>附件大小</td>
                            <td>上传时间</td>
                        </tr>
                        <asp:Repeater ID="rp_Atta" runat="server">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Eval("AttaName") %></td>
                                    <td><%#Eval("AttaSize") %>KB </td>
                                    <td><%#Convert.ToDateTime(Eval("CreateDate")).ToString("yyyy-MM-dd")%></td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <!--上传电子附件结束-->

                <!--翻页开始-->
                <div class="line gray" style="line-height: 18px;">
                    &nbsp;&nbsp;&nbsp;&nbsp;<img src="/themes/default/images/me_icon_02.png">&nbsp;&nbsp;提示：<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;1.点击【确认简历信息】后，方可进行工作申请。<br>
                    &nbsp;&nbsp;&nbsp;&nbsp;2.简历确认后，所有内容均不可以修改。<br>
                    <br>
                </div>
                <div class="page">
                    <asp:Button ID="Button1" runat="server" Text="确认简历信息" CssClass="btnsubmit" Width="140" OnClick="Button1_Click" />
                    &nbsp;
                </div>
            </div>
        </div>
        <div class="clearit"></div>
    </form>
    <uc1:employee_foot runat="server" ID="employee_foot" />
</body>
</html>

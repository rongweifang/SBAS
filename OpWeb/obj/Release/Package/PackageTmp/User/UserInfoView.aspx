<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserInfoView.aspx.cs" Inherits="Manage.User.UserInfoView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <link href="/themes/index/css/css.css" rel="stylesheet" />
    <link href="/themes/index/css/job.css" rel="stylesheet" />
    <style type="text/css">
        .basic_photos {
            float: right;
            height: 126px;
            width: 102px;
        }

        .basic_left {
            float: left;
        }
    </style>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">

        <div>
            <div>
                <div class="column02">
                    <div style="float: left;">个人信息</div>
                    <asp:Label ID="Label1" runat="server" Text="0" Visible="false"></asp:Label>
                </div>
                <div class="clearit"></div>
                <div>
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
            <div style="clear:both"></div>
            <div class="line top_10">
                <div class="column02">
                    <div style="float: left;">学习经历</div>
                </div>
            </div>
            <div class="clearit"></div>
            <table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                <tbody>
                    <tr bgcolor="#f2f2f2" align="center" class="black">
                        <td>起止时间</td>
                        <td>学历/学位</td>
                        <td>学校名称</td>
                        <td>所学专业</td>
                    
                        <td>招生批次</td>
                       
                        <td>学习形式</td>
                        <td>学历证书号</td>
                        <td>学籍认证码</td>
                        <td>有效期</td>

                        <td>是否最高学历</td>
                        <td>985</td>
                        <td>211</td>
                    </tr>
                    <asp:Repeater ID="rp_Education" runat="server" OnItemDataBound="rp_Education_ItemDataBound">
                        <ItemTemplate>
                            <tr bgcolor="#FFFFFF" align="center" class="gray">
                                <td><%#Convert.ToDateTime(Eval("BeginDate")).ToString("yyyy-MM-dd")%>至<%#Convert.ToDateTime(Eval("EndDate")).ToString("yyyy-MM-dd")%></td>
                                <td><%#Eval("eduBackName") %>/<%#Eval("degreeName") %></td>
                                <td><%#Eval("SchoolName") %></td>
                                <td><%#Eval("specialty") %></td>
                               
                                <td><%#Eval("edubatchName") %></td>
                               
                                <td><%#Eval("eduTypeName") %></td>
                                <td><%#Eval("CertNO") %></td>
                                <td><%#Eval("DegreeAuthcode") %></td>
                                <td><%#Eval("DegreeOverdate") %></td>
                                <td><asp:Label ID="isfirst" runat="server" Text='<%#Eval("isfirst") %>'></asp:Label></td>
                                <td><%#Eval("Is985") %></td>
                                <td><%#Eval("Is211") %></td>
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
            <table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
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
            <table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                <tbody>
                    <tr bgcolor="#f2f2f2" align="center" class="black">
                        <td>证书名称</td>
                        <td>获得时间</td>
                        <td>分数</td>
                        <td>证书编号</td>
                        <td>级别</td>
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
            <table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
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
            <table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
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
            <table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
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
            <table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
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
            <table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
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
            <table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
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

        
            <table width="100%" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;display:none;">
                <tbody>
                    <tr bgcolor="#f2f2f2" align="center" class="black">
                        <td>附件类型</td>
                        <td>附件大小</td>
                        <td>上传时间</td>
                        <td>附件详细</td>
                    </tr>
                    <asp:Repeater ID="rp_Atta" runat="server">
                        <ItemTemplate>
                            <tr bgcolor="#FFFFFF" align="center" class="gray">
                                <td><%#Eval("AttaName") %></td>
                                <td><%#Eval("AttaSize") %>KB </td>
                                <td><%#Convert.ToDateTime(Eval("CreateDate")).ToString("yyyy-MM-dd")%></td>
                                <td><a href='<%#Eval("AttaPath") %>' target="_blank">预览</a></td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </tbody>
            </table>
            <!--上传电子附件结束-->
            <style>
                .button_verify{width:100px; height:32px; line-height:32px; background-color:teal; margin-left:5px; margin-right:5px; color:white;}

            </style>
            <div style="width:100%">
                <table style="width:100%">
                    <tr>
                        <td></td>
                        <td></td>
                    </tr>
                </table>

            </div>
            <!--翻页开始-->
            <div class="page" style="width:100%">
                <asp:Button ID="Button3" runat="server" Text="上一个"  CssClass="button_verify" BorderStyle="None" OnClick="Button3_Click"/>
                <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="审核合格" CssClass="button_verify" BorderStyle="None"/>
                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="不合格" CssClass="button_verify" BorderStyle="None" />
                <asp:Button ID="Button5" runat="server" Text="标记"  CssClass="button_verify" BorderStyle="None" OnClick="Button5_Click" />
                <asp:Button ID="Button4" runat="server" Text="下一个"  CssClass="button_verify" BorderStyle="None" OnClick="Button4_Click"/>
            </div>
        </div>
    </form>
</body>
</html>

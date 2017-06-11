<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CompayApplyView.aspx.cs" Inherits="Zhaopin.UserCenter.CompayApplyView" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>招聘一览</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/style_detail.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/job.css" rel="stylesheet" type="text/css" />
    <script src="/scripts/jquery.js" type="text/javascript"></script>
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <script src="/scripts/FunctionJS.js" type="text/javascript"></script>
    <style type="text/css">
        <!--
        .text_button {
            width: 930px;
            margin: 0px auto;
            border-bottom: dashed 1px #ccc;
            padding: 10px 0px;
        }

        .green, .green a:link, .green a:visited {
            font-size: 12px;
            line-height: 24px;
            font-weight: normal;
            color: #0a7671;
            text-decoration: none;
        }

            .green a:hover {
                font-size: 12px;
                line-height: 24px;
                font-weight: normal;
                color: #000;
                text-decoration: none;
            }
        -->
        .jssearch {
            width: 100%;
            overflow: hidden;
        }

            .jssearch li {
                width: 100%;
                overflow: hidden;
                margin-bottom: 10px;
            }

        .search_text {
            width: 100%;
        }

        .search_input {
            width: 100%;
            float: left;
            line-height: 24px;
        }

        .fujian {
            color: #000;
            text-decoration: none;
        }

            .fujian:hover {
                color: #0033CC;
                text-decoration: underline;
            }
    </style>
    <script type="text/javascript">
        function apply(specID) {
            layer.alert('注意：每人只能申请一个专业，新的工作申请会自动覆盖上一个！', {
                skin: 'layui-layer-molv' //样式类名
            }, function () {
                var flag = false;
                var parm = 'action=specapply&specID=' + escape(specID);
                getAjax('/Ajax/Common_UserApply.ashx', parm, function (rs) {
                    if (parseInt(rs) == 1) {
                        layer.closeAll();
                        layer.msg('工作申请成功！');
                    }
                    if (parseInt(rs) == 2) {
                        layer.closeAll();
                        layer.msg('你的条件不符合该专业学历要求！');
                    }
                    if (parseInt(rs) == 3) {
                        layer.closeAll();
                        layer.msg('请先确认简历后，再申请工作！');
                    }
                    if (parseInt(rs) == 4) {
                        layer.closeAll();
                        layer.msg('你的毕业时间或年龄不符合该专业要求！');
                    }
                    if (parseInt(rs) == 0) {
                        layer.closeAll();
                        layer.msg('专业申请失败，请重新登录后再申请！');
                    }

                });
            });
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div id="wrap">
            <uc1:head runat="server" ID="head" />
            <div id="location">
                <div class="left">
                    <a href="/UserCenter/CompayApplyList.aspx">招聘一览</a>&gt;<a href="#">信息内容</a>
                </div>
            </div>
            <div id="main_content_02">
                <div class="text_button" style="padding-left: 16px;">
                    报名截止日期：<%=EndDate %>
                </div>
                <div class="detail">
                    <h1 style="font-size: 18pt"><%=companyName %></h1>
                    <h2>报名开始日期：<%=BeginDate %>&nbsp;&nbsp;&nbsp;&nbsp;</h2>
                    <div style="padding: 20px 48px 0px 48px; line-height: 24px; text-indent: 2em; font-size:16px;">
                        <%=Introduction %>
                       
                        <div style="text-align: left; line-height: 29pt; text-indent: 32.15pt" align="left"><b><span style="font-size: 16pt">招聘专业</span></b></div>
                        <table style="border-collapse: collapse; background: #000;" cellspacing="1" cellpadding="0" width="890" style=" text-indent: 0em;">
                            <thead>
                                <tr style="height: 40.5pt">
                                    <td style="border-bottom: black 1pt solid; border-left: black 1pt solid;text-indent: 0em; padding-bottom: 0cm; background-color: white; padding-left: 5.4pt;  padding-right: 5.4pt; height: 40.5pt; border-top: black 1pt solid; border-right: black 1pt solid; padding-top: 0cm" >
                                        <div style="text-align: center; line-height: 18pt; layout-grid-mode: char" align="center"><b><span style="font-size: 12pt">序号</span></b></div>
                                    </td>
                                    <td style="border-bottom: black 1pt solid; border-left: #ece9d8; padding-bottom: 0cm; text-indent: 0em;background-color: white; padding-left: 5.4pt; padding-right: 5.4pt; height: 40.5pt; border-top: black 1pt solid; border-right: black 1pt solid; padding-top: 0cm" >
                                        <div style="text-align: center; line-height: 18pt; layout-grid-mode: char" align="center"><b><span style="font-size: 12pt">招聘专业</span></b></div>
                                    </td>
                                    <td style="border-bottom: black 1pt solid; border-left: #ece9d8; padding-bottom: 0cm; text-indent: 0em;background-color: white; padding-left: 5.4pt; padding-right: 5.4pt; height: 40.5pt; border-top: black 1pt solid; border-right: black 1pt solid; padding-top: 0cm" >
                                        <div style="text-align: center; line-height: 18pt; layout-grid-mode: char" align="center"><b><span style="font-size: 12pt">需求人数</span></b></div>
                                    </td>
                                    <td style="border-bottom: black 1pt solid; border-left: #ece9d8; padding-bottom: 0cm; background-color: white; padding-left: 5.4pt; padding-right: 5.4pt; height: 40.5pt; border-top: black 1pt solid; border-right: black 1pt solid; padding-top: 0cm;" >
                                        <div style="text-align: center; line-height: 18pt; layout-grid-mode: char" align="center"><b><span style="font-size: 12pt">专业范围</span></b></div>
                                    </td>
                                    <td style="border-bottom: black 1pt solid; border-left: #ece9d8; padding-bottom: 0cm;text-indent: 0em; background-color: white; padding-left: 5.4pt; padding-right: 5.4pt; height: 40.5pt; border-top: black 1pt solid; border-right: black 1pt solid; padding-top: 0cm">
                                        <div style="text-align: center; line-height: 18pt; layout-grid-mode: char" align="center"><b><span style="font-size: 12pt">最低学历</span></b></div>
                                    </td>
                                    <td style="border-bottom: black 1pt solid; border-left: #ece9d8; padding-bottom: 0cm;text-indent: 0em; background-color: white; padding-left: 5.4pt; padding-right: 5.4pt; height: 40.5pt; border-top: black 1pt solid; border-right: black 1pt solid; padding-top: 0cm" >
                                        <div style="text-align: center; line-height: 18pt; layout-grid-mode: char" align="center"><b><span style="font-size: 12pt">工作申请</span></b></div>
                                    </td>
                                </tr>
                            </thead>
                            <tbody id="workApply">
                                <asp:Repeater ID="rp_apply" runat="server">
                                    <ItemTemplate>
                                        <tr>
                                            <td style="border-bottom: black 1pt solid; border-left: black 1pt solid; padding-left: 5.4pt;text-indent: 0em;text-align: center;" height="35"><%# Container.ItemIndex + 1%></td>
                                            <td style="border-bottom: black 1pt solid; border-left: black 1pt solid; padding-left: 5.4pt;text-indent: 0em;text-align: center; width:140px;" ><%#Eval("specName") %></td>
                                            <td style="border-bottom: black 1pt solid; border-left: black 1pt solid; padding-left: 5.4pt;text-indent: 0em; text-align: center;width:80px;" ><%#Eval("acceptNum")%></td>
                                            <td style="border-bottom: black 1pt solid; border-left: black 1pt solid; padding-left: 5.4pt;text-indent: 0em; text-align:left;"><%#Eval("acceptLevel") %></td>
                                            <td style="border-bottom: black 1pt solid; border-left: black 1pt solid; padding-left: 5.4pt;text-indent: 0em; text-align: center;width:120px;" ><%#Eval("EduBackName") %></td>
                                            <td style="border-bottom: black 1pt solid; border-left: black 1pt solid; padding-left: 5.4pt;text-indent: 0em; text-align: center; cursor: pointer; width:90px;" onclick="apply('<%#Eval("ID") %>');">
                                                <span class="SpecialtyOrder" style="text-indent:0px;">申请</span></td>
                                        </tr>
                                    </ItemTemplate>
                                </asp:Repeater>
                            </tbody>
                        </table>
                    </div>
                    <div style="margin-top: 30px;">
                    </div>
                    <div style="line-height:25px;padding:30px">

学历要求：<br />
1、电子信息类：<br />
&nbsp;&nbsp;计算机专业：硕士研究生及以上学历。<br />
&nbsp;&nbsp;其他电子信息类专业：硕士研究生或取得英语六级、计算机二级的本科生。<br />
2、财务审计类：硕士研究生及以上学历或具有注册会计师资格的本科生。<br />
3、法律：硕士研究生及以上学历或通过国家司法考试的本科生。<br />


                    </div>
                    <div class="text_button" style="padding-left: 16px;">
                        报名截止日期：<%=EndDate %>
                    </div>

                </div>
            </div>
        </div>
        <uc1:foot runat="server" ID="foot" />
    </form>
</body>
</html>

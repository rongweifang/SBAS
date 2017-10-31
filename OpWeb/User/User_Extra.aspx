<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Extra.aspx.cs" Inherits="OpWeb.User.User_Extra" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户基本信息2/3</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
    <!-- jQuery Validation plugin javascript-->
    <script src="/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/plugins/validate/messages_zh.min.js"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
</head>
<body>
    <form id="signupForm" runat="server">
        <div class="ibox-content">
            <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                <tbody>
                    <tr>
                        <td width="120">
                            <label class="control-label">婚烟状况：</label></td>
                        <td width="180">
                            <select class="form-control" id="U_Marry" name="U_Marry" runat="server">
                                <option>已婚</option>
                                <option>未婚</option>
                                <option>离婚</option>
                                <option>丧偶</option>
                            </select>
                        </td>
                        <td width="120">
                            <label class="control-label">学　　历：</label>
                        </td>
                        <td>
                            <select class="form-control" id="U_Education" name="U_Education" runat="server">
                                <option>小学</option>
                                <option>初中</option>
                                <option>高中</option>
                                <option>大专</option>
                                <option>硕士研究生</option>
                                <option>博士研究生</option>
                                <option>本科</option>
                            </select>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">工作单位：</label></td>
                        <td>
                            <input id="U_Company" name="U_Company" class="form-control" type="text" runat="server" />

                        </td>
                        <td>
                            <label class="control-label">行政职务：</label></td>
                        <td>
                            <input id="U_Duties" name="U_Duties" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">单位性质：</label></td>
                        <td>
                            <input id="U_OrgProperty" name="U_OrgProperty" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">单位地址：</label></td>
                        <td>
                            <input id="U_CompanyAddress" name="U_CompanyAddress" class="form-control" type="text" runat="server" />
                        </td>

                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">单位电话：</label></td>
                        <td>
                            <input id="U_CompanyTel" name="U_CompanyTel" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">单位邮编：</label></td>
                        <td>
                            <input id="U_CompanyZip" name="U_CompanyZip" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">月收入金额：</label></td>
                        <td>
                            <input id="U_Income" name="U_Income" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">收入来源：</label></td>
                        <td>
                            <input id="U_Earn" name="U_Earn" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">供养人口：</label>
                        </td>
                        <td>
                            <input id="U_Provide" name="U_Provide" class="form-control" type="text" runat="server" />
                        </td>
                        <td>
                            <label class="control-label">个人公积金帐号：</label></td>
                        <td>
                            <input id="U_Accumulation" name="U_Accumulation" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">职业：</label>
                        </td>
                        <td>
                            <select class="form-control" id="U_Occupation" name="U_Occupation" runat="server">
                                <option>其他</option>
                                <option>政府公务人员</option>
                                <option>事业单位人员</option>
                                <option>公司人员</option>
                                <option>军人</option>
                            </select></td>
                        <td>
                            <label class="control-label">职务：</label></td>
                        <td>
                            <select class="form-control" id="U_Duty" name="U_Duty" runat="server">
                                <option selected>其它</option>
                                <option>厅级以上</option>
                                <option>处级</option>
                                <option>科级</option>
                                <option>科级以下</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">职称：</label>
                        </td>
                        <td>
                            <select class="form-control" id="U_TechnicalPost" name="U_TechnicalPost" runat="server">
                                <option selected></option>
                                <option>中级以下</option>
                                <option>研究员</option>
                                <option>高级</option>
                                <option>中级</option>
                            </select>
                        </td>
                        <td>
                            <label class="control-label">工龄：</label>
                        </td>
                        <td>
                            <input id="U_Seniority" name="U_Seniority" class="form-control" type="text" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">现居住面积：</label></td>
                        <td>
                            <input id="U_Area" name="U_Area" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">产权情况：</label></td>
                        <td>
                            <select class="form-control" id="U_PropertyRight" name="U_PropertyRight" runat="server">
                                <option selected></option>
                                <option>自有住房</option>
                                <option>分期付款住房</option>
                                <option>租房</option>
                                <option>与父母同住</option>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">入住时间：</label></td>
                        <td>
                            <input id="U_CheckIn" name="U_CheckIn" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">住宅电话：</label></td>
                        <td>
                            <input id="U_HomePhone" name="U_HomePhone" class="form-control" type="text" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">父母住址:</label></td>
                        <td colspan="3">
                            <input id="U_ParentAddress" name="U_ParentAddress" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                </tbody>
            </table>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">完　成</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                </div>
            </div>
        </div>
    </form>

    <script>
        $.validator.setDefaults({
            highlight: function (element) {
                $(element).closest('.form-group').removeClass('has-success').addClass('has-error');
            },
            success: function (element) {
                element.closest('.form-group').removeClass('has-error').addClass('has-success');
            },
            errorElement: "span",
            errorPlacement: function (error, element) {
                if (element.is(":radio") || element.is(":checkbox")) {
                    error.appendTo(element.parent().parent().parent());
                } else {
                    error.appendTo(element.parent());
                }
            },
            errorClass: "help-block m-b-none",
            validClass: "help-block m-b-none"
        });
    </script>
</body>
</html>

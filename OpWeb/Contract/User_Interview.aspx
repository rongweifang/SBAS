<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Interview.aspx.cs" Inherits="OpWeb.Contract.User_Interview" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>富民一卡通--面谈记录</title>
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
    <script src="/js/plugins/suggest/bootstrap-suggest.min.js"></script>
    <script src="/js/plugins/laydate/laydate.js"></script>

    <style type="text/css">
        .ULine {
            padding: 2px;
            margin: 0;
        }

            .ULine label {
                padding: 0;
                margin: 3px;
            }

            .ULine li {
                float: left;
                list-style: none;
                line-height: 25px;
                display: block;
                margin: 0;
                padding: 0;
            }

        .FormInline {
            width: 120px;
            display: inline-block;
            height: 30px;
        }

        .FormHead {
            display: inline-block;
            line-height: 30px;
        }

        .FormInput {
            width: 100px;
            display: inline-block;
            line-height: 30px;
        }

            .FormInput input {
                padding: 0px;
                margin: 0px;
                border: none;
                border-bottom: solid 1px #000;
                height: 25px;
            }
    </style>
</head>
<body>
    <form id="signupForm" runat="server">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td>
                                <label class="control-label">申请人：</label></td>
                            <td colspan="3" style="text-align:left"><%=Card_Name %></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td width="80">
                                <label class="control-label">面谈时间：</label></td>
                            <td width="150">
                                <input id="UV_Date" runat="server" class="laydate-icon form-control layer-date" name="UV_Date" /></td>
                            <td width="120">
                                <label class="control-label">面谈地点：</label></td>
                            <td>

                                <input id="UV_Address" name="UV_Address" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="text-align: left"><span style="display: inline-block; line-height: 30px;">感谢您对我社的信赖，现根据我社贷款业务的有关规定，就您在我社申请借款有关事宜，请您回答几个问题，您在此承诺保证内容的真实性。</span></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>1</td>
                            <td colspan="3" style="text-align: left;"><span style="display: inline-block; line-height: 30px;">您申请的贷款是：<%=M_CreditType %></span></td>
                        </tr>
                        <tr>
                            <td>2</td>
                            <td colspan="3" style="text-align: left;"><span style="display: inline-block; line-height: 30px;">您申请贷款的用途是：<%=M_Use %></span></td>
                        </tr>
                        <tr>
                            <td>3</td>
                            <td colspan="3" style="text-align: left;"><span style="display: inline-block; line-height: 30px;">您在《借款申请表》中填写的身份、职业、住址、联系电话等个人资料是否准确、真实：</span><span class="FormInline"><select class="form-control" id="UV_Real" name="UV_Real" runat="server">
                                <option>是</option>
                                <option>否</option>
                            </select></span></td>
                        </tr>
                        <tr>
                            <td>4</td>
                            <td colspan="3" style="text-align: left;"><span class="FormHead">您您拥有的个人资产：房产</span><span class="FormInput"><input id="UV_House" name="UV_House" class="form-control" type="text" runat="server" /></span><span class="FormHead">价值</span><span class="FormInput"><input id="UV_HouseValue" name="UV_HouseValue" class="form-control" type="text" runat="server" /></span><span class="FormHead">万元，车辆</span><span class="FormInput"><input id="UV_Vehicle" name="UV_Vehicle" class="form-control" type="text" runat="server" /></span><span class="FormHead">价值</span><span class="FormInput"><input id="UV_VehicleValue" name="UV_VehicleValue" class="form-control" type="text" runat="server" /></span><span class="FormHead">万元，其他资产</span><span class="FormInput"><input id="UV_Others" name="UV_Others" class="form-control" type="text" runat="server" /></span><span class="FormHead">。</span>
                            </td>
                        </tr>
                        <tr>
                            <td>5</td>
                            <td colspan="3" style="text-align: left;"><span class="FormHead">您所从事的行业</span><span class="FormInput"><input id="UV_Trade" name="UV_Trade" class="form-control" type="text" runat="server" /></span><span class="FormHead">经营项目</span><span class="FormInput"><input id="UV_Operating" name="UV_Operating" class="form-control" type="text" runat="server" /></span><span class="FormHead">。</span></td>
                        </tr>
                        <tr>
                            <td>6</td>
                            <td colspan="3" style="text-align: left;"><span style="display: inline-block; line-height: 30px;">您个人月收入</span><span class="FormInput"><input id="UV_Income" name="UV_Income" class="form-control" type="text" runat="server" /></span><span class="FormHead">元；配偶月收入</span><span class="FormInput"><input id="UV_MateIncome" name="UV_MateIncome" class="form-control" type="text" runat="server" /></span><span class="FormHead">元；家庭的全年经济收入</span><span class="FormInput"><input id="UV_FamilyIncome" name="UV_FamilyIncome" class="form-control" type="text" runat="server" /></span><span class="FormHead">万元。</span>
                            </td>
                        </tr>
                        <tr>
                            <td>7</td>
                            <td colspan="3" style="text-align: left;"><span style="display: inline-block; line-height: 30px;">您归还贷款的主要来源是： <%=M_Source %>。</span>  </td>
                        </tr>
                        <tr>
                            <td>8</td>
                            <td colspan="3" style="text-align: left;"><span style="display: inline-block; line-height: 30px;">您申请贷款的担保方式是：<%=M_GuaranteeType %></span></td>
                        </tr>
                        <tr>
                            <td>9</td>
                            <td colspan="3" style="text-align: left;"><span style="display: inline-block; line-height: 30px;">您申请贷款的抵（质）押物是否归您本人所有：</span><span class="FormInline"><select class="form-control" id="UV_Ownership" name="UV_Ownership" runat="server">
                                <option>是</option>
                                <option>否</option>
                            </select></span></td>
                        </tr>
                        <tr>
                            <td>10</td>
                            <td colspan="3" style="text-align: left;"><span class="FormHead">您申请办理抵押担保贷款，对有关评估、登记、公正、保险的费用，按有关规定将由您承担。您是否清楚：</span><span class="FormInline"><select class="form-control" id="UV_FeeAffirm" name="UV_FeeAffirm" runat="server">
                                <option>真实</option>
                                <option>不真实</option>
                            </select></span>
                            </td>
                        </tr>
                        <tr>
                            <td>11</td>
                            <td colspan="3" style="text-align: left;"><span class="FormHead">您提供的资料是否真实：</span><span class="FormInline"><select class="form-control" id="UV_Affirm" name="UV_Affirm" runat="server">
                                <option>真实</option>
                                <option>不真实</option>
                            </select></span>
                            </td>
                        </tr>
                        <tr>
                            <td>12</td>
                            <td colspan="3" style="text-align: left;"><span class="FormHead">以上谈话内容是否真实：</span><span class="FormInline"><select class="form-control" id="UV_AffirmAll" name="UV_AffirmAll" runat="server">
                                <option>真实</option>
                                <option>不真实</option>
                            </select></span> </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px;"></td>
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
        </div>

    </form>



    <script>
        laydate.render({
            elem: '#UV_Date'
        });

    </script>

</body>
</html>

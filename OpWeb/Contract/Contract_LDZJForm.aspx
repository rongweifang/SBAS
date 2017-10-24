<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_LDZJForm.aspx.cs" Inherits="OpWeb.Contract.Contract_LDZJForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>流动资金借款合同管理</title>
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
    <script src="/js/plugins/iCheck/icheck.min.js"></script>
    <script src="/js/plugins/laydate/laydate.js"></script>
    <script src="/js/demo/form-advanced-demo.js"></script>

</head>
<body>
    <form id="signupForm" runat="server">
        <div class="ibox float-e-margins">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-briefcase"></i>借款信息</a></li>
                <li class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i>用款计划</a></li>
                <li class=""><a data-toggle="tab" href="#tab-3"><i class="fa fa-briefcase"></i>还款计划</a></li>
                <li class="" id="Type1"><a data-toggle="tab" href="#tab-4"><i class="fa fa-briefcase"></i>保证方式</a></li>
                <li class="" style="display: none;" id="Type2"><a data-toggle="tab" href="#tab-5"><i class="fa fa-briefcase"></i>抵押方式</a></li>
                <li class="" style="display: none;" id="Type3"><a data-toggle="tab" href="#tab-6"><i class="fa fa-briefcase"></i>质押方式</a></li>
            </ul>
            <div style="clear: both"></div>
            <div class="tab-content" style="height: 390px;">
                <div id="tab-1" class="tab-pane active">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                            <tbody>
                                <tr>
                                    <td width="110">
                                        <label class="control-label">担保方式<span style="color: red">*</span>：</label></td>
                                    <td width="180">
                                        <select class="form-control" name="E_GuaranteeType" id="E_GuaranteeType" runat="server" onchange="SGuaranteeType()">
                                            <option>保证</option>
                                            <option>抵押</option>
                                            <option>质押</option>
                                            <option>信用</option>
                                        </select>
                                    </td>
                                    <td width="100">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">借款金额<span style="color: red">*</span>：</label></td>
                                    <td>
                                        <input id="E_Loan" name="E_Loan" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">大写：</label></td>
                                    <td>
                                        <input id="E_Loan_Cap" name="E_Loan_Cap" readonly="true" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">借款期限<span style="color: red">*</span>：</label></td>
                                    <td>
                                        <div class="input-group">
                                            <input id="M_Loan_Months" name="M_Loan_Months" class="form-control" type="text" runat="server" />
                                            <span class="input-group-addon">月</span>
                                        </div>
                                    </td>
                                    <td>
                                        <label class="control-label">借款用途<span style="color: red">*</span>：</label></td>
                                    <td>
                                        <input id="E_Use" name="E_Use" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">借款利率<span style="color: red">*</span>：</label></td>
                                    <td>
                                        <select class="form-control" name="M_Loan_Type" id="M_Loan_Type" runat="server">
                                            <option value="1">固定利率</option>
                                            <option value="2">浮动利率</option>
                                        </select>
                                    </td>
                                    <td colspan="2">
                                        <div class="input-group" id="TypeC1">
                                            <span class="input-group-addon">年利率</span>
                                            <input id="M_Rate_Year" name="M_Rate_Year" class="form-control" type="text" runat="server" />
                                            <span class="input-group-addon">%</span>
                                        </div>
                                        <div class="input-group" id="TypeC2" style="display:none">
                                            <span class="input-group-addon">浮动周期</span>
                                            <input id="M_Loan_Period" name="M_Loan_Period" class="form-control" type="text" runat="server" />
                                            <span class="input-group-addon">个月</span>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">开始时间<span style="color: red">*</span>：</label></td>
                                    <td>
                                        <input id="M_Reply_Begin" name="M_Reply_Begin" class="laydate-icon form-control layer-date" runat="server" /></td>
                                    <td>
                                        <label class="control-label">结束时间：</label></td>
                                    <td>
                                        <input id="M_Reply_End" name="M_Reply_End" readonly="true" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">还款方式：</label></td>
                                    <td>
                                        <select class="form-control" name="E_Replay_Type" id="E_Replay_Type" runat="server">
                                            <option>一次性偿还</option>
                                            <option>分期偿还</option>
                                        </select></td>
                                    <td>
                                        <label class="control-label">还款资金来源<span style="color: red">*</span>：</label></td>
                                    <td>
                                        <input id="E_Earn" name="E_Earn" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">结息方式<span style="color: red">*</span>：</label></td>
                                    <td>
                                        <select class="form-control" name="M_SettlementType" id="M_SettlementType" runat="server">
                                            <option value="1">按季结息</option>
                                            <option value="2">按月结息</option>
                                        </select></td>
                                    <td> <label class="control-label">备注：</label></td>
                                    <td><input id="M_SettlementMemo" name="M_SettlementMemo" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">资产金额：</label></td>
                                    <td>
                                        <input id="E_Total" name="E_Total" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">负债总额：</label></td>
                                    <td>
                                        <input id="E_Liabilities" name="E_Liabilities" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">所有者权益总额：</label></td>
                                    <td>
                                        <input id="E_Equity" name="E_Equity" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">资产负债率：</label></td>
                                    <td>
                                        <input id="E_DebtRatio" name="E_DebtRatio" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>

                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="3" cellpadding="2">
                            <tbody>
                                <tr style="text-align: center;">
                                    <td width="50">序 号</td>
                                    <td width="100">年</td>
                                    <td width="80">&nbsp;</td>
                                    <td width="80">月</td>
                                    <td width="80">&nbsp;</td>
                                    <td width="80">日</td>
                                    <td width="120">&nbsp;</td>
                                    <td width="120">金 额</td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td>①</td>
                                    <td>
                                        <input id="PlanUse_Year1" name="PlanUse_Year1" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Month1" name="PlanUse_Month1" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Day1" name="PlanUse_Day1" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Money1" name="PlanUse_Money1" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 5px;"></td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td>②</td>
                                    <td>
                                        <input id="PlanUse_Year2" name="PlanUse_Year2" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Month2" name="PlanUse_Month2" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Day2" name="PlanUse_Day2" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Money2" name="PlanUse_Money2" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 5px;"></td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td>③</td>
                                    <td>
                                        <input id="PlanUse_Year3" name="PlanUse_Year3" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Month3" name="PlanUse_Month3" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Day3" name="PlanUse_Day3" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Money3" name="PlanUse_Money3" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="8" style="height: 5px;"></td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td>④</td>
                                    <td>
                                        <input id="PlanUse_Year4" name="PlanUse_Year4" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Month4" name="PlanUse_Month4" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Day4" name="PlanUse_Day4" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>
                                        <input id="PlanUse_Money4" name="PlanUse_Money4" class="form-control" type="text" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="3" cellpadding="2">
                            <tbody>
                                <tr style="text-align: center;">
                                    <td width="50">序 号</td>
                                    <td width="100">年</td>
                                    <td width="80">月</td>
                                    <td width="80">日</td>
                                    <td width="120">金 额</td>
                                    <td width="60">&nbsp;</td>
                                    <td width="50">序 号</td>
                                    <td width="100">年</td>
                                    <td width="80">月</td>
                                    <td width="80">日</td>
                                    <td width="120">金 额</td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td>①</td>
                                    <td>
                                        <input id="PlanRefund_Year1" name="PlanRefund_Year1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Month1" name="PlanRefund_Month1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Day1" name="PlanRefund_Day1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Money1" name="PlanRefund_Money1" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>②</td>
                                    <td>
                                        <input id="PlanRefund_Year2" name="PlanRefund_Year2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Month2" name="PlanRefund_Month2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Day2" name="PlanRefund_Day2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Money2" name="PlanRefund_Money2" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr style="text-align: center;">
                                    <td>③</td>
                                    <td>
                                        <input id="PlanRefund_Year3" name="PlanRefund_Year3" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Month3" name="PlanRefund_Month3" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Day3" name="PlanRefund_Day3" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Money3" name="PlanRefund_Money3" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>④</td>
                                    <td>
                                        <input id="PlanRefund_Year4" name="PlanRefund_Year4" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Month4" name="PlanRefund_Month4" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Day4" name="PlanRefund_Day4" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PlanRefund_Money4" name="PlanRefund_Money4" class="form-control" type="text" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tab-4" class="tab-pane">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="3" cellpadding="2">
                            <tbody>
                                <tr style="text-align: center">
                                    <td style="width: 50px;">序号</td>
                                    <td style="width: 140px;">保证人全称</td>
                                    <td style="width: 180px;">基本账户行及账号</td>
                                    <td>住址</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">①</td>
                                    <td>
                                        <input id="GT_Name1" name="GT_Name1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="GT_Account1" name="GT_Account1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="GT_Address1" name="GT_Address1" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">②</td>
                                    <td>
                                        <input id="GT_Name2" name="GT_Name2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="GT_Account2" name="GT_Account2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="GT_Address2" name="GT_Address2" class="form-control" type="text" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tab-5" class="tab-pane">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="3" cellpadding="2">
                            <tbody>
                                <tr style="text-align: center">
                                    <td style="width: 50px;">序号</td>
                                    <td style="width: 140px;">抵押人全称</td>
                                    <td style="width: 180px;">主要抵押物名称</td>
                                    <td style="width: 80px;">现值</td>
                                    <td>住址</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">①</td>
                                    <td>
                                        <input id="MG_Name1" name="MG_Name1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="MG_Pawn1" name="MG_Pawn1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="MG_Value1" name="MG_Value1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="MG_Address1" name="MG_Address1" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">②</td>
                                    <td>
                                        <input id="MG_Name2" name="MG_Name2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="MG_Pawn2" name="MG_Pawn2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="MG_Value2" name="MG_Value2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="MG_Address2" name="MG_Address2" class="form-control" type="text" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tab-6" class="tab-pane">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="3" cellpadding="2">
                            <tbody>
                                <tr style="text-align: center">
                                    <td style="width: 50px;">序号</td>
                                    <td style="width: 140px;">出质人全称</td>
                                    <td style="width: 180px;">主要质物名称</td>
                                    <td style="width: 80px;">现值</td>
                                    <td>住址</td>
                                </tr>
                                <tr>
                                    <td style="text-align: center">①</td>
                                    <td>
                                        <input id="PG_Name" name="PG_Name" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PG_Pawn" name="PG_Pawn" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PG_Value" name="PG_Value" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="PG_Address" name="PG_Address" class="form-control" type="text" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>


                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">保  存</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                </div>
            </div>
        </div>
    </form>
    <script>
        function SGuaranteeType() {
            var _type = $("#E_GuaranteeType").val();
            if (_type == "保证") {
                $("#Type1").show();
                $("#Type2").hide();
                $("#Type3").hide();
            } else if (_type == "抵押") {
                $("#Type1").hide();
                $("#Type2").show();
                $("#Type3").hide();
            } else if (_type == "质押") {
                $("#Type1").hide();
                $("#Type2").hide();
                $("#Type3").show();
            } else {
                $("#Type1").hide();
                $("#Type2").hide();
                $("#Type3").hide();
            }
        }
        //M_Loan_Type
        $("#M_Loan_Type").change(function () {
            var _value = this.value;
            if (_value == "2") {
                $("#TypeC1").hide();
                $("#TypeC2").show();
            } else {
                $("#TypeC2").hide();
                $("#TypeC1").show();
            }

        });
    </script>
    <script>
        $(document).ready(function () {
            if (!$("#M_Reply_Begin").val().length > 0) {
                var _year = new Date().getFullYear();
                var _month = parseInt(new Date().getMonth()) + 1;
                var _day = new Date().getDate();

                $("#M_Reply_End").val(_year + "-" + _month + "-" + _day);
            }
        });
        laydate.render({
            elem: '#M_Reply_Begin'
        });
        laydate.render({
            elem: '#PlanUse_Year1'
  , type: 'year'
        });
        laydate.render({
            elem: '#PlanUse_Year2'
  , type: 'year'
        });
        laydate.render({
            elem: '#PlanUse_Year3'
  , type: 'year'
        });
        laydate.render({
            elem: '#PlanUse_Year4'
  , type: 'year'
        });
        $("#E_Loan").keyup(function () {
            var Pay = $(this).val();
            if ((/^(\+|-)?\d+$/.test(Pay)) && Pay > 0) {
                $("#E_Loan_Cap").val(formatRMB(Pay));
                return true;
            } else {
                layer.msg("请输入正确的数值");
                $("#E_Loan").val(Pay.substring(0, Pay.length - 1));
                return false;
            }
        });
        $("#M_Loan_Months").keyup(function () {
            var months = $(this).val();
            if ((/^(\+|-)?\d+$/.test(months)) && months > 0) {

            }
            else {
                layer.msg("请输入正确的数值");
                $("#M_Loan_Months").val(months.substring(0, months.length - 1));
                return false;
            }
        });
        $("#M_Reply_End").click(function () {
            cale_date();
        });

        function cale_date() {
            var Mons = $("#M_Loan_Months").val();
            var begindate = new Date($("#M_Reply_Begin").val());
            var month = parseInt(begindate.getMonth()) + 1 + parseInt(Mons);

            var enddate = new Date(begindate.setMonth(month));

            $("#M_Reply_End").val(enddate.getFullYear() + "-" + enddate.getMonth() + "-" + enddate.getDate());
        }
    </script>
    <script>
        var c = "零壹贰叁肆伍陆柒捌玖".split("");
        // ["零","壹","贰","叁","肆","伍","陆","柒","捌","玖"]
        var _c = {}; // 反向对应关系
        for (var i = 0; i < c.length; i++) {
            _c[c[i]] = i;
        };

        var d = "元***万***亿***万";
        var e = ",拾,佰,仟".split(",");
        function unit4(arr) {
            var str = "", i = 0;
            while (arr.length) {
                var t = arr.pop();
                str = (c[t] + (t == 0 ? "" : e[i])) + str;
                i++;
            }

            str = str.replace(/[零]{2,}/g, "零");

            str = str.replace(/^[零]/, "");
            str = str.replace(/[零]$/, "");
            if (str.indexOf("零") == 0) {
                str = str.substring(1);
            }
            if (str.lastIndexOf("零") == str.length - 1) {
                str = str.substring(0, str.length - 1);
            }

            return str;
        }
        function _formatD(a) {
            // 转化整数部分
            var arr = a.split(""), i = 0, result = "";
            while (arr.length) {
                var arr1 = arr.splice(-4, 4);

                var dw = d.charAt(i), unit = unit4(arr1);

                if (dw == '万' && !unit) {
                    dw = "";
                }
                result = unit + dw + result;
                i += 4;
            }
            return result == "元" ? "" : result;
        }
        function _formatF(b) {
            // 转化小数部分
            b = b || "";
            switch (b.length) {
                case 0:
                    return "";
                case 1:
                    return c[b] + "角";
                default:
                    return c[b.charAt(0)] + "角" + c[b.charAt(1)] + "分";
            }
        }
        function _format(n) {
            var a = ("" + n).split("."), a0 = a[0], a1 = a[1];
            return _formatD(a0) + _formatF(a1);
        }

        function parse4(u4) {
            var res = 0;
            while (t = /([零壹贰叁肆伍陆柒捌玖])([拾佰仟]?)/g.exec(u4)) {
                var n = _c[t[1]], d = {
                    "": 1,
                    "拾": 10,
                    "佰": 100,
                    "仟": 1000
                }[t[2]];
                res += n * d;
                u4 = u4.replace(t[0], "");
            }
            var result = ("0000" + res);
            return result.substring(result.length - 4);
        }
        function _parseD(d) {
            var arr = d.replace(/[零]/g, "").split(/[万亿]/), rs = "";
            for (var i = 0; i < arr.length; i++) {
                rs += parse4(arr[i]);
            }
            ;
            return rs.replace(/^[0]+/, "");
        };
        function _parseF(f) {
            var res = "", t = f.replace(/[^零壹贰叁肆伍陆柒捌玖]+/g, "").split(""); // 去掉单位
            if (t.length) {
                res = ".";
            } else {
                return "";
            }
            ;
            for (var i = 0; (i < t.length && i < 2) ; i++) {
                res += _c[t[i]];
            }
            ;
            return res;
        };
        function _parse(rmb) {
            var a = rmb.split("元"), a1 = a[1], a0 = a[0];
            if (a.length == 1) {
                a1 = a0;
                a0 = "";
            }
            return _parseD(a0) + _parseF(a1);

        };
        //小写转大写
        function formatRMB(num) {
            var n = Number(num);
            if (!isNaN(num)) {
                if (num == 0) {
                    return "零";
                } else {
                    return _format(n);
                }
            } else {
                return false;
            }
        }

    </script>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_LDZJFinance.aspx.cs" Inherits="OpWeb.Contract.Contract_LDZJFinance" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>法定代表人信息</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/js/jquery.min.js?v=2.1.4" type="text/javascript"></script>
    <!-- 全局js -->
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
    <script src="/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/plugins/validate/messages_zh.min.js"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>

</head>
<body onload="CheckType()">
    <form id="signupForm" runat="server">
        <div class="ibox float-e-margins">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-briefcase"></i>财务指标</a></li>
                <li class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i>信用情况</a></li>
                <li class=""><a data-toggle="tab" href="#tab-3"><i class="fa fa-briefcase"></i>第一还款来源</a></li>
                <li class=""><a data-toggle="tab" href="#tab-4"><i class="fa fa-briefcase"></i>第二还款来源</a></li>
            </ul>
            <div style="clear: both"></div>
            <div class="tab-content" style="height: 400px;">
                <div id="tab-1" class="tab-pane active">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                            <tbody>
                                <tr>
                                    <td>年度</td>
                                    <td>资产总额</td>
                                    <td>负债总额</td>
                                    <td>所有者权益</td>
                                    <td>销售收入</td>
                                    <td>净利润</td>
                                    <td>现金净流量</td>
                                </tr>
                                <tr>
                                    <td>
                                        <input id="EF_Year1" name="EF_Year1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Total1" name="EF_Total1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Debt1" name="EF_Debt1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Equity1" name="EF_Equity1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Sale1" name="EF_Sale1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Profit1" name="EF_Profit1" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Cash1" name="EF_Cash1" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="7" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input id="EF_Year2" name="EF_Year2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Total2" name="EF_Total2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Debt2" name="EF_Debt2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Equity2" name="EF_Equity2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Sale2" name="EF_Sale2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Profit2" name="EF_Profit2" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Cash2" name="EF_Cash2" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="7" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <input id="EF_Year3" name="EF_Year3" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Total3" name="EF_Total3" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Debt3" name="EF_Debt3" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Equity3" name="EF_Equity3" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Sale3" name="EF_Sale3" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Profit3" name="EF_Profit3" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <input id="EF_Cash3" name="EF_Cash3" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="7" style="height: 15px;"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">目前已抵押资产额</td>
                                    <td colspan="3">
                                        <input id="EF_Pledge" name="EF_Pledge" class="form-control" type="text" runat="server" /></td>
                                    <td colspan="2"></td>

                                </tr>
                                <tr>
                                    <td colspan="7" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td colspan="2">目前的对外担保金额</td>
                                    <td colspan="3">
                                        <input id="EF_Guarantee" name="EF_Guarantee" class="form-control" type="text" runat="server" /></td>
                                    <td colspan="2"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tab-2" class="tab-pane">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                            <tbody>
                                <tr>
                                    <td>
                                        <label class="control-label">四级分类：</label></td>
                                    <td>
                                        <select class="form-control" id="EF_Level4" name="EF_Level4" runat="server">
                                            <option>正常</option>
                                            <option>逾期</option>
                                            <option>呆滞</option>
                                            <option>呆账 </option>
                                        </select></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">五级分类：</label></td>
                                    <td>
                                        <select class="form-control" id="EF_Level5" name="EF_Level5" runat="server">
                                            <option>正常</option>
                                            <option>关注</option>
                                            <option>次级</option>
                                            <option>可疑</option>
                                            <option>损失</option>
                                        </select></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">贷款方式：</label></td>
                                    <td>
                                        <select class="form-control" id="EF_LoanType" name="EF_LoanType" runat="server">
                                            <option>抵（质）押</option>
                                            <option>保证</option>
                                            <option>欠息</option>
                                            <option>信用</option>
                                        </select></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">上年度授信种类：</label></td>
                                    <td>
                                        <input id="EF_CreditType" name="EF_CreditType" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">上年度授信额度：</label></td>
                                    <td>
                                        <input id="EF_CreditLine" name="EF_CreditLine" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">实际占用：</label></td>
                                    <td>
                                        <input id="EF_Occupy" name="EF_Occupy" class="form-control" type="text" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tab-3" class="tab-pane">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                            <tbody>
                                <tr>
                                    <td>
                                        <label class="control-label">总资产：</label></td>
                                    <td>
                                        <input id="EF_From1_Total" name="EF_From1_Total" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">总负债：</label></td>
                                    <td>
                                        <input id="EF_From1_Debt" name="EF_From1_Debt" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">流动资产：</label></td>
                                    <td>
                                        <input id="EF_From1_Currentassets" name="EF_From1_Currentassets" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">流动负债：</label></td>
                                    <td>
                                        <input id="EF_From1_CurrentDebt" name="EF_From1_CurrentDebt" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">1、应付账款：</label></td>
                                    <td>
                                        <input id="EF_From1_PayOut" name="EF_From1_PayOut" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">1、短期借款：</label></td>
                                    <td>
                                        <input id="EF_From1_ShortTerm" name="EF_From1_ShortTerm" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>2、其它应收款</td>
                                    <td>
                                        <input id="EF_From1_OtherIn" name="EF_From1_OtherIn" class="form-control" type="text" runat="server" /></td>
                                    <td>2、应付票据</td>
                                    <td>
                                        <input id="EF_From1_PayNote" name="EF_From1_PayNote" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>3、存货</td>
                                    <td>
                                        <input id="EF_From1_Stock" name="EF_From1_Stock" class="form-control" type="text" runat="server" /></td>
                                    <td>3、应付账款</td>
                                    <td>
                                        <input id="EF_From1_Pay" name="EF_From1_Pay" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>4、待摊费用</td>
                                    <td>
                                        <input id="EF_From1_Booth" name="EF_From1_Booth" class="form-control" type="text" runat="server" /></td>
                                    <td>销售收入</td>
                                    <td>
                                        <input id="EF_From1_Sale" name="EF_From1_Sale" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                                <tr>
                                    <td>对外投资</td>
                                    <td>
                                        <input id="EF_From1_Investment" name="EF_From1_Investment" class="form-control" type="text" runat="server" /></td>
                                    <td>利润总额</td>
                                    <td>
                                        <input id="EF_From1_Profit" name="EF_From1_Profit" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 5px;"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tab-4" class="tab-pane">
                    <div class="ibox-content">
                        <table width="100%" id="Type1" border="1" cellspacing="2" cellpadding="3" style="text-align: center;">
                            <tbody>
                                <tr>
                                    <td rowspan="11">保<br />
                                        证<br />
                                        人<br />
                                        调<br />
                                        查</td>
                                    <td>
                                        <label class="control-label">总资产：</label></td>
                                    <td>
                                        <input id="EF_From2_Total" name="EF_From2_Total" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">总负债：</label></td>
                                    <td>
                                        <input id="EF_From2_Debt" name="EF_From2_Debt" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">流动资产：</label></td>
                                    <td>
                                        <input id="EF_From2_Currentassets" name="EF_From2_Currentassets" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">流动负债：</label></td>
                                    <td>
                                        <input id="EF_From2_CurrentDebt" name="EF_From2_CurrentDebt" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">固定资产：</label></td>
                                    <td>
                                        <input id="EF_From2_FixedAsset" name="EF_From2_FixedAsset" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">长期负债：</label></td>
                                    <td>
                                        <input id="EF_From2_LongtermDebt" name="EF_From2_LongtermDebt" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>资产负债率</td>
                                    <td>
                                        <input id="EF_From2_DebtRate" name="EF_From2_DebtRate" class="form-control" type="text" runat="server" /></td>
                                    <td>在信用社贷款额</td>
                                    <td>
                                        <input id="EF_From2_Limit" name="EF_From2_Limit" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>流动比率</td>
                                    <td>
                                        <input id="EF_From2_CurrentRate" name="EF_From2_CurrentRate" class="form-control" type="text" runat="server" /></td>
                                    <td>不良贷款额</td>
                                    <td>
                                        <input id="EF_From2_Bad" name="EF_From2_Bad" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>存货周转率</td>
                                    <td>
                                        <input id="EF_From2_Turnover" name="EF_From2_Turnover" class="form-control" type="text" runat="server" /></td>
                                    <td>销售收入</td>
                                    <td>
                                        <input id="EF_From2_Sale" name="EF_From2_Sale" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>销售利润率</td>
                                    <td>
                                        <input id="EF_From2_ProfitRate" name="EF_From2_ProfitRate" class="form-control" type="text" runat="server" /></td>
                                    <td>利润总额</td>
                                    <td>
                                        <input id="EF_From2_Profit" name="EF_From2_Profit" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>本次承担保证金额</td>
                                    <td>
                                        <input id="EF_From2_Total1" name="EF_From2_Total1" class="form-control" type="text" runat="server" /></td>
                                    <td>已为他人担保</td>
                                    <td>
                                        <input id="EF_From2_Total2" name="EF_From2_Total2" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>已抵押资产额</td>
                                    <td>
                                        <input id="EF_From2_Total3" name="EF_From2_Total3" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>报告期信用等级</td>
                                    <td>
                                        <input id="EF_From2_TCredit" name="EF_From2_TCredit" class="form-control" type="text" runat="server" /></td>
                                    <td>年度信用等级</td>
                                    <td>
                                        <input id="EF_From2_YCredit" name="EF_From2_YCredit" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>保证人其它认定</td>
                                    <td>
                                        <input id="EF_From2_Other" name="EF_From2_Other" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </tbody>
                        </table>
                        <table id="Type2" width="100%" border="1" cellspacing="2" cellpadding="3" style="text-align: center;">
                            <tbody>
                                <tr>
                                    <td rowspan="3">抵<br />
                                        押<br />
                                        物<br />
                                        认<br />
                                        定</td>
                                    <td>抵押物原值</td>
                                    <td>
                                        <input id="EF_From2_PawnValue" name="EF_From2_PawnValue" class="form-control" type="text" runat="server" /></td>
                                    <td>净值</td>
                                    <td>
                                        <input id="EF_From2_Value" name="EF_From2_Value" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>评估单位</td>
                                    <td>
                                        <input id="EF_From2_Assess" name="EF_From2_Assess" class="form-control" type="text" runat="server" /></td>
                                    <td>评估值</td>
                                    <td>
                                        <input id="EF_From2_AssessMent" name="EF_From2_AssessMent" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>本次抵押贷款额</td>
                                    <td>
                                        <input id="EF_From2_Pawn" name="EF_From2_Pawn" class="form-control" type="text" runat="server" /></td>
                                    <td>未到期抵押贷款</td>
                                    <td>
                                        <input id="EF_From2_Pawning" name="EF_From2_Pawning" class="form-control" type="text" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                        <table id="Type3" width="100%" border="1" cellspacing="2" cellpadding="3" style="text-align: center;">
                            <tbody>
                                <tr>
                                    <td rowspan="4">质<br />
                                        押<br />
                                        物<br />
                                        认<br />
                                        定</td>
                                    <td>质押物原值</td>
                                    <td>
                                        <input id="EF_From2_PledgeValue" name="EF_From2_PledgeValue" class="form-control" type="text" runat="server" /></td>
                                    <td>净值 </td>
                                    <td>
                                        <input id="EF_From2_PV" name="EF_From2_PV" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>评估单位</td>
                                    <td>
                                        <input id="EF_From2_PledgeAssess" name="EF_From2_PledgeAssess" class="form-control" type="text" runat="server" /></td>
                                    <td>评估值</td>
                                    <td>
                                        <input id="EF_From2_PledgeAssessMen" name="EF_From2_PledgeAssessMen" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>质押贷款额</td>
                                    <td>
                                        <input id="EF_From2_PledgeLimit" name="EF_From2_PledgeLimit" class="form-control" type="text" runat="server" /></td>
                                    <td>质押率</td>
                                    <td>
                                        <input id="EF_From2_PledgeRate" name="EF_From2_PledgeRate" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>质物变现能力判断</td>
                                    <td>
                                        <input id="EF_From2_Realization" name="EF_From2_Realization" class="form-control" type="text" runat="server" /></td>
                                    <td>其它认定</td>
                                    <td>
                                        <input id="EF_From2_PledgeOther" name="EF_From2_PledgeOther" class="form-control" type="text" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
        <div class="form-group">
            <div class="col-sm-8 col-sm-offset-3">
                <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">保  存</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
            </div>
        </div>
    </form>
    <script>
        function CheckType()
        {
            var _type = "<%=Type%>";
            if (_type=="保证") {
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
    </script>
</body>
</html>

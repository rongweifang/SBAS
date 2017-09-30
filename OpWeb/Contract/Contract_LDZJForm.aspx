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
    <script src="/js/plugins/layer/laydate/laydate.js"></script>
    <script src="/js/demo/form-advanced-demo.js"></script>
    
</head>
<body class="gray-bg">
    <form class="form-horizontal m-t" id="signupForm" runat="server">
        <div class="ibox float-e-margins">
            <div class="ibox-title">
                <h5>借款信息</h5>
            </div>
            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td width="110">
                                <label class="control-label">担保方式<span style="color:red">*</span>：</label></td>
                            <td>
                                <select class="form-control" name="E_GuaranteeType" id="E_GuaranteeType" runat="server">
                                    <option>保证</option>
                                    <option>抵押</option>
                                    <option>质押</option>
                                    <option>信用</option>
                                </select>
                            </td>
                            <td width="100">&nbsp;</td>
                            <td width="180">&nbsp;</td>
                            <td width="130">&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">借款金额<span style="color:red">*</span>：</label></td>
                            <td><input id="E_Loan" name="E_Loan" class="form-control" type="text" runat="server"/></td>
                            <td>
                                <label class="control-label">借款期限<span style="color:red">*</span>：</label></td>
                            <td>
                                <select class="form-control" name="M_Loan_Years" id="M_Loan_Years" runat="server">
                                   <option value="5">1年</option>
                                   <option value="5">2年</option>
                                   <option value="5">3年</option>
                                   <option value="5">4年</option>
                                    <option value="5">5年</option>
                                    <option value="5">6年</option>
                                    <option value="5">7年</option>
                                    <option value="10">10年</option>
                                    <option value="15">15年</option>
                                    <option value="20">20年</option>
                                    <option value="25">25年</option>
                                    <option value="30">30年</option>
                                </select>

                            </td>
                            <td>
                                <label class="control-label">借款用途<span style="color:red">*</span>：</label></td>
                            <td>
                                <input id="E_Use" name="E_Use" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">还款方式：</label></td>
                            <td>
                                <select class="form-control" name="E_Replay_Type" id="E_Replay_Type" runat="server">
                                    <option>分期偿还</option>
                                    <option>一次性偿还</option>
                                </select></td>
                            <td>
                                <label class="control-label">还款资金来源<span style="color:red">*</span>：</label></td>
                            <td colspan="3">
                                <input id="E_Earn" name="E_Earn" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                          <td><label class="control-label">资产金额：</label></td>
                          <td><input id="E_Total" name="E_Total" class="form-control" type="text" runat="server"/></td>
                          <td><label class="control-label">负债总额：</label></td>
                          <td colspan="3"><input id="E_Liabilities" name="E_Liabilities" class="form-control" type="text" runat="server"/></td>
                        </tr>
                         <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                          <td><label class="control-label">所有者权益总额：</label></td>
                          <td><input id="E_Equity" name="E_Equity" class="form-control" type="text" runat="server"/></td>
                          <td><label class="control-label">资产负债率：</label></td>
                          <td colspan="3"><input id="E_DebtRatio" name="E_DebtRatio" class="form-control" type="text" runat="server"/></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                       
                    </tbody>
                </table>

            </div>
            <div class="ibox-title">
                <h5>用款计划</h5>
            </div>
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
      <td><input id="PlanUse_Year1" name="PlanUse_Year1" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Month1" name="PlanUse_Month1" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Day1" name="PlanUse_Day1" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Money1" name="PlanUse_Money1" class="form-control" type="text" runat="server" /></td>
      <td>&nbsp;</td>
      <td>②</td>
      <td><input id="PlanUse_Year2" name="PlanUse_Year2" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Month2" name="PlanUse_Month2" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Day2" name="PlanUse_Day2" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Money2" name="PlanUse_Money2" class="form-control" type="text" runat="server" /></td>
    </tr>
    <tr style="text-align: center;">
      <td>③</td>
      <td><input id="PlanUse_Year3" name="PlanUse_Year3" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Month3" name="PlanUse_Month3" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Day3" name="PlanUse_Day3" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Money3" name="PlanUse_Money3" class="form-control" type="text" runat="server" /></td>
      <td>&nbsp;</td>
      <td>④</td>
      <td><input id="PlanUse_Year4" name="PlanUse_Year4" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Month4" name="PlanUse_Month4" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Day4" name="PlanUse_Day4" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanUse_Money4" name="PlanUse_Money4" class="form-control" type="text" runat="server" /></td>
    </tr>
  </tbody>
</table>

            </div>
            <div class="ibox-title">
                <h5>还款计划</h5>
            </div>
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
      <td><input id="PlanRefund_Year1" name="PlanRefund_Year1" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Month1" name="PlanRefund_Month1" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Day1" name="PlanRefund_Day1" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Money1" name="PlanRefund_Money1" class="form-control" type="text" runat="server" /></td>
      <td>&nbsp;</td>
      <td>②</td>
      <td><input id="PlanRefund_Year2" name="PlanRefund_Year2" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Month2" name="PlanRefund_Month2" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Day2" name="PlanRefund_Day2" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Money2" name="PlanRefund_Money2" class="form-control" type="text" runat="server" /></td>
    </tr>
    <tr style="text-align: center;">
      <td>③</td>
      <td><input id="PlanRefund_Year3" name="PlanRefund_Year3" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Month3" name="PlanRefund_Month3" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Day3" name="PlanRefund_Day3" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Money3" name="PlanRefund_Money3" class="form-control" type="text" runat="server" /></td>
      <td>&nbsp;</td>
      <td>④</td>
      <td><input id="PlanRefund_Year4" name="PlanRefund_Year4" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Month4" name="PlanRefund_Month4" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Day4" name="PlanRefund_Day4" class="form-control" type="text" runat="server" /></td>
      <td><input id="PlanRefund_Money4" name="PlanRefund_Money4" class="form-control" type="text" runat="server" /></td>
    </tr>
  </tbody>
</table>
          </div>
            <div class="ibox-title">
                <h5>保证方式</h5>
            </div>
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
      <td><input id="GT_Name1" name="GT_Name1" class="form-control" type="text" runat="server" /></td>
      <td><input id="GT_Account1" name="GT_Account1" class="form-control" type="text" runat="server" /></td>
      <td><input id="GT_Address1" name="GT_Address1" class="form-control" type="text" runat="server" /></td>
    </tr>
    <tr>
      <td style="text-align: center">②</td>
      <td><input id="GT_Name2" name="GT_Name2" class="form-control" type="text" runat="server" /></td>
      <td><input id="GT_Account2" name="GT_Account2" class="form-control" type="text" runat="server" /></td>
      <td><input id="GT_Address2" name="GT_Address2" class="form-control" type="text" runat="server" /></td>
    </tr>
  </tbody>
</table>

          </div>

            <div class="ibox-title">
                <h5>抵押方式</h5>
            </div>
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
      <td><input id="MG_Name1" name="MG_Name1" class="form-control" type="text" runat="server" /></td>
      <td><input id="MG_Pawn1" name="MG_Pawn1" class="form-control" type="text" runat="server" /></td>
      <td><input id="MG_Value1" name="MG_Value1" class="form-control" type="text" runat="server" /></td>
      <td><input id="MG_Address1" name="MG_Address1" class="form-control" type="text" runat="server" /></td>
    </tr>
    <tr>
      <td style="text-align: center">②</td>
      <td><input id="MG_Name2" name="MG_Name2" class="form-control" type="text" runat="server" /></td>
      <td><input id="MG_Pawn2" name="MG_Pawn2" class="form-control" type="text" runat="server" /></td>
      <td><input id="MG_Value2" name="MG_Value2" class="form-control" type="text" runat="server" /></td>
      <td><input id="MG_Address2" name="MG_Address2" class="form-control" type="text" runat="server" /></td>
    </tr>
  </tbody>
</table>
          </div>

            <div class="ibox-title">
                <h5>质押方式</h5>
            </div>
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
      <td><input id="PG_Name" name="PG_Name" class="form-control" type="text" runat="server" /></td>
      <td><input id="PG_Pawn" name="PG_Pawn" class="form-control" type="text" runat="server" /></td>
      <td><input id="PG_Value" name="PG_Value" class="form-control" type="text" runat="server" /></td>
      <td><input id="PG_Address" name="PG_Address" class="form-control" type="text" runat="server" /></td>
    </tr>
    </tbody>
</table>
            </div>

            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">保  存</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                </div>
            </div>
        </div>

    </form>

 
</body>
</html>

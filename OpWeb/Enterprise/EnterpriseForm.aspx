<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseForm.aspx.cs" Inherits="OpWeb.Enterprise.EnterpriseForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户基本信息</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/js/jquery.min.js?v=2.1.4" type="text/javascript"></script>
    <!-- 全局js -->
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
     <script src="/js/plugins/laydate/laydate.js"></script>
</head>
<body>
    <form id="signupForm" runat="server">
        <div class="ibox-content">
            <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                <tbody>
                    <tr>
                        <td width="140">
                            <label class="control-label">统一社会信用代码：</label></td>
                        <td width="200">
                            <div class="input-group">
                                <input name="E_creditCode" type="text" class="form-control" id="E_creditCode" value="" runat="server" />
                                <span class="input-group-addon" style="background-color: cadetblue; cursor: pointer;"><i class="fa fa-gg"></i></span>
                            </div>
                        </td>
                        <td width="100">
                            <label class="control-label">类　　型：</label>
                        </td>
                        <td width="337">
                            <input name="E_enterpriseType" type="text" class="form-control" id="E_enterpriseType" value="" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 8px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">企 业 名 称：</label></td>
                        <td colspan="3">
                            <div class="input-group">
                                <input id="E_enterpriseName" name="E_enterpriseName" class="form-control" type="text" runat="server" />
                                <span class="input-group-addon" style="background-color: cadetblue; cursor: pointer;"><i class="fa fa-gg"></i></span>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 8px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">法定代表人：</label></td>
                        <td>
                            <input id="E_frName" name="E_frName" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">登记状态：</label></td>
                        <td>

                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <input id="E_enterpriseStatus" name="E_enterpriseStatus" class="form-control" type="text" runat="server" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 8px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">经营期限自：</label></td>
                        <td colspan="3">
                            <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="text-align: center">
                                <tbody>
                                    <tr>
                                        <td>
                                            <input id="E_openFrom" name="E_openFrom" class="form-control" type="text" runat="server" /></td>
                                        <td>
                                            <label class="control-label">至</label></td>
                                        <td>
                                            <input id="E_openTo" name="E_openTo" class="form-control" type="text" runat="server" /></td>
                                    </tr>
                                </tbody>
                            </table>

                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 8px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">注 册 地 址：</label></td>
                        <td colspan="3">
                            <input id="E_address" name="E_address" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 8px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">注 册 资 金：</label></td>
                        <td>
                            <input id="E_regCap" name="E_regCap" class="form-control" type="text" runat="server" /></td>
                        <td><span class="control-label">万元</span></td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 8px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">经营(业务)范围:</label></td>
                        <td colspan="3">
                            <input id="E_operateScope" name="E_operateScope" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 8px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">基本账户开户行：</label></td>
                        <td>
                            <input id="E_BankDeposit" name="E_BankDeposit" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">基本账户号码：</label></td>
                        <td>
                            <input id="E_BankAccount" name="E_BankAccount" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 8px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">联 系 人：</label></td>
                        <td>
                            <input id="E_LinkMan" name="E_LinkMan" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">联系人电话：</label></td>
                        <td>

                            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                <tbody>
                                    <tr>
                                        <td>
                                            <input id="E_LinkPhone" name="E_LinkPhone" class="form-control" type="text" runat="server" /></td>
                                    </tr>
                                </tbody>
                            </table>
                        </td>
                    </tr>
                    <tr>
                        <td colspan="4" style="height: 8px;"></td>
                    </tr>
                </tbody>
            </table>
            <div class="form-group">
                <div class="col-sm-8 col-sm-offset-3">
                    <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">确  定</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                </div>
            </div>
        </div>
    </form>
    <script>
        laydate.render({
            elem: '#E_openFrom'
        });
    </script>
</body>
</html>

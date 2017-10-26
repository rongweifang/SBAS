<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_LDZJMGInfoForm1.aspx.cs" Inherits="OpWeb.Contract.Contract_LDZJMGInfoForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>房产抵押清单</title>
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
    <form id="form1" runat="server">
        <div class="ibox float-e-margins">
            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td width="130">
                                <label class="control-label">抵　押　人：</label></td>
                            <td>
                                <input id="PE_Pledgor" name="PE_Pledgor" class="form-control" type="text" runat="server" /></td>
                            <td width="140">
                                <label class="control-label">产权或使用权人：</label></td>
                            <td>
                                <input id="PE_User" name="PE_User" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 4px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">抵押物名称：</label></td>
                            <td>
                                <input id="PE_Name" name="PE_Name" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">保　管　人：</label></td>
                            <td>
                                <input id="PE_Preserver" name="PE_Preserver" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 4px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">房产坐落：</label></td>
                            <td>
                                <input id="PE_HPlace" name="PE_HPlace" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">土地坐落及地号：</label></td>
                            <td>
                                <input id="PE_LPlace" name="PE_LPlace" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 4px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">房产证号：</label></td>
                            <td>
                                <input id="PE_HNO" name="PE_HNO" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">土地使用权类型及证号：</label></td>
                            <td>
                                <input id="PE_LType" name="PE_LType" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 4px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">建造日期：</label></td>
                            <td>
                                <input id="PE_HBuilt" name="PE_HBuilt" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">使用权年限：</label></td>
                            <td>
                                <input id="PE_LLimit" name="PE_LLimit" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 4px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">建筑面积：</label></td>
                            <td>
                                <div class="input-group">
                                    <input id="PE_HArea" name="PE_HArea" class="form-control" type="text" runat="server" />
                                    <span class="input-group-addon">平方米</span>
                                </div>
                            </td>
                            <td>
                                <label class="control-label">土地使用面积：</label></td>
                            <td>
                                <div class="input-group">
                                    <input id="PE_LUsable" name="PE_LUsable" class="form-control" type="text" runat="server" />
                                    <span class="input-group-addon">平方米</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 4px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">建筑结构：</label></td>
                            <td>
                                <input id="PE_HStruct" name="PE_HStruct" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">其中建筑占地面积：</label></td>
                            <td>
                                <div class="input-group">
                                    <input id="PE_LArea" name="PE_LArea" class="form-control" type="text" runat="server" />
                                    <span class="input-group-addon">平方米</span>
                                </div>
            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 4px;"></td>
                        </tr>
            <tr>
                <td>
                    <label class="control-label">用　　　　途：</label></td>
                <td>
                    <input id="PE_HUse" name="PE_HUse" class="form-control" type="text" runat="server" /></td>
                <td>
                    <label class="control-label">用　　　　途：</label></td>
                <td>
                    <input id="PE_LUse" name="PE_LUse" class="form-control" type="text" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 4px;"></td>
            </tr>
            <tr>
                <td>
                    <label class="control-label">抵押、出租情况：</label></td>
                <td>
                    <input id="PE_PledgeMemo" name="PE_PledgeMemo" class="form-control" type="text" runat="server" /></td>
                <td>
                    <label class="control-label">抵押情况：</label></td>
                <td>
                    <input id="PE_LAssess" name="PE_LAssess" class="form-control" type="text" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 4px;"></td>
            </tr>
            <tr>
                <td>
                    <label class="control-label">房地产评估情况：</label></td>
                <td>
                    <input id="PE_HAssess" name="PE_HAssess" class="form-control" type="text" runat="server" /></td>
                <td>
                    <label class="control-label">保险起止时间：</label></td>
                <td>
                    <input id="PE_Startstop" name="PE_Startstop" class="form-control" type="text" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 4px;"></td>
            </tr>
            <tr>
                <td>
                    <label class="control-label">保险单号码：</label></td>
                <td>
                    <input id="PE_Odd" name="PE_Odd" class="form-control" type="text" runat="server" /></td>
                <td>
                    <label class="control-label">保险金额：</label></td>
                <td>
                    <input id="PE_Insurance" name="PE_Insurance" class="form-control" type="text" runat="server" /></td>
            </tr>
            <tr>
                <td colspan="4" style="height: 4px;"></td>
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
    <script>
        laydate.render({
            elem: '#PE_HBuilt'
        });
        laydate.render({
            elem: '#PE_Startstop'
  , range: true
        });
    </script>
</body>
</html>

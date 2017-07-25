<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Spouse.aspx.cs" Inherits="OpWeb.User.User_Spouse" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>配偶信息</title>

    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
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

    <script type="text/javascript">


        function Load() {
            show.OpenIdCard();
        }

        function Unload() {
            CloseDevice();
            show.CloseIdCard();
        }

        function CloseDevice() {
            show.CloseDevice();
        }

        function GetIdCardResult() {

            Unload();
            Load();
        }


    </script>

    <script language="Javascript" event="IdCardEvent()" for="show">

        //show.UnFaceDetect();//

        var name = show.GetTempFileName(".bmp");
        show.GetIdCardImage(name, 1);
        //var feature = show.GetFaceTemplFromFile(name);
        show.DeleteFile(name);

        // show.FaceDetect(feature, 45, 1);
        //[in] 整数，表示结果信息代号。目前支持的值为1~15，其中
        //1	表示姓名，	
        //2表示性别，
        //3表示民族，
        //4表示出生年，
        //5表示出生月，
        //6表示出生日，
        //7表示住址，
        //8表示身份证号，
        //9表示发证机关，
        //10表示有效期起始年，	
        //11表示有效期起始月，
        //12表示有效	期起始日，
        //13表示表示有效期结束	年，
        //14表示表示有效期结束月，
        //15表示表示有效期结束日。
        $('#US_Card_Name').val(show.GetIdCardResult(1));
        $('#US_Card_ID').val(show.GetIdCardResult(8));
        $('#US_Card_Sex').val(show.GetIdCardResult(2));
        $('#US_Card_Nation').val(show.GetIdCardResult(3));
        $('#US_Card_Year').val(show.GetIdCardResult(4));
        $('#US_Card_Month').val(show.GetIdCardResult(5));
        $('#US_Card_Day').val(show.GetIdCardResult(6));
        $('#US_Card_Address').val(show.GetIdCardResult(7));
        $('#US_Card_Apply_Year').val(show.GetIdCardResult(10));
        $('#US_Card_Apply_Month').val(show.GetIdCardResult(11));
        $('#US_Card_Apply_Day').val(show.GetIdCardResult(12));
        $('#US_Card_Valid_Year').val(show.GetIdCardResult(13));
        $('#US_Card_Valid_Month').val(show.GetIdCardResult(14));
        $('#US_Card_Valid_Day').val(show.GetIdCardResult(15));
        d = new Date();
        var nowYear = d.getFullYear();
        var ageDiff = nowYear - show.GetIdCardResult(4);
        $("#US_Age").val(ageDiff);
    </script>
</head>
<body class="gray-bg" <%=LoadJs %>>
    <div style="display: none;">
        <object id="show" classid="clsid:E77E4CC8-E879-4A72-850A-B824742EC5B7" width="600" height="400">
        </object>
    </div>
    <form class="form-horizontal m-t" id="signupForm" runat="server">
        <div class="ibox float-e-margins">

            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td width="100">
                                <label class="control-label">姓　　名：</label></td>
                            <td width="140">
                                <input readonly id="US_Card_Name" name="US_Card_Name" class="form-control" type="text" runat="server" />
                            </td>
                            <td width="100">
                                <label class="control-label">身份证号：</label></td>
                            <td width="220">
                                <input readonly id="US_Card_ID" name="US_Card_ID" class="form-control valid" type="text" aria-required="true" aria-invalid="false" runat="server" />
                            </td>
                            <td colspan="2" rowspan="5">
                                <img src="../img/CardHead.jpg" width="102" height="126" alt="" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">性　　别：</label></td>
                            <td>
                                <input readonly id="US_Card_Sex" name="US_Card_Sex" class="form-control" type="text" runat="server" />

                            </td>
                            <td>
                                <label class="control-label">民　　族：</label></td>
                            <td>
                                <input readonly id="US_Card_Nation" name="US_Card_Nation" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">年　　龄：</label></td>
                            <td>
                                <input readonly id="US_Age" name="US_Age" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">出生年月：</label></td>
                            <td>

                                <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input readonly id="US_Card_Year" name="US_Card_Year" class="form-control" type="text" style="width: 80px;" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input readonly id="US_Card_Month" name="US_Card_Month" class="form-control" style="width: 45px;" type="text" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input readonly id="US_Card_Day" name="US_Card_Day" class="form-control" style="width: 45px;" type="text" runat="server" /></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </td>
                        </tr>
                        <tr style="display: none">
                            <td colspan="4" style="height: 5px;"></td>
                            <td></td>
                            <td></td>
                        </tr>
                        <tr style="display: none">
                            <td>
                                <label class="control-label">身份证有效期：</label></td>
                            <td colspan="3">
                                <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="text-align: center">
                                    <tbody>
                                        <tr>
                                            <td>
                                                <input readonly id="US_Card_Apply_Year" name="US_Card_Apply_Year" class="form-control" type="text" style="width: 80px;" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input readonly id="US_Card_Apply_Month" name="US_Card_Apply_Month" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input readonly id="US_Card_Apply_Day" name="US_Card_Apply_Day" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                            <td>至 </td>
                                            <td>
                                                <input readonly id="US_Card_Valid_Year" name="US_Card_Valid_Year" class="form-control" type="text" style="width: 80px;" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input readonly id="US_Card_Valid_Month" name="US_Card_Valid_Month" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                            <td>－</td>
                                            <td>
                                                <input readonly id="US_Card_Valid_Day" name="US_Card_Valid_Day" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                        </tr>
                                    </tbody>
                                </table>

                            </td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px;"></td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">户籍地址：</label></td>
                            <td colspan="3">
                                <input readonly id="US_Card_Address" name="US_Card_Address" class="form-control" type="text" runat="server" /></td>
                            <td colspan="2">&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px;"></td>
                            <td colspan="2"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">联系电话：</label></td>
                            <td>
                                <input id="US_Tel" name="US_Tel" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">学　　历：</label></td>
                            <td>
                                <select class="form-control" id="US_Education" name="US_Education" runat="server">
                                    <option>小学</option>
                                    <option>初中</option>
                                    <option>高中</option>
                                    <option>大专</option>
                                    <option>硕士研究生</option>
                                    <option>博士研究生</option>
                                    <option>本科</option>
                                </select></td>
                            <td colspan="2" rowspan="7">
                                <button class="btn btn-primary dim btn-large-dim" type="button" title="扫描身份证"  <%=LoadJs %>>
                                    <i class="fa fa-money"></i>
                                </button>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td height="24">
                                <label class="control-label">月收入金额<span style="color:red">*</span>：</label></td>
                            <td>
                                <input id="US_Income" name="US_Income" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">收入来源：</label></td>
                            <td>
                                <input id="US_Earn" name="US_Earn" class="form-control" type="text" runat="server" /></td>
                        </tr>

                        <tr>
                            <td colspan="4" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">工作单位：</label></td>
                            <td>
                                <input id="US_Company" name="US_Company" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">行政职务：</label></td>
                            <td>
                                <input id="US_Duties" name="US_Duties" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="4" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">单位地址：</label></td>
                            <td colspan="3">
                                <input id="US_CompanyAddress" name="US_CompanyAddress" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">单位电话：</label></td>
                            <td>
                                <input id="US_CompanyTel" name="US_CompanyTel" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">邮　　编：</label></td>
                            <td>
                                <input id="US_CompanyZip" name="US_CompanyZip" class="form-control" type="text" runat="server" /></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">父母住址：</label></td>
                            <td colspan="3">
                                <input id="US_ParentAddress" name="US_ParentAddress" class="form-control" type="text" runat="server" /></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-3">
                        <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">下一步</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                    </div>
                </div>
            </div>
        </div>

    </form>



</body>
</html>

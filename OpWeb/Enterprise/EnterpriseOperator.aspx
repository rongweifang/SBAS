<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EnterpriseOperator.aspx.cs" Inherits="OpWeb.Enterprise.EnterpriseOperator" %>

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

        var HeadSrc = show.GetTempFileName(".bmp");
        show.GetIdCardImage(HeadSrc, 1);

        show.DeleteFile(name);
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
        $('#Card_Name').val(show.GetIdCardResult(1));
        $('#Card_ID').val(show.GetIdCardResult(8));
        $('#Card_Sex').val(show.GetIdCardResult(2));
        $('#Card_Nation').val(show.GetIdCardResult(3));
        $('#Card_Year').val(show.GetIdCardResult(4));
        $('#Card_Month').val(show.GetIdCardResult(5));
        $('#Card_Day').val(show.GetIdCardResult(6));
        $('#Card_Address').val(show.GetIdCardResult(7));
        $('#Card_Apply_Year').val(show.GetIdCardResult(10));
        $('#Card_Apply_Month').val(show.GetIdCardResult(11));
        $('#Card_Apply_Day').val(show.GetIdCardResult(12));
        $('#Card_Valid_Year').val(show.GetIdCardResult(13));
        $('#Card_Valid_Month').val(show.GetIdCardResult(14));
        $('#Card_Valid_Day').val(show.GetIdCardResult(15));
        d = new Date();
        var nowYear = d.getFullYear();
        var ageDiff = nowYear - show.GetIdCardResult(4);
        $("#U_Age").val(ageDiff);

        // $("#Card_Head").attr({ 'src': name });
        //document.getElementById("Card_Head").src = name;
        //alert(getBase64(name));

    </script>

</head>
<body <%=LoadJs %>>
    <div style="display: none;">
        <object id="show" classid="clsid:E77E4CC8-E879-4A72-850A-B824742EC5B7" width="600" height="400">
        </object>
    </div>
    <form id="signupForm" runat="server">
        <div class="ibox float-e-margins">
            <ul class="nav nav-tabs">
                <li class="active"><a data-toggle="tab" href="#tab-1"><i class="fa fa-user"></i>法定代表人</a></li>
                <li class=""><a data-toggle="tab" href="#tab-2"><i class="fa fa-briefcase"></i>董事长</a></li>
                <li class=""><a data-toggle="tab" href="#tab-3"><i class="fa fa-briefcase"></i>总经理</a></li>
                <li class=""><a data-toggle="tab" href="#tab-4"><i class="fa fa-briefcase"></i>财务主管</a></li>
            </ul>
            <div style="clear: both"></div>
            <div class="tab-content" style="height: 390px;">
                <div id="tab-1" class="tab-pane active">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                            <tbody>
                                <tr>
                                    <td width="100">
                                        <label class="control-label">姓　　名：</label></td>
                                    <td width="140">
                                        <input id="Card_Name" readonly name="Card_Name" class="form-control" value="" type="text" runat="server" />
                                    </td>
                                    <td width="100">
                                        <label class="control-label">身份证号：</label></td>
                                    <td width="220">
                                        <input id="Card_ID" readonly name="Card_ID" class="form-control valid" type="text" value="" aria-required="true" aria-invalid="false" runat="server" />
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td></td>
                                    <td>&nbsp;</td>
                                    <td><span class="help-block m-b-none"><i class="fa fa-info-circle"></i>身份证号不能为空</span></td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">性　　别：</label></td>
                                    <td>
                                        <input id="Card_Sex" readonly name="Card_Sex" class="form-control" type="text" runat="server" />

                                    </td>
                                    <td>
                                        <label class="control-label">民　　族：</label></td>
                                    <td>
                                        <input id="Card_Nation" readonly name="Card_Nation" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">年　　龄：</label></td>
                                    <td>
                                        <input id="U_Age" readonly name="U_Age" value="" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">出生年月：</label></td>
                                    <td>

                                        <table width="100%" border="0" cellspacing="0" cellpadding="0">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input id="Card_Year" readonly name="Card_Year" class="form-control" type="text" style="width: 80px;" runat="server" /></td>
                                                    <td>－</td>
                                                    <td>
                                                        <input id="Card_Month" readonly name="Card_Month" class="form-control" style="width: 45px;" type="text" runat="server" /></td>
                                                    <td>－</td>
                                                    <td>
                                                        <input id="Card_Day" readonly name="Card_Day" class="form-control" style="width: 45px;" type="text" runat="server" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">身份证有效期：</label></td>
                                    <td colspan="3">
                                        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center" style="text-align: center">
                                            <tbody>
                                                <tr>
                                                    <td>
                                                        <input id="Card_Apply_Year" readonly name="Card_Apply_Year" class="form-control" type="text" style="width: 80px;" runat="server" /></td>
                                                    <td>－</td>
                                                    <td>
                                                        <input id="Card_Apply_Month" readonly name="Card_Apply_Month" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                                    <td>－</td>
                                                    <td>
                                                        <input id="Card_Apply_Day" readonly name="Card_Apply_Day" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                                    <td>至 </td>
                                                    <td>
                                                        <input id="Card_Valid_Year" readonly name="Card_Valid_Year" class="form-control" type="text" style="width: 80px;" runat="server" /></td>
                                                    <td>－</td>
                                                    <td>
                                                        <input id="Card_Valid_Month" readonly name="Card_Valid_Month" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                                    <td>－</td>
                                                    <td>
                                                        <input id="Card_Valid_Day" readonly name="Card_Valid_Day" class="form-control" type="text" style="width: 45px;" runat="server" /></td>
                                                </tr>
                                            </tbody>
                                        </table>

                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">户籍地址：</label></td>
                                    <td colspan="3">
                                        <input id="Card_Address" readonly name="Card_Address" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td>&nbsp;</td>
                                    <td colspan="3">&nbsp;</td>
                                </tr>

                                <tr>
                                    <td>
                                        <label class="control-label">联系电话:</label></td>
                                    <td>
                                        <input id="U_Tel" name="U_Tel" class="form-control" type="text" runat="server" /></td>
                                    <td>&nbsp;
                                    </td>
                                    <td>&nbsp;
                                    </td>
                                </tr>
                                <tr>
                                    <td>&nbsp;
                                    </td>
                                    <td colspan="3">&nbsp;
                                    </td>
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
                                        <label class="control-label">姓　　名：</label></td>
                                    <td>
                                        <input id="E_ChairMan" name="E_ChairMan" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">身份证号：</label></td>
                                    <td>
                                        <input id="E_ChairMan_ID" name="E_ChairMan_ID" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 15px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">性　　别：</label></td>
                                    <td>
                                        <select class="form-control" name="E_ChairMan_Sex" id="E_ChairMan_Sex" runat="server">
                                            <option selected></option>
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </td>
                                    <td>
                                        <label class="control-label">任职年限：</label></td>
                                    <td>
                                        <input id="E_ChairMan_Limit" name="E_ChairMan_Limit" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 15px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">学　　历：</label></td>
                                    <td>
                                        <select class="form-control" id="E_ChairMan_Edu" name="E_ChairMan_Edu" runat="server">
                                            <option selected></option>
                                            <option>小学</option>
                                            <option>初中</option>
                                            <option>高中</option>
                                            <option>大专</option>
                                            <option>硕士研究生</option>
                                            <option>博士研究生</option>
                                            <option>本科</option>
                                        </select>

                                    </td>
                                    <td>
                                        <label class="control-label">有无不良记录：</label></td>
                                    <td>
                                        <input id="E_ChairMan_Bad" name="E_ChairMan_Bad" class="form-control" type="text" runat="server" /></td>
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
                                        <label class="control-label">姓　　名：</label></td>
                                    <td>
                                        <input id="E_Manager" name="E_Manager" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">身份证号：</label></td>
                                    <td>
                                        <input id="E_Manager_ID" name="E_Manager_ID" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 15px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">性　　别：</label></td>
                                    <td>
                                        <select class="form-control" name="E_Manager_Sex" id="E_Manager_Sex" runat="server">
                                            <option selected></option>
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </td>
                                    <td>
                                        <label class="control-label">任职年限：</label></td>
                                    <td>
                                        <input id="E_Manager_Limit" name="E_Manager_Limit" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 15px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">学　　历：</label></td>
                                    <td>
                                        <select class="form-control" id="E_Manager_Edu" name="E_Manager_Edu" runat="server">
                                            <option selected></option>
                                            <option>小学</option>
                                            <option>初中</option>
                                            <option>高中</option>
                                            <option>大专</option>
                                            <option>硕士研究生</option>
                                            <option>博士研究生</option>
                                            <option>本科</option>
                                        </select>

                                    </td>
                                    <td>
                                        <label class="control-label">有无不良记录：</label></td>
                                    <td>
                                        <input id="E_Manager_Bad" name="E_Manager_Bad" class="form-control" type="text" runat="server" /></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
                <div id="tab-4" class="tab-pane">
                    <div class="ibox-content">
                        <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                            <tbody>
                                <tr>
                                    <td>
                                        <label class="control-label">姓　　名：</label></td>
                                    <td>
                                        <input id="E_CFO" name="E_CFO" class="form-control" type="text" runat="server" /></td>
                                    <td>
                                        <label class="control-label">身份证号：</label></td>
                                    <td>
                                        <input id="E_CFO_ID" name="E_CFO_ID" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 15px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">性　　别：</label></td>
                                    <td>
                                        <select class="form-control" name="E_CFO_Sex" id="E_CFO_Sex" runat="server">
                                            <option selected></option>
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </td>
                                    <td>
                                        <label class="control-label">任职年限：</label></td>
                                    <td>
                                        <input id="E_CFO_Limit" name="E_CFO_Limit" class="form-control" type="text" runat="server" /></td>
                                </tr>
                                <tr>
                                    <td colspan="4" style="height: 15px;">&nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        <label class="control-label">学　　历：</label></td>
                                    <td>
                                        <select class="form-control" id="E_CFO_Edu" name="E_CFO_Edu" runat="server">
                                            <option selected></option>
                                            <option>小学</option>
                                            <option>初中</option>
                                            <option>高中</option>
                                            <option>大专</option>
                                            <option>硕士研究生</option>
                                            <option>博士研究生</option>
                                            <option>本科</option>
                                        </select>
                                    </td>
                                    <td>
                                        <label class="control-label">有无不良记录：</label></td>
                                    <td>
                                        <input id="E_CFO_Bad" name="E_CFO_Bad" class="form-control" type="text" runat="server" /></td>
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
</body>
</html>

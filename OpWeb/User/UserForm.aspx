<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserForm.aspx.cs" Inherits="OpWeb.User.UserForm" %>

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
        
        //show.DeleteFile(name);
        
        
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
                                <input id="Card_Name" readonly name="Card_Name" class="form-control" type="text" runat="server" />
                            </td>
                            <td width="100">
                                <label class="control-label">身份证号：</label></td>
                            <td width="220">
                                <input id="Card_ID" readonly name="Card_ID" class="form-control valid" type="text" aria-required="true" aria-invalid="false" runat="server" />
                            </td>
                            <td colspan="2" rowspan="5">
                                <img src="../img/CardHead.jpg" id="Card_Head" width="102" height="126" alt="" runat="server" /></td>
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
                                <input id="U_Age" readonly name="U_Age" class="form-control" type="text" runat="server" /></td>
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
                            <td><input id="H" name="H" class="form-control" type="text" runat="server" /></td>
                            <td>&nbsp;</td>
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
                            <td colspan="2" rowspan="7">
                                <button class="btn btn-primary dim btn-large-dim" type="button" title="扫描身份证" <%=LoadJs %>>
                                    <i class="fa fa-money"></i>
                                </button>
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
                                <label class="control-label">居住地址：</label></td>
                            <td colspan="3">
                                <input id="U_Address" name="U_Address" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">联系电话:</label></td>
                            <td>
                                <input id="U_Tel" name="U_Tel" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">邮    编：</label></td>
                            <td>
                                <input id="U_Zip" name="U_Zip" class="form-control" type="text" runat="server" /></td>
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

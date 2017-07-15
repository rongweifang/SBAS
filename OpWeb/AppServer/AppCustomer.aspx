<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AppCustomer.aspx.cs" Inherits="OpWeb.AppServer.AppCustomer" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>客户资料</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/ContactTemp.css" rel="stylesheet" />
    <link href="/css/ContractPrint.css" media="print" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/blueimp/css/blueimp-gallery.min.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <style>
        .lightBoxGallery img {
            margin: 5px;
            width: 160px;
            max-height: 100px;
        }

        #signature {
            border: 2px dotted black;
            background-color: lightgrey;
        }
    </style>
</head>
<body>

    <%=PageContent %>

    <h1>客户资料</h1>
    <div class="lightBoxGallery">
        <%=SM.ToString() %>
        <div id="blueimp-gallery" class="blueimp-gallery">
            <div class="slides"></div>
            <h3 class="title"></h3>
            <a class="prev">‹</a>
            <a class="next">›</a>
            <a class="close">×</a>
            <a class="play-pause"></a>
            <ol class="indicator"></ol>
        </div>
        <script src="/js/jquery.min.js?v=2.1.4"></script>
        <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
        <script src="/js/content.js?v=1.0.0"></script>
        <script src="/js/plugins/blueimp/jquery.blueimp-gallery.min.js"></script>
    </div>
    <h1>确认签名</h1>
    <table  width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
        <tr>
            <td style="width:80px;">
                <label class="control-label">我的意见：</label></td>
            <td colspan="3" style="height:80px;">
                <input id="Operat" name="Operat" class="form-control" style="height:100%" type="text" runat="server" />
            </td>
        </tr>
    </table>
    <div id="signature" style="margin:15px 0 15px 0;"></div>


    <form id="form1" runat="server">
        <div style="padding-bottom:20px; text-align:center;">
        <input type="button" value="清除签名" class="btn btn-w-m btn-danger" onclick="ClearSign()" />&nbsp;
         <asp:Button ID="Btn_NoPass" runat="server" class="btn btn-w-m btn-warning" OnClientClick="return CheckSign();" Text="审批不通过" OnClick="Btn_NoPass_Click" />&nbsp;
        <asp:Button ID="Btn_Pass" class="btn btn-w-m btn-primary" runat="server" OnClientClick="return CheckSign();" Text="审批通过" OnClick="Btn_Pass_Click" />
        <input id="SignBase" type="hidden" value="" runat="server" />
            </div>
    </form>
    <script src="libs/jSignature.min.noconflict.js"></script>
    <script>

        $(document).ready(function () {

            var $sigdiv = $("#signature").jSignature({ 'UndoButton': true });
        });

        function ClearSign() {
            var $sigdiv = $("#signature");
            $sigdiv.jSignature("reset");
        }
        function CheckSign() {

            if ($("#Undo").css("display") == 'none') {
                layer.msg('签名未识别，请重新签名');
                return false;
            }
            else {
                var $sigdiv = $("#signature");
                var datapair = $sigdiv.jSignature("getData", "default")
                $("#SignBase").val(datapair);
            }

            //$("input:button").each(function (e) {
            //    if ($(this).val() == "擦除") {
            //        if ($(this).css("display") == 'none') {
            //            layer.msg('签名未识别，请重新签名');
            //            return false;
            //        }
            //        else {
            //            var $sigdiv = $("#signature");
            //            var datapair = $sigdiv.jSignature("getData", "default")
            //            $("#SignBase").val(datapair);
            //        }
            //    }
            //});
        }
    </script>


</body>
</html>

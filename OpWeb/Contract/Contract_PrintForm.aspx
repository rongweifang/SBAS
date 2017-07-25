<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_PrintForm.aspx.cs" Inherits="OpWeb.Contract.Contract_PrintForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同模板管理</title>

    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/plugins/summernote/summernote.css" rel="stylesheet" />
    <link href="/css/plugins/summernote/summernote-bs3.css" rel="stylesheet" />
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="/css/ContactTemp.css" rel="stylesheet" />
    <link href="/css/ContractPrint.css" media="print" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>


    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
    <!-- SUMMERNOTE -->
    <script src="/js/plugins/summernote/summernote.min.js"></script>
    <script src="/js/plugins/summernote/summernote-zh-CN.js"></script>

    <script>

        (function ($) {
            $.fn.extend({
                insertAtCaret: function (myValue) {
                    var $t = $(this)[0];
                    if (document.selection) {
                        this.focus();
                        sel = document.selection.createRange();
                        sel.text = myValue;
                        this.focus();
                    } else
                        if ($t.selectionStart || $t.selectionStart == '0') {
                            var startPos = $t.selectionStart;
                            var endPos = $t.selectionEnd;
                            var scrollTop = $t.scrollTop;
                            $t.value = $t.value.substring(0, startPos) + myValue + $t.value.substring(endPos, $t.value.length);
                            this.focus();
                            $t.selectionStart = startPos + myValue.length;
                            $t.selectionEnd = startPos + myValue.length;
                            $t.scrollTop = scrollTop;
                        } else {
                            this.value += myValue;
                            this.focus();
                        }
                }
            })
        })(jQuery);

    </script>

    <style>
        .note-editor {
            min-height: 450px;
        }
    </style>



</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <td>
                    <div class="row">
                        <div class="col-sm-12">
                            <div class="ibox float-e-margins" style="height: 460px;">
                                <input type="hidden" id="CTContent" runat="server" value="" />
                                <div class="ibox-content no-padding" id="Content" style="width: 100%; height: 100%; overflow: scroll;">
                                    <div class="click2edit">
                                    </div>

                                </div>
                            </div>
                        </div>
                    </div>
                </td>
            </tr>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Save" runat="server" class="l-btn"
                OnClick="Save_Click" OnClientClick="save()"><span class="l-btn-left">
            <img src="/Themes/Images/disk.png" alt="" />保 存</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>


    <script>
        $(document).ready(function () {

            $('.click2edit').summernote({
                lang: 'zh-CN'
            });
            $('.click2edit').code(unescape($('#CTContent').val()));
        });

        var save = function () {
            $("#Content").removeClass("no-padding");
            var aHTML = escape($('.click2edit').code());
            $('.click2edit').destroy();
            $('#CTContent').val(aHTML);
        };
    </script>
</body>
</html>

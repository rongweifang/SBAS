<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="Company_form.aspx.cs" Inherits="Manage.Company.Company_form" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>公司信息表单</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="/Themes/scripts/jwysiwyg/jquery.wysiwyg.css" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script type="text/javascript" src="/Themes/scripts/jwysiwyg/jquery.wysiwyg.js"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <style type="text/css">
        .auto-style1 {
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        <table border="0" cellpadding="0" cellspacing="0" class="frm">
            <tr>
                <th>公司名称：
                </th>
                <td>
                    <input id="companyName" runat="server" type="text" class="txt" datacol="yes" err="公司名称" checkexpession="NotNull" style="width: 85%" />
                </td>
            </tr>
            <tr>
                <th>公司类型：
                </th>
                <td>
                    <select id="companyType" name="companyType" class="required validate-selection" runat="server">
                        <option value="1">集团公司</option>
                        <option value="2">分公司</option>
                        <option value="3">二级单位</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>招聘开始时间：
                </th>
                <td>
                    <input type="text" id="BeginDate" class="txt" runat="server" style="width: 115px;"
                        onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd' })" />&nbsp;&nbsp;&nbsp;招聘结束时间：<input type="text" id="EndDate" class="txt" runat="server" style="width: 115px;"
                            onfocus="WdatePicker({dateFmt: 'yyyy-MM-dd' })" />
                </td>
            </tr>
            <tr>
                <th>是否发布：
                </th>
                <td>
                    <select id="DeleteMark" class="select" runat="server" style="width: 206px">
                        <option value="1">不发布</option>
                        <option value="0">发布</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th>公司简介：
                </th>
                <td>
                    <textarea id="Introduction" class="txtRemark" runat="server" style="width: 535px; height: 70px;"></textarea>
                </td>
            </tr>
            <tr>
                <th>招聘条件：
                </th>
                <td>
                    <textarea id="notice" class="txtRemark" runat="server" style="width: 535px; height: 70px;"></textarea>
                </td>
            </tr>
        </table>
        <div class="frmbottom">
            <asp:LinkButton ID="Save" runat="server" class="l-btn"  OnClick="Save_Click"><span class="l-btn-left">
            <img src="/Themes/Images/disk.png" alt="" />保 存</span></asp:LinkButton>
            <a id="Close" class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span
                class="l-btn-left">
                <img src="/Themes/Images/cancel.png" alt="" />关 闭</span></a>
        </div>
        <script type="text/javascript">
           
            function HTMLDecode(fString) {
                fString = replace(fString, "&gt;", ">")
                fString = replace(fString, "&lt;", "<")
                fString = Replace(fString, "&nbsp;", chr(32))
                fString = Replace(fString, "&quot;", chr(34))
                fString = Replace(fString, "&#39;", chr(39))
                fString = Replace(fString, "", CHR(13))
                fString = Replace(fString, "</P><P>", CHR(10) & CHR(10))
                fString = Replace(fString, "<BR>", CHR(10))
                fString = Replace(fString, "<BR/>", CHR(10))
                HTMLDecode = fString
            }

            //function chgcode() {
            //    alert(0);
            //    var intor = $('#Introduction').html();
            //    var noti = $('#Introduction').html();
            //    $('#Introduction').html("");
            //    $('#notice').html("");
            //    alert(noti);
            //    $('#Introduction').html(intor);
            //    $('#notice').html(noti);
            //    $('form1').submit();
            //    //OnClick="Save_Click"
            //}
            function HTMLEncode(fString) {
                fString = replace(fString, ">", "&gt;")
                fString = replace(fString, "<", "&lt;")
                fString = Replace(fString, CHR(32), "&nbsp;")
                fString = Replace(fString, CHR(34), "&quot;")
                fString = Replace(fString, CHR(39), "&#39;")
                fString = Replace(fString, CHR(13), "")
                fString = Replace(fString, CHR(10) & CHR(10), "</P><P>")
                fString = Replace(fString, CHR(10), "<BR>")
                HTMLEncode = fString
            }
            (function ($) {
                $('#Introduction').wysiwyg({
                    controls: {
                        strikeThrough: { visible: true },
                        underline: { visible: true },

                        separator00: { visible: true },

                        justifyLeft: { visible: true },
                        justifyCenter: { visible: true },
                        justifyRight: { visible: true },
                        justifyFull: { visible: true },

                        separator01: { visible: true },

                        indent: { visible: true },
                        outdent: { visible: true },

                        separator02: { visible: true },

                        subscript: { visible: true },
                        superscript: { visible: true },

                        separator03: { visible: true },

                        undo: { visible: true },
                        redo: { visible: true },

                        separator04: { visible: true },

                        insertOrderedList: { visible: true },
                        insertUnorderedList: { visible: true },
                        insertHorizontalRule: { visible: true },

                        h4mozilla: { visible: true && $.browser.mozilla, className: 'h4', command: 'heading', arguments: ['h4'], tags: ['h4'], tooltip: "Header 4" },
                        h5mozilla: { visible: true && $.browser.mozilla, className: 'h5', command: 'heading', arguments: ['h5'], tags: ['h5'], tooltip: "Header 5" },
                        h6mozilla: { visible: true && $.browser.mozilla, className: 'h6', command: 'heading', arguments: ['h6'], tags: ['h6'], tooltip: "Header 6" },

                        h4: { visible: true && !($.browser.mozilla), className: 'h4', command: 'formatBlock', arguments: ['<H4>'], tags: ['h4'], tooltip: "Header 4" },
                        h5: { visible: true && !($.browser.mozilla), className: 'h5', command: 'formatBlock', arguments: ['<H5>'], tags: ['h5'], tooltip: "Header 5" },
                        h6: { visible: true && !($.browser.mozilla), className: 'h6', command: 'formatBlock', arguments: ['<H6>'], tags: ['h6'], tooltip: "Header 6" },

                        separator07: { visible: true },

                        cut: { visible: true },
                        copy: { visible: true },
                        paste: { visible: true }
                    }
                });
            })(jQuery);

            (function ($) {
                $('#notice').wysiwyg({
                    controls: {
                        strikeThrough: { visible: true },
                        underline: { visible: true },

                        separator00: { visible: true },

                        justifyLeft: { visible: true },
                        justifyCenter: { visible: true },
                        justifyRight: { visible: true },
                        justifyFull: { visible: true },

                        separator01: { visible: true },

                        indent: { visible: true },
                        outdent: { visible: true },

                        separator02: { visible: true },

                        subscript: { visible: true },
                        superscript: { visible: true },

                        separator03: { visible: true },

                        undo: { visible: true },
                        redo: { visible: true },

                        separator04: { visible: true },

                        insertOrderedList: { visible: true },
                        insertUnorderedList: { visible: true },
                        insertHorizontalRule: { visible: true },

                        h4mozilla: { visible: true && $.browser.mozilla, className: 'h4', command: 'heading', arguments: ['h4'], tags: ['h4'], tooltip: "Header 4" },
                        h5mozilla: { visible: true && $.browser.mozilla, className: 'h5', command: 'heading', arguments: ['h5'], tags: ['h5'], tooltip: "Header 5" },
                        h6mozilla: { visible: true && $.browser.mozilla, className: 'h6', command: 'heading', arguments: ['h6'], tags: ['h6'], tooltip: "Header 6" },

                        h4: { visible: true && !($.browser.mozilla), className: 'h4', command: 'formatBlock', arguments: ['<H4>'], tags: ['h4'], tooltip: "Header 4" },
                        h5: { visible: true && !($.browser.mozilla), className: 'h5', command: 'formatBlock', arguments: ['<H5>'], tags: ['h5'], tooltip: "Header 5" },
                        h6: { visible: true && !($.browser.mozilla), className: 'h6', command: 'formatBlock', arguments: ['<H6>'], tags: ['h6'], tooltip: "Header 6" },

                        separator07: { visible: true },

                        cut: { visible: true },
                        copy: { visible: true },
                        paste: { visible: true }
                    }
                });
            })(jQuery);

        </script>
    </form>
</body>
</html>

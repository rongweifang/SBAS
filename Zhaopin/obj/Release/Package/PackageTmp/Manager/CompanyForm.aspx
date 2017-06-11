<%@ Page Language="C#" ValidateRequest="false" AutoEventWireup="true" CodeBehind="CompanyForm.aspx.cs" Inherits="Zhaopin.Manager.CompanyForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet">
    <link href="/themes/index/css/job.css" rel="stylesheet">
    <link rel="stylesheet" href="/scripts/jwysiwyg/jquery.wysiwyg.css" type="text/css" />
    <script type="text/javascript" src="/scripts/jquery.js"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script type="text/javascript" src="/scripts/jwysiwyg/jquery.wysiwyg.js"></script>
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <script src="/Scripts/FunctionJS.js" type="text/javascript"></script>
    <style type="text/css">
        .auto-style1 {
        }
    </style>
     <script>
         $(document).ready(function () {
             $("#BeginDate").datepicker({ dateFormat: 'yy-mm-dd' });
             $("#EndDate").datepicker({ dateFormat: 'yy-mm-dd' });
         });
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <div>

            <table style="width: 100%;">
                <tr>
                    <td class="auto-style1">公司名称</td>
                    <td>
                        <input id="companyName" name="companyName" type="text" class="required validate-specialchar input" value="" maxlength="20" runat="server" />

                    </td>
                    <td>&nbsp;</td>
                </tr>

                <tr>
                    <td class="auto-style1">公司类型</td>
                    <td>
                        <select id="companyType" name="companyType" class="required validate-selection" runat="server">
                            <option value="1">集团公司</option>
                            <option value="2">分公司</option>
                            <option value="3">二级单位</option>
                        </select>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                 <tr>
                    <td class="auto-style1">招聘开始时间</td>
                    <td>
                       <input id="BeginDate" name="BeginDate" type="text" class="required validate-specialchar input" value="" maxlength="20" runat="server" />

                    </td>
                    <td>&nbsp;</td>
                </tr>
                 <tr>
                    <td class="auto-style1">招聘结束时间</td>
                    <td>
                        <input id="EndDate" name="EndDate" type="text" class="required validate-specialchar input" value="" maxlength="20" runat="server" />

                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">公司简介</td>
                    <td>&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3">
                        <textarea name="Introduction" id="Introduction" rows="5" cols="103" runat="server"></textarea></td>
                </tr>
                <tr>
                    <td class="auto-style1">招聘条件</td>
                    <td></td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3">
                        <textarea name="notice" id="notice" rows="5" cols="103" runat="server"></textarea></td>
                </tr>
                <tr>
                    <td class="auto-style1" colspan="3">
                        <asp:Button ID="Button1" CssClass="btnsubmit" runat="server" Text="提交" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>

        </div>

        <script type="text/javascript">
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

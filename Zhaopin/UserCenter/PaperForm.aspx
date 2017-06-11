<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PaperForm.aspx.cs" Inherits="Zhaopin.UserCenter.PaperForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心 - 简历登记 - 论文</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" />
    <link href="/themes/index/css/job.css" rel="stylesheet" />
   <script src="/scripts/prototype_for_validation.js" type="text/javascript"></script>
    <script src="/scripts/effects.js" type="text/javascript"></script>
    <script src="/scripts/validation_cn.js" type="text/javascript"></script>
    <script src="/scripts/jquery.js" type="text/javascript"></script>
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <script src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script src="/scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
    <script type="text/javascript" src="/scripts/jquery.form.js"></script>
    <script src="/scripts/jquery.blockUI.js" type="text/javascript"></script>
    <link href="/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/Scripts/ShowMsg/msgbox.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/ShowMsg/msgbox.js" type="text/javascript"></script>
    <script src="/Scripts/FunctionJS.js" type="text/javascript"></script>
    <style type="text/css">
        <!--
        /* 学术成果情况 */
        .form01 {
            width: 330px;
            height: 50px;
            float: left;
        }

        .form02 {
            width: 115px;
            text-align: right;
            height: 50px;
            float: left;
        }

        .form03 {
            width: 170px;
            float: left;
        }

        .form04 {
            width: 330px;
            height: 50px;
            float: left;
        }

        .form05 {
            width: 450px;
            float: left;
        }

        .form06 {
            width: 300px;
            height: 50px;
            float: left;
        }

        .form07 {
            width: 580px;
            height: 50px;
            float: left;
        }

        .form08 {
            width: 580px;
            height: 90px;
            float: left;
        }

        .form11 {
            float: left;
            width: 170px;
        }

        .form12 {
            float: left;
            width: 170px;
            height: 50px;
        }

        .form13 {
            width: 150px;
            float: left;
        }

        .form14 {
            width: 115px;
            text-align: right;
            height: 60px;
            float: left;
        }

        .form15 {
            float: left;
            width: 65px;
        }

        .form16 {
            float: left;
            width: 130px;
        }

        .form17 {
            float: left;
            width: 270px;
        }

        .gray26, .gray26 a:link, .gray26 a:visited {
            font-size: 12px;
            line-height: 26px;
            font-weight: normal;
            color: #338d89;
            text-decoration: none;
        }

        table {
            width: 738px;
        }

        .gray30 {
            background-color: #FFF;
            width: 400px;
        }


        #paperAdd {
            height: 342px;
            width: 660px;
            background-color: #EEE;
            padding-top: 8px;
        }
        -->
    </style>
    <script type="text/javascript">
        $(document).ready(function () {
            $("#Pubdate").datepicker({ dateFormat: 'yy-mm-dd' });
            
        });
    </script>
</head>
<body>
    <form id="PaperForm" runat="server">
        <div id="paperAdd">
            <ul>
                <li>
                    <div class="form06" style="width: 400px;">
                        <div class="form02">论文级别：</div>
                        <div class="form15" style="width: 260px">
                            <div style="padding-top: 4px; width: 260px;">
                                <select id="PaperLevel" name="PaperLevel" class="required validate-selection" runat="server">
                                </select><span style="color: red; padding-left: 5px;">*</span>
                            </div>
                        </div>
                    </div>
                </li>
                <li>
                    <div class="form04">
                        <div class="form02">论文名称：</div>
                        <div class="form11">
                            <input id="PaperName" name="PaperName" type="text" class="required validate-specialchar input" value="" maxlength="100" runat="server" />
                        </div>
                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                    </div>
                </li>
                <li>
                    <div class="form01">
                        <div class="form02">发表时间：</div>
                        <div class="form11">
                            <input id="Pubdate" name="Pubdate" type="text" value="" class="required input" readonly="true" runat="server" />
                        </div>
                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                    </div>

                </li>
                <li>
                    <div class="form01">
                        <div class="form02">期刊/收录机构名称：</div>
                        <div class="form11">
                            <input id="Press" name="Press" type="text" class="required validate-specialchar input" value="" maxlength="20" runat="server" />
                        </div>
                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                    </div>
                </li>
                <li>
                    <div class="form01">
                        <div class="form02">年度及期次：</div>
                        <div class="form11">
                            <input id="Period" name="Period" type="text" class="required validate-specialchar input" value="" maxlength="10" runat="server" />
                        </div>
                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                    </div>
                </li>
                <li>
                    <div class="form01">
                        <div class="form02">作者排序：</div>
                        <div class="form12" style="overflow: hidden;">
                            <div>
                                <input id="AuthorOrder" name="AuthorOrder" type="text" class="required  validate-pattern-/^\d*$/ input" value="" maxlength="20" runat="server" />
                            </div>
                            <div class="gray02">请填写阿拉伯数字</div>
                        </div>
                        <div style="color: red; width: 20px; float: left;">&nbsp;&nbsp;*</div>
                    </div>
                </li>
                <li>
                    <div class="form01">
                        <div class="form02">论文索引号：</div>
                        <div class="form11">
                            <input id="PaperIndex" name="PaperIndex" type="text" class="validate-alphanum input" value="" maxlength="20" runat="server" />
                        </div>
                        <div style="color: red; width: 20px; float: left;"></div>
                    </div>
                </li>
                <li>
                    <div class="form07">
                        <div class="form02">&nbsp;&nbsp;</div>
                        <div class="form05">
                            <asp:Button ID="Button1" runat="server" Text="保存" CssClass="btnsubmit" OnClientClick="return chkPaperFormSubmit();" OnClick="Button1_Click" />
                        </div>
                    </div>
                </li>
            </ul>
        </div>
    </form>
      <script>
          var PaperForm = new Validation("PaperForm");
          function chkPaperFormSubmit() {
              if (!PaperForm.validate()) {
                  return false;
              }
          }
    </script>
</body>
</html>

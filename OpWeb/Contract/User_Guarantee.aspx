<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Guarantee.aspx.cs" Inherits="OpWeb.Contract.User_Guarantee" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>保证人/抵押人</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/TreeTable/jquery.treeTable.js" type="text/javascript"></script>
    <link href="/Themes/Scripts/TreeTable/css/jquery.treeTable.css" rel="stylesheet"
        type="text/css" />
    <link href="/Themes/Scripts/TreeView/treeview.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/TreeView/treeview.pack.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        //初始化
        $(function () {
            $('#table2').hide();
        })
        //点击切换面板
        function panel(obj) {
            if (obj == 1) {
                $('#table1').show();
                $('#table2').hide();

            } else if (obj == 2) {
                $('#table1').hide();
                $("#table2").show();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="frmtop">
        <table style="padding: 0px; margin: 0px; height: 100%;" cellpadding="0" cellspacing="0">
            <tr>
                <td id="menutab" style="vertical-align: bottom;">
                    <div id="tab0" class="Tabsel" onclick="GetTabClick(this);panel(1)">
                        保证人</div>
                    <div id="tab1" class="Tabremovesel" onclick="GetTabClick(this);panel(2);">
                        抵押人</div>
                </td>
            </tr>
        </table>
    </div>
    <div class="div-frm" style="height: 275px;">
        <%--房产抵押--%>
        <table id="table1" border="0" cellpadding="0" cellspacing="0" class="frm">
            
        </table>
        <%--汽车抵押--%>
        <table id="table2" border="0" cellpadding="0" cellspacing="0" class="frm">
           
        </table>
       
    </div>
   
    </form>
</body>
</html>

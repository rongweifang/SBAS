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
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        //初始化

        //点击切换面板
        function panel(obj) {
            var url = "User_GuaranteeForm1.aspx?UID=<%=UID%>";
            if (obj == 1) {

                url = "User_GuaranteeForm1.aspx?UID=<%=UID%>";
            } else if (obj == 2) {
                url = "User_GuaranteeForm2.aspx?UID=<%=UID%>";
            }
            $('#iframe0').attr('src', url);
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
                            保证人
                        </div>
                        <div id="tab1" class="Tabremovesel" onclick="GetTabClick(this);panel(2);">
                            抵押人
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="div-frm" style="height: 590px;overflow:hidden;">
            <iframe name="iframe0" id="iframe0" width="100%" height="100%" src="User_GuaranteeForm1.aspx?UID=<%=UID%>" frameborder="0"></iframe>
        </div>
    </form>
</body>
</html>

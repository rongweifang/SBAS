<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_LDZJPGInfo.aspx.cs" Inherits="OpWeb.Contract.Contract_LDZJPGInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>质押凭证清单</title>
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
            var url = "Contract_LDZJPGInfoForm1.aspx?UID=<%=UID%>";
            if (obj == 1) {

                url = "Contract_LDZJPGInfoForm1.aspx?UID=<%=UID%>";
            } else if (obj == 2) {
                url = "Contract_LDZJPGInfoForm2.aspx?UID=<%=UID%>";
            }
            else if (obj == 3) {
                url = "Contract_LDZJPGInfoForm3.aspx?UID=<%=UID%>";
            }
            else if (obj == 4) {
                url = "Contract_LDZJPGInfoForm4.aspx?UID=<%=UID%>";
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
                            证券质押
                        </div>
                        <div id="tab1" class="Tabremovesel" onclick="GetTabClick(this);panel(2);">
                            质押凭证
                        </div>
                        <div id="tab2" class="Tabremovesel" onclick="GetTabClick(this);panel(3);">
                            权利质押
                        </div>
                        <div id="tab3" class="Tabremovesel" onclick="GetTabClick(this);panel(4);">
                            定期存单
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="div-frm" style="height: 590px; overflow: hidden;">
            <iframe name="iframe0" id="iframe0" width="100%" height="100%" src="Contract_LDZJPGInfoForm1.aspx?UID=<%=UID%>" frameborder="0"></iframe>
        </div>
    </form>
</body>
</html>

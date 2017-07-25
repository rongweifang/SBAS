﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_SelectTemp_Left.aspx.cs" Inherits="OpWeb.Contract.Contract_SelectTemp_Left" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
   <title>选择项信息</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <link href="/Themes/Scripts/TreeView/treeview.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/TreeView/treeview.pack.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        //初始化
        $(function () {
            divresize(29);
            treeAttrCss();
            GetClickValue();
        })
        function GetClickValue() {
            $(".strTree li div").click(function () {
                var id = "";
                //子目录 
                $(this).parent().find("span").each(function () {
                    if ($(this).html() != "") {
                        id += "'" + $(this).html() + "',";
                    }
                });
                id = id.substr(0, id.length - 1);
                var path = 'Contract_SelectTemp_Right.aspx?SL_ID=' + id;
                window.parent.frames["target_right"].location = path;
                Loading(true);
            })
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="btnbartitle">
        <div>
            合同分类列表
        </div>
    </div>
    <div class="div-body">
        <ul class="strTree">
            <%=strHtml.ToString()%>
        </ul>
    </div>
    </form>
</body>
</html>

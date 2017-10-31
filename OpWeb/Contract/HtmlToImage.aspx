<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HtmlToImage.aspx.cs" Inherits="OpWeb.Contract.HtmlToImage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>HtmlToImage</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/ContactTemp.css" rel="stylesheet" />
    <link href="/css/ContractPrint.css" media="print" rel="stylesheet" />
    <script type="text/javascript" src="/js/jquery.min.js"></script>
    <script type="text/javascript" src="/js/html2canvas.js"></script>
     <%=CssUrl %>
    <style>
        #ViewBody {
            width: 710px;
            overflow-y: hidden;
            overflow-x: hidden;
            padding: 0;
            margin: 0;
        }
    </style>
</head>
<body>
    
        <%=HtmlBody %>
   
    <script type="text/javascript">
        $(document).ready(function () {
                html2canvas(document.body, {
                    allowTaint: true,
                    taintTest: false,
                    onrendered: function (canvas) {
                        canvas.id = "Pagecanvas";
                        var dataUrl = canvas.toDataURL();
                        var newImg = document.createElement("img");
                        newImg.src = dataUrl;
                        newImg.width = 700;
                        document.body.innerHTML = "";
                        document.body.appendChild(newImg);
                    }
            });
        });

    </script>
</body>
</html>

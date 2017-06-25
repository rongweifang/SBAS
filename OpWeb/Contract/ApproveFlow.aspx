<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ApproveFlow.aspx.cs" Inherits="OpWeb.Contract.ApproveFlow" %>

<!DOCTYPE html>

<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户信息</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/JS/jquery.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script type="text/javascript">
        //回车键
        document.onkeydown = function (e) {
            if (!e) e = window.event; //火狐中是 window.event
            if ((e.keyCode || e.which) == 13) {
                var obtnSearch = document.getElementById("lbtSearch");
                obtnSearch.click();
            }
        }
        $(function () {
            divresize(60);
            FixedTableHeader("#table1", $(window).height() - 118);
        })

        function refresh() {
            location.reload();
        }

        //添加
        function add() {
            var url = "/User/BlackUserEdit.aspx";
            top.openDialog(url, 'UserForm', '黑名单 - 添加', 800, 510, 50, 50);
        }
        //修改
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/User/BlackUserEdit.aspx?userId=" + key;
                top.openDialog(url, 'UserForm', '黑名单 - 编辑', 800, 510, 50, 50);
            }
        }
        //删除
        function Delete() {
            var key = CheckboxValue();
            if (!confirm("确定删除该记录吗？")) {
                return;
            }
            if (key == null || $.trim(key) == null) {
                alert("删除失败");
                return;
            }
            getAjax('/Handler/BlackUserHandler.ashx?op=deleteBlackUser&id=' + key, "", function (rs) {
                if (parseInt(rs) <= 0) {
                    showTipsMsg("<span style='color:red'>删除失败！</span>", 4000, 5);
                }
                else {
                    windowload();
                }
            });
        }

        function refresh() {
            windowload();
        }

        function saveSuccess(msg) {
            showTipsMsg("<span style='color:red'>" + msg + "</span>", 500, 4);
            window.setTimeout(windowload, 1000);
        }

        function Onflag() {
            //var key = CheckboxValue();
            //if (IsDelData(key)) {
            //    var parm = 'action=flag&user_ID=' + key;
            //    getAjax('Common_UserInfo.ashx', parm, function (rs) {
            //        if (parseInt(rs) > 0) {
            //            showTipsMsg("标记成功！在【用户管理】-【我的标记】里查看详细！", 2000, 4);
            //            windowload();
            //        }
            //        else {
            //            showTipsMsg("<span style='color:red'>标记失败，请稍后重试！</span>", 4000, 5);
            //        }
            //    });

            //}
        }
        $(document).ready(function () {
            $("#btn_refresh").click(function () {

            });
        });
    </script>


</head>
<body class="gray-bg">
    <div class="wrapper animated fadeInRight">
        <form id="form1" runat="server">
            <div class="div-body">
                <div>
                    
                </div>
            </div>
        </form>
    </div>
</body>
</html>
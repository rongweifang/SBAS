<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MainDefault.aspx.cs" Inherits="OpWeb.MainDefault" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="renderer" content="webkit" />

    <title>系统主页</title>


    <!--[if lt IE 9]>
    <meta http-equiv="refresh" content="0;ie.html" />
    <![endif]-->

    <link rel="shortcut icon" href="favicon.ico" />
    <link href="css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="css/font-awesome.min.css?v=4.4.0" rel="stylesheet" />
    <link href="css/animate.css" rel="stylesheet" />
    <link href="css/style.css?v=4.1.0" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <link href="/Themes/Scripts/ShowMsg/msgbox.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/ShowMsg/msgbox.js" type="text/javascript"></script>
    <link href="/Themes/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script src="/Frame/MainFrame.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(function () {
            GetMenu();
        })
        //菜单
        var V_JSON = "";
        function GetMenu() {
            var parm = 'action=Menu';
            $("#side-menu").empty();
            $("#side-menu").append(GetLoginInfo());
            getAjax('Frame/Frame.ashx', parm, function (rs) {
                try {
                    V_JSON = rs;
                    var j = 0;
                    var json = eval("(" + V_JSON + ")");
                    var css = "sel";
                    for (var i = 0; i < json.MENU.length; i++) {
                        var menu = json.MENU[i];
                        if (menu.PARENTID == 0) {
                            $("#side-menu").append(" <li><a href=\"#\"><i class=\"fa " + menu.ICONCLASS + "\"></i><span class=\"nav-label\">" + menu.MENU_NAME + "</span><span class=\"fa arrow\"></span></a>" + GetSeedMenu(this, menu.MENU_ID) + "</li>");
                            j++;
                        }
                    }
                } catch (e) {
                }
            });
        }

        //子菜单
        function GetSeedMenu(e, menu_id) {
            var menus = "";
            var j = 0;
            var json = eval("(" + V_JSON + ")");
            for (var i = 0; i < json.MENU.length; i++) {
                var menu = json.MENU[i];
                if (menu.PARENTID == menu_id) {
                    menus += " <li> <a class=\"J_menuItem\" href=\"" + menu.NAVIGATEURL + "\" data-index=" + i + ">" + menu.MENU_NAME + "</a></li>";
                    j++;
                }
            }
            return menus != "" ? " <ul class=\"nav nav-second-level\">" + menus + "</ul>" : "";
        }
        function GetLoginInfo() {
            var Infos = "";
            Infos += "  <li class=\"nav-header\">";
            Infos += "               <div class=\"dropdown profile-element\">";
            Infos += "                  <span>";
            Infos += "                <img alt=\"image\" class=\"img-circle\" src=\"img/profile_small.jpg\" /></span>";
            Infos += "            <a data-toggle=\"dropdown\" class=\"dropdown-toggle\" href=\"#\">";
            Infos += "                <span class=\"clear\">";
            Infos += "                    <span class=\"block m-t-xs\"><strong class=\"font-bold\"> <%=UserName %></strong></span>";
            Infos += "                    <span class=\"text-muted text-xs block\"><%=User_Account%><b class=\"caret\"></b></span>";
            Infos += "                </span>";
            Infos += "            </a>";
            Infos += "            <ul class=\"dropdown-menu animated fadeInRight m-t-xs\">";
            Infos += "                <li><a class=\"J_menuItem\" href=\"form_avatar.html\">修改头像</a>";
            Infos += "                </li>";
            Infos += "                <li><a class=\"J_menuItem\" href=\"profile.html\">个人资料</a>";
            Infos += "                </li>";
            Infos += "                <li><a class=\"J_menuItem\" href=\"contacts.html\">联系我们</a>";
            Infos += "                </li>";
            Infos += "                <li><a class=\"J_menuItem\" href=\"mailbox.html\">信箱</a>";
            Infos += "                </li>";
            Infos += "                <li class=\"divider\"></li>";
            Infos += "                <li><a href=\"login.html\">安全退出</a>";
            Infos += "                </li>";
            Infos += "            </ul>";
            Infos += "        </div>";
            Infos += "        <div class=\"logo-element\">";
            Infos += "           GW";
            Infos += "        </div>";
            Infos += "    </li>";

            return Infos;
        }
    </script>
</head>
<body class="fixed-sidebar full-height-layout gray-bg" style="overflow: hidden">
    <div id="wrapper">
        <!--左侧导航开始-->
        <nav class="navbar-default navbar-static-side" role="navigation">
            <div class="nav-close">
                <i class="fa fa-times-circle"></i>
            </div>
            <div class="sidebar-collapse">
                <ul class="nav" id="side-menu">
                </ul>
            </div>
        </nav>
        <!--左侧导航结束-->
        <!--右侧部分开始-->
        <div id="page-wrapper" class="gray-bg dashbard-1">
            <div class="row border-bottom">
                <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                    <div class="navbar-header">
                        <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#"><i class="fa fa-bars"></i></a>
                        <form role="search" class="navbar-form-custom" method="post" action="search_results.html">
                            <div class="form-group">
                                <input type="text" placeholder="请输入您需要查找的内容 …" class="form-control" name="top-search" id="top-search" />
                            </div>
                        </form>
                    </div>
                    <ul class="nav navbar-top-links navbar-right">
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-envelope"></i><span class="label label-warning">0</span>
                            </a>
                            <ul class="dropdown-menu dropdown-messages">

                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="mailbox.html">
                                            <i class="fa fa-envelope"></i><strong>查看所有消息</strong>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="dropdown">
                            <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                                <i class="fa fa-bell"></i><span class="label label-primary">0</span>
                            </a>
                            <ul class="dropdown-menu dropdown-alerts">
                                <li>
                                    <a href="mailbox.html">
                                        <div>
                                            <i class="fa fa-envelope fa-fw"></i>您有0条未读消息
                                           
                                                <span class="pull-right text-muted small"></span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <a href="profile.html">
                                        <div>
                                            <i class="fa fa-qq fa-fw"></i>0条新回复
                                           
                                                <span class="pull-right text-muted small"></span>
                                        </div>
                                    </a>
                                </li>
                                <li class="divider"></li>
                                <li>
                                    <div class="text-center link-block">
                                        <a class="J_menuItem" href="notifications.html">
                                            <strong>查看所有 </strong>
                                            <i class="fa fa-angle-right"></i>
                                        </a>
                                    </div>
                                </li>
                            </ul>
                        </li>
                        <li class="hidden-xs">
                            <a href="index_v1.html" class="J_menuItem" data-index="0"><i class="fa fa-cart-arrow-down"></i>锁定</a>
                        </li>
                        <li class="dropdown hidden-xs">
                            <a class="right-sidebar-toggle" aria-expanded="false">
                                <i class="fa fa-tasks"></i>主题
                            </a>
                        </li>
                    </ul>
                </nav>
            </div>
            <div class="row content-tabs">
                <button class="roll-nav roll-left J_tabLeft">
                    <i class="fa fa-backward"></i>
                </button>
                <nav class="page-tabs J_menuTabs">
                    <div class="page-tabs-content">
                        <a href="javascript:;" class="active J_menuTab" data-id="HomeIndex.aspx">首页</a>
                    </div>
                </nav>

                <button class="roll-nav roll-right J_tabRight">
                    <i class="fa fa-forward"></i>
                </button>

                <div class="btn-group roll-nav roll-right">

                    <button class="dropdown J_tabClose" data-toggle="dropdown">
                        关闭操作<span class="caret"></span>

                    </button>
                    <ul role="menu" class="dropdown-menu dropdown-menu-right">
                        <li class="J_tabShowActive"><a>定位当前选项卡</a>
                        </li>
                        <li class="divider"></li>
                        <li class="J_tabCloseAll"><a>关闭全部选项卡</a>
                        </li>
                        <li class="J_tabCloseOther"><a>关闭其他选项卡</a>
                        </li>
                        <li class="J_tabRefresh"><a>刷新当前选项卡</a>
                        </li>
                    </ul>
                </div>
                <a href="login.html" class="roll-nav roll-right J_tabExit"><i class="fa fa fa-sign-out"></i>退出</a>
            </div>
            <div class="row J_mainContent" id="content-main">
                <iframe class="J_iframe" name="iframe0" id="iframe0" width="100%" height="100%" src="/Frame/HomeIndex.aspx" frameborder="0" data-id="HomeIndex.aspx" seamless></iframe>
            </div>
            <div class="footer">
                <div class="pull-right">
                    &copy; 2017 <a href="http://www.gowants.com/" target="_blank">GoWants</a>
                </div>
            </div>
        </div>
        <!--右侧部分结束-->
        <!--右侧边栏开始-->
        <div id="right-sidebar">
            <div class="sidebar-container">

                <ul class="nav nav-tabs navs-3">

                    <li class="active">
                        <a data-toggle="tab" href="#tab-1">
                            <i class="fa fa-gear"></i>主题
                        </a>
                    </li>
                    <li class=""><a data-toggle="tab" href="#tab-2">通知
                    </a>
                    </li>
                    <li><a data-toggle="tab" href="#tab-3">项目进度
                    </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="tab-1" class="tab-pane active">
                        <div class="sidebar-title">
                            <h3><i class="fa fa-comments-o"></i>主题设置</h3>
                            <small><i class="fa fa-tim"></i>你可以从这里选择和预览主题的布局和样式，这些设置会被保存在本地，下次打开的时候会直接应用这些设置。</small>
                        </div>
                        <div class="skin-setttings">
                            <div class="title">主题设置</div>
                            <div class="setings-item">
                                <span>收起左侧菜单</span>
                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="collapsemenu" class="onoffswitch-checkbox" id="collapsemenu" />
                                        <label class="onoffswitch-label" for="collapsemenu">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定顶部</span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="fixednavbar" class="onoffswitch-checkbox" id="fixednavbar">
                                        <label class="onoffswitch-label" for="fixednavbar">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="setings-item">
                                <span>固定宽度
                    </span>

                                <div class="switch">
                                    <div class="onoffswitch">
                                        <input type="checkbox" name="boxedlayout" class="onoffswitch-checkbox" id="boxedlayout">
                                        <label class="onoffswitch-label" for="boxedlayout">
                                            <span class="onoffswitch-inner"></span>
                                            <span class="onoffswitch-switch"></span>
                                        </label>
                                    </div>
                                </div>
                            </div>
                            <div class="title">皮肤选择</div>
                            <div class="setings-item default-skin nb">
                                <span class="skin-name ">
                                    <a href="#" class="s-skin-0">默认皮肤
                         </a>
                                </span>
                            </div>
                            <div class="setings-item blue-skin nb">
                                <span class="skin-name ">
                                    <a href="#" class="s-skin-1">蓝色主题
                        </a>
                                </span>
                            </div>
                            <div class="setings-item yellow-skin nb">
                                <span class="skin-name ">
                                    <a href="#" class="s-skin-3">黄色/紫色主题
                        </a>
                                </span>
                            </div>
                        </div>
                    </div>
                    <div id="tab-2" class="tab-pane">

                        <div class="sidebar-title">
                            <h3><i class="fa fa-comments-o"></i>最新通知</h3>
                            <small><i class="fa fa-tim"></i>您当前有0条未读信息</small>
                        </div>

                        <div>
                        </div>

                    </div>
                    <div id="tab-3" class="tab-pane">

                        <div class="sidebar-title">
                            <h3><i class="fa fa-cube"></i>最新审批</h3>
                            <small><i class="fa fa-tim"></i>您当前有0个任务，0个已完成</small>
                        </div>

                        <ul class="sidebar-list">
                            <li>
                                <a href="#">
                                    <div class="small pull-right m-t-xs"></div>
                                    <h4></h4>




                                    <div class="small"></div>
                                    <div class="progress progress-mini">
                                        <div style="width: 22%;" class="progress-bar progress-bar-warning"></div>
                                    </div>
                                    <div class="small text-muted m-t-xs"></div>
                                </a>
                            </li>


                        </ul>

                    </div>
                </div>

            </div>
        </div>
        <!--右侧边栏结束-->
        <!--mini聊天窗口开始-->
        <div class="small-chat-box fadeInRight animated">

            <div class="heading" draggable="true">
                <small class="chat-date pull-right"></small>与管理员对话
               
            </div>

            <div class="content">
            </div>
            <div class="form-chat">
                <div class="input-group input-group-sm">
                    <input type="text" class="form-control" />
                    <span class="input-group-btn">
                        <button
                            class="btn btn-primary" type="button">
                            发送
               
                        </button>
                    </span>
                </div>
            </div>

        </div>
        <div id="small-chat">
            <span class="badge badge-warning pull-right"></span>
            <a class="open-small-chat">
                <i class="fa fa-comments"></i>

            </a>
        </div>
        <!--mini聊天窗口结束-->
    </div>
    <div id="loading" onclick="Loading(false);">
        正在处理，请稍待。。。
    </div>
    <div id="Toploading">
    </div>
    <!-- 全局js -->
    <script src="js/jquery.min.js?v=2.1.4"></script>
    <script src="js/bootstrap.min.js?v=3.3.6"></script>
    <script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
    <script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
    <script src="js/plugins/layer/layer.min.js"></script>

    <!-- 自定义js -->
    <script src="js/hplus.js?v=4.1.0"></script>
    <script type="text/javascript" src="js/contabs.js"></script>

    <!-- 第三方插件 -->
    <script src="js/plugins/pace/pace.min.js"></script>
</body>
</html>

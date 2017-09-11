<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="HomeIndex.aspx.cs" Inherits="OpWeb.Frame.HomeIndex" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>系统首页</title>


    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />

    <link href="/css/plugins/morris/morris-0.4.3.min.css" rel="stylesheet" />

    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />

</head>
<body class="gray-bg sidebar-content">


    <div class="wrapper wrapper-content">
        <div class="row">
            <div class="col-sm-12">
                <div class="ibox float-e-margins">
                    <div class="ibox-content">
                        <div>

                            <h1 class="m-b-xs">￥ <%=LoanOut %>万元</h1>
                            <h3 class="font-bold no-margins">本月贷款金额
                            </h3>
                            <small><%= Common.DotNetConfig.ConfigHelper.GetAppSettings("CustomerCompanyNameShort") %></small>
                        </div>

                        <div class="flot-chart" style="height: 140px">
                            <div class="flot-chart-content" id="flot-chart3"></div>
                        </div>

                        <div class="m-t-md">
                            <small class="pull-right">
                                <i class="fa fa-clock-o"></i>
                                最后更新：<%=DateTime.Now.ToString("yyyy年MM月dd日") %>
                            </small>
                            <small>
                                <strong>贷款分析：</strong> 该值已随时间发生变化，上个月达到的水平超过0万元。
                            </small>
                        </div>

                    </div>
                </div>
            </div>
        </div>


        <div class="row">

            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-primary pull-right">今天</span>
                        <h5>客户</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><%=Customers %></h1>
                        <div class="stat-percent font-bold text-navy">
                            0% <i class="fa fa-level-up"></i>
                        </div>
                        <small>新客户</small>
                    </div>
                </div>
            </div>
            <div class="col-sm-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-info pull-right">月</span>
                        <h5>合同数量</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><%=ContractNum %></h1>
                        <div class="stat-percent font-bold text-info">
                            0% <i class="fa fa-level-up"></i>
                        </div>
                        <small>新合同</small>
                    </div>
                </div>
            </div>
            <div class="col-lg-4">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <span class="label label-warning pull-right">年</span>
                        <h5>提交审批</h5>
                    </div>
                    <div class="ibox-content">
                        <h1 class="no-margins"><%=ApproveNum %></h1>
                        <div class="stat-percent font-bold text-warning">
                            0% <i class="fa fa-level-up"></i>
                        </div>
                        <small>不含作废审批</small>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>登录情况</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>

                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>
                    <div class="ibox-content ibox-heading">
                        <%=Login_InfoHtml%>
                        <br />
                        <img src="/Themes/Images/exclamation_octagon_fram.png" style="vertical-align: middle; margin-bottom: 3px;"
                            width="16" height="16" alt="tip" />
                        提示：为了账号的安全，如果上面的登录情况不正常，建议您马上 <a href="javascript:void(0);" title="修改登录密码" style="text-decoration: underline; color: Blue;"
                            onclick="editpwd()">密码修改</a>
                    </div>

                </div>

            </div>

            <div class="col-sm-6">
                <div class="ibox float-e-margins">
                    <div class="ibox-title">
                        <h5>待审批事项</h5>
                        <div class="ibox-tools">
                            <a class="collapse-link">
                                <i class="fa fa-chevron-up"></i>
                            </a>

                            <a class="close-link">
                                <i class="fa fa-times"></i>
                            </a>
                        </div>
                    </div>

                    <div class="ibox-content timeline">

                        <div class="timeline-item">
                            <div class="row">
                                <div class="col-xs-3 date">
                                    <i class="fa fa-briefcase"></i>6:00
                                    <br />
                                    <small class="text-navy"></small>
                                </div>
                                <div class="col-xs-7 content no-top-border">
                                    <p class="m-b-xs">
                                        <strong></strong>
                                    </p>
                                    <p></p>
                                </div>
                            </div>
                            <div class="clear"></div>
                        </div>

                    </div>
                </div>
            </div>

        </div>

    </div>


    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>

    <!-- Flot -->
    <script src="/js/plugins/flot/jquery.flot.js"></script>
    <script src="/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
    <script src="/js/plugins/flot/jquery.flot.spline.js"></script>
    <script src="/js/plugins/flot/jquery.flot.resize.js"></script>
    <script src="/js/plugins/flot/jquery.flot.pie.js"></script>
    <script src="/js/plugins/flot/jquery.flot.symbol.js"></script>
    <script src="/js/plugins/flot/curvedLines.js"></script>
    <script src="/js/content.js?v=1.0.0"></script>
    <!-- jQuery UI -->
    <script src="/js/plugins/jquery-ui/jquery-ui.min.js"></script>

    <!-- EayPIE -->
    <script src="/js/plugins/easypiechart/jquery.easypiechart.js"></script>


    <script>
        $(document).ready(function () {
            var d1 = [
                [1262304000000, 1],
                [1264982400000, 100],
                [1267401600000, 1],
                [1270080000000, 200],
                [1272672000000, 1],
                [1275350400000, 100],
                [1277942400000, 1],
                [1280620800000, 300]
            ];
            var d2 = [
                [1262304000000, 100],
                [1264982400000, 1],
                [1267401600000, 150],
                [1270080000000, 1],
                [1272672000000, 230],

                [1275350400000, 1],
                [1277942400000, 150],
                [1280620800000, 10]
            ];

            var data3 = [
                {
                    label: "Data 1",
                    data: d1,
                    color: '#23c6c8'
                },
                {
                    label: "Data 2",
                    data: d2,
                    color: '#1ab394'
                }
            ];
            $.plot($("#flot-chart3"), data3, {
                xaxis: {
                    tickDecimals: 0
                },
                series: {
                    lines: {
                        show: true,
                        fill: true,
                        fillColor: {
                            colors: [{
                                opacity: 1
                            }, {
                                opacity: 1
                            }]
                        },
                    },
                    curvedLines: {
                        active: true,
                        fit: true,
                        apply: true
                    },
                    points: {
                        width: 0.1,
                        show: false
                    },
                },
                grid: {
                    show: false,
                    borderWidth: 0
                },
                legend: {
                    show: false,
                }
            });
        });

        /**修改密码**/
        function editpwd() {
            var url = "/RMBase/SysUser/UpdateUserPwd.aspx";
            top.openDialog(url, 'UpdateUserPwd', '修改登录密码', 400, 225, 50, 50);
        }
        //新增快捷功能
        function add_HomeShortcut() {
            var url = "/RMBase/SysPersonal/HomeShortcut_Form.aspx";
            top.openDialog(url, 'Menu_Form', '首页快捷功能信息 - 添加', 450, 300, 50, 50);
        }
        //快捷功能点击事件
        function ClickShortcut(url, title, Target) {
            top.NavMenu(url, title);
        }
    </script>



</body>
</html>

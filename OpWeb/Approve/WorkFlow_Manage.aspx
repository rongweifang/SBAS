<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WorkFlow_Manage.aspx.cs" Inherits="OpWeb.Approve.WorkFlow_Manage" %>

<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>审批流程管理</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />

    <script type="text/javascript">
        //回车键
        document.onkeydown = function (e) {
            if (!e) e = window.event; //
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
            var url = "/Approve/WorkFlow_ManageForm.aspx";
            top.openDialog(url, 'WorkFlow_ManageForm', '审批流程管理-添加', 600, 500, 50, 50);
        }

        //编辑
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Approve/WorkFlow_ManageForm.aspx?ID=" + key;
                top.openDialog(url, 'WorkFlow_ManageForm', '审批流程管理-编辑', 600, 500, 50, 50);
            }
        }

        function menuItem() {
            // 获取标识数据
            var dataUrl = $(this).attr('href'),
                dataIndex = $(this).data('index'),
                menuName = $.trim($(this).text()),
                flag = true;
            if (dataUrl == undefined || $.trim(dataUrl).length == 0) return false;

            // 选项卡菜单已存在
            $('.J_menuTab').each(function () {
                if ($(this).data('id') == dataUrl) {
                    if (!$(this).hasClass('active')) {
                        $(this).addClass('active').siblings('.J_menuTab').removeClass('active');
                        scrollToTab(this);
                        // 显示tab对应的内容区
                        $('.J_mainContent .J_iframe').each(function () {
                            if ($(this).data('id') == dataUrl) {
                                $(this).show().siblings('.J_iframe').hide();
                                return false;
                            }
                        });
                    }
                    flag = false;
                    return false;
                }
            });

            // 选项卡菜单不存在
            if (flag) {
                var str = '<a href="javascript:;" class="active J_menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
                $('.J_menuTab').removeClass('active');

                // 添加选项卡对应的iframe
                var str1 = '<iframe class="J_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
                $('.J_mainContent').find('iframe.J_iframe').hide().parents('.J_mainContent').append(str1);

                //显示loading提示
                //            var loading = layer.load();
                //
                //            $('.J_mainContent iframe:visible').load(function () {
                //                //iframe加载完成后隐藏loading提示
                //                layer.close(loading);
                //            });
                // 添加选项卡
                $('.J_menuTabs .page-tabs-content').append(str);
                scrollToTab($('.J_menuTab.active'));
            }
            return false;
        }

        function nodeitem() {
            if (!$(this).attr('data-index')) {
                $(this).attr('data-index', 99);
            }
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/Approve/WorkFlow_PointManage.aspx?key=" + key;

              var dataUrl = url,
              dataIndex = $(this).data('index'),
              menuName = '审批流程节点管理',
              flag = true;

                // 选项卡菜单已存在
                $('.J_menuTab', parent.document).each(function () {
                    if ($(this).data('id') == dataUrl) {
                        if (!$(this).hasClass('active')) {
                            $(this).addClass('active').siblings('.J_menuTab', parent.document).removeClass('active');
                            scrollToTab(this);
                            // 显示tab对应的内容区
                            $('.J_mainContent .J_iframe', parent.document).each(function () {
                                if ($(this).data('id') == dataUrl) {
                                    $(this).show().siblings('.J_iframe', parent.document).hide();
                                    return false;
                                }
                            });
                        }
                        flag = false;
                        return false;
                    }
                });
                if (flag) {
                    var str = '<a href="javascript:;" class="active J_menuTab" data-id="' + dataUrl + '">' + menuName + ' <i class="fa fa-times-circle"></i></a>';
                    $('.J_menuTab', parent.document).removeClass('active');

                    // 添加选项卡对应的iframe
                    var str1 = '<iframe class="J_iframe" name="iframe' + dataIndex + '" width="100%" height="100%" src="' + dataUrl + '" frameborder="0" data-id="' + dataUrl + '" seamless></iframe>';
                    $('.J_mainContent', parent.document).find('iframe.J_iframe').hide().parents('.J_mainContent').append(str1);


                    // 添加选项卡
                    $('.J_menuTabs .page-tabs-content', parent.document).append(str);
                    scrollToTab($('.J_menuTab.active'));
                }
            }
        }
        //计算元素集合的总宽度
        function calSumWidth(elements) {
            var width = 0;
            $(elements).each(function () {
                width += $(this).outerWidth(true);
            });
            return width;
        }
        function scrollToTab(element) {
            var marginLeftVal = calSumWidth($(element).prevAll()), marginRightVal = calSumWidth($(element).nextAll());
            // 可视区域非tab宽度
            var tabOuterWidth = calSumWidth($(".content-tabs", parent.document).children().not(".J_menuTabs"));
            //可视区域tab宽度
            var visibleWidth = $(".content-tabs", parent.document).outerWidth(true) - tabOuterWidth;
            //实际滚动宽度
            var scrollVal = 0;
            if ($(".page-tabs-content", parent.document).outerWidth() < visibleWidth) {
                scrollVal = 0;
            } else if (marginRightVal <= (visibleWidth - $(element).outerWidth(true) - $(element).next().outerWidth(true))) {
                if ((visibleWidth - $(element).next().outerWidth(true)) > marginRightVal) {
                    scrollVal = marginLeftVal;
                    var tabElement = element;
                    while ((scrollVal - $(tabElement).outerWidth()) > ($(".page-tabs-content", parent.document).outerWidth() - visibleWidth)) {
                        scrollVal -= $(tabElement).prev().outerWidth();
                        tabElement = $(tabElement).prev();
                    }
                }
            } else if (marginLeftVal > (visibleWidth - $(element).outerWidth(true) - $(element).prev().outerWidth(true))) {
                scrollVal = marginLeftVal - $(element).prev().outerWidth(true);
            }
            $('.page-tabs-content', parent.document).animate({
                marginLeft: 0 - scrollVal + 'px'
            }, "fast");
        }

        //删除
        //function EditWarrantor(Card_ID) {
        //    if (IsEditdata(Card_ID)) {
        //        var url = "/X.aspx?Card_ID=" + Card_ID;
        //        top.openDialog(url, 'User_Warrantor', '保证人信息', 800, 630, 50, 50);
        //    }
        //}




    </script>
</head>
<body class="gray-bg">
    <div class="wrapper animated fadeInRight">
        <form id="form1" runat="server">

            <div class="btnbarcontetn">

                <div style="text-align: right">
                    <uc2:LoadButton ID="LoadButton1" runat="server" />
                </div>
            </div>
            <div class="div-body">
                <table id="table1" class="grid" singleselect="false">
                    <thead>
                        <tr>
                            <td style="width: 20px; text-align: left;">
                                <label id="checkAllOff" onclick="CheckAllLine()" title="全选"></label>
                            </td>
                            <td style="width: 140px; text-align: center;">审批流名称</td>
                            <td style="width: 220px; text-align: center;">金额区间</td>
                            <td>备注</td>
                        </tr>
                    </thead>
                    <tbody style="line-height: 35px;">
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 20px; text-align: left;">
                                        <input type="checkbox" value="<%#Eval("ID")%>" name="checkbox" />
                                    </td>
                                    <td style="width: 140px; text-align: center;"><%#Eval("WFName")%></td>
                                    <td style="width: 220px; text-align: center;"><%#Eval("AmountFrom")%>-<%#Eval("AmountTo")%></td>
                                    <td><%#Eval("Descript")%></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                <% if (rp_Item != null)
                                    {
                                        if (rp_Item.Items.Count == 0)
                                        {
                                            Response.Write("<tr><td colspan='8' style='color:red;text-align:center'>没有找到您要的相关数据！</td></tr>");
                                        }
                                    } %>
                            </FooterTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
        </form>
    </div>
</body>
</html>

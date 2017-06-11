<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Zhaopin.guide.Default" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/help_left.ascx" TagPrefix="uc1" TagName="help_left" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>应聘指南 - 内蒙古电力（集团）有限责任公司 - 招聘平台</title>

    <link href="/themes/default/css/style_others.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" />
    <link href="/themes/index/css/job.css" rel="stylesheet" />
    <link type="text/css" href="/themes/new/css/style.css" rel="stylesheet" />
    <script src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
</head>
<body class="green_bg">
    <form id="form1" runat="server">
        <div id="wrap">
            <uc1:head runat="server" ID="head" />
        </div>
        <div id="location">
            <div class="left"><a href="#">应聘指南</a></div>
        </div>
        <div id="main_content">
            <uc1:help_left runat="server" ID="help_left" />
            <div class="right">
                <div id="title1" class="title" style="display: view;">应聘须知</div>
                <div id="context1" class="content" style="display: view">
                    <p>为保证您的合法权益，方便快捷的在内蒙古电力（集团）有限责任公司招聘平台（简称招聘平台）上进行应聘活动，请务必认真阅读 以下事项：</p>
                    <p>一、本招聘平台仅供应聘内蒙古电力（集团）有限责任公司的人员使用。</p>
                    <p>二、应聘人员不得以他人身份及资料进行应聘，否则对由此造成无法应聘等情况而引起的纠纷，承担相应的责任。</p>
                    <p>三、认真填写简历：简历填写前请仔细阅读《简历填写说明》，按要求准备好所需资料，以节省简历填写时间。</p>
                    <p>四、仔细查看公告：请仔细查看招聘信息，搜索符合本人条件的招聘需求。</p>
                    <p>五、谨慎申请工作：正式报名前，请仔细阅读所申请工作的招聘信息，确认本人条件符合招聘要求，以提高您的报名质量；</p>
                    <p>六、特别关注：报名成功后，请按照公告时间要求查看"个人中心"- -"我的消息"，未按时查者按照放弃处理。</p>
                </div>

                <div id="title2" class="title" style="display: none;">应聘流程</div>
                <div id="context2" class="content" style="display: none;">
                    <p>1、用户用身份证号及有效邮箱等信息进行注册系统，然后登录系统；</p>
                    <p>2、认真填写真实简历详细信息，简历经过预览确认后不可再修改；</p>
                    <p>3、根据应聘者简历、应聘岗位要求、参考招聘计划数量，筛选可参加考试的人员；</p>
                    <p>4、通过"我的消息"模块发送筛选结果、考试通知及其他安排。</p>
                    <p style="margin-left: 57px;">
                        <img src="/themes/default/images/employ_process.jpg" alt="应聘流程图">
                    </p>
                </div>

                <div id="title3" class="title" style="display: none;">简历登记</div>
                <div id="context3" class="content" style="display: none;">
                    简历登记包括八个步骤，其中前三个步骤（个人信息、学习经历、语言能力、计算机能力及其他）为必填项，后五个步骤为非必填项，
    	在前三个步骤完善后方可进行后五个步骤的填写，并且，在前三个步骤未完善之前不能进行简历的确认操作。
                </div>

                <div id="title4" class="title" style="display: none;">简历预览及确认</div>
                <div id="context4" class="content" style="display: none;">
                    1、确认之前都可以修改信息；<br/>
                    2、点击【确认简历信息】按键，确认简历信息；简历确认后不可修改。<br/>
                </div>

            
                <div id="title5" class="title" style="display: none;">我的工作申请</div>
                <div id="context5" class="content" style="display: none;">
                    展示已申请的工作，每位应聘者在本次招聘中只能选择一个专业。<br/>
                </div>

                <div id="title6" class="title" style="display: none;">我的消息</div>
                <div id="context6" class="content" style="display: none;">
                    展示与个人相关的注册信息、筛选结果、考试通知及其他安排；请及时查看并处理，未按时查看确认的按照弃权处理。

                </div>

                <div id="title7" class="title" style="display: none;">修改密码</div>
                <div id="context7" class="content" style="display: none;">
                    实现对个人密码的修改，在修改密码之前必须通过当前密码的身份确认。
                </div>
            </div>
            <div class="clear_line"></div>
        </div>

        <uc1:foot runat="server" ID="foot" />
    </form>
</body>
</html>

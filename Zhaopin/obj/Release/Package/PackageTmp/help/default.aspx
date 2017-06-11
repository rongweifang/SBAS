<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Zhaopin.help._default" %>

<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>帮助中心 - 内蒙古电力（集团）有限责任公司 - 招聘平台</title>
    <link rel="shortcut icon" href="/favicon.ico" type="image/x-icon" />
    <link href="/themes/default/css/style_others.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" />
    <link href="/themes/index/css/job.css" rel="stylesheet" />
    <script language="JavaScript" src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            showWhichDiv(4);//页面加载时显示第一项
        });
        function showWhichDiv(num) {
            //先把所有的层隐藏
            for (i = 1; i <= 4; i++) {
                $("#title" + i).attr("style", "display:none;");
                $("#context" + i).attr("style", "display:none;");
            }
            //之后将要显示的项显示
            $("#title" + num).attr("style", "display:view;");
            $("#context" + num).attr("style", "display:view");
        }
    </script>
</head>
<body class="green_bg">
    <form id="form1" runat="server">
        <uc1:head runat="server" ID="head" />
        <div id="location">
            <div class="left"><a href="#">应聘指南</a></div>
        </div>
        <div id="main_content">
            <div class="left">
                <dl>
                    <dt>帮助中心</dt>
                    <dd onclick="showWhichDiv(1);">招聘常见问题</dd>
                    <dd onclick="showWhichDiv(2);">密码如何找回</dd>
                    <dd onclick="showWhichDiv(3);">修改邮箱地址</dd>
                    <dd onclick="showWhichDiv(4);">技术支持</dd>
                </dl>
            </div>
            <div class="right">
                <div id="title1" class="title" style="display: view;">招聘常见问题</div>
                <div id="context1" class="content" style="display: view">
                    1、简历登记时填完一类信息后（比如基本信息），为什么不能下一步？ 
			<p style="margin-left: 17px;">信息录入后，必须先点击保存，保存成功后再进行下一步。</p>
                    2、申请专业后，如何知道自己的录取情况？ 
			<p style="margin-left: 17px;">请按照公告时间要求查看“我的消息”，未按时查看者按照放弃处理。</p>
                    3、怎么查看职位申请成功？
    		<p style="margin-left: 17px;">职位申请成功之后，所填报的公司将出现在我的工作申请栏中。</p>
                    4、照片上传格式的限制说明
		   <p style="margin-left: 17px;">图片上传格式为.jpg，大小在0-600K之间的本地照片；同名文件只能上传一次。若照片大小已符合要求但仍不能上传，请更换浏览器重新进行操作。</p>
                    5、简历信息填写说明
		   <p style="margin-left: 17px;">简历确认提交之前，需要输入个人信息、学习经历、语言能力三项内容，输入完毕之后方可进行简历提交确认。其他项目为补充信息，可以根据需要选择填写。</p>
                    6、信息保存不成功问题？
		   <p style="margin-left: 17px;">若您点击保存按钮提示操作不成功，请仔细检查该页面必输信息项是否填写完整，填写完整后仍不能保存成功的，请更换浏览器，或更换电脑进行简历信息录入。</p>
                    7、信息填报错误怎么办？
		   <p style="margin-left: 17px;">报名人员应认真填写报名相关信息，简历提交之后不能更改。</p>
                    8、为什么在简历填写过程中会退出到登陆窗口？
		    <p style="margin-left: 17px;">为保证毕业生的信息安全，如果长时间没有操作，系统会自动退出。另外建议毕业生选择网络环境好的电脑填写简历和填报志愿。</p>
                    9、关于学习经历填写过程中，第二学士学位与双学士的区别
    	 <p style="margin-left: 17px;">
             “第二学士学位”是经批准设立第二学士学位专业的高校，学制两年，学习合格后，颁发毕业证书和学位证书；<br/>
             “双学士”是在本科学习阶段，学习本专业的同时，学习了另一学科专业的学位课程，达到要求者可在一个毕业证书上注上两个专业名称，同时获得两个学士学位。
         </p>
                </div>

                <div id="title2" class="title" style="display: none;">密码如何找回</div>
                <div id="context2" class="content" style="display: none;">
                    如果您忘记了自己的密码，可以在登录页通过点击【忘记密码？】链接，进入密码找回页面。
    	在密码找回页面您需要填写真实姓名、身份证号码、电子邮箱等信息，电子邮箱用于接收找回的密码。
                </div>

                <div id="title3" class="title" style="display: none;">修改邮箱地址</div>
                <div id="context3" class="content" style="display: none;">
                    电子邮箱为注册人员取回密码的重要依据，一经注册不得更改。
                </div>

                <div id="title4" class="title" style="display: none;">技术支持</div>
                <div id="context4" class="content" style="display: none;">
                    <br />
                    电子邮箱：impc@vip.126.com<br />
                    技术支持电话：0471-5972266<br />
                    
                </div>
            </div>
            <div class="clear_line"></div>
        </div>
        <div>
        </div>
        <uc1:foot runat="server" ID="foot" />
    </form>
</body>
</html>

<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="help_left.ascx.cs" Inherits="Zhaopin.UserControl.guide_left" %>
<script type="text/javascript">
    $(document).ready(function () {
        showWhichDiv(1);
    });
    function showWhichDiv(num) {
        for (i = 1; i <= 7; i++) {
            $("#title" + i).attr("style", "display:none;");
            $("#context" + i).attr("style", "display:none;");
        }
        $("#title" + num).attr("style", "display:view;");
        $("#context" + num).attr("style", "display:view");
        $(".nav li a").get(2).style = "color:#6df8fe;";
    }
</script>
<div class="left">
    <dl>
        <dt>应聘指南</dt>
        <dd onclick="showWhichDiv(1);">应聘须知</dd>
        <dd onclick="showWhichDiv(2);">应聘流程</dd>
    </dl>
    <dl>
        <dt>我的简历</dt>
        <dd onclick="showWhichDiv(3);">简历登记</dd>
        <dd onclick="showWhichDiv(4);">简历预览及确认</dd>
    </dl>

    <dl>
        <dt>我的求职</dt>
   
        <dd onclick="showWhichDiv(5);">我的工作申请</dd>
    </dl>

    <dl>
        <dt>待办事项</dt>
        <dd onclick="showWhichDiv(6);">我的消息</dd>
    </dl>

    <dl>
        <dt>个人设置</dt>

        <dd onclick="showWhichDiv(7);">修改密码</dd>
    </dl>

</div>

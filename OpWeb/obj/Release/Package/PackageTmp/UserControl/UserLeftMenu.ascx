<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UserLeftMenu.ascx.cs" Inherits="Manage.UserControl.UserLeftMenu" %>
<div class="admin-sidebar">
    <ul class="am-list admin-sidebar-list">
        <li><a href="/default.aspx"><span class="am-icon-home"></span>首页</a></li>
        <li class="admin-parent">
            <a class="am-cf" data-am-collapse="{target: '#collapse-nav'}"><span class="am-icon-file"></span>系统管理 <span class="am-icon-angle-right am-fr am-margin-right"></span></a>
            <ul class="am-list am-collapse admin-sidebar-sub am-in" id="collapse-nav">
                <li><a href="CompanyList.aspx" class="am-cf"><span class="am-icon-check"></span>单位管理<span class="am-icon-star am-fr am-margin-right admin-icon-yellow"></span></a></li>
                <li><a href="SpecialtyList.aspx"><span class="am-icon-puzzle-piece"></span>专业管理</a></li>
                <li><a href="UserMessage.aspx"><span class="am-icon-th"></span>系统消息<span class="am-badge am-badge-secondary am-margin-right am-fr"></span></a></li>
                <li><a href="UserResult.aspx"><span class="am-icon-calendar"></span>成绩管理</a></li>
                <li><a href="UserLog.aspx"><span class="am-icon-bug"></span>日志管理</a></li>
            </ul>
        </li>
        <li><a href="UserList.aspx"><span class="am-icon-table"></span>注册用户</a></li>
        <li><a href="FeedbackList.aspx"><span class="am-icon-pencil-square-o"></span>意见反馈</a></li>
        <li><a href="#"><span class="am-icon-sign-out"></span>注销</a></li>
    </ul>
    <div class="am-panel am-panel-default admin-sidebar-panel">
    <div class="am-panel-bd">
        <p><span class="am-icon-bookmark"></span>公告</p>
        <p></p>
    </div>
</div>
<div class="am-panel am-panel-default admin-sidebar-panel">
    <div class="am-panel-bd">
        <p><span class="am-icon-tag"></span></p>
        <p></p>
    </div>
</div>

</div>

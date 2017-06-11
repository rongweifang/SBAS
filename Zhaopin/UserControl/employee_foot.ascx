<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="employee_foot.ascx.cs" Inherits="Zhaopin.UserControl.employee_foot" %>
<div id="foot">
<a href="http://www.impc.com.cn">内蒙古电力（集团）有限责任公司</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="/help/">联系我们</a>&nbsp;&nbsp;&nbsp;|&nbsp;&nbsp;&nbsp;<a href="#" onclick="AddFavorite('内蒙古电力（集团）有限责任公司-招聘平台', 'http://zhaopin.impc.com.cn')">收藏本站</a><br/>
Copyright 2007-2015 All Rights Reserved 内蒙古电力（集团）有限责任公司版权所有<br/>
技术支持  内蒙古强网电子科技有限公司
</div>
<script type="text/javascript">

    //收藏本站
    function AddFavorite(sTitle, sURL) {
        try {
            window.external.addFavorite(sURL, sTitle);

        } catch (e) {
            try {
                window.sidebar.addPanel(sTitle, sURL, "");
            } catch (e) {
                alert("加入收藏失败，请使用Ctrl+D进行添加");
            }
        }
    }
    </script>
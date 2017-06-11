$(function(){
//加顶部导航背景
//去虚线
   $("a").focus(function(){
		$(this).blur();
   })
//顶部导航
   $("#topNav li").click(function(){
	   $("#topNav li").removeClass();
		$(this).addClass("topNavAfter");
   })
})

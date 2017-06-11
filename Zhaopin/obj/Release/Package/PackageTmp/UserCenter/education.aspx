<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="education.aspx.cs" Inherits="Zhaopin.UserCenter.education" %>

<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/foot.ascx" TagPrefix="uc1" TagName="foot" %>
<%@ Register Src="~/UserControl/employee_process.ascx" TagPrefix="uc1" TagName="employee_process" %>
<%@ Register Src="~/UserControl/DateMonthSelect.ascx" TagPrefix="uc1" TagName="DateMonthSelect" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>个人中心 - 简历登记 - 学习经历</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" />
    <link href="/themes/index/css/job.css" rel="stylesheet" />
    <script src="/scripts/prototype_for_validation.js" type="text/javascript"></script>
    <script src="/scripts/effects.js" type="text/javascript"></script>
    <script src="/scripts/validation_cn.js" type="text/javascript"></script>
    <script src="/scripts/jquery.js" type="text/javascript"></script>
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <link href="/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/Scripts/ShowMsg/msgbox.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/ShowMsg/msgbox.js" type="text/javascript"></script>
    <script src="/scripts/jquery-1.4.4.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script src="/scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
    <script type="text/javascript" src="/scripts/jquery.form.js"></script>
    <script src="/scripts/jquery.blockUI.js" type="text/javascript"></script>
    <link type="text/css" rel="stylesheet" href="/sample/contents/autocomplete/jquery.autocomplete.css" media="all" />
    <script type="text/javascript" src="/sample/contents/autocomplete/jquery.autocomplete.js"></script>
    <script src="/Scripts/FunctionJS.js" type="text/javascript"></script>

    <style type="text/css">
        <!--
        /* 学习经历 */
        .form01 {
            width: 290px;
            height: 50px;
            float: left;
        }

        .form02 {
            width: 100px;
            text-align: right;
            height: 50px;
            float: left;
        }

        .form03 {
            width: 160px;
            float: left;
        }

        .form04 {
            width: 560px;
            height: 50px;
            float: left;
        }

        .form05 {
            width: 450px;
            float: left;
        }

        .form06 {
            width: 290px;
            height: 50px;
            float: left;
        }

        .form07 {
            width: 560px;
            height: 50px;
            float: left;
        }

        .gray26, .gray26 a:link, .gray26 a:visited {
            font-size: 12px;
            line-height: 26px;
            font-weight: normal;
            color: #338d89;
            text-decoration: none;
        }
        /* js */
        .js_Search {
            padding-top: 5px;
            width: 96%;
            margin: 0px auto;
            height: 30px;
            border-bottom: solid 1px #dedede;
        }

        .js_schools {
            width: 96%;
            margin: 0px auto;
            overflow: hidden;
            background-color: #f5f5f5;
            border: solid 1px #dedede;
        }

            .js_schools ul {
                width: 470px;
                height: 210px;
            }

                .js_schools ul li {
                    width: 217px;
                    float: left;
                }

        .js_foot_text {
            text-align: center;
        }

        .jsschools {
            width: 400px;
            overflow: hidden;
        }

            .jsschools li {
                width: 100%;
                overflow: hidden;
                margin-bottom: 10px;
            }

        .schools_text {
            width: 90px;
            float: left;
            text-align: right;
        }

        .schools_input {
            width: 300px;
            float: left;
        }

        .success {
            width: 340px;
            margin: 10px auto;
            overflow: hidden;
            text-align: center;
        }

        .schools_inputtwo {
            float: left;
            width: 250px;
        }

        table {
            width: 738px;
        }
        -->
    </style>



</head>

<body>

    <form id="educationForm" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="location">
            <div class="location_left">
                <a href="/UserCenter/">个人中心</a> &gt;简历登记
            </div>
        </div>
        <div class="clearit"></div>
        <div class="content">
            <uc1:employee_left runat="server" ID="employee_left" />
            <div class="right">
                <uc1:employee_process runat="server" ID="employee_process" />
                <div class="clearit"></div>
                <div class="line top_10">
                    <div class="column">学习经历</div>
                </div>
                <div class="line">
                    <div style="padding: 10px;">
                        <!--<div class="gray26">建议学历从高到低的次序录入，并从大学开始保持学历连续</div>-->
                        <div class="gray26">学历信息请从高往低填写,至少有一条为“最高学历”，高中及高中以下学历无需填写</div>
                        <div class="gray26">1、学历选择“博士、硕士研究生毕业”则必须填写一条本科或专科记录</div>
                        <div class="gray26">2、招生批次选择“专升本”则必须填写一条专科记录</div>
                        <div class="gray26">3、学位为双学士的，请上传两个学位证；有第二学士学位的，学位均选择第二学士。</div>
                        <div class="gray26">4、学历信息中包含一个选项是否全日制最高学历，若此选项标识为最高学历，则学习形式必须是普通全日制，请结合自己的实际学历情况进行选择</div>
                        <div class="gray26">
                            5、最高学历的下一级学历证号和学位证号必输，
		 	“学历证书号”栏和“学位证书号”栏中：硕博连读人员如无硕士学位、学历证号，填写“无”；留学生需填写教育部留学服务中心的国外学历、学位认证号，暂未获取的填写“无”
                        </div>
                        <div class="gray26">
                            6、2015届毕业生未取得毕业证、学位证的，请认真填写学籍在线验证报告编号和报告有效期，不需要填写学历、学位证书号。
                        </div>
                    </div>
                </div>
                <table width="740px" border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                    <tbody>
                        <tr bgcolor="#f2f2f2" align="center" class="black">
                            <td>起止时间</td>

                            <td>学校</td>
                            <td>所学专业</td>
                            <td>是否最高学历</td>
                            <td width="110px">操作</td>
                        </tr>
                        <asp:Repeater ID="rp_Item" runat="server" OnItemDataBound="rp_Item_ItemDataBound">
                            <ItemTemplate>
                                <tr bgcolor="#FFFFFF" align="center" class="gray">
                                    <td><%#Convert.ToDateTime(Eval("BeginDate")).ToString("yyyy-MM-dd")%>至<%#Convert.ToDateTime(Eval("EndDate")).ToString("yyyy-MM-dd")%></td>
                                    <td><%#Eval("SchoolName") %></td>
                                    <td><%#Eval("specialty") %></td>
                                    <td>
                                        <asp:Label ID="Lb_isfirst" runat="server" Text='<%#Eval("isfirst") %>'></asp:Label></td>
                                    <td>
                                        <span class="btn_operate" onclick='Edit("<%#Eval("EduID") %>")'>编辑</span>
                                        <span class="btn_operate" onclick='Delete("<%#Eval("EduID") %>")'>删除</span>
                                    </td>
                                </tr>
                            </ItemTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
                <div class="line">
                    <div class="btn_operate" style="margin: 3px">
                        <asp:Label ID="lb_title" runat="server" Text="新增"></asp:Label>
                    </div>
                </div>
                <div id="educationAddId" class="line">
                    <div class="columnbj">
                        <div class="Form_left">
                            <ul class="gray30">
                                <li>
                                    <div class="form06">
                                        <div class="form02">入学时间：</div>
                                        <div class="form03">
                                            <div>
                                                <input id="BeginDate" type="text" runat="server" readonly="true" />
                                            </div>
                                        </div>
                                        <div style="color: red; width: 16px; float: left;">&nbsp;&nbsp;&nbsp;&nbsp;*</div>
                                    </div>
                                    <div class="form06">
                                        <div class="form02">(预计)毕业时间：</div>
                                        <div class="form03">
                                            <div>
                                                <input id="EndDate" type="text" runat="server" readonly="true" />
                                            </div>
                                        </div>
                                        <div style="color: red; width: 16px; float: left;">&nbsp;&nbsp;&nbsp;&nbsp;*</div>
                                    </div>
                                    <a id="TipsData" onclick="OpenTips()" style="cursor: pointer">提示</a></li>
                                <li>
                                    <div class="form04" style="overflow: hidden;">
                                        <div class="form02">学校名称：</div>
                                        <div class="form05">
                                            <div>
                                                <input id="SchoolID" name="SchoolID" type="hidden" class="required input2" runat="server" />
                                                <input id="SchoolName" name="SchoolName" type="text" class="required input2" onclick="viewSearchSchool();" value="" maxlength="80" runat="server" readonly />
                                            </div>
                                            <div class="gray02">点击输入框搜索学校名称</div>
                                        </div>
                                    </div>
                                    <div style="color: red; width: 5px; float: left; margin-left: -187px;">*</div>
                                    <div class="form02">
                                        <input id="isfirst" type="checkbox" runat="server" />是否最高学历
                                    </div>
                                </li>
                                <li>
                                    <div class="form06">
                                        <div class="form02">学习形式：</div>
                                        <div class="form03">
                                            <div style="padding-top: 3px;">
                                                <select id="eduType" name="eduType" class="required validate-selection" runat="server">
                                                </select>
                                            </div>
                                        </div>
                                        <div style="color: red; width: 5px; float: left; margin-left: 13px;">*</div>
                                    </div>
                                    <div class="form06">
                                        <div class="form02">
                                            <input id="Is985" type="checkbox" runat="server" />是否985
                                        </div>
                                        <div class="form02">
                                            <input id="Is211" type="checkbox" runat="server" />是否211
                                        </div>

                                    </div>
                                </li>
                                <li>
                                    <div class="form06">
                                        <div class="form02">学历：</div>
                                        <div class="form03">
                                            <div style="padding-top: 3px;">
                                                <select id="eduBack" name="eduBack" class="required validate-selection" onchange="changePiCi('1');" runat="server">
                                                </select>
                                            </div>
                                        </div>
                                        <div style="color: red; width: 5px; float: left; margin-left: 13px;">*</div>
                                    </div>
                                    <div class="form06">
                                        <div class="form02">学历证书号：</div>
                                        <div class="form03">
                                            <div>
                                                <input id="CertNO" name="CertNO" type="text" value="" maxlength="50" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form06">
                                        <div class="form02" style="line-height:20px;">学历(学籍)<br />认证码：</div>
                                        <div class="form03">
                                            <input id="DegreeAuthcode" name="DegreeAuthcode" type="text"  value="" maxlength="50" runat="server" />
                                        </div>
                                    </div>
                                    <div class="form06">
                                        <div class="form02">有效期至：</div>
                                        <div class="form03">
                                            <input id="DegreeOverdate" name="DegreeOverdate" type="text" class="required input" readonly="readonly" value="" runat="server" />
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div id="zspc" class="form06">
                                        <div class="form02">招生批次：</div>
                                        <div class="form03">
                                            <div style="padding-top: 3px;">
                                                <select id="edubatch" name="edubatch" class="required validate-selection" runat="server">
                                                </select>
                                            </div>
                                        </div>
                                        <div style="color: red; width: 5px; float: left; margin-left: 13px;">*</div>
                                    </div>
                                    <div class="form06">

                                        <div class="form03" style="width: 70px;">
                                            <input id="IsFullDay" type="checkbox" runat="server" />是全日制
                                        </div>
                                        <div style="color: red; width: 5px; float: left; margin-left: 13px;">*</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form06">
                                        <div class="form02">学位：</div>
                                        <div class="form03">
                                            <div style="padding-top: 3px;">
                                                <select id="Degree" name="Degree" class="required validate-selection" runat="server">
                                                </select>
                                            </div>
                                        </div>
                                        <div id="z00hrxw_required" style="color: red; width: 5px; float: left; margin-left: 13px;">*</div>
                                    </div>
                                    <div class="form06" style="display: none">
                                        <div class="form02">学位证书号：</div>
                                        <div class="form03">
                                            <div>
                                                <input id="Diploma" name="Diploma" type="text" class="validate-specialchar input" value="" maxlength="50" runat="server" />
                                            </div>
                                        </div>
                                    </div>
                                </li>

                                <li>
                                    <div class="form06">
                                        <div class="form02">学科层次：</div>
                                        <div class="form03">
                                            <div style="padding-top: 3px;">
                                                <select id="gradeType" name="gradeType" runat="server">
                                                </select>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form06" style="overflow: hidden;">
                                        <div class="form02">专业名称：</div>
                                        <div class="form03">
                                            <div>
                                                <input id="specialty" name="specialty" type="text" class="required input" value="" maxlength="120" runat="server" />
                                            </div>
                                        </div>
                                        <div style="color: red; width: 5px; float: left;">&nbsp;&nbsp;&nbsp;&nbsp;*</div>
                                    </div>
                                    <div class="form06">
                                        <div class="form02" style="width: 120px;"></div>
                                        <div class="form03">
                                            <div>
                                            </div>

                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form06" style="overflow: hidden;">
                                        <div class="form02">研究方向：</div>
                                        <div class="form03">
                                            <div>
                                                <input id="Direction" name="Direction" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                            </div>
                                        </div>
                                        <div class="form03 gray02">研究生请填写研究方向</div>
                                    </div>
                                </li>
                                <li></li>
                                <li>
                                    <div class="form07">
                                        <div class="form02">&nbsp;&nbsp;</div>
                                        <div class="form05">
                                            <asp:Button ID="btn_save" runat="server" Text="保存" CssClass="btnsubmit" OnClientClick="chkEducationSubmit()" OnClick="btn_save_Click" />
                                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                            
                                        </div>
                                    </div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="right_foot"></div>
            </div>
        </div>
        <div class="clearit"></div>
    </form>
    <uc1:foot runat="server" ID="foot" />
    <script type="text/javascript">
        //删除
        function Delete(key) {
            if (IsDelData(key)) {
                var delparm = 'action=del&type=education&ID=' + key;
                delConfig('/Ajax/Common_UserRecord.ashx', delparm)
            }
        }

        $(document).ready(function () {
            $("#BeginDate").datepicker({ dateFormat: 'yy-mm-dd' });
            $("#EndDate").datepicker({ dateFormat: 'yy-mm-dd' });


            //  changePiCi('0');//页面加载时决定是否显示 招生批次下拉菜单
        });
        function OpenTips() {
            layer.tips('与【个人信息】-【(预计)毕业时间】一致!', '#TipsData');
        }

    </script>
    <script type="text/javascript">

        //院校联动搜索
        function showSchoolList() {
            var address = $("#School_Area").val();
            var reg = /^[\u2e80-\ufe4fA-Za-z]*$/;
            if (address != "" && reg.test($("#schoolName").val())) {
                var name = $("#schoolName").val();

                //var url = "/ajax/University_data.ashx?action=Searchq=" + name + "&location=" + address;
                var parm = 'action=Search&q=' + escape(name) + '&location=' + escape(address);
                getAjax('/ajax/University_data.ashx', parm, function (rs) {
                    var content = rs;
                    var school_arr = content.split(";");
                    var inner = "<ul>";
                    for (var i = 0; i < school_arr.length; i++) {
                        var step = school_arr[i];
                        step = step.replace(/\s+/g, "");
                        if (step != null && step != "") {
                            var perUniArr = step.split(",");
                            inner += "<li><a style='cursor: hand;' onclick=\"getUniversityName('" + perUniArr[1] + "','" + perUniArr[0] + "');\">" + perUniArr[1] + "</a></li>";
                        }
                    }
                    inner += "</ul>";
                    $("#searchSchoolInfo").attr("innerHTML", inner);

                });

            } else if (!reg.test($("#schoolName").val())) {
                $.alert("院校名称格式不正确");// 
            } else {
                $.alert("请先选择学校所在地");// 院校所在地为必选
            }
        }

        //function emptySearchSchoolInfo() {
        //    $("#searchSchoolInfo").attr("innerHTML", "");
        //}


    </script>
    <script type="text/javascript">
        var educationForm = new Validation("educationForm");
        $(function () {

            $("#DegreeOverdate").datepicker({ dateFormat: 'yy-mm-dd' });
            $("#searchSchool").dialog("destroy");
            $("#searchSchool").dialog({ title: '学校名称搜索', width: 506, autoOpen: false, modal: true, resizable: false });
        });
        function viewSearchSchool() {
            $('#searchSchool').dialog('open');//打开院校搜索窗口
            $('#schoolName').focus();
        }
        function hiddenSearchSchool() {
            $('#searchSchool').dialog('close');
        }
        function Edit(eduid) {
            var url = "/UserCenter/education.aspx?action=edit&eduid=" + eduid;
            Urlhref(url);
        }

        function changePiCi(oper) {
            //学历为研究生(11:博士研究生毕业,14:硕士研究生毕业)时，招生批次下拉菜单隐藏
            //国外院校时，招生批次下拉菜单隐藏
            var xl = $("#eduBack")[0];
            var xl_value = "";
            if (xl != null) {
                xl_value = xl.value.substring(0, 1);
            }
            //研究生学历无招生批次
            if (xl_value == "1") {
                $('#zspc').hide();
                // $("#edubatch").val("");//清除所选的招生批次
            } else {
                $('#zspc').show();
                //选择学历，招生批次对应学历联动
                $("#edubatch").empty();
                $("#edubatch").append("<option value=''>请选择</option>");
                $("#edubatch").append("<option value='08'>保送</option>");
                $("#edubatch").append("<option value='09'>提前录取</option>");
                $("#edubatch").append("<option value='01'>本科一批</option>");
                $("#edubatch").append("<option value='02'>本科二批</option>");
                $("#edubatch").append("<option value='03'>本科三批</option>");
                $("#edubatch").append("<option value='04'>专升本</option>");
                $("#edubatch").append("<option value='05'>专科一批</option>");
                $("#edubatch").append("<option value='06'>专科二批</option>");
                $("#edubatch").append("<option value='07'>五年制大专</option>");
                $("#edubatch").append("<option value='99'>其他</option>");
                if (xl_value == "2") {//选本科学历时清除对应专科的招生批次
                    $("#edubatch option[value='05']").remove();
                    $("#edubatch option[value='06']").remove();
                    $("#edubatch option[value='07']").remove();
                } else if (xl_value == "3") {//选专科学历时清除对应本科的招生批次
                    $("#edubatch option[value='01']").remove();
                    $("#edubatch option[value='02']").remove();
                    $("#edubatch option[value='03']").remove();
                    $("#edubatch option[value='04']").remove();
                }
                if (oper == '0') {//页面加载时，由于以上操作，使招生批次重新选中已提交的项
                    $("#edubatch").attr("value", '');
                }
            }
            // 学历与学位联动处理
            $("#Degree").empty();
            $("#Degree").append("<option value=''>请选择</option>");
            if (xl.value != "") {
                if (xl.value == "11") {// 博士研究生
                    $("#Degree").append("<option value='1'>名誉博士</option>");
                    $("#Degree").append("<option value='2'>博士</option>");
                } else if (xl.value == "14") {// 硕士研究生
                    $("#Degree").append("<option value='3'>硕士</option>");
                } else if (xl.value == "21") {// 本科
                    $("#Degree").append("<option value='4'>学士</option>");
                    $("#Degree").append("<option value='5'>双学士</option>");
                    $("#Degree").append("<option value='6'>第二学士</option>");
                } else {
                    $("#Degree option[value='']").remove();
                }
            } else {// 无学历信息时显示所有学位
                $("#Degree").append("<option value='1'>名誉博士</option>");
                $("#Degree").append("<option value='2'>博士</option>");
                $("#Degree").append("<option value='3'>硕士</option>");
                $("#Degree").append("<option value='4'>学士</option>");
                $("#Degree").append("<option value='5'>双学士</option>");
                $("#Degree").append("<option value='6'>第二学士</option>");
            }
            $("#Degree").append("<option value='-1'>无</option>");

            if (xl_value == "3") {
                $("#Degree").attr("class", "");//去除class：required validate-selection
                $("#Degree_required").attr("style", "color:red;width:5px;float:left;margin-left:13px;display:none;");
            } else {
                $("#Degree").attr("class", "required validate-selection");
                $("#Degree_required").attr("style", "color:red;width:5px;float:left;margin-left:13px;");
            }
        }

        function chkEducationSubmit() {
            if (!educationForm.validate()) {
                return false;
            }
        }


        function getUniversityName(universityName, universityCode) {

            changePiCi('1');
            $("#SchoolName").attr("value", universityName);
            $("#SchoolID").attr("value", universityCode);

            hiddenSearchSchool();
        }

    </script>

    <div id="ui-datepicker-div" class="ui-datepicker ui-widget ui-widget-content ui-helper-clearfix ui-corner-all ui-helper-hidden-accessible"></div>
    <div class="ui-dialog ui-widget ui-widget-content ui-corner-all  ui-draggable" tabindex="-1" role="dialog" aria-labelledby="ui-dialog-title-searchSchool" style="display: none; position: absolute; overflow: hidden; z-index: 1000; outline: 0px;">
        <div class="ui-dialog-titlebar ui-widget-header ui-corner-all ui-helper-clearfix" unselectable="on"><span class="ui-dialog-title" id="ui-dialog-title-searchSchool" unselectable="on">学校名称搜索</span><a href="#" class="ui-dialog-titlebar-close ui-corner-all" role="button" unselectable="on"><span class="ui-icon ui-icon-closethick" unselectable="on">close</span></a></div>
        <div id="searchSchool" style="" class="ui-dialog-content ui-widget-content">
            <div class="js_Search gray30">
                <div style="float: left; width: 80px; text-align: right;">学校所在地：</div>
                <div style="float: left; padding-top: 4px;">
                    <select id="School_Area" name="School_Area" class="validate-selection" runat="server">
                    </select>
                </div>
            </div>
            <div class="js_Search gray30">
                <div style="float: left; width: 80px; text-align: right;">学校名称：</div>
                <div style="float: left;">
                    <input id="schoolName" name="schoolName" type="text" class="input ac_input" onmouseover="this.select();" autocomplete="off" />
                    <input type="button" value="搜索" onclick="showSchoolList();" />
                </div>
            </div>
            <div style="width: 96%; margin: 0px auto;">
            </div>
            <div id="searchSchoolInfo" class="js_schools gray" style="overflow: auto; overflow-y: auto; overflow-x: hidden; height: 100px"></div>
        </div>
    </div>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="profile.aspx.cs" Inherits="Zhaopin.UserCenter.profile" %>

<%@ Register Src="~/UserControl/employee_left.ascx" TagPrefix="uc1" TagName="employee_left" %>
<%@ Register Src="~/UserControl/employee_foot.ascx" TagPrefix="uc1" TagName="employee_foot" %>
<%@ Register Src="~/UserControl/head.ascx" TagPrefix="uc1" TagName="head" %>
<%@ Register Src="~/UserControl/employee_process.ascx" TagPrefix="uc1" TagName="employee_process" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>个人中心 - 简历登记 - 个人信息</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/job.css" rel="stylesheet" type="text/css" />
    <script src="/scripts/prototype_for_validation.js" type="text/javascript"></script>
    <script src="/scripts/effects.js" type="text/javascript"></script>
    <script src="/scripts/validation_cn.js" type="text/javascript"></script>
    <script src="/scripts/jquery.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.ui.js"></script>
    <script src="/scripts/jquery.bgiframe.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.validate.js"></script>
    <script type="text/javascript" src="/scripts/jquery.common.js"></script>
    <script type="text/javascript" src="/scripts/jquery.form.js"></script>
    <script src="/scripts/jquery.blockUI.js" type="text/javascript"></script>
    <script src="/scripts/layer.js" type="text/javascript"></script>
    <link href="/Scripts/artDialog/skins/blue.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <link href="/Scripts/ShowMsg/msgbox.css" rel="stylesheet" type="text/css" />
    <script src="/Scripts/ShowMsg/msgbox.js" type="text/javascript"></script>
    <script src="/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript" src="/scripts/jquery.selectbox.js"></script>

    <style type="text/css">
        <!--
        /* 基本信息 */
        .basic_left {
            float: left;
            width: 580px;
            overflow: hidden;
            padding: 15px;
        }

            .basic_left li {
                width: 100%;
                overflow: hidden;
            }

        .form01 {
            width: 280px;
            height: 60px;
            float: left;
        }

        .form02 {
            width: 92px;
            text-align: right;
            height: 60px;
            float: left;
        }

        .form03 {
            width: 160px;
            float: left;
        }

        .form04 {
            width: 500px;
            height: 60px;
            float: left;
        }

        .form05 {
            width: 400px;
            float: left;
        }

        .form06 {
            width: 280px;
            height: 60px;
            float: left;
        }

        .basic_right {
            width: 102px;
            height: 140px;
            float: left;
            padding-top: 15px;
        }

        .basic_photos {
            border: solid 1px #ccc;
            width: 95px;
            height: 126px;
        }

        .photos {
            width: 95px;
            height: 130px;
        }

        /* 联系方式 */
        .contact {
            width: 710px;
            margin: 15px auto;
            overflow: hidden;
        }

            .contact li {
                width: 100%;
                height: 60px;
            }

        .form07 {
            width: 90px;
            text-align: right;
            height: 30px;
            float: left;
        }

        .form08 {
            width: 300px;
        }

        .form09 {
            width: 300px;
        }

        .form10 {
            width: 275px;
        }

        .form01two {
            width: 480px;
            height: 60px;
            float: left;
        }

        .form02two {
            width: 100px;
            text-align: right;
            height: 60px;
            float: left;
        }

        .form03two {
            width: 360px;
            float: left;
            height: 62.8px;
        }

        .form11 {
            width: 480px;
            height: 70px;
            float: left;
        }

        .form14 {
            width: 500px;
            height: 60px;
            float: left;
        }

        .form12 {
            width: 100px;
            text-align: right;
            height: 50px;
            float: left;
        }
        /* 照片上传 */
        .upload_photos {
            width: 340px;
            overflow: hidden;
            padding: 10px 0px 0px 10px;
        }

            .upload_photos li {
                width: 100%;
                overflow: hidden;
            }
        -->
        /* 简历确认后 */
        .preview {
            width: 100%;
            height: 32px;
            background: url(/themes/default/images/me_icon_16.gif);
        }

        .preview_left {
            width: 13px;
            float: left;
            height: 32px;
            background: url(/themes/default/images/me_icon_15.gif);
        }

        .preview_text {
            width: 150px;
            padding-top: 5px;
            float: left;
        }

        .preview_right {
            width: 13px;
            float: right;
            height: 32px;
            background: url(/themes/default/images/me_icon_17.gif);
        }

        .black26 {
            font-size: 12px;
            line-height: 26px;
            font-weight: normal;
            color: #000;
            text-decoration: none;
        }

        .gray26, .gray26 a:link, .gray26 a:visited {
            font-size: 12px;
            line-height: 26px;
            font-weight: normal;
            text-decoration: none;
        }

            .gray26 a:hover {
                font-size: 12px;
                line-height: 26px;
                font-weight: normal;
                text-decoration: none;
            }

        .gray022 {
            text-decoration: none;
        }
    </style>
    <script>
        $(document).ready(function () {
            $("#gradDate").datepicker({ dateFormat: 'yy-mm-dd' });
        });
        function UploadPhoto() {
            layer.open({
                type: 2,
                title: '照片上传',
                maxmin: false,
                shadeClose: true, //点击遮罩关闭层
                area: ['460px', '175px'],
                content: '/UserCenter/PhotoUpload.aspx'
            });


        }
    </script>
</head>
<body>
    <form id="employeeForm" name="employeeForm" runat="server">
        <uc1:head runat="server" ID="head" />
        <div class="location">
            <div class="location_left">
               <a href="/UserCenter/">个人中心</a> &gt;<a href="/UserCenter/profile.aspx">简历登记</a>
            </div>
        </div>
        <div class="content">
            <uc1:employee_left runat="server" ID="employee_left" />
            <div class="right">
                <uc1:employee_process runat="server" ID="employee_process" />

                <div class="clearit"></div>
                <div class="line top_10">
                    <div class="column">基本信息</div>
                    <div class="columnbj">
                        <div class="basic_left">
                            <ul class="gray30">
                                <li>
                                    <div class="form01">
                                        <div class="form02">姓名：</div>
                                        <div class="form03">
                                            <asp:Label ID="name" runat="server" Text=""></asp:Label>

                                        </div>
                                    </div>
                                    <div class="form01">
                                        <div class="form02">性别：</div>
                                        <div class="form03">
                                            <asp:Label ID="sexText" runat="server" Text=""></asp:Label>

                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form01">
                                        <div class="form02">身份证号码：</div>
                                        <div class="form03">
                                            <asp:Label ID="loginname" runat="server" Text=""></asp:Label>

                                        </div>
                                    </div>
                                    <div class="form01">
                                        <div class="form02">出生年月：</div>
                                        <div class="form03">
                                            <asp:Label ID="birthday" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form01">
                                        <div class="form02">手机号码：</div>
                                        <div class="form03">
                                            <asp:Label ID="mobile" runat="server" Text=""></asp:Label>
                                        </div>
                                    </div>
                                    <div class="form01">
                                        <div class="form02">电子邮箱：</div>
                                        <div class="form03">
                                            <asp:Label ID="email" runat="server" Text=""></asp:Label>

                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form01">
                                        <div class="form02">政治面貌：</div>
                                        <div class="form03" style="width: 170px;">
                                            <div>
                                                <select id="polity" name="polity" class="required validate-selection" runat="server">
                                                </select>

                                            </div>
                                            <div class="gray02">
                                            </div>
                                        </div>
                                        <div style="color: red; width: 16px; float: left;">&nbsp;&nbsp;*</div>
                                    </div>
                                    <div class="form01">
                                        <div class="form02"></div>
                                        <div class="form03">
                                            <div style="padding-top: 4px;">
                                            </div>
                                        </div>
                                        <div style="color: red; width: 5px; float: left; margin-left: 12px;"></div>
                                    </div>
                                </li>

                                <li>
                                    <div class="form04" style="height: 80px;">
                                        <div class="form02">生源地：</div>
                                        <div class="form05">
                                            <div>
                                                <span id="selectbox" class="selectbox">
                                                    <input id="z00hrsyd" name="z00hrsyd" type="hidden" value="" runat="server" />
                                                    <select id="z00hrsyd0" name="z00hrsyd0" style="width: auto;">
                                                    </select></span>
                                                <span style="color: red; padding-left: 5px;">*</span>

                                            </div>
                                            <div id="syd_warn" class="gray02">
                                                <div style="line-height: 15px;">
                                                    <p>1、请选择高考前户口所在地</p>
                                                    <p>2、曾经参加过工作的，请选择工作时户口所在地</p>
                                                    <p>3、不要选择学校户口所在地</p>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form06">
                                        <div class="form02">(预计)毕业时间：</div>
                                        <div class="form03">
                                            <input id="gradDate" name="gradDate" type="text" value="" class="required input" runat="server" readonly="true" />
                                            <div class="gray02">
                                                <div id="notCurrentGra" style="color: red; line-height: 15px;"></div>
                                            </div>
                                        </div>
                                        <div style="color: red; width: 16px; float: left;">
                                            &nbsp;&nbsp;&nbsp;&nbsp;*
                                        </div>
                                    </div>
                                    <div class="form06">
                                        <div class="form02">毕业生类型：</div>
                                        <div class="form03">
                                            <select id="gradtype" name="gradtype" class="required validate-selection" runat="server">
                                            </select>
                                        </div>
                                        <div style="color: red; width: 5px; float: left; margin-left: 13px;">*</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form01">
                                        <div class="form02">身高(cm)：</div>
                                        <div class="form03">
                                            <div>
                                                <input id="height" name="height" type="text" class="required int-range-sgtz-50-260 input" value="" runat="server" />
                                            </div>
                                            <div class="gray02"></div>
                                        </div>
                                        <div style="color: red; width: 16px; float: left;">&nbsp;&nbsp;&nbsp;&nbsp;*</div>
                                    </div>
                                    <div class="form01">
                                        <div class="form02">体重(kg)：</div>
                                        <div class="form03">
                                            <div>
                                                <input id="weight" name="weight" type="text" class="required int-range-sgtz-20-200 input" value="" runat="server" />
                                            </div>
                                            <div class="gray02"></div>
                                        </div>
                                        <div style="color: red; width: 16px; float: left;">&nbsp;&nbsp;&nbsp;&nbsp;*</div>
                                    </div>
                                </li>
                                <li>
                                    <div class="form06">
                                        <div class="form02">民族：</div>
                                        <div class="form03">
                                            <div style="padding-top: 4px;">
                                                <select id="Nation" name="Nation" class="required validate-selection" runat="server">
                                                </select>
                                            </div>
                                        </div>
                                        <div style="color: red; width: 5px; float: left; margin-left: 13px;">*</div>
                                    </div>
                                    <div class="form06">
                                        <div class="form02">婚姻状况：</div>
                                        <div class="form03">
                                            <div style="padding-top: 4px;">
                                                <select id="marriage" name="marriage" class="required validate-selection" runat="server">
                                                </select>
                                            </div>
                                        </div>
                                        <div style="color: red; width: 5px; float: left; margin-left: 13px;">*</div>
                                    </div>
                                </li>
                                <li style="text-indent: 30px;">&nbsp;健康情况：
                                    <asp:CheckBox ID="healthy" runat="server" Text="是否健康" />
                                </li>
                            </ul>
                        </div>
                        <div class="basic_right">
                            <div class="basic_photos">
                                <div class="photos">
                                    <input type="hidden" id="headphoto" runat="server" />
                                    <img id="blogimgsees" width="95" height="126" style="width: 95px; height: 126px;" src="/themes/default/images/me_icon_04.gif" runat="server" />
                                </div>
                            </div>
                            <div>
                                <div class="btn_uploadphoto" onclick="UploadPhoto();">上传照片</div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="line top_10">
                    <div class="column">联系方式</div>
                    <div class="columnbj">
                        <div class="contact">

                            <ul class="gray30">
                                <li>
                                    <div class="form01two">
                                        <div class="form02two">通信地址：</div>
                                        <div class="form03two">
                                            <div>
                                                <input id="Address" name="Address" type="text" class="required validate-specialchar input2" value="" maxlength="60" runat="server" />
                                            </div>
                                            <div class="gray02"></div>
                                        </div>
                                    </div>
                                    <div style="color: red; width: 20px; float: left; margin-left: -106px;">*</div>
                                </li>
                                <li>
                                    <div class="form01two">
                                        <div class="form02two">邮政编码：</div>
                                        <div class="form03two">
                                            <div>
                                                <input id="zipcode" name="zipcode" type="text" class="required validate-zip input" value="" runat="server" />
                                            </div>
                                            <div class="gray02"></div>
                                        </div>
                                    </div>
                                    <div style="color: red; width: 20px; float: left; margin-left: -206px;">*</div>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="page">
                    <asp:Button class="btnsubmit" ID="btn_save" runat="server" Text="保存" OnClientClick="isSubmit();" OnClick="btn_save_Click" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </div>
                <div class="right_foot"></div>
            </div>
        </div>
        <div class="clearit"></div>

        <uc1:employee_foot runat="server" ID="employee_foot" />

        <script type="text/javascript">

            $(function () {
                var apath = '/ajax/area_data.ashx';
                var arr = new Array();
                var areaCode = $("#z00hrsyd").val();
                if (areaCode != undefined) {
                    if (areaCode.length == 6) {
                        arr[0] = areaCode.substr(0, 2) + "0000";
                        arr[1] = areaCode.substr(0, 4) + "00";
                        arr[2] = areaCode;
                    }
                }
                $('#selectbox').selectbox({ name: 'z00hrsyd', src: apath, data: [arr[0], arr[1], arr[2]] }, function () {
                });
            });
        </script>
        <script type="text/javascript">

            var employeeForm = new Validation("employeeForm");
            function chkEmployeeSubmit() {
                return employeeForm.validate();
            }
            function checkSYD() {
                var syd = $('#z00hrsyd').val();
                if (syd == "" || (syd != "" && syd.substring(2) == "0000" && syd != "710000" && syd != "810000" && syd != "820000")
                    || ((syd.substring(0, 2) == "11" || syd.substring(0, 2) == "12" || syd.substring(0, 2) == "31" || syd.substring(0, 2) == "50") && syd.substring(4) == "00")) {//必选并且不能只选到省一级
                    $("#syd_warn").attr("innerHTML", "<font color='red'>请确定你的生源地，省到市，如内蒙古呼和浩特市</font>");
                    $('#z00hrjg').focus();
                    return false;
                } else {
                    $("#syd_warn").attr("innerHTML", "1、研究生学历，且曾经参加工作的，填写工作时户口所在地,<br>2、其它毕业生填写高考前户口所在地");
                    return true;
                }
            }
            function isSubmit() { 
                if (!checkSYD()) {
                    return false;
                }
                if (!chkEmployeeSubmit()) {
                    return false;
                }
            }
        </script>

    </form>
</body>
</html>

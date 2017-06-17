<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_MortgageForm.aspx.cs" Inherits="OpWeb.Contract.Contract_MortgageForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>合同管理</title>
    <link href="/css/bootstrap.min.css?v=3.3.6" rel="stylesheet" />
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <!-- 全局js -->
    <script src="/js/jquery.min.js?v=2.1.4"></script>
    <script src="/js/bootstrap.min.js?v=3.3.6"></script>
    <!-- 自定义js -->
    <script src="/js/content.js?v=1.0.0"></script>
    <!-- jQuery Validation plugin javascript-->
    <script src="/js/plugins/validate/jquery.validate.min.js"></script>
    <script src="/js/plugins/validate/messages_zh.min.js"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script src="/js/plugins/suggest/bootstrap-suggest.min.js"></script>
    <script src="/js/plugins/iCheck/icheck.min.js"></script>
    <script src="/js/plugins/layer/laydate/laydate.js"></script>
    <script src="/js/demo/form-advanced-demo.js"></script>
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }

        .ULine {
            padding: 2px;
            margin: 0px;
        }

            .ULine label {
                padding: 0px;
                margin: 3px;
            }

            .ULine li {
                float: left;
                list-style: none;
                line-height: 25px;
                display: block;
                margin: 0px;
                padding: 0px;
            }
    </style>
</head>
<body class="gray-bg">
    <form class="form-horizontal m-t" id="signupForm" runat="server">
        <div class="ibox float-e-margins">

            <div class="ibox-content">
                <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                    <tbody>
                        <tr>
                            <td width="110">
                                <label class="control-label">购房地址：</label></td>
                            <td width="200">
                                <div class="input-group">
                                    <input type="text" class="form-control" id="M_Address" runat="server" />
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        </ul>
                                    </div>
                                </div>
                            </td>
                            <td width="100">
                                <label class="control-label">楼　　层：</label></td>
                            <td width="180">
                                <input id="M_Floor" name="M_Floor" class="form-control" type="text" runat="server" /></td>
                            <td width="130">
                                <label class="control-label">合 同 号：</label></td>
                            <td>
                                <input id="M_NO" name="M_NO" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">用　　途：</label></td>
                            <td>
                                <select class="form-control" id="M_Use" name="M_Use" runat="server">
                                    <option>住房</option>
                                    <option>商业住房</option>
                                </select>

                            </td>
                            <td>
                                <label class="control-label">房屋形式：</label></td>
                            <td>
                                <select class="form-control" id="M_Class" name="M_Class" runat="server">
                                    <option>住房</option>
                                    <option>商业住房</option>
                                </select>

                            </td>
                            <td>
                                <label class="control-label">房屋类型：</label></td>
                            <td>
                                <select class="form-control" id="M_Form" name="M_Form" runat="server">
                                    <option>住宅</option>
                                    <option>商铺</option>
                                    <option>车位</option>
                                    <option>其它</option>
                                </select></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">建筑面积：</label></td>
                            <td>
                                <input id="M_Area" name="M_Area" class="form-control" type="text" runat="server" onkeyup="Calc_Value()" /></td>
                            <td>
                                <label class="control-label">单位售价：</label></td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">&yen;</span>
                                    <input type="text" class="form-control" id="M_Price" name="M_Price" onkeyup="Calc_Value()" runat="server" />
                                    <span class="input-group-addon">.00</span>
                                </div>
                            </td>
                            <td>
                                <label class="control-label">住房总价：</label></td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">&yen;</span>
                                    <input type="text" readonly class="form-control" id="M_Value" name="M_Value" runat="server" />
                                    <span class="input-group-addon">.00</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">已付购房款：</label></td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">&yen;</span>
                                    <input type="text" class="form-control" id="M_Pay" name="M_Pay" runat="server" />
                                    <input type="hidden" class="form-control" id="M_Pay_Cap" name="M_Pay_Cap" runat="server" />
                                    <span class="input-group-addon">.00</span>
                                </div>
                            </td>
                            <td>
                                <label class="control-label">借款金额：</label></td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">&yen;</span>
                                    <input type="text" readonly class="form-control" id="M_Loan" name="M_Loan" runat="server" />
                                    <span class="input-group-addon">.00</span>
                                </div>
                            </td>
                            <td>
                                <label class="control-label">贷款占总价比例：</label></td>
                            <td>
                                <div class="input-group">
                                    <input type="text" readonly class="form-control" id="M_Ratio" name="M_Ratio" runat="server" />
                                    <span class="input-group-addon">%</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">贷款利率(年)：</label></td>
                            <td>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="M_Rate_Year" value="4.9" name="M_Rate_Year" runat="server" />
                                    <span class="input-group-addon">%</span>
                                </div>
                            </td>
                            <td>
                                <label class="control-label">贷款利率(月)：</label></td>
                            <td>
                                <div class="input-group">
                                    <input type="text" readonly class="form-control" id="M_Rate_Month" value="" name="M_Rate_Month" runat="server" />
                                    <span class="input-group-addon">‰</span>
                                </div>
                            </td>
                            <td>
                                <label class="control-label">利率上浮：</label></td>
                            <td>
                                <div class="input-group">
                                    <input type="text" class="form-control" id="M_Rate_Up" name="M_Rate_Up" runat="server" />
                                    <span class="input-group-addon">%</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">分 期 数：</label></td>
                            <td>
                                <select class="form-control" name="M_Loan_Years" id="M_Loan_Years" runat="server">
                                    <option value="5">5年</option>
                                    <option value="10">10年</option>
                                    <option value="15">15年</option>
                                    <option value="20">20年</option>
                                    <option value="25">25年</option>
                                    <option value="30">30年</option>
                                </select>
                                <input type="hidden" id="M_Loan_Months" value="60" name="M_Loan_Months" runat="server" />
                            </td>
                            <td>
                                <label class="control-label">开始日期：</label></td>
                            <td>
                                <input id="M_Reply_Begin" name="M_Reply_Begin" class="laydate-icon form-control layer-date" runat="server" /></td>
                            <td>
                                <label class="control-label">结束日期：</label></td>
                            <td>
                                <input id="M_Reply_End" readonly name="M_Reply_End" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">还款方式：</label></td>
                            <td>
                                <select class="form-control" id="M_Replay_Type" name="M_Replay_Type" runat="server">
                                    <option selected>等额本息</option>
                                    <option>等额本金</option>
                                </select>

                            </td>
                            <td>
                                <label class="control-label">还款账号：</label></td>
                            <td>
                                <input id="M_Account" name="M_Account" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">开 户 行：</label></td>
                            <td>
                                <input id="M_Bank" name="M_Bank" class="form-control" type="text" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">抵押物类型：</label></td>
                            <td>
                                <select class="form-control" name="M_Type" id="M_Type" runat="server">
                                    <option>商业房</option>
                                    <option>住房</option>
                                </select></td>
                            <td>
                                <label class="control-label">土地性质：</label></td>
                            <td>
                                <select class="form-control" id="M_LandStatus" name="M_LandStatus" runat="server">
                                    <option>建设用地</option>
                                </select></td>
                            <td>
                                <label class="control-label">房屋结构：</label></td>
                            <td>
                                <select class="form-control" id="M_Struct" name="M_Struct" runat="server">
                                    <option selected>框剪</option>
                                    <option>框架</option>
                                </select>

                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>

                        <tr>
                            <td>
                                <label class="control-label">抵押物价值：</label></td>
                            <td>
                                <div class="input-group">
                                    <span class="input-group-addon">&yen;</span>
                                    <input type="text" readonly id="M_Loan_Cap" name="M_Loan_Cap" class="form-control" runat="server" />
                                    <span class="input-group-addon">整</span>
                                </div>
                            </td>
                            <td>
                                <label class="control-label">产权证号：</label></td>
                            <td>
                                <input id="M_PropertyNO" name="M_PropertyNO" class="form-control" type="text" runat="server" /></td>
                            <td>&nbsp;</td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">合同份数：</label></td>
                            <td>
                                <input id="M_Copies" name="M_Copies" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">持 有 人： </label>
                            </td>
                            <td>
                                <input id="M_People" name="M_People" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">合同签署日期：</label></td>
                            <td>
                                <input id="M_SignDate" name="M_SignDate" class="form-control layer-date" placeholder="年-月-日" onclick="laydate({ istime: true, format: 'YYYY-MM-DD' })" runat="server" /></td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">合同签署地点：</label></td>
                            <td colspan="5">
                                <div class="input-group" style="width: 100%;">
                                    <input type="text" class="form-control" id="M_Signed" runat="server" />
                                    <div class="input-group-btn">
                                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                                            <span class="caret"></span>
                                        </button>
                                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
                                        </ul>
                                    </div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 5px;"></td>
                        </tr>
                        <tr>
                            <td>
                                <label class="control-label">家庭月收入：</label></td>
                            <td>
                                <input id="M_Income" name="M_Income" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">每月拟还款：</label></td>
                            <td>
                                <input id="M_Reply" name="M_Reply" class="form-control" type="text" runat="server" /></td>
                            <td>
                                <label class="control-label">占家庭月收入比例：</label></td>
                            <td>
                                <div class="input-group">
                                    <input type="text" id="M_Re_Ratio" name="M_Re_Ratio" class="form-control" runat="server" />
                                    <span class="input-group-addon">%</span>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="6" style="height: 25px;"></td>
                        </tr>
                    </tbody>
                </table>
                <div class="form-group">
                    <div class="col-sm-8 col-sm-offset-3">
                        <asp:LinkButton ID="Save" runat="server" class="btn btn-w-m btn-primary" OnClick="Save_Click">完　成</asp:LinkButton>&nbsp;
                                        <button type="button" class="btn btn-w-m btn-warning" onclick="OpenClose();">取  消</button>
                    </div>
                </div>
            </div>
        </div>

    </form>


    <script>
        $(document).ready(function () {
            $('.i-checks').iCheck({
                checkboxClass: 'icheckbox_square-green',
                radioClass: 'iradio_square-green',
            });
            if (!$("#M_Loan_Months").val().length > 0) {
                $("#M_Loan_Months").val("60");
            }

            if (!$("#M_Rate_Year").val().length > 0) {
                $("#M_Rate_Year").val("4.9");
            }

            if (!$("#M_Rate_Month").val().length > 0) {
                $("#M_Rate_Month").val("4.0834");
            }

            if (!$("#M_Rate_Up").val().length > 0) {
                $("#M_Rate_Up").val("0");
            }

            if (!$("#M_Reply_Begin").val().length > 0) {
                var _year = new Date().getFullYear();
                var _month = parseInt(new Date().getMonth()) + 1;
                var _day = new Date().getDate();

                $("#M_Reply_End").val(_year + "-" + _month + "-" + _day);
            }

            if (!$("#M_Reply_End").val().length > 0) {
                cale_date();
            }


        });

       
        var baiduBsSuggest = $("#M_Address").bsSuggest({
            allowNoKeyword: true, //是否允许无关键字时请求数据
            multiWord: true, //以分隔符号分割的多关键字支持
            separator: ",", //多关键字支持时的分隔符，默认为空格
            getDataMethod: "url", //获取数据的方式，总是从 URL 获取
            url: '/Frame/Com_Acquire.ashx?T=Contract_Mortgage&F=M_Address&XX=',
            /*优先从url ajax 请求 json 帮助数据，注意最后一个参数为关键字请求参数*/
            jsonp: '',
            /*如果从 url 获取数据，并且需要跨域，则该参数必须设置*/
            processData: function (json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
                var i, len, data = {
                    value: []
                };
                if (!json || !json.sItems || json.sItems.length === 0) {
                    return false;
                }

                console.log(json);
                len = json.sItems.length;

                jsonStr = "{'value':[";
                for (i = 0; i < len; i++) {
                    data.value.push({
                        word: json.sItems[i].s
                    });
                }
                data.defaults = 'M_Address';

                //字符串转化为 js 对象
                return data;
            }
        });
		
		var baiduBsSuggest = $("#M_Signed").bsSuggest({
            allowNoKeyword: true, //是否允许无关键字时请求数据
            multiWord: true, //以分隔符号分割的多关键字支持
            separator: ",", //多关键字支持时的分隔符，默认为空格
            getDataMethod: "url", //获取数据的方式，总是从 URL 获取
            url: '/Frame/Com_Acquire.ashx?T=Contract_Mortgage&F=M_Signed&U=U0&XX=',
            /*优先从url ajax 请求 json 帮助数据，注意最后一个参数为关键字请求参数*/
            jsonp: '',
            /*如果从 url 获取数据，并且需要跨域，则该参数必须设置*/
            processData: function (json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数
                var i, len, data = {
                    value: []
                };
                if (!json || !json.sItems || json.sItems.length === 0) {
                    return false;
                }

                console.log(json);
                len = json.sItems.length;

                jsonStr = "{'value':[";
                for (i = 0; i < len; i++) {
                    data.value.push({
                        word: json.sItems[i].s
                    });
                }
                data.defaults = 'M_Signed';

                //字符串转化为 js 对象
                return data;
            }
        });
		
               function Calc_Value() {
            var Area = $("#M_Area").val();
            var Price = $("#M_Price").val();

            if (Area.length > 0 && Price.length > 0) {
                if (!isNaN(Area)) {

                    if (/^(\+|-)?\d+$/.test(Price)) {
                        $("#M_Value").attr("value", (Area * Price).toFixed(0));
                    }
                    else {
                        layer.msg("请输入正确的数值");
                        $("#M_Price").val(Price.substring(0, Price.length - 1));
                        $("#M_Value").attr("value", "");
                        $("#M_Price").focus();
                    }

                } else {
                    layer.msg("请输入正确的数值");
                    $("#M_Area").val(Area.substring(0, Area.length - 1));
                    $("#M_Value").attr("value", "");
                    $("#M_Area").focus();
                }
            }
        }

        $("#M_Pay").keyup(function () {
            var Pay = $(this).val();
            if ((/^(\+|-)?\d+$/.test(Pay)) && Pay > 0) {
                var Value = $("#M_Value").val();
                var Loan = parseInt(Value - Pay);
                $("#M_Loan").val(Value - Pay);
                $("#M_Ratio").val((Pay * 100 / Value).toFixed(2));
                //$("#M_Loan_Cap").val(convertCurrency(Value-Pay));
                //convertCurrency(Value-Pay);
                $("#M_Loan_Cap").val(formatRMB(Loan));
                return true;
            } else {
                layer.msg("请输入正确的数值");
                $("#M_Pay").val(Pay.substring(0, Pay.length - 1));
                return false;
            }
        });

        $("#M_Rate_Year").keyup(function () {
            var Rate = $(this).val();
            if (!isNaN(Rate)) {
                //4.0834
                $("#M_Rate_Month").val((Math.ceil(Rate * 100000 / 12) / 10000).toFixed(4));

                return true;
            } else {
                layer.msg("请输入正确的数值");
                $("#M_Rate_Month").val("");
                $("#M_Rate_Year").val(Rate.substring(0, Rate.length - 1));
                return false;
            }
        });


        $("#M_Loan_Years").change(function () {
            var year = $(this).val();
            if ((/^(\+|-)?\d+$/.test(year)) && year > 0) {
                $("#M_Loan_Months").val(year * 12);
                $("#M_Reply_End").click();
            }
            else {

                layer.msg("请重新选择【分期数】");
            }

        });


        $("#M_Reply_End").click(function () {
            cale_date();
        });

        function cale_date() {
            var year = $("#M_Loan_Years").val();
            var begindate = new Date($("#M_Reply_Begin").val());

            if ($("#M_Reply_Begin").val().length > 0) {
                begindate.setFullYear(begindate.getFullYear() + parseInt(year));
                begindate.setDate(begindate.getDate() - 1);
                var month = parseInt(begindate.getMonth()) + 1;
                $("#M_Reply_End").val(begindate.getFullYear() + "-" + month + "-" + begindate.getDate());

            }
        }

    </script>
    <script>
        var c = "零壹贰叁肆伍陆柒捌玖".split("");
        // ["零","壹","贰","叁","肆","伍","陆","柒","捌","玖"]
        var _c = {}; // 反向对应关系
        for (var i = 0; i < c.length; i++) {
            _c[c[i]] = i;
        };

        var d = "元***万***亿***万";
        var e = ",拾,佰,仟".split(",");
        function unit4(arr) {
            var str = "", i = 0;
            while (arr.length) {
                var t = arr.pop();
                str = (c[t] + (t == 0 ? "" : e[i])) + str;
                i++;
            }

            str = str.replace(/[零]{2,}/g, "零");

            str = str.replace(/^[零]/, "");
            str = str.replace(/[零]$/, "");
            if (str.indexOf("零") == 0) {
                str = str.substring(1);
            }
            if (str.lastIndexOf("零") == str.length - 1) {
                str = str.substring(0, str.length - 1);
            }

            return str;
        }
        function _formatD(a) {
            // 转化整数部分
            var arr = a.split(""), i = 0, result = "";
            while (arr.length) {
                var arr1 = arr.splice(-4, 4);

                var dw = d.charAt(i), unit = unit4(arr1);

                if (dw == '万' && !unit) {
                    dw = "";
                }
                result = unit + dw + result;
                i += 4;
            }
            return result == "元" ? "" : result;
        }
        function _formatF(b) {
            // 转化小数部分
            b = b || "";
            switch (b.length) {
                case 0:
                    return "";
                case 1:
                    return c[b] + "角";
                default:
                    return c[b.charAt(0)] + "角" + c[b.charAt(1)] + "分";
            }
        }
        function _format(n) {
            var a = ("" + n).split("."), a0 = a[0], a1 = a[1];
            return _formatD(a0) + _formatF(a1);
        }

        function parse4(u4) {
            var res = 0;
            while (t = /([零壹贰叁肆伍陆柒捌玖])([拾佰仟]?)/g.exec(u4)) {
                var n = _c[t[1]], d = {
                    "": 1,
                    "拾": 10,
                    "佰": 100,
                    "仟": 1000
                }[t[2]];
                res += n * d;
                u4 = u4.replace(t[0], "");
            }
            var result = ("0000" + res);
            return result.substring(result.length - 4);
        }
        function _parseD(d) {
            var arr = d.replace(/[零]/g, "").split(/[万亿]/), rs = "";
            for (var i = 0; i < arr.length; i++) {
                rs += parse4(arr[i]);
            }
            ;
            return rs.replace(/^[0]+/, "");
        };
        function _parseF(f) {
            var res = "", t = f.replace(/[^零壹贰叁肆伍陆柒捌玖]+/g, "").split(""); // 去掉单位
            if (t.length) {
                res = ".";
            } else {
                return "";
            }
            ;
            for (var i = 0; (i < t.length && i < 2) ; i++) {
                res += _c[t[i]];
            }
            ;
            return res;
        };
        function _parse(rmb) {
            var a = rmb.split("元"), a1 = a[1], a0 = a[0];
            if (a.length == 1) {
                a1 = a0;
                a0 = "";
            }
            return _parseD(a0) + _parseF(a1);

        };
        //小写转大写
        function formatRMB(num) {
            var n = Number(num);
            if (!isNaN(num)) {
                if (num == 0) {
                    return "零";
                } else {
                    return _format(n);
                }
            } else {
                return false;
            }
        }

    </script>
    <script>
        //外部js调用
        laydate({
            elem: '#M_Reply_Begin', //目标元素。由于laydate.js封装了一个轻量级的选择器引擎，因此elem还允许你传入class、tag但必须按照这种方式 '#id .class'
            event: 'focus' //响应事件。如果没有传入event，则按照默认的click
        });

        //日期范围限制
        var start = {
            elem: '#start',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(), //设定最小日期为当前日期
            max: '2099-06-16 23:59:59', //最大日期
            istime: true,
            istoday: false,
            choose: function (datas) {
                end.min = datas; //开始日选好后，重置结束日的最小日期
                end.start = datas //将结束日的初始值设定为开始日
            }
        };
        var end = {
            elem: '#end',
            format: 'YYYY/MM/DD hh:mm:ss',
            min: laydate.now(),
            max: '2099-06-16 23:59:59',
            istime: true,
            istoday: false,
            choose: function (datas) {
                start.max = datas; //结束日选好后，重置开始日的最大日期
            }
        };
        laydate(start);
        laydate(end);

    </script>

</body>
</html>

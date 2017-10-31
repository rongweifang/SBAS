<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_OneCardForm.aspx.cs" Inherits="OpWeb.Contract.Contract_OneCardForm" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>富民一卡通 </title>
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
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script src="/js/plugins/suggest/bootstrap-suggest.min.js"></script>
    <script src="/js/plugins/laydate/laydate.js"></script>

    <style type="text/css">
        .ULine {
            padding: 2px;
            margin: 0;
        }

            .ULine label {
                padding: 0;
                margin: 3px;
            }

            .ULine li {
                float: left;
                list-style: none;
                line-height: 25px;
                display: block;
                margin: 0;
                padding: 0;
            }
    </style>
</head>
<body>
    <form id="signupForm" runat="server">
        <div class="ibox-content">
            <table width="100%" border="0" cellspacing="2" cellpadding="3" style="text-align: center;">
                <tbody>
                    <tr>
                        <td width="110">&nbsp;<label class="control-label">用户类型：</label></td>
                        <td width="200">
                            <select class="form-control" id="M_UserType" name="M_UserType" runat="server">
                                <option value="1">个体工商户</option>
                                <option value="2">行政事业单位人员</option>
                                <option value="3">农牧户</option>
                            </select></td>
                        <td width="100">
                            <label class="control-label">贷款类型：</label></td>
                        <td width="180">
                            <select class="form-control" id="M_CreditType" name="M_CreditType" runat="server">
                                <option>个人经营性贷款 </option>
                                <option>个人综合消费贷款</option>
                                <option>其他贷款</option>
                            </select></td>
                        <td width="130">
                            <label class="control-label">担保方式 ：</label></td>
                        <td>
                            <select class="form-control" id="M_GuaranteeType" name="M_GuaranteeType" runat="server">
                                <option>抵押</option>
                                <option>质押</option>
                                <option>保证</option>
                                <option>信用</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td width="110">
                            <label class="control-label">贷前调查方式：</label></td>
                        <td width="200">
                            <select class="form-control" id="M_surveyType" name="M_surveyType" runat="server">
                                <option>约见面谈</option>
                                <option>电话访谈</option>
                                <option>上门走访</option>
                                <option>数据库和网络查询</option>
                                <option>实地考察</option>
                                <option>其他</option>
                            </select>

                        </td>
                        <td width="100">
                            <label class="control-label">担保物核实 ：</label></td>
                        <td width="180">
                            <select class="form-control" id="M_VerifyOrg" name="M_VerifyOrg" runat="server">
                                <option>实地调查</option>
                                <option>查询产权登记部门</option>
                                <option>查询评估机构</option>
                                <option>其他</option>
                            </select>

                        </td>
                        <td width="130">
                            <label class="control-label">信用记录查询：</label></td>
                        <td>
                            <select class="form-control" id="M_VreditOrg" name="M_VreditOrg" runat="server">
                                <option>信贷风险管理系统</option>
                                <option>人民银行征信系统</option>
                                <option>其他途径</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">借款人基本信息：</label></td>
                        <td>
                            <select class="form-control" id="M_VerifyInfo" name="M_VerifyInfo" runat="server">
                                <option>真实</option>
                                <option>不真实</option>
                            </select>

                        </td>
                        <td>
                            <label class="control-label">信用记录情况：</label></td>
                        <td>
                            <select class="form-control" id="M_VerifyCredit" name="M_VerifyCredit" runat="server">
                                <option>正常</option>
                                <option>不正常</option>
                            </select>

                        </td>
                        <td>
                            <label class="control-label">借款主体是否合法：</label></td>
                        <td>
                            <select class="form-control" id="M_VerifySub" name="M_VerifySub" runat="server">
                                <option>是</option>
                                <option>否</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">资信等级：</label></td>
                        <td>
                            <select class="form-control" id="M_Rating" name="M_Rating" runat="server">
                                <option>优秀</option>
                                <option>良好</option>
                                <option>一般</option>
                                 <option>撤销资信等级</option>
                            </select>

                        </td>
                        <td>
                            <label class="control-label">信用社评级：</label></td>
                        <td>
                            <select class="form-control" id="M_Grade" name="M_Grade" runat="server">
                                <option>优秀</option>
                                <option>良好</option>
                                <option>一般</option>
                            </select>

                        </td>
                        <td>
                            <label class="control-label">合约号：</label></td>
                        <td>
                            <input id="M_AgreementNO" name="M_AgreementNO" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">其它情况：</label></td>
                        <td colspan="5">
                            <input id="M_Memo" name="M_Memo" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">还款来源分析：</label></td>
                        <td colspan="5">

                            <input id="M_Source" name="M_Source" class="form-control" type="text" runat="server" /></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">授信金额(<span style="color: red">*</span>)：</label></td>
                        <td>
                            <div class="input-group">
                                <span class="input-group-addon">&yen;</span>
                                <input type="text" class="form-control" id="M_Loan" name="M_Loan" runat="server" />
                                <span class="input-group-addon">.00</span>
                            </div>
                        </td>
                        <td>
                            <label class="control-label">大写：</label></td>
                        <td>
                            <input id="M_Loan_Cap" name="M_Loan_Cap" class="form-control" readonly runat="server" /></td>
                        <td>
                            <label class="control-label">结算方式：</label></td>
                        <td>
                            <select class="form-control" id="M_Replay_Type" name="M_Replay_Type" runat="server">
                                <option selected value="1">按季结息</option>
                                <option value="2">按月结息</option>
                                <option value="3">利随本清</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>
                     <tr>
                        <td>
                            <label class="control-label">授信期限：</label></td>
                        <td>

                            <input id="M_Reply_Begin" name="M_Reply_Begin" class="laydate-icon form-control layer-date" runat="server" /></td>
                        <td>
                            <label class="control-label">结束日期：</label></td>
                        <td>
                            <input id="M_Reply_End" name="M_Reply_End" class="laydate-icon form-control layer-date" runat="server" /></td>
                        <td>
                            <label class="control-label"></label></td>
                        <td>
                            &nbsp;</td>
                    </tr>
                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>
                    <tr>
                       
                        <td>
                            <label class="control-label">利率(年)：</label></td>
                        <td>
                            <div class="input-group">
                                <input type="text" class="form-control" id="M_Rate_Year" value="4.9" name="M_Rate_Year" runat="server" />
                                <span class="input-group-addon">%</span>
                            </div>
                        </td>
                        <td>
                            <label class="control-label">利率(月)：</label></td>
                        <td>
                            <div class="input-group">
                                <input type="text" class="form-control" id="M_Rate_Month" value="" name="M_Rate_Month" runat="server" />
                                <span class="input-group-addon">‰</span>
                            </div>
                        </td>
                         <td>
                            <label class="control-label"></label></td>
                        <td>
                            &nbsp;</td>
                    </tr>

                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>
                    <tr>
                        <td>
                            <label class="control-label">富民卡卡号(<span style="color: red">*</span>)：</label></td>
                        <td>
                            <input id="M_CardNO" name="M_CardNO" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">发卡时间：</label></td>
                        <td>
                            <input id="M_IssuingDate" name="M_IssuingDate" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">年费：</label></td>
                        <td>
                            <input id="M_AnnualFee" name="M_AnnualFee" class="form-control" type="text" runat="server" value="0" /></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>

                    <tr>
                        <td>
                            <label class="control-label">挂失手续费：</label></td>
                        <td>
                            <input type="text" id="M_Poundage" name="M_Poundage" class="form-control" runat="server" value="0" />
                        </td>
                        <td>
                            <label class="control-label">短信费：</label></td>
                        <td>
                            <input id="M_ServiceCharge" name="M_ServiceCharge" class="form-control" type="text" runat="server" value="2" /></td>
                        <td>
                            <label class="control-label">抵押率为:</label></td>
                        <td>
                            <input id="M_Discount" name="M_Discount" class="form-control" type="text" runat="server" /></td>
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
                            <label class="control-label">财务报表周期：</label></td>
                        <td>
                            <select class="form-control" id="M_Period" name="M_Period" runat="server">
                                <option selected>季</option>
                                <option>月</option>
                            </select></td>
                    </tr>
                    <tr>
                        <td colspan="6" style="height: 5px;"></td>
                    </tr>
                    <tr>
                         <td>
                            <label class="control-label">用途：</label></td>
                        <td colspan="3">
                            <input id="M_Use" name="M_Use" class="form-control" type="text" runat="server" /></td>
                        <td>
                            <label class="control-label">合同签署地点：</label></td>
                        <td>
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
                        <td colspan="6" style="height: 20px;"></td>
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
    </form>

    <script>
        $(document).ready(function () {
            if (!$("#M_Rate_Year").val().length > 0) {
                $("#M_Rate_Year").val("4.9");
            }

            if (!$("#M_Rate_Month").val().length > 0) {
                $("#M_Rate_Month").val("4.0834");
            }

        });

        $("#M_Loan").keyup(function () {
            var Pay = $(this).val();
            if ((/^(\+|-)?\d+$/.test(Pay)) && Pay > 0) {
                $("#M_Loan_Cap").val(formatRMB(Pay));
                $("#M_Loan_W").val(parseInt(Pay) / 10000 + '万');
                return true;
            } else {
                layer.msg("请输入正确的数值");
                $("#M_Loan").val(Pay.substring(0, Pay.length - 1));
                return false;
            }
        });

        var baiduBsSuggest = $("#M_Signed").bsSuggest({
            allowNoKeyword: true, //是否允许无关键字时请求数据
            multiWord: true, //以分隔符号分割的多关键字支持
            separator: ",", //多关键字支持时的分隔符，默认为空格
            getDataMethod: "url", //获取数据的方式，总是从 URL 获取
            url: '/Frame/Com_Acquire.ashx?T=Contract_OneCard&F=M_Signed&U=U0&XX=',
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
        laydate.render({
            elem: '#M_Reply_Begin'
        });
        laydate.render({
            elem: '#M_Reply_End'
        });
        laydate.render({
            elem: '#M_IssuingDate'
        });
    </script>

</body>
</html>

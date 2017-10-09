<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_GuaranteeForm1.aspx.cs" Inherits="OpWeb.Contract.User_GuaranteeForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>保证人</title>
    <link href="/themes/demo/css/style.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/validate.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="/themes/demo/css/ui_100buy.css" rel="stylesheet" type="text/css" />
    <link href="/themes/default/css/memberglobal.css" rel="stylesheet" type="text/css" />
    <link href="/themes/index/css/css.css" rel="stylesheet" />
    <link href="/themes/index/css/job.css" rel="stylesheet" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/scripts/layer.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>

    <style type="text/css">
        <!--
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
    <form id="form1" runat="server">
        <table border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
            <tbody>
                <tr bgcolor="#f2f2f2" align="center" class="black">
                    <td>保证人姓名</td>

                    <td>性别</td>
                    <td>电话</td>
                    <td width="110px">操作</td>
                </tr>
                <asp:Repeater ID="rp_Item" runat="server">
                    <ItemTemplate>
                        <tr bgcolor="#FFFFFF" align="center" class="gray">
                            <td><%#Eval("UG_Name") %></td>
                            <td><%#Eval("UG_Sex") %></td>
                            <td><%#Eval("UG_Tel") %></td>

                            <td>
                                <span class="btn_operate" onclick='Edit("<%#Eval("UGID") %>")'>编辑</span>
                                <span class="btn_operate" onclick='Delete("<%#Eval("UGID") %>")'>删除</span>
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
                                <div class="form02">姓名(*)：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UG_Name" name="UG_Name" type="text" class="required input" value="" maxlength="50" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form06">
                                <div class="form02">性别：</div>
                                <div class="form03">
                                    <div>
                                        <select id="UG_Sex" name="UG_Sex" class="required validate-selection" runat="server">
                                            <option>男</option>
                                            <option>女</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form04" style="overflow: hidden;">
                                <div class="form02">住址：</div>
                                <div class="form05">
                                    <div>
                                        <input id="UG_Address" name="UG_Address" type="text" class="required input2" value="" maxlength="80" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form06">
                                <div class="form02" style="line-height: 20px;">联系电话：</div>
                                <div class="form03">
                                    <input id="UG_Tel" name="UG_Tel" type="text" class="required input" value="" maxlength="50" runat="server" />
                                </div>
                            </div>
                            <div class="form06">
                                <div class="form02">身份证号：</div>
                                <div class="form03">
                                    <input id="UG_Card_Id" name="UG_Card_Id" type="text" class="required input" value="" runat="server" />
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form06" style="overflow: hidden;">
                                <div class="form02">工作单位：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UG_Company" name="UG_Company" type="text" class="required input" value="" maxlength="120" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form06">
                                <div class="form02">职称：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UG_Professional" name="UG_Professional" type="text" class="required input" value="" maxlength="120" runat="server" />
                                    </div>

                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form06" style="overflow: hidden;">
                                <div class="form02">学历：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UG_Education" name="UG_Education" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form06">
                                <div class="form02">学位：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UG_Degree" name="UG_Degree" type="text" class="required input" value="" maxlength="120" runat="server" />
                                    </div>

                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form06" style="overflow: hidden;">
                                <div class="form02">月均收入：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UG_Income" name="UG_Income" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form06">
                                <div class="form02">担保次数：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UG_GuaranteeCount" name="UG_GuaranteeCount" type="text" class="required input" value="" maxlength="120" runat="server" />
                                    </div>

                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form06" style="overflow: hidden;">
                                <div class="form02">配偶姓名：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UG_MateName" name="UG_MateName" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form06">
                                <div class="form02">身份证号码：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UG_MateID" name="UG_MateID" type="text" class="required input" value="" maxlength="120" runat="server" />
                                    </div>

                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form06" style="overflow: hidden;">
                                <div class="form02">是否同意：</div>
                                <div class="form03">
                                    <div>
                                        <select id="UG_IsAgree" name="UG_IsAgree" class="required validate-selection" runat="server">
                                            <option>是</option>
                                            <option>否</option>
                                        </select>
                                    </div>
                                </div>
                            </div>

                        </li>
                        <li>
                            <div class="form07">
                                <div class="form02">&nbsp;&nbsp;</div>
                                <div class="form05">
                                    <asp:Button ID="btn_save" runat="server" Text="保存" CssClass="btnsubmit" OnClientClick="chkEducationSubmit()" OnClick="btn_save_Click" />
                                </div>
                            </div>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </form>
    <script>

        function Edit(UGID) {
            var url = "/Contract/User_GuaranteeForm1.aspx?action=edit&UID=<%=UID%>&UGID=" + UGID;
            Urlhref(url);
        }
        //删除
        function Delete(key) {
            if (IsDelData(key)) {
                var delparm = 'action=Delete&tableName=User_Guarantee&pkName=UGID&pkVal=' + key;
                delConfig('/Ajax/Common_Ajax.ashx', delparm)
            }
        }
    </script>
</body>
</html>

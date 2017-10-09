﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_GuaranteeForm2.aspx.cs" Inherits="OpWeb.Contract.User_GuaranteeForm2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>抵押人</title>
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
                    <td>抵押人姓名</td>
                    <td>抵押物</td>
                    <td>评估值</td>
                    <td width="110px">操作</td>
                </tr>
                <asp:Repeater ID="rp_Item" runat="server">
                    <ItemTemplate>
                        <tr bgcolor="#FFFFFF" align="center" class="gray">
                            <td><%#Eval("UP_CardName") %></td>
                            <td><%#Eval("UP_Name") %></td>
                            <td><%#Eval("UP_Assess") %></td>

                            <td>
                                <span class="btn_operate" onclick='Edit("<%#Eval("UPID") %>")'>编辑</span>
                                <span class="btn_operate" onclick='Delete("<%#Eval("UPID") %>")'>删除</span>
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
                                <div class="form02">抵押人姓名(*)：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UP_CardName" name="UP_CardName" type="text" class="required input" value="" maxlength="50" runat="server" />
                                    </div>
                                </div>
                            </div>
                            <div class="form06">
                                <div class="form02">抵押物名称(*)：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UP_Name" name="UP_Name" type="text" class="required input" value="" maxlength="50" runat="server" /></div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form04" style="overflow: hidden;">
                                <div class="form02">抵押物位置：</div>
                                <div class="form05">
                                    <div>
                                        <input id="UP_Location" name="UP_Location" type="text" class="required input2" value="" maxlength="80" runat="server" />
                                    </div>
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form06">
                                <div class="form02" style="line-height: 20px;">预评估价值：</div>
                                <div class="form03">
                                    <input id="UP_Assess" name="UP_Assess" type="text" class="required input" value="" maxlength="50" runat="server" />
                                </div>
                            </div>
                            <div class="form06">
                                <div class="form02">抵押率：</div>
                                <div class="form03">
                                    <input id="UP_Rate" name="UP_Rate" type="text" class="required input" value="" runat="server" />
                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form06" style="overflow: hidden;">
                                <div class="form02">是否出租 ：</div>
                                <div class="form03">
                                    <div>
                                        <select id="UP_IsRent" name="UP_IsRent" class="required validate-selection" runat="server">
                                            <option>是</option>
                                            <option>否</option>
                                        </select>
                                    </div>
                                </div>
                            </div>
                            <div class="form06">
                                <div class="form02">出租期限：</div>
                                <div class="form03">
                                    <div>
                                        <input id="UP_Expire" name="UP_Expire" type="text" class="required input" value="" maxlength="120" runat="server" />
                                    </div>

                                </div>
                            </div>
                        </li>
                        <li>
                            <div class="form04" style="overflow: hidden;">
                                <div class="form02">其他认定情况：</div>
                                <div class="form05">
                                    <div>
                                        <input id="UP_Memo" name="UP_Memo" type="text" class="required input2" value="" maxlength="120" runat="server" /></div>
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

        function Edit(UPID) {
            var url = "/Contract/User_GuaranteeForm2.aspx?action=edit&UID=<%=UID%>&UPID=" + UPID;
            Urlhref(url);
        }
        //删除
        function Delete(key) {
            if (IsDelData(key)) {
                var delparm = 'action=Delete&tableName=User_Pledge&pkName=UPID&pkVal=' + key;
                delConfig('/Ajax/Common_Ajax.ashx', delparm)
            }
        }
    </script>
</body>
</html>

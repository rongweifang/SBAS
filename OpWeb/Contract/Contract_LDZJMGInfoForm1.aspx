<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Contract_LDZJMGInfoForm1.aspx.cs" Inherits="OpWeb.Contract.Contract_LDZJMGInfoForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>房产抵押清单</title>
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
    <div style="height: 520px; overflow: auto;">
        <form id="form1" runat="server">
            <table border="0" cellspacing="1" cellpadding="0" style="background-color: #c4c4c4;">
                <tbody>
                    <tr bgcolor="#f2f2f2" align="center" class="black">
                        <td>房产座落</td>
                        <td>建筑面积</td>
                        <td>建造日期 </td>
                        <td width="110px">操作</td>
                    </tr>
                    <asp:Repeater ID="rp_Item" runat="server">
                        <ItemTemplate>
                            <tr bgcolor="#FFFFFF" align="center" class="gray">
                                <td><%#Eval("PE_HPlace") %></td>
                                <td><%#Eval("PE_HArea") %></td>
                                <td><%#Eval("PE_HBuilt") %></td>
                                <td>
                                    <span class="btn_operate" onclick='Edit("<%#Eval("PEID") %>")'>编辑</span>
                                    <span class="btn_operate" onclick='Delete("<%#Eval("PEID") %>")'>删除</span>
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
                                    <div class="form02">抵押物名称：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_Name" name="PE_Name" type="text" class="required input" value="" maxlength="50" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form06">
                                    <div class="form02">保管人：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_Preserver" name="PE_Preserver" type="text" class="required input" value="" maxlength="50" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">产权或使用权人：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_User" name="PE_User" type="text" class="required input" value="" maxlength="80" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06">
                                    <div class="form02" style="line-height: 20px;">房产座落：</div>
                                    <div class="form03">
                                        <input id="PE_HPlace" name="PE_HPlace" type="text" class="required input" value="" maxlength="50" runat="server" />
                                    </div>
                                </div>
                                <div class="form06">
                                    <div class="form02">房产证号：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_HNO" name="PE_HNO" type="text" class="required input" value="" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">建造日期：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_HBuilt" name="PE_HBuilt" type="text" class="required input" value="" maxlength="120" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form06">
                                    <div class="form02">建筑面积：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_HArea" name="PE_HArea" type="text" class="required input" value="" maxlength="120" runat="server" />
                                        </div>

                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">建筑结构：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_HStruct" name="PE_HStruct" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form06">
                                    <div class="form02">用途：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_HUse" name="PE_HUse" type="text" class="required input" value="" maxlength="120" runat="server" />
                                        </div>

                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">抵押、出租情况：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_PledgeMemo" name="PE_PledgeMemo" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form06">
                                    <div class="form02">房地产评估情况：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_HAssess" name="PE_HAssess" type="text" class="required input" value="" maxlength="120" runat="server" />
                                        </div>

                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">土地座落及地号：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_LPlace" name="PE_LPlace" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">使用权类型证号：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_LType" name="PE_LType" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">使用权年限：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_LLimit" name="PE_LLimit" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form06">
                                    <div class="form02">起止时间：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_LStartstop" name="PE_LStartstop" type="text" class="required input" value="" maxlength="120" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">土地使用面积：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_LUsable" name="PE_LUsable" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form06">
                                    <div class="form02">建筑占地面积：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_LArea" name="PE_LArea" type="text" class="required input" value="" maxlength="120" runat="server" />
                                        </div>

                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">用途：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_LUse" name="PE_LUse" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                        </div>
                                    </div>
                                </div>
                                <div class="form06">
                                    <div class="form02">抵押情况：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_LAssess" name="PE_LAssess" type="text" class="required input" value="" maxlength="120" runat="server" />
                                        </div>

                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">保险单号码：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_Odd" name="PE_Odd" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form06">
                                    <div class="form02">起止时间：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_Startstop" name="PE_Startstop" type="text" class="required input" value="" maxlength="120" runat="server" />
                                        </div>

                                    </div>
                                </div>
                                <div class="form06" style="overflow: hidden;">
                                    <div class="form02">保险金额：</div>
                                    <div class="form03">
                                        <div>
                                            <input id="PE_Insurance" name="PE_Insurance" type="text" class="validate-specialchar input" value="" maxlength="80" runat="server" />
                                        </div>
                                    </div>
                                </div>
                            </li>
                            <li>
                                <div class="form07">
                                    <div class="form02">&nbsp;&nbsp;</div>
                                    <div class="form05">
                                        <asp:Button ID="btn_save" runat="server" Text="保存" CssClass="btnsubmit" OnClick="btn_save_Click" />
                                    </div>
                                </div>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <script>
        function Edit(PEID) {
            var url = "/Contract/Contract_LDZJMGInfoForm1.aspx?action=edit&UID=<%=UID%>&PEID=" + PEID;
            Urlhref(url);
        }
        //删除
        function Delete(key) {
            if (IsDelData(key)) {
                var delparm = 'action=Delete&tableName=Pledge_Estate&pkName=PEID&pkVal=' + key;
                delConfig('/Ajax/Common_Ajax.ashx', delparm)
            }
        }
    </script>
</body>
</html>

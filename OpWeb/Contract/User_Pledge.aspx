<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="User_Pledge.aspx.cs" Inherits="OpWeb.Contract.User_Pledge" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>抵押品信息</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/Validator/JValidator.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/DatePicker/WdatePicker.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/artDialog.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/artDialog/iframeTools.source.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <script type="text/javascript">
        //初始化
        $(function () {

            $('#table2').hide();
            $('#table3').hide();
        })
        //点击切换面板
        function panel(obj) {
            $('#Append_value').val(obj);
            if (obj == 1) {
                $('#table1').show();
                $('#table2').hide();
                $('#table3').hide();

            } else if (obj == 2) {
                $('#table1').hide();
                $("#table2").show();
                $('#table3').hide();

            } else if (obj == 3) {
                $('#table1').hide();
                $("#table2").hide();
                $('#table3').show();
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <input id="Append_value" type="hidden" value="1" runat="server" />
        <div class="frmtop">
            <table style="padding: 0px; margin: 0px; height: 100%;" cellpadding="0" cellspacing="0">
                <tr>
                    <td id="menutab" style="vertical-align: bottom;">
                        <div id="tab0" class="Tabsel" onclick="GetTabClick(this);panel(1)">
                            房产抵押
                        </div>
                        <div id="tab1" class="Tabremovesel" onclick="GetTabClick(this);panel(2);">
                            汽车抵押
                        </div>
                        <div id="tab2" class="Tabremovesel" onclick="GetTabClick(this);panel(3);">
                            其他抵押
                        </div>

                    </td>
                </tr>
            </table>
        </div>
        <div class="div-frm" style="height: 160px;">
            <%--房产抵押--%>
            <table id="table1" border="0" cellpadding="0" cellspacing="0" class="frm" runat="server">
                <tr>
                    <th>抵押物地址:
                    </th>
                    <td>
                        <input id="PH_Address" runat="server" type="text" class="txt" style="width: 200px" />
                    </td>
                    <th>建筑面积（㎡）:
                    </th>
                    <td>
                        <input id="PH_Area" runat="server" type="text" class="txt" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>评估价值:
                    </th>
                    <td>
                        <input id="PH_Assess" runat="server" type="text" class="txt" style="width: 200px" />
                    </td>
                    <th>抵押价值:
                    </th>
                    <td>
                        <input id="PH_Value" runat="server" type="text" class="txt" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>抵押率（%）:
                    </th>
                    <td>
                        <input id="PH_Rate" runat="server" type="text" class="txt" style="width: 200px" />
                    </td>
                    <th>抵押品到期时间:
                    </th>
                    <td>
                        <input id="PH_Expire" runat="server" type="text" class="txt" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>房屋所有权证号:
                    </th>
                    <td>
                        <input id="PH_NO" runat="server" type="text" class="txt" style="width: 200px" />
                    </td>
                    <th>他项权证号:
                    </th>
                    <td>
                        <input id="PH_OtherNO" runat="server" type="text" class="txt" style="width: 200px" />
                    </td>
                </tr>

            </table>
            <%--汽车抵押--%>
            <table id="table2" border="0" cellpadding="0" cellspacing="0" class="frm" runat="server">
                <tr>
                    <th>车牌号码:
                    </th>
                    <td>
                        <input id="PV_Number" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>车辆类型:
                    </th>
                    <td>
                        <input id="PV_Type" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>厂牌型号:
                    </th>
                    <td>
                        <input id="PV_Verder" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>车架号码:
                    </th>
                    <td>
                        <input id="PV_Frame" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>发动机号:
                    </th>
                    <td>
                        <input id="PV_Engine" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>机动车登记证书编号:
                    </th>
                    <td>
                        <input id="PV_Registration" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>购车价值:
                    </th>
                    <td>
                        <input id="PV_Price" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>抵押价值:
                    </th>
                    <td>
                        <input id="PV_Value" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>抵押率%:
                    </th>
                    <td>
                        <input id="PV_Rate" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>抵押品到期日:
                    </th>
                    <td>
                        <input id="PV_Expire" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>

            </table>
            <%--其他财产抵押 --%>
            <table id="table3" border="0" cellpadding="0" cellspacing="0" class="frm" runat="server">
                <tr>
                    <th>抵押物名称:
                    </th>
                    <td>
                        <input id="PS_Name" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>单位:
                    </th>
                    <td>
                        <input id="PS_Unit" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>数量:
                    </th>
                    <td>
                        <input id="PS_Count" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>抵押品到期日:
                    </th>
                    <td>
                        <input id="PS_Expire" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>评估价:
                    </th>
                    <td>
                        <input id="PS_Assess" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th>抵押价:
                    </th>
                    <td>
                        <input id="PS_Value" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                </tr>
                <tr>
                    <th>抵押率:
                    </th>
                    <td>
                        <input id="PS_Rate" runat="server" type="text" class="txt" datacol="yes" style="width: 200px" />
                    </td>
                    <th></th>
                    <td></td>
                </tr>
            </table>
        </div>
        <div class="frmbottom">
            <asp:LinkButton ID="Save" runat="server" class="l-btn" OnClientClick="return CheckValid();"
                OnClick="Save_Click"><span class="l-btn-left">
            <img src="/Themes/Images/disk.png" alt="" />保 存</span></asp:LinkButton>
            <a class="l-btn" href="javascript:void(0)" onclick="OpenClose();"><span class="l-btn-left">
                <img src="/Themes/Images/cancel.png" alt="" />关 闭</span></a>
        </div>
    </form>
</body>
</html>

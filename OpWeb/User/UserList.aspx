<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="UserList.aspx.cs" Inherits="OpWeb.User.UserList" %>

<%@ Register Src="../UserControl/PageControl.ascx" TagName="PageControl" TagPrefix="uc1" %>
<%@ Register Src="../UserControl/LoadButton.ascx" TagName="LoadButton" TagPrefix="uc2" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>用户信息</title>
    <link href="/Themes/Styles/Site.css" rel="stylesheet" type="text/css" />
    <script src="/Themes/Scripts/jquery-1.8.2.min.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/jquery.pullbox.js" type="text/javascript"></script>
    <script src="/Themes/Scripts/FunctionJS.js" type="text/javascript"></script>
    <link href="/css/font-awesome.css?v=4.4.0" rel="stylesheet" />
    <link href="/css/plugins/iCheck/custom.css" rel="stylesheet" />
    <link href="/css/animate.css" rel="stylesheet" />
    <link href="/css/style.css?v=4.1.0" rel="stylesheet" />
    <script type="text/javascript">
        //回车键
        document.onkeydown = function (e) {
            if (!e) e = window.event; //火狐中是 window.event
            if ((e.keyCode || e.which) == 13) {
                var obtnSearch = document.getElementById("lbtSearch");
                obtnSearch.click();
            }
        }
        $(function () {
            divresize(60);
            FixedTableHeader("#table1", $(window).height() - 118);
        })

        function refresh() {
            location.reload();
        }

        //添加
        function add() {
            var url = "/User/UserForm.aspx";
            top.openDialog(url, 'UserForm', '客户管理 - 添加', 800, 510, 50, 50);
        }
        //修改
        function edit() {
            var key = CheckboxValue();
            if (IsEditdata(key)) {
                var url = "/User/UserForm.aspx?key=" + key;
                top.openDialog(url, 'UserForm', '客户管理 - 编辑', 800, 510, 50, 50);
            }
        }
        //指纹录入
        function EditFinger(Card_ID, Card_Name) {
            if (IsEditdata(Card_ID)) {
                var url = "/User/User_Finger.aspx?Card_ID=" + Card_ID;
                top.openDialog(url, 'User_Extra', '指纹录入-' + Card_Name, 800, 680, 50, 50);
            }
        }
        //配偶
        function EditSpouse(Card_ID) {
            if (IsEditdata(Card_ID)) {
                var url = "/User/User_Spouse.aspx?Card_ID=" + Card_ID;
                top.openDialog(url, 'User_Spouse', '配偶信息管理 ', 800, 560, 50, 50);
            }
        }
        //共同居住人
        function EditSymbiosis(Card_ID) {
            if (IsEditdata(Card_ID)) {
                var url = "/User/User_Symbiosis.aspx?Card_ID= " + Card_ID;
                top.openDialog(url, 'User_Symbiosis', '共同居住人信息', 950, 560, 50, 50);
            }
        }
        //保证人
        function EditWarrantor(Card_ID) {
            if (IsEditdata(Card_ID)) {
                var url = "/User/User_Warrantor.aspx?Card_ID=" + Card_ID;
                top.openDialog(url, 'User_Warrantor', '保证人信息', 800, 630, 50, 50);
            }
        }
        //申请人信息
        function EditExtra(Card_ID) {
            if (IsEditdata(Card_ID)) {
                var url = "/User/User_Extra.aspx?Card_ID=" + Card_ID;
                top.openDialog(url, 'User_Extra', '申请人信息 - 编辑', 700, 630, 50, 50);
            }
        }
        //签订合同
        function EditContract(Card_ID, Card_Name) {
            if (IsEditdata(Card_ID)) {
                var url = "/User/User_Contract.aspx?Card_ID=" + Card_ID + "&Card_Name=" + Card_Name;
                top.openDialog(url, 'User_Contract', '合同管理 - ' + Card_Name, 780, 330, 50, 50);
            }
        }
        //照片管理
        function EditPhoto(Card_ID) {
            if (IsEditdata(Card_ID)) {
                var url = "/User/User_Photo.aspx?Card_ID=" + Card_ID;
                top.openDialog(url, 'User_Photo', '照片管理', 700, 580, 50, 50);
            }
        }

        function Onflag() {
            //var key = CheckboxValue();
            //if (IsDelData(key)) {
            //    var parm = 'action=flag&user_ID=' + key;
            //    getAjax('Common_UserInfo.ashx', parm, function (rs) {
            //        if (parseInt(rs) > 0) {
            //            showTipsMsg("标记成功！在【用户管理】-【我的标记】里查看详细！", 2000, 4);
            //            windowload();
            //        }
            //        else {
            //            showTipsMsg("<span style='color:red'>标记失败，请稍后重试！</span>", 4000, 5);
            //        }
            //    });

            //}
        }

    </script>


</head>
<body class="gray-bg">
    <div class="wrapper animated fadeInRight">
        <form id="form1" runat="server">

            <div class="btnbarcontetn">
                <div style="float: left;">
                    <input type="text" id="txt_Search" class="txtSearch SearchImg" runat="server" style="width: 180px;" /><asp:LinkButton ID="lbtSearch" runat="server" class="button green" OnClick="lbtSearch_Click"><span class="icon-botton"
            style="background: url('../../Themes/images/Search.png') no-repeat scroll 0px 4px;">
        </span>查 询</asp:LinkButton>
                    <button class="button green">指纹搜索</button>
                    <button class="button green">身份证搜索</button>
                </div>
                <div style="text-align: right">
                    <uc2:LoadButton ID="LoadButton1" runat="server" />
                </div>
            </div>
            <div class="div-body">
                <table id="table1" class="grid" singleselect="false">
                    <thead>
                        <tr>
                            <td style="width: 20px; text-align: left;">
                                <label id="checkAllOff" onclick="CheckAllLine()" title="全选"></label>
                            </td>
                            <td style="width: 80px; text-align: center;">姓名</td>
                            <td style="width: 140px; text-align: center;">身份证号</td>
                            <td style="width: 40px; text-align: center;">性别</td>
                            <td style="width: 40px; text-align: center;">年龄</td>
                            <td style="width: 100px; text-align: center;">联系电话</td>
                            <td style="width: 70px; text-align: center;">指纹采集</td>
                            <td style="width: 60px; text-align: center;">配偶信息</td>
                            <td style="width: 70px; text-align: center;">共同居住人</td>
                            <td style="width: 60px; text-align: center;">照片采集</td>
                            <td style="width: 70px; text-align: center;">签订合同</td>
                            <td style="width: 70px; text-align: center;">状态</td>
                            <td>创建日期</td>
                        </tr>
                    </thead>
                    <tbody style="line-height: 35px;">
                        <asp:Repeater ID="rp_Item" runat="server">
                            <ItemTemplate>
                                <tr>
                                    <td style="width: 20px; text-align: left;">
                                        <input id="CID" type="checkbox" value="<%#Eval("Card_ID")%>" name="checkbox" />
                                    </td>
                                    <td style="width: 80px; text-align: center;"><%#Eval("Card_Name")%></td>
                                    <td style="width: 140px; text-align: center;"><%#Eval("Card_ID")%></td>
                                    <td style="width: 40px; text-align: center;"><%#Eval("Card_Sex")%></td>
                                    <td style="width: 40px; text-align: center;"><%#Eval("U_Age")%></td>
                                    <td style="width: 100px; text-align: center;"><%#Eval("U_Tel")%></td>
                                    <td style="width: 70px; text-align: center;">
                                        <a onclick="EditFinger('<%#Eval("Card_ID")%>','<%#Eval("Card_Name")%>')">
                                            <img src="../img/fingerprint_default.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <a onclick="EditSpouse('<%#Eval("Card_ID")%>')">
                                            <img src="../img/matte_white_square.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 70px; text-align: center;">
                                        <a onclick="EditSymbiosis('<%#Eval("Card_ID")%>')">
                                            <img src="../img/family.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 60px; text-align: center;">
                                        <a onclick="EditPhoto('<%#Eval("Card_ID")%>')">
                                            <img src="../img/sonyericsson_camera.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 70px; text-align: center;">
                                        <a onclick="EditContract('<%#Eval("Card_ID")%>','<%#Eval("Card_Name")%>')">
                                            <img src="../img/contract_740.png" width="35" height="35" alt="" />
                                        </a>
                                    </td>
                                    <td style="width: 70px; text-align: center;"><%#Eval("status")%></td>
                                    <td><%#Eval("CreateDate")%></td>
                                </tr>
                            </ItemTemplate>
                            <FooterTemplate>
                                <% if (rp_Item != null)
                                   {
                                       if (rp_Item.Items.Count == 0)
                                       {
                                           Response.Write("<tr><td colspan='8' style='color:red;text-align:center'>没有找到您要的相关数据！</td></tr>");
                                       }
                                   } %>
                            </FooterTemplate>
                        </asp:Repeater>
                    </tbody>
                </table>
            </div>
            <uc1:PageControl ID="PageControl1" runat="server" />
        </form>
    </div>
</body>
</html>

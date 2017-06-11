<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SearchControl.ascx.cs" Inherits="Manage.UserControl.SearchControl" %>
单位:
            <select id="Organization_ID" name="Organization_ID" class="select" runat="server" style="width: 160px;"></select>
                状态:
          <select name="Ticket_States" id="Ticket_States" class="select" runat="server" style="width: 80px;"></select>
                开票月份:&nbsp;<select id="SL_Month" name="SL_Month" class="select" runat="server">
                    <option value="" selected="selected">未选择</option>
                    <option value="1">1月</option>
                    <option value="2">2月</option>
                    <option value="3">3月</option>
                    <option value="4">4月</option>
                    <option value="5">5月</option>
                    <option value="6">6月</option>
                    <option value="7">7月</option>
                    <option value="8">8月</option>
                    <option value="9">9月</option>
                    <option value="10">10月</option>
                    <option value="11">11月</option>
                    <option value="12">12月</option>
                </select>&nbsp;&nbsp;
                <asp:LinkButton ID="lbtSearch" runat="server" class="button green" OnClick="lbtSearch_Click"><span class="icon-botton"
            style="background: url('/Themes/images/Search.png') no-repeat scroll 0px 4px;"></span>查 询</asp:LinkButton>
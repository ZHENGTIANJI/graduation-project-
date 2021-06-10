<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reserve.aspx.cs" Inherits="managers_borrow_reserve" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
        }
        .auto-style3 {
            font-size: large;
        }
        </style>
    <link rel="stylesheet" type="text/css" href="../mGrid.css" />
    <link rel="stylesheet" type="text/css" href="../btn_textbox.css" />
</head>
<body>
    <form id="form1" runat="server">
        <br />
        查询条件：<asp:TextBox ID="txtcond" runat="server" CssClass="input"></asp:TextBox>
        <asp:RadioButton ID="rbno" runat="server" GroupName="1" Text="根据账号" />
        <asp:RadioButton ID="rbn" runat="server" GroupName="1" Text="根据姓名" />
        <asp:RadioButton ID="rbbno" runat="server" GroupName="1" Text="根据二维码" />
        &nbsp;
        <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="查询" CssClass="btedit ant-btn-primary" />
        &nbsp;
        <asp:Button ID="btprint" runat="server" OnClick="btprint_Click" Text="打印" CssClass="btedit ant-btn-primary" />
        <br />
        <br />
        <div style="text-align: center;" class="auto-style3"><strong style="text-align: center">预约信息管理</strong></div>
        <div style="width:81px;margin-left:80%;">
            <asp:DropDownList ID="dpselect" runat="server" OnSelectedIndexChanged="dpselect_SelectedIndexChanged" AutoPostBack="True" CssClass="input">
                <asp:ListItem Value="0">全部</asp:ListItem>
                <asp:ListItem Value="3">未借出</asp:ListItem>
                <asp:ListItem Value="1">已借出</asp:ListItem>
                <asp:ListItem Value="2">过期</asp:ListItem>
            </asp:DropDownList>
        </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" align="center" OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" PageSize="10">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="编号" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="no" HeaderText="账号" ReadOnly="True" SortExpression="no" />
                <asp:BoundField DataField="name" HeaderText="姓名" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="QR_code" HeaderText="条形码编码" ReadOnly="True" SortExpression="QR_code" />
                <asp:BoundField DataField="name2" HeaderText="书名" ReadOnly="True" SortExpression="name2" />
                <asp:BoundField DataField="name1" HeaderText="资源类型" ReadOnly="True" SortExpression="name1" />
                <asp:BoundField DataField="reserve_time" HeaderText="预约时间" ReadOnly="True" SortExpression="reserve_time" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="deadline" HeaderText="截止时间" ReadOnly="True" SortExpression="deadline" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="status" HeaderText="状态" ReadOnly="True" SortExpression="status" />
            </Columns>
        </asp:GridView>
        <asp:Button ID="btovertime" runat="server" Text="删除已过期预约信息" align="left" OnClick="btovertime_Click" OnClientClick="return window.confirm(&quot;确定要删除吗？&quot;)" CssClass="btedit ant-btn-primary" Width="159px" />
        <asp:Button ID="btstatus" runat="server" Text="删除已处理预约信息" align="right" OnClick="btstatus_Click" OnClientClick="return window.confirm(&quot;确定要删除吗？&quot;)" CssClass="btedit ant-btn-primary" Width="150px" />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select 0 id,'' no,'' name,'' name,'' QR_code,'' name,'' reserve_time,'' deadline,'' status"></asp:SqlDataSource>
    </form>
</body>
</html>

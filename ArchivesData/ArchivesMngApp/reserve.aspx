<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reserve.aspx.cs" Inherits="users_reserve" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .nav {
            height: 40px;
            background-color: rgb(231, 231, 231);
            font-size: 16px;
            padding-left: 10px;
            margin: 0 auto;
        }

        li {
            float: left;
            list-style: none;
            line-height: 40px;
            padding: 0 10px;
        }
    </style>
    <link rel="stylesheet" href="btn_textbox.css" />
    <link rel="stylesheet" href="mGrid.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul class="nav">
                <li>
                     <asp:RadioButton ID="rbc" runat="server" AutoPostBack="True" Checked="True" GroupName="1" Text="当前预约" />
                </li>
                <li>
                     <asp:RadioButton ID="rbh" runat="server" AutoPostBack="True" GroupName="1" Text="历史预约" />
                </li>
            </ul>
        </div>
        <div style="margin: 10px 0px 0px 20px;">
            <asp:Button ID="btprint" runat="server" OnClick="btprint_Click" Text="导出" CssClass="btedit ant-btn-primary"/>
        </div>
        <br />
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" align="center" OnRowDataBound="GridView1_RowDataBound" OnPageIndexChanging="GridView1_PageIndexChanging" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" PageSize="10">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="编号" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="QR_code" HeaderText="条形码编号" ReadOnly="True" SortExpression="QR_code" />
                <asp:BoundField DataField="name" HeaderText="书名" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="name1" HeaderText="资源类型" ReadOnly="True" SortExpression="name1" />
                <asp:BoundField DataField="reserve_time" HeaderText="预约时间" ReadOnly="True" SortExpression="reserve_time" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="deadline" HeaderText="截止时间" ReadOnly="True" SortExpression="deadline" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="status" HeaderText="状态" ReadOnly="True" SortExpression="status" />
            </Columns>
            <EmptyDataTemplate>
                 暂无数据！
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select 0 id,'' QR_code,'' name,'' name,'' reserve_time,'' deadline,'' status"></asp:SqlDataSource>
    </form>
</body>
</html>


<%@ Page Language="C#" AutoEventWireup="true" CodeFile="return.aspx.cs" Inherits="managers_borrow_return" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 126px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../mGrid.css" />
    <link rel="stylesheet" type="text/css" href="../btn_textbox.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <table style="width:32%; margin:0 auto;">
            <tr>
                <td class="auto-style1">条形码编码：</td>
                <td>
                    <asp:TextBox ID="txtbid" runat="server" CssClass="input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtbid" ErrorMessage="不能为空！" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">还书日期：</td>
                <td>
                    <asp:TextBox ID="txtdate" runat="server" Enabled="False" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button ID="btok" runat="server" Text="还书" OnClick="btok_Click" ValidationGroup="1" CssClass="btedit ant-btn-primary"/>
                </td>
            </tr>
        </table>
        <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowDataBound="GridView1_RowDataBound" align="center" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging"  GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" PageSize="10" HorizontalAlign="Center">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="编号" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="borrower_id" HeaderText="借阅者账号" ReadOnly="True" SortExpression="borrower_id" />
                <asp:BoundField DataField="name" HeaderText="借阅者姓名" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="QR_code" HeaderText="条形码编码" ReadOnly="True" SortExpression="QR_code" />
                <asp:BoundField DataField="bn" HeaderText="书名" ReadOnly="True" SortExpression="bn" />
                <asp:BoundField DataField="btn" HeaderText="资源类型" ReadOnly="True" SortExpression="btn" />
                <asp:BoundField DataField="borrow_dt" HeaderText="借阅时间" ReadOnly="True" SortExpression="borrow_dt" DataFormatString="{0:yyyy-MM-dd}"/>
                <asp:BoundField DataField="return_dt" HeaderText="归还时间" ReadOnly="True" SortExpression="return_dt" DataFormatString="{0:yyyy-MM-dd}"/>
                <asp:BoundField DataField="overdays" HeaderText="超期天数" ReadOnly="True" SortExpression="overdays" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select '' id,'' borrower_id,'' name,'' QR_code,'' bn,'' btn,'' borrow_dt,'' return_dt,'' overdays
"></asp:SqlDataSource>
    </form>
</body>
</html>

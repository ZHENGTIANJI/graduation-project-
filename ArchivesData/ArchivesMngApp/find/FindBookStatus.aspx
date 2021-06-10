<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindBookStatus.aspx.cs" Inherits="find_FindBookStatus" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style3 {
            width: 1567px;
        }

        .auto-style5 {
            width: 782px;
            text-align: right;
        }

        .auto-style6 {
            width: 783px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../mGrid.css" />
    <link rel="stylesheet" type="text/css" href="../btn_textbox.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
        <table class="auto-style3"style="width:62%;margin:0 auto;">
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style5">选择所属类别：</td>
                <td class="auto-style6">
                    <asp:DropDownList ID="dpbtype" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="id" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">输入书名关键字：</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtn" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">输入条形码：</td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtQR" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btfind" runat="server" OnClick="btfind_Click" Text="查询" CssClass="btedit ant-btn-primary"/>
                &nbsp;
                    <asp:Button ID="btprint" runat="server" OnClick="btprint_Click" Text="打印" CssClass="btedit ant-btn-primary"/>
                </td>
            </tr>
            <tr>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            </table>
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" align="center" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="编号" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="name" HeaderText="书名" ReadOnly="True" SortExpression="name" />
                            <asp:BoundField DataField="QR_code" HeaderText="条形码编号" ReadOnly="True" SortExpression="QR_code" />
                            <asp:BoundField DataField="status" HeaderText="状态" ReadOnly="True" SortExpression="status" />
                            <asp:BoundField DataField="borrower_id" HeaderText="借阅（预约）者账号" ReadOnly="True" SortExpression="borrower_id" />
                            <asp:BoundField DataField="name1" HeaderText="借阅（预约）者姓名" ReadOnly="True" SortExpression="name1" />
                            <asp:BoundField DataField="borrow_dt" HeaderText="借阅（预约）时间" ReadOnly="True" SortExpression="borrow_dt" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="deadline" HeaderText="截止日期" ReadOnly="True" SortExpression="deadline" DataFormatString="{0:yyyy-MM-dd}" />
                        </Columns>
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select '' id,'' name,'' QR_code,'' status,'' borrower_id,'' name,'' borrow_dt,'' deadline"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [borrow_type] union select 0,'全部'"></asp:SqlDataSource>
    </form>
</body>
</html>

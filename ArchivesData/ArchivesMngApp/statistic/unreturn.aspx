<%@ Page Language="C#" AutoEventWireup="true" CodeFile="unreturn.aspx.cs" Inherits="managers_statistic_unreturn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 1207px;
        }
        .auto-style8 {
            text-align: center;
            height: 25px;
            width: 602px;
        }
        .auto-style9 {
            height: 25px;
            width: 603px;
        }
        .auto-style10 {
            font-size: large;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../mGrid.css" />
    <link rel="stylesheet" type="text/css" href="../btn_textbox.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style2" style="margin:0 auto;width:80%">
            <caption class="auto-style10">
                <strong>
                <br />
                未还书统计</strong></caption>
            <tr>
                <td class="auto-style8">
                    <asp:Label ID="lbtotall" runat="server" Style="text-align: right" Text="Label"></asp:Label>&nbsp;
                    <td style="text-align: center" class="auto-style9">
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:DropDownList ID="dpcond" runat="server" OnSelectedIndexChanged="dpcond_SelectedIndexChanged" AutoPostBack="True" CssClass="input">
                            <asp:ListItem Value="0">全部</asp:ListItem>
                            <asp:ListItem Value="1">超期</asp:ListItem>
                            <asp:ListItem Value="2">正常</asp:ListItem>
                        </asp:DropDownList>
                    &nbsp; <asp:Button ID="btprint" runat="server" OnClick="btprint_Click" Text="打印" CssClass="ant-btn-primary btedit"/>
                    </td>
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    <asp:GridView ID="GridView1" runat="server" align="center" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging">
                        <Columns>
                            <asp:BoundField DataField="QR_code" HeaderText="条形码编码" ReadOnly="True" SortExpression="QR_code" />
                            <asp:BoundField DataField="name" HeaderText="书名" ReadOnly="True" SortExpression="name" />
                            <asp:BoundField DataField="borrow_dt" HeaderText="借阅时间" ReadOnly="True" SortExpression="borrow_dt" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="deadline" HeaderText="截止日期" ReadOnly="True" SortExpression="deadline" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="id" HeaderText="借阅人账号" ReadOnly="True" SortExpression="name1" />
                            <asp:BoundField DataField="name1" HeaderText="借阅人姓名" ReadOnly="True" SortExpression="name1" />
                            <asp:BoundField DataField="mname" HeaderText="专业" ReadOnly="True" SortExpression="mname" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            </table>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select '' QR_code,'' name,'' borrow_dt,'' deadline,'' id,'' name,'' mname
"></asp:SqlDataSource>
    </form>
</body>
</html>

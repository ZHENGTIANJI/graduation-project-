<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookstatistics.aspx.cs" Inherits="统计分析_bookstatistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 89px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="图书总册数"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="number" runat="server"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="btname">
            <Columns>
                <asp:BoundField DataField="btname" HeaderText="类别名称" InsertVisible="False" ReadOnly="True" SortExpression="btname" />
                <asp:BoundField DataField="number" HeaderText="数目" SortExpression="number" />
            </Columns>
        </asp:GridView>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" >
            <Columns>
                <asp:BoundField DataField="mname" HeaderText="专业名称" SortExpression="mname" />
                <asp:BoundField DataField="mnumber" HeaderText="数目" SortExpression="mnumber" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>

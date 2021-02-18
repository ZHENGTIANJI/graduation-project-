<%@ Page Language="C#" AutoEventWireup="true" CodeFile="delete.aspx.cs" Inherits="delete" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 102px;
        }
    </style>
</head>
    <body>

        <form id="form1" runat="server">
            <table style="width:100%;">
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label1" runat="server" Text="图书名称"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtbookname" runat="server"></asp:TextBox>
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">
                        <asp:Label ID="Label2" runat="server" Text="二维码编码"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                        <asp:Button ID="scan" runat="server" Text="扫描" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style1">&nbsp;</td>
                    <td>
                        <asp:Button ID="del" runat="server" OnClick="del_Click" Text="剔旧" />
                    </td>
                    <td>&nbsp;</td>
                </tr>
            </table>
        </form>

    </body>
</html>

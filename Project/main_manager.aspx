<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main_manager.aspx.cs" Inherits="首页" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 20px;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td style="text-align: center">
                    <asp:Button ID="btbookstock" runat="server" OnClick="btbookstock_Click" style="text-align: center" Text="图书入库" />
                </td>
                <td style="text-align: center">
                    <asp:Button ID="Button4" runat="server" Text="期刊入库" OnClick="Button4_Click" />
                </td>
                <td style="text-align: center">
                    <asp:Button ID="Button2" runat="server" Text="资料入库" OnClick="Button2_Click" />
                </td>
                <td style="text-align: center">
                    <asp:Button ID="Button3" runat="server" Text="论文入库" OnClick="Button3_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Button ID="Button6" runat="server" Text="图书信息查改" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="Button7" runat="server" style="text-align: center" Text="期刊信息查改" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="Button8" runat="server" Text="资料信息查改" />
                </td>
                <td class="auto-style1">
                    <asp:Button ID="Button9" runat="server" Text="论文信息查改" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Button ID="delete" runat="server" Text="剔旧" OnClick="delete_Click" />
                </td>
                <td style="text-align: center">
                    <asp:Button ID="statistics" runat="server" Text="统计信息" OnClick="statistics_Click" />
                </td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>

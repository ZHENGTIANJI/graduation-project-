<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="登录" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 429px;
        }
        .auto-style4 {
            width: 586px;
        }
        .auto-style2 {
            width: 429px;
            height: 36px;
        }
        .auto-style5 {
            height: 36px;
            width: 586px;
        }
        .auto-style3 {
            height: 36px;
        }
    </style>
</head>
<body style="height: 576px">
    <form id="form1" runat="server">
        <table style="width: 100%;">
            <tr>
                <td class="auto-style1"></td>
                <td class="auto-style4">
        <asp:Label ID="Label1" runat="server" Text="账号"></asp:Label>
        ：<asp:TextBox ID="txtuid" runat="server" Height="18px" Width="143px"></asp:TextBox>
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </td>
                <td></td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style4">
        <asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
        ：<asp:TextBox ID="txtpsw" runat="server" Height="19px" style="margin-top: 0px" Width="143px"></asp:TextBox>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style5">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="btok" runat="server" Text="登录" Height="30px" OnClick="btok_Click" Width="47px" />
                </td>
                <td class="auto-style3"></td>
            </tr>
        </table>
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    </form>
</body>
</html>

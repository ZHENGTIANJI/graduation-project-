<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="登录" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 389px;
            height: 815px;
        }
        .auto-style8 {
            width: 945px;
        }
        .auto-style12 {
            text-align: right;
            width: 945px;
            height: 42px;
        }
        .auto-style13 {
            height: 42px;
        }
        .auto-style14 {
            text-align: right;
            width: 945px;
            height: 48px;
        }
        .auto-style15 {
            height: 48px;
        }
        #form1 {
            height: 741px;
            width: 1264px;
        }
        .auto-style16 {
            text-align: right;
            width: 945px;
            height: 260px;
        }
        .auto-style18 {
            height: 260px;
        }
    </style>
</head>
<body style="height: 741px; width: 1263px;">
    <form id="form1" runat="server">
        <table style="width: 100%; height: 745px;">
            <tr>
                <td class="auto-style1">
                    <asp:Panel ID="Panel1" runat="server" BackImageUrl="~/imgs/1.PNG" Height="812px" Width="1311px">
                        <table style="width:100%;">
                            <tr>
                                <td class="auto-style16">
                                    <asp:Image ID="Image1" runat="server" ImageUrl="~/imgs/捕获2.PNG" />
                                </td>
                                <td class="auto-style18">
                                </td>
                                <td class="auto-style18"></td>
                            </tr>
                            <tr>
                                <td class="auto-style12">
                                    <asp:Label ID="Label3" runat="server" Text="用户登录"></asp:Label>
                                </td>
                                <td class="auto-style13">
                                    &nbsp;</td>
                                <td class="auto-style13">&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="auto-style12">
                                    <asp:Label ID="Label1" runat="server" Text="账号"></asp:Label>
                                </td>
                                <td class="auto-style13">
                                    <asp:TextBox ID="txtuid" runat="server" Height="18px" Width="143px"></asp:TextBox>
                                </td>
                                <td class="auto-style13"></td>
                            </tr>
                            <tr>
                                <td class="auto-style14">
                                    <asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
                                </td>
                                <td class="auto-style15">
                                    <asp:TextBox ID="txtpsw" runat="server" Height="19px" style="margin-top: 0px" Width="143px"></asp:TextBox>
                                </td>
                                <td class="auto-style15"></td>
                            </tr>
                            <tr>
                                <td class="auto-style8">&nbsp;</td>
                                <td>&nbsp;&nbsp;&nbsp;&nbsp;
                                    <asp:Button ID="btok" runat="server" Height="30px" OnClick="btok_Click" Text="登录" Width="76px" />
                                </td>
                                <td>&nbsp;</td>
                            </tr>
                        </table>
                    </asp:Panel>
                </td>
            </tr>
            </table>
    </form>
</body>
</html>

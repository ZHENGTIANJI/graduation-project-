<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login1.aspx.cs" Inherits="login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style6 {
            width: 1981px;
            height: 280px;
        }
        .auto-style7 {
            width: 400px;
            height: 280px;
        }
        .auto-style8 {
            width: 201px;
            text-align: right;
            height: 280px;
        }
        .auto-style9 {
            height: 280px;
        }
        .auto-style11 {
            width: 1981px;
        }
        .auto-style13 {
            width: 1981px;
            height: 40px;
        }
        .auto-style14 {
            width: 400px;
            height: 40px;
        }
        .auto-style15 {
            width: 201px;
            text-align: right;
            height: 40px;
        }
        .auto-style16 {
            height: 40px;
        }
        .auto-style17 {
            width: 1981px;
            height: 41px;
        }
        .auto-style18 {
            width: 400px;
            height: 41px;
        }
        .auto-style19 {
            width: 201px;
            text-align: right;
            height: 41px;
        }
        .auto-style20 {
            height: 41px;
        }
        .auto-style21 {
            width: 400px;
            text-align: right;
        }
        .auto-style22 {
            width: 281px;
            text-align: right;
        }
        .auto-style23 {
            width: 201px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <asp:Panel ID="Panel1" runat="server" BackImageUrl="~/imgs/1.PNG" Height="587px" Width="1194px">
            <table style="width:91%;">
                <tr>
                    <td class="auto-style6"></td>
                    <td class="auto-style7"></td>
                    <td class="auto-style8"></td>
                    <td class="auto-style9"></td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style21">
                        <asp:Label ID="Label3" runat="server" Text="用户登录"></asp:Label>
                    </td>
                    <td class="auto-style23">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style13"></td>
                    <td class="auto-style14"></td>
                    <td class="auto-style15">
                        <asp:Label ID="Label1" runat="server" Text="账号"></asp:Label>
                    </td>
                    <td class="auto-style16">
                        <asp:TextBox ID="txtuid" runat="server" Height="18px" Width="143px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style17"></td>
                    <td class="auto-style18"></td>
                    <td class="auto-style19">
                        <asp:Label ID="Label2" runat="server" Text="密码"></asp:Label>
                    </td>
                    <td class="auto-style20">
                        <asp:TextBox ID="txtpsw" runat="server" Height="19px" style="margin-top: 0px" Width="143px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style11">&nbsp;</td>
                    <td class="auto-style21">&nbsp;</td>
                    <td class="auto-style23">&nbsp;</td>
                    <td style="text-align: center">
                        <asp:Button ID="btok" runat="server" Height="30px" OnClick="btok_Click" Text="登录" Width="76px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    
    </div>
    </form>
</body>
</html>

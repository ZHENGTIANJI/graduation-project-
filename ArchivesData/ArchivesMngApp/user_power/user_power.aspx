<%@ Page Language="C#" AutoEventWireup="true" CodeFile="user_power.aspx.cs" Inherits="user_power_user_power" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="../btn_textbox.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:13%;margin:0 auto">
            <tr>
                <td>角色类型：<asp:DropDownList ID="dputy" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dputy_SelectedIndexChanged" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>权限设置：<asp:TreeView ID="tvpower" runat="server">
                    </asp:TreeView>
                </td>
            </tr>
            <tr>
                <td style="text-align: center">
                    <asp:Button ID="btsave" runat="server" OnClick="btsave_Click" Text="保存" style="text-align: center; top: 0px; left: 0px;" CssClass="btedit ant-btn-primary" Width="80%"/>
                </td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

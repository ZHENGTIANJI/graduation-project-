<%@ Page Language="C#" AutoEventWireup="true" CodeFile="updateP.aspx.cs" Inherits="users_updateP" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        html,body{
            width:100%;
            height:100%;
            overflow:hidden;
        }
        .auto-style2 {
            height: 31px;
        }
        .auto-style7 {
            width: 180px;
            height: 24px;
        }
        .auto-style10 {
            width: 102px;
            height: 24px;
        }       
    </style>
    <link rel="stylesheet" href="btn_textbox.css" />
</head>
<body>
    <form id="form1" runat="server" style="width: 100%;">
        <table style="width: 500px;margin-left:50%;position:relative;left:-160px; ">
            <tr>
                <td class="auto-style2" colspan="2">
                    <asp:Button ID="btedit" runat="server" OnClick="btedit_Click" Text="修改" CssClass="btedit ant-btn-primary" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" ValidationGroup="1" CssClass="btedit ant-btn-primary" />
                </td>
                <td class="auto-style2">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">姓名：</td>
                <td class="auto-style7">
                    <asp:Label ID="lbn" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">账号：</td>
                <td class="auto-style7">
                    <asp:Label ID="lbid" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">用户类型：</td>
                <td class="auto-style7">
                    <asp:Label ID="lbut" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">性别：</td>
                <td class="auto-style7">
                    <asp:Label ID="lbsex" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">学院：</td>
                <td class="auto-style7">
                    <asp:Label ID="lbc" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">专业：</td>
                <td class="auto-style7">
                    <asp:Label ID="lbm" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">年级：</td>
                <td class="auto-style7">
                    <asp:Label ID="lbg" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">班级：</td>
                <td class="auto-style7">
                    <asp:Label ID="lbclass" runat="server" Text="Label"></asp:Label>
                </td>
                <td class="auto-style8">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style10">邮箱：</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtemail" runat="server" Enabled="False" CssClass="input"></asp:TextBox>
                </td>
                <td class="auto-style7">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="邮箱格式不正确！" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10">电话：</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtphone" runat="server" Enabled="False" CssClass="input"></asp:TextBox>
                </td>
                <td class="auto-style7">
            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphone" ErrorMessage="电话格式不正确！" ValidationExpression="\d{11}" ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style10" style="color:red">超期图书：</td>
                <td class="auto-style7">
                    <asp:TextBox ID="txtovernum" runat="server" Enabled="False" CssClass="input"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
        </table>
        <p style="text-align: right">
            &nbsp;</p>
        <p>
            &nbsp;</p>
    </form>
</body>
</html>

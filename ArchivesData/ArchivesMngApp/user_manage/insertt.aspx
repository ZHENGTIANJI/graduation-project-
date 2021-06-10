<%@ Page Language="C#" AutoEventWireup="true" CodeFile="insertt.aspx.cs" Inherits="managers_user_manage_insertt" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 104px;
        }

        .auto-style2 {
            font-size: smaller;
        }
    </style>
    <link rel="stylesheet" href="../btn_textbox.css" />
    <link rel="stylesheet" href="../mGrid.css" />
</head>
<body>
    <form id="form1" runat="server">
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <table style="width:48%; margin:0 auto;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">用户类型：</td>
                <td>
                    <asp:DropDownList ID="dputy" runat="server" DataSourceID="SqlDataSource1" DataTextField="user_class" DataValueField="utid" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">账号：</td>
                <td>
                    <asp:TextBox ID="txtid" runat="server" CssClass="input"></asp:TextBox>
                    <span class="auto-style2" style="color:red;">*</span></td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">密码：</td>
                <td>
                    <asp:TextBox ID="txtpsw" runat="server" CssClass="input"></asp:TextBox>
                    <span class="auto-style2" style="color:red;">*</span></td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">姓名：</td>
                <td>
                    <asp:TextBox ID="txtn" runat="server" CssClass="input"></asp:TextBox>
                    <span class="auto-style2" style="color:red;">*</span></td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">性别：</td>
                <td>
                    <asp:DropDownList ID="dpsex" runat="server" CssClass="input">
                        <asp:ListItem Value="0">男</asp:ListItem>
                        <asp:ListItem Value="1">女</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">学院：</td>
                <td>
                    <asp:DropDownList ID="dpc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dpc_SelectedIndexChanged" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">专业：</td>
                <td>               
                    <asp:DropDownList ID="dpm" runat="server" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">年级：</td>
                <td>
                    <asp:DropDownList ID="dpg" runat="server" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">班级：</td>
                <td>
                    <asp:DropDownList ID="dpcla" runat="server" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">邮箱：</td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" CssClass="input"></asp:TextBox>
                    <span class="auto-style2" style="color:red;">*</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="邮箱格式不正确！" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">电话：</td>
                <td>
                    <asp:TextBox ID="txtphone" runat="server" CssClass="input"></asp:TextBox>
                    <span class="auto-style2" style="color:red;">*</span><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphone" ErrorMessage="电话格式不正确！" ValidationExpression="\d{11}" ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td>
                    <asp:Button ID="btok" runat="server" Text="保存" ValidationGroup="1" OnClick="btok_Click" CssClass="btedit ant-btn-primary"/>
&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:Button ID="btcancel" runat="server" Text="取消" OnClick="btcancel_Click" CssClass="btedit ant-btn-primary" />
                </td>
            </tr>
        </table>
    <div>
    
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT [utid], [user_class] FROM [user_class]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [campus]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [major] WHERE ([cid] = @cid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="dpc" Name="cid" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

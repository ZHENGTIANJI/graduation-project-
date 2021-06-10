<%@ Page Language="C#" AutoEventWireup="true" CodeFile="enrol.aspx.cs" Inherits="enrol" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        body, html {
            width: 100%;
            height: 100%;
            padding: 0px;
            margin: 0px;
            position: relative;
            overflow: hidden;
        }
        .header{
            width: 100%;
            height: 100px;
            background-color: rgba(0, 0, 0, 0.65);
            position:relative;
        }
        .name {
            margin-left: 5px;
            color: rgb(255, 255, 255);
            font-family: Times New Roman;
            font-size: 18px;
            font-weight: 700;
        }
        .mention1{
            color:rgb(255, 255, 255);
            font-size:medium;
            width:180px;
            position:absolute;
            right:5%;
            bottom:10%;
        }
        .main{
            width: 100%;
            position: absolute;
            top:100px;
            bottom: 0px;
            left:0px;
        }
        </style>
    <link rel="stylesheet" href="btn_textbox.css"/>
</head>
<body>
    <form id="form1" runat="server" style="width:100%;height:100%;">
        <div class="header">
            <div class="name">矿业工程学院档案室借阅管理信息系统</div>
            <div class="mention1">当前用户:游客</div>
        </div>
        <br />
        <br />
        <br />
        <br />
        <table style="margin-left:50%;position:relative;left:-115px">
            <tr>
                <td>用户类型：</td>
                <td>
                    <asp:DropDownList ID="dput" runat="server" CssClass="input"></asp:DropDownList></td>
            </tr>
            <tr>
                <td>账号：</td>
                <td>
                    <asp:TextBox ID="txtid" runat="server" CssClass="input"></asp:TextBox><span style="color: red;">*</span><span style="color: black;">账号为学号或工号!</span></td>
            </tr>
            <tr>
                <td>密码：</td>
                <td>
                    <asp:TextBox ID="txtpsw" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                    <span style="color: red;">*</span></td>
            </tr>
            <tr>
                <td>密码确认：</td>
                <td>
                    <asp:TextBox ID="txtpsw2" runat="server" TextMode="Password" CssClass="input"></asp:TextBox>
                    <span class="auto-style14" style="color: red;">*</span></td>
            </tr>
            <tr>
                <td>姓名：</td>
                <td>
                    <asp:TextBox ID="txtn" runat="server" CssClass="input"></asp:TextBox>
                    <span style="color: red;">*</span></td>
            </tr>
            <tr>
                <td>性别：</td>
                <td>
                    <asp:DropDownList ID="dpsex" runat="server" CssClass="input">
                        <asp:ListItem Value="0">男</asp:ListItem>
                        <asp:ListItem Value="1">女</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>学院：</td>
                <td>
                    <asp:DropDownList ID="dpc" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dpc_SelectedIndexChanged" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>专业：</td>
                <td>
                    <asp:DropDownList ID="dpm" runat="server" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>年级：</td>
                <td>
                    <asp:DropDownList ID="dpg" runat="server" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>班级：</td>
                <td>
                    <asp:DropDownList ID="dpclass" runat="server" CssClass="input">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>邮箱：</td>
                <td>
                    <asp:TextBox ID="txtemail" runat="server" CssClass="input"></asp:TextBox>
                    <span style="color: red;">*</span><asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="txtemail" ErrorMessage="邮箱格式不正确！" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>电话：</td>
                <td>
                    <asp:TextBox ID="txtphone" runat="server" CssClass="input"></asp:TextBox>
                    <span style="color: red;">*</span><asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="txtphone" ErrorMessage="电话格式不正确！" ValidationExpression="\d{11}" ValidationGroup="1"></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Button ID="btok" runat="server" Text="完成" OnClick="btok_Click" ValidationGroup="1" Style="height: 27px;margin-left:50px;" CssClass="btedit ant-btn-primary"/>
                    &nbsp;&nbsp; &nbsp;
                    <input id="Reset1" type="reset" value="重置" class="btedit ant-btn-primary" style="height: 27px;"/></td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: left">注：所有带“<span style="color: red;">*</span>”的信息必填！</td>
            </tr>

        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [campus]"></asp:SqlDataSource>
        &nbsp;<asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [major] WHERE ([cid] = @cid)">
            <SelectParameters>
                <asp:ControlParameter ControlID="dpc" Name="cid" PropertyName="SelectedValue" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select * from user_class where user_class&lt;&gt;'管理员'
"></asp:SqlDataSource>
    </form>
</body>
</html>

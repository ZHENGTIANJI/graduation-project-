<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        body{
            background-image: url(image/背景.jpg);
            background-repeat:no-repeat;
            background-attachment:fixed;
            background-size:100% 100%;
        }

        #login-box{
            background-color: white;
            text-align: center;
            margin: 0px auto;
            margin-top: 150px;
            width: 360px;
            height: 400px;
            border-radius: 13px;
        }

        #login-box h1{
            padding-top: 60px;
            color:black;
        }
        .auto-style1 {
            height:40px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div id="login-box">
        <h1>账户登录</h1>       
        <div>
            <br />
         <table style="width: 100%;">
             <tr>
                 <td class="auto-style1">账号：<asp:TextBox ID="txtid" runat="server" Width="200px"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style1">密码：<asp:TextBox ID="txtpsw" runat="server" style="margin-bottom: 0px" TextMode="Password" Width="200px"></asp:TextBox>
                 </td>
             </tr>
             <tr>
                 <td class="auto-style1">&nbsp;&nbsp;&nbsp;</td>
             </tr>
             <tr>
                 <td class="auto-style1">
                     <asp:Button ID="btlogin" runat="server" Text="登录" OnClick="btlogin_Click" BackColor="#3498DB" ForeColor="White" Height="30px" style="font-weight: 700" Width="100px" />
                     &nbsp;<asp:Button ID="btenrol" runat="server" Text="注册" OnClick="btenrol_Click" BackColor="#3498DB" ForeColor="White" Height="30px" style="font-weight: 700" Width="100px" />
                 </td>
             </tr>
         </table>
        </div>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [binding_type]"></asp:SqlDataSource>
    </form>
</body>
</html>

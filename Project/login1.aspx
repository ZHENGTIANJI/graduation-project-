<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login1.aspx.cs" Inherits="login1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link rel="stylesheet" href="icon.css"/>
    <link rel="stylesheet" href="login.css"/>
    <title>LOGIN</title>
    <style type="text/css">
        * {
    padding: 0;
    margin: 0;
}

html {
    height: 100%;
}

body {
    height: 100%;
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    display: flex;
    /*实现块级元素垂直居中*/
    justify-content: center;
    align-items: center;
}

.image img {
    /*实现图片自适应屏幕大小*/
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    z-index: -10;
}

.login {
    width: 300px;
    background-color: rgba(41, 45, 62, 0.7);
    color: aliceblue;
    border-radius: 8px;
    padding: 50px;
}

.login .header {
    text-align: center;
    font-size: 30px;
    line-height: 100px;
}

.login .input input {
    background-color: rgb(41, 45, 62);
    border: 0px;
    width: 100%;
    text-align: center;
    font-size: 15px;
    color: aliceblue;
    outline: none;
}

.login .input input::placeholder {
    text-transform: uppercase;
}

.login .input-border {
    /*实现颜色从左到右渐变效果*/
    background-image: linear-gradient(to right, #e8198b, #3B65BB);
    height: 45px;
    width: 100%;
    margin-bottom: 20px;
    border-radius: 25px;
    display: flex;
    justify-content: center;
    align-items: center;
    transition: .3s;
}

.login .input-border .border {
    /*这里使用了css3的calc()方法用于自动计算宽高*/
    height: calc(100% - 4px);
    width: calc(100% - 4px);
    border-radius: 25px;
    font-size: 14px;
}

.login .btn-login {
    width: 60%;
    border: 2px solid #3B65BB;
    margin: 0 auto;
    text-align: center;
    line-height: 40px;
    text-transform: uppercase;
    border-radius: 25px;
    cursor: pointer;
    transition: .3s;
}

.login .btn-login:hover {
    background-color: #3B65BB;
}
.transButton{background-color:transparent;}
.login .icon {
    text-align: center;
    width: 60%;
    margin: 0 auto;
    margin-top: 18px;
    border-top: 1px dashed #eee;
    padding-top: 13px;
}

.login .icon i {
    font-size: 18px;
    color: rgb(187, 187, 187);
    cursor: pointer;
    padding: 0 5px;
}
        </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="image">
        <!-- 图片大家可以自选电脑里任意，以写好调整图片大小css代码 -->
        <img src="imgs/login.jpg" alt=""/>
    </div>
    <div class="login">
        <div class="header">
            矿业学院档案管理系统
        </div>

        <div class="input">
            <div class="input-border">
                <input type="text" class="border" name="username" placeholder="username"/>
            </div>
            <div class="input-border">
                <input type="password" class="border" name="password" placeholder="password"/>
            </div>
        </div>
        <div class="action">
            <div>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Button ID="btok" runat="server"  OnClick="btok_Click" Text="登录"  CssClass="transButton" Height="36px" Width="171px" Font-Size="Medium" />
            </div>
        </div>
    </div>
        </form>
</body>

</html>

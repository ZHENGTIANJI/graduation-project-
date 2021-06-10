<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main.aspx.cs" Inherits="main" %>

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
            overflow:hidden;
        }
        .header {
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
        .back{
            width:80px;
            position:absolute;
            right:16%;
        }
        .mention1,.mention2{
            color:rgb(255, 255, 255);
            font-size:13px;
            width:250px;
            position:absolute;
            right:5%;
        }
        .mention1{            
            bottom:30%;
        }
        .mention2{
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
    <link rel="stylesheet" href="style.css" />
</head>
<body>
    <form id="form1" runat="server" style="width: 100%; height: 100%;">
        <div class="header">
            <div class="name">矿业工程学院档案室借阅管理信息系统</div>
            <div class="back"><asp:Button ID="btback" runat="server" OnClick="btback_Click" Text="退出系统" /></div>
            <div class="mention1"><asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></div>
            <div class="mention2"><asp:Label ID="Label2" runat="server" Text="Label" ></asp:Label></div>
        </div>
        <div class="main">
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
        </div>
    </form>
    </body>
</html>

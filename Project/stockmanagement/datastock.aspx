﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="datastock.aspx.cs" Inherits="stockmanagement_datastock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 80px;
        }
        .auto-style2 {
            width: 80px;
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
        }
        .auto-style4 {
            height: 20px;
            width: 115px;
        }
        .auto-style5 {
            width: 115px;
        }
        .auto-style6 {
            width: 64px;
            height: 20px;
        }
        .auto-style7 {
            width: 64px;
        }
        .auto-style8 {
            height: 20px;
            width: 140px;
        }
        .auto-style9 {
            width: 140px;
        }
        .auto-style10 {
            height: 20px;
            width: 135px;
        }
        .auto-style11 {
            width: 135px;
        }
        .auto-style12 {
            width: 60px;
            height: 20px;
        }
        .auto-style13 {
            width: 60px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h1 style="text-align: center">
            <asp:Label ID="Label14" runat="server" style="text-align: center" Text="矿业学院资料室资料入库管理"></asp:Label>
        </h1>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label2" runat="server" Text="资料名称"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label11" runat="server" Text="编著日期"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label3" runat="server" Text="资料类别"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:DropDownList ID="DropDownList3" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label4" runat="server" Text="编著单位"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label7" runat="server" Text="入库日期"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label9" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label10" runat="server" Text="语言种类"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label6" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label5" runat="server" Text="作者"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label8" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label12" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label15" runat="server" Text="价格"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label16" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>

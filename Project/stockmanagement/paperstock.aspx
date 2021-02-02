<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paperstock.aspx.cs" Inherits="stockmanagement_paperstock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 80px;
            height: 20px;
            text-align: right;
        }
        .auto-style4 {
            height: 20px;
            width: 115px;
        }
        .auto-style6 {
            width: 64px;
            height: 20px;
        }
        .auto-style8 {
            height: 20px;
            width: 140px;
        }
        .auto-style10 {
            height: 20px;
            width: 135px;
        }
        .auto-style12 {
            width: 60px;
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
        }
        .auto-style1 {
            width: 80px;
            text-align: right;
        }
        .auto-style5 {
            width: 115px;
        }
        .auto-style7 {
            width: 64px;
            text-align: right;
        }
        .auto-style9 {
            width: 140px;
        }
        .auto-style11 {
            width: 135px;
        }
        .auto-style13 {
            width: 60px;
        }
        .auto-style14 {
            width: 260px;
            height: 20px;
        }
        .auto-style15 {
            width: 260px;
        }
        .auto-style16 {
            height: 20px;
            width: 140px;
            text-align: left;
        }
        .auto-style17 {
            width: 99px;
            height: 20px;
            text-align: right;
        }
        .auto-style19 {
            width: 144px;
            height: 20px;
            text-align: right;
        }
        .auto-style20 {
            width: 144px;
            text-align: right;
        }
        .auto-style21 {
            height: 20px;
            width: 144px;
        }
        .auto-style22 {
            width: 99px;
            height: 20px;
            text-align: right;
        }
        .auto-style23 {
            width: 99px;
            text-align: right;
        }
        .auto-style24 {
            width: 99px;
            height: 20px;
            text-align: right;
        }
        .auto-style25 {
            width: 49px;
            height: 20px;
            text-align: right;
        }
        .auto-style26 {
            width: 49px;
            height: 20px;
            text-align: left;
        }
        .auto-style27 {
            width: 49px;
            text-align: right;
        }
        .auto-style28 {
            width: 260px;
            height: 22px;
        }
        .auto-style29 {
            width: 80px;
            text-align: right;
            height: 22px;
        }
        .auto-style30 {
            width: 115px;
            height: 22px;
        }
        .auto-style31 {
            width: 49px;
            text-align: right;
            height: 22px;
        }
        .auto-style32 {
            width: 99px;
            text-align: right;
            height: 22px;
        }
        .auto-style33 {
            width: 140px;
            height: 22px;
        }
        .auto-style34 {
            width: 144px;
            text-align: right;
            height: 22px;
        }
        .auto-style35 {
            width: 135px;
            height: 22px;
        }
        .auto-style36 {
            width: 64px;
            text-align: right;
            height: 22px;
        }
        .auto-style37 {
            width: 60px;
            height: 22px;
        }
        .auto-style38 {
            height: 22px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <h1 style="text-align: center">
                        <asp:Label ID="Label17" runat="server" Text="学院资料室论文入库管理"></asp:Label>
                    </h1>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style14">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label21" runat="server" Text="论文类别"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="DropDownList6" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style25">
                    &nbsp;</td>
                <td class="auto-style17">
                    <asp:Label ID="Label22" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:DropDownList ID="DropDownList7" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style21">
                    &nbsp;</td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label35" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style26">
                    <asp:Button ID="Button1" runat="server" Text="扫描" />
                </td>
                <td class="auto-style24">
                    <asp:Label ID="Label36" runat="server" style="text-align: right" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="TextBox26" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style21">
                    &nbsp;</td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label20" runat="server" Text="论文名称"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="TextBox16" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style25">
                    &nbsp;</td>
                <td class="auto-style22">
                    <asp:Label ID="Label23" runat="server" Text="编著日期"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label24" runat="server" Text="学制"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="DropDownList8" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label28" runat="server" Text="作者"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style27">
                    &nbsp;</td>
                <td class="auto-style23">
                    <asp:Label ID="Label26" runat="server" Text="入库日期"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox19" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style20">
                    <asp:Label ID="Label27" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBox20" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label30" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="TextBox21" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style27">
                    &nbsp;</td>
                <td class="auto-style23">
                    <asp:Label ID="Label29" runat="server" Text="答辩日期"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="TextBox22" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style20">
                    <asp:Label ID="Label18" runat="server" Text="指导教师"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBox15" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style28">
                </td>
                <td class="auto-style29">
                    <asp:Label ID="Label32" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style30">
                    <asp:TextBox ID="TextBox14" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style31">
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label31" runat="server" Text="研究方向"></asp:Label>
                </td>
                <td class="auto-style33">
                    <asp:TextBox ID="TextBox23" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style34">
                    <asp:Label ID="Label19" runat="server" Text="职称"></asp:Label>
                </td>
                <td class="auto-style35">
                    <asp:DropDownList ID="DropDownList5" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style36"></td>
                <td class="auto-style37"></td>
                <td class="auto-style38"></td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label33" runat="server" Text="语言种类"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="DropDownList4" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style27">
                    &nbsp;</td>
                <td class="auto-style23">
                    &nbsp;</td>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style20">
                    <asp:Label ID="Label34" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="TextBox25" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>

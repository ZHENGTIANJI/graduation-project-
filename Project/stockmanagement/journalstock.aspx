﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="journalstock.aspx.cs" Inherits="stockmanagement_journalstock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style6 {
            width: 64px;
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
        }
        .auto-style1 {
            width: 253px;
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
        .auto-style16 {
            width: 84px;
            text-align: right;
        }
        .auto-style17 {
            width: 89px;
        }
        .auto-style18 {
            width: 398px;
            text-align: left;
        }
        .auto-style19 {
            width: 15px;
        }
        .auto-style21 {
            width: 180px;
            text-align: left;
        }
        .auto-style22 {
            height: 20px;
            width: 253px;
            text-align: right;
        }
        .auto-style23 {
            width: 231px;
        }
        .auto-style27 {
            width: 201px;
            height: 20px;
            text-align: right;
        }
        .auto-style28 {
            width: 201px;
            text-align: right;
        }
        .auto-style30 {
            height: 20px;
            width: 235px;
            text-align: right;
        }
        .auto-style31 {
            width: 235px;
            text-align: right;
        }
        .auto-style32 {
            width: 74px;
            height: 20px;
            text-align: right;
        }
        .auto-style33 {
            width: 74px;
            text-align: right;
        }
        .auto-style34 {
            height: 20px;
            width: 231px;
        }
        .auto-style35 {
            height: 20px;
            width: 270px;
            text-align: right;
        }
        .auto-style36 {
            width: 270px;
            text-align: right;
        }
        .auto-style37 {
            width: 138px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px">
            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <DynamicSelectedStyle BackColor="#507CD1" />
            <Items>
                <asp:MenuItem Text="入库管理" Value="入库管理">
                    <asp:MenuItem NavigateUrl="~/stockmanagement/bookstock.aspx" Text="图书入库" Value="图书入库"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/journalstock.aspx" Text="期刊入库" Value="期刊入库"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/datastock.aspx" Text="资料入库" Value="资料入库"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/paperstock.aspx" Text="论文入库" Value="论文入库"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="信息查改" Value="信息查改">
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/bookQueryAndModify.aspx" Text="图书查改" Value="图书查改"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/journalQueryAndModify.aspx" Text="期刊查改" Value="期刊查改"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/dataQueryAndModify.aspx" Text="资料查改" Value="资料查改"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/paperQueryAndModify.aspx" Text="论文查改" Value="论文查改"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="剔旧" Value="剔旧">
                    <asp:MenuItem NavigateUrl="~/delete.aspx" Text="图书剔旧" Value="图书剔旧"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="统计分析" Value="统计分析">
                    <asp:MenuItem NavigateUrl="~/statistics/bookstatistics.aspx" Text="图书统计" Value="图书统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/statistics/journalstatistics.aspx" Text="期刊统计" Value="期刊统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/datastock.aspx" Text="资料统计" Value="资料统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/statistics/paperstatistics.aspx" Text="论文统计" Value="论文统计"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <StaticMenuItemStyle Font-Size="Large" HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#507CD1" />
        </asp:Menu>
        <table style="width:100%;">
            <tr>
                <td class="auto-style37">&nbsp;</td>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style18">
                    <h1 style="width: 451px">
                        <asp:Label ID="Label18" runat="server" Text="学院资料室期刊入库管理"></asp:Label>
                    </h1>
                </td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style37">
                    <asp:Label ID="Label3" runat="server" Text="期刊类别"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:DropDownList ID="jt" runat="server" DataSourceID="SqlDataSource1" DataTextField="jtname" DataValueField="jtname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label17" runat="server" Text="出版周期"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:DropDownList ID="period" runat="server">
                        <asp:ListItem>日刊</asp:ListItem>
                        <asp:ListItem>周刊</asp:ListItem>
                        <asp:ListItem>旬刊</asp:ListItem>
                        <asp:ListItem>半月刊</asp:ListItem>
                        <asp:ListItem>月刊</asp:ListItem>
                        <asp:ListItem>双月刊</asp:ListItem>
                        <asp:ListItem>季刊</asp:ListItem>
                        <asp:ListItem>半年刊</asp:ListItem>
                        <asp:ListItem>年刊</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style17">
                    <asp:Label ID="Label19" runat="server" Text="年第"></asp:Label>
                    <asp:TextBox ID="txtpn" runat="server" Width="20px"></asp:TextBox>
                    <asp:Label ID="Label20" runat="server" Text="期"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style32">
                    &nbsp;</td>
                <td class="auto-style22">
                    <asp:Label ID="Label1" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style34">
                    <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="扫描" />
                </td>
                <td class="auto-style35">
                    <asp:Label ID="Label2" runat="server" Text="期刊名称"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style27">
                    <asp:Label ID="Label11" runat="server" Text="出版日期"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtpubdt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style30">
                    <asp:Label ID="Label22" runat="server" Text="期刊等级"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:DropDownList ID="grade" runat="server" DataSourceID="SqlDataSource4" DataTextField="gradename" DataValueField="gradename">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style33">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label4" runat="server" Text="检索机构"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtorgan" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style36">
                    <asp:Label ID="Label7" runat="server" Text="入库日期"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtstockdt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style28">
                    <asp:Label ID="Label9" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style31">
                    <asp:Label ID="Label21" runat="server" Text="期刊语种"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource3" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style33">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label6" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtcn" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style36">
                    <asp:Label ID="Label5" runat="server" Text="出版社名称"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtoffname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style28">
                    <asp:Label ID="Label16" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style31">
                    <asp:Label ID="Label12" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style33">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style36">
                    <asp:Label ID="Label15" runat="server" Text="价格"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style28">
                    <asp:Label ID="Label8" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style31">
                    <asp:Label ID="Label24" runat="server" Text="检索机构"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource5" DataTextField="organname" DataValueField="organname">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style33">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label23" runat="server" Text="出版社地址"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style36">
                    &nbsp;</td>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style28">
                    &nbsp;</td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style31">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td>
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" />
                    <asp:Button ID="btclear" runat="server" OnClick="btclear_Click" Text="清空" />
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [journal_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [journal_grade]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [organization]"></asp:SqlDataSource>
    </form>
</body>
</html>

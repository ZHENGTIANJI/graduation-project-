<%@ Page Language="C#" AutoEventWireup="true" CodeFile="journalstock.aspx.cs" Inherits="stockmanagement_journalstock" %>

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
        .auto-style16 {
            width: 84px;
            text-align: right;
        }
        .auto-style17 {
            width: 65px;
        }
        .auto-style18 {
            width: 398px;
        }
        .auto-style19 {
            width: 15px;
        }
        .auto-style20 {
            width: 159px;
        }
        .auto-style21 {
            width: 180px;
        }
        .auto-style22 {
            height: 20px;
            width: 243px;
        }
        .auto-style23 {
            width: 243px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style21">&nbsp;</td>
                <td class="auto-style16">&nbsp;</td>
                <td class="auto-style18">
                    <h1>
                        <asp:Label ID="Label18" runat="server" Text="学院资料室期刊入库管理"></asp:Label>
                    </h1>
                </td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style19">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">&nbsp;</td>
                <td class="auto-style7">
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
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label20" runat="server" Text="期"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style22">
                    <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="扫描" />
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server" Text="期刊名称"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label11" runat="server" Text="出版日期"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtpubdt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label22" runat="server" Text="期刊等级"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:DropDownList ID="grade" runat="server" DataSourceID="SqlDataSource4" DataTextField="gradename" DataValueField="gradename">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label4" runat="server" Text="检索机构"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtorgan" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label7" runat="server" Text="入库日期"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtstockdt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label9" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label21" runat="server" Text="期刊语种"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource3" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label6" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtcn" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label5" runat="server" Text="出版社名称"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtoffname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label16" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label12" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    <asp:Label ID="Label15" runat="server" Text="价格"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label8" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label24" runat="server" Text="检索机构"></asp:Label>
                </td>
                <td class="auto-style13">
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="SqlDataSource5" DataTextField="organname" DataValueField="organname">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label23" runat="server" Text="出版社地址"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
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

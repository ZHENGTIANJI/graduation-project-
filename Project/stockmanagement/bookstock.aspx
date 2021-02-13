<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookstock.aspx.cs" Inherits="bookstock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        #form1 {
            text-align: center;
        }
        .auto-style1 {
            width: 336px;
        }
        .auto-style2 {
            width: 605px;
        }
        .auto-style18 {
            width: 257px;
            text-align: left;
        }
        .auto-style20 {
            width: 257px;
            height: 23px;
            text-align: left;
        }
        .auto-style22 {
            height: 23px;
            text-align: left;
            width: 79px;
        }
        .auto-style23 {
            width: 79px;
        }
        .auto-style24 {
            height: 23px;
            width: 79px;
            text-align: left;
        }
        .auto-style26 {
            width: 71px;
            text-align: right;
            height: 23px;
        }
        .auto-style28 {
            width: 71px;
            text-align: right;
        }
        .auto-style29 {
            height: 26px;
            text-align: right;
            width: 153px;
        }
        .auto-style31 {
            width: 98px;
            text-align: right;
        }
        .auto-style32 {
            height: 26px;
            text-align: left;
            width: 270px;
        }
        .auto-style33 {
            width: 261px;
            text-align: right;
        }
        .auto-style36 {
            height: 23px;
            text-align: left;
            width: 28px;
        }
        .auto-style37 {
            width: 28px;
        }
        .auto-style40 {
            width: 261px;
            text-align: right;
            height: 31px;
        }
        .auto-style38 {
            width: 28px;
            height: 31px;
        }
        .auto-style44 {
            width: 72px;
            height: 31px;
        }
        .auto-style41 {
            width: 261px;
            text-align: right;
            height: 23px;
        }
        .auto-style48 {
            width: 153px;
            height: 23px;
        }
        .auto-style49 {
            height: 23px;
            text-align: left;
            width: 194px;
        }
        .auto-style50 {
            width: 194px;
            text-align: left;
        }
        .auto-style51 {
            height: 26px;
            text-align: left;
            width: 194px;
        }
        .auto-style52 {
            width: 263px;
            height: 23px;
        }
        .auto-style53 {
            width: 263px;
            text-align: right;
        }
        .auto-style54 {
            height: 26px;
            text-align: right;
            width: 263px;
        }
        .auto-style55 {
            width: 263px;
            text-align: right;
            height: 23px;
        }
        .auto-style58 {
            height: 26px;
            text-align: left;
            width: 257px;
        }
        .auto-style59 {
            width: 152px;
            text-align: right;
            height: 23px;
        }
        .auto-style60 {
            width: 152px;
            text-align: right;
        }
        .auto-style61 {
            width: 153px;
            text-align: right;
        }
        .auto-style62 {
            width: 153px;
            text-align: right;
            height: 23px;
        }
        .auto-style63 {
            height: 23px;
            text-align: left;
            width: 72px;
        }
        .auto-style64 {
            width: 72px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="矿业学院资料室图书入库管理" runat="server" style="text-align: center; font-size: xx-large" Text="矿业学院资料室图书入库管理"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            </table>
                    <table style="width: 100%; height: 190px;">
                        <tr>
                            <td class="auto-style52">
                                &nbsp;</td>
                            <td class="auto-style48">
                                <asp:Label ID="Label25" runat="server" Text="二维码编码"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtQR" runat="server" style="text-align: left"></asp:TextBox>
                                <asp:Button ID="btscan" runat="server" Text="扫描" />
                            </td>
                            <td class="auto-style26">
                                &nbsp;</td>
                            <td class="auto-style59">
                    <asp:Label ID="Label21" runat="server" Text="图书类别"></asp:Label>
                            </td>
                            <td class="auto-style49">
                    <asp:DropDownList ID="bt" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="btname" DataValueField="btname">
                    </asp:DropDownList>
                            </td>
                            <td class="auto-style33">
                                &nbsp;</td>
                            <td class="auto-style36">
                                &nbsp;</td>
                            <td class="auto-style63">&nbsp;</td>
                            <td class="auto-style22">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style53">
                                &nbsp;</td>
                            <td class="auto-style61">
                                <asp:Label ID="Label26" runat="server" Text="书名"></asp:Label>
                            </td>
                            <td class="auto-style18">
                                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style28">
                                &nbsp;</td>
                            <td class="auto-style60">
                    <asp:Label ID="Label22" runat="server" Text="专业"></asp:Label>
                            </td>
                            <td class="auto-style50">
                    <asp:DropDownList ID="major1" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                            </td>
                            <td class="auto-style33">
                                &nbsp;</td>
                            <td class="auto-style37">
                                &nbsp;</td>
                            <td class="auto-style64">&nbsp;</td>
                            <td class="auto-style23">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style54">
                                &nbsp;</td>
                            <td class="auto-style29">
                                <asp:Label ID="Label28" runat="server" Text="出版社"></asp:Label>
                            </td>
                            <td class="auto-style58">
                                <asp:TextBox ID="txtpub" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style31">
                                &nbsp;</td>
                            <td class="auto-style60">
                                <asp:Label ID="Label29" runat="server" Text="图书语种"></asp:Label>
                            </td>
                            <td class="auto-style51">
                                <asp:DropDownList ID="language" runat="server" Height="30px" Width="107px" DataSourceID="SqlDataSource4" DataTextField="lname" DataValueField="lname">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style40">
                                &nbsp;</td>
                            <td class="auto-style38">
                                &nbsp;</td>
                            <td class="auto-style44">&nbsp;</td>
                            <td class="auto-style32">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style55">
                                &nbsp;</td>
                            <td class="auto-style62">
                                <asp:Label ID="Label31" runat="server" Text="编者"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style26">
                                &nbsp;</td>
                            <td class="auto-style59">
                                <asp:Label ID="Label32" runat="server" Text="装订类型"></asp:Label>
                            </td>
                            <td class="auto-style49">
                                <asp:DropDownList ID="bindingtype" runat="server" Height="30px" style="text-align: left" Width="107px" DataSourceID="SqlDataSource3" DataTextField="bitname" DataValueField="bitname">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style41">
                                <asp:Label ID="Label30" runat="server" Text="赠书老师姓名"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtteacher" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style63">
                                &nbsp;</td>
                            <td class="auto-style22">
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style55">
                                &nbsp;</td>
                            <td class="auto-style62">
                                <asp:Label ID="Label34" runat="server" Text="出版日期"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtpubdt" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style26">
                                &nbsp;</td>
                            <td class="auto-style59">
                                <asp:Label ID="Label27" runat="server" Text="是否有光盘"></asp:Label>
                            </td>
                            <td class="auto-style49">
                                <asp:DropDownList ID="CD" runat="server" Height="30px" style="text-align: left" Width="63px">
                                    <asp:ListItem Value="有">有</asp:ListItem>
                                    <asp:ListItem Value="无">无</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style41">
                                <asp:Label ID="Label33" runat="server" Text="入库日期"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtstockdt" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style63">
                                &nbsp;</td>
                            <td class="auto-style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style55">
                                &nbsp;</td>
                            <td class="auto-style62">
                                <asp:Label ID="Label36" runat="server" Text="书号"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtbooknumber" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style26">
                                &nbsp;</td>
                            <td class="auto-style59">
                                <asp:Label ID="Label37" runat="server" style="text-align: right" Text="定价"></asp:Label>
                            </td>
                            <td class="auto-style49">
                                <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style41">
                                <asp:Label ID="Label38" runat="server" Text="存放位置"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style63">
                                &nbsp;</td>
                            <td class="auto-style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style55">
                                &nbsp;</td>
                            <td class="auto-style62">
                                <asp:Label ID="Label39" runat="server" Text="开本"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style26">
                                &nbsp;</td>
                            <td class="auto-style59">
                                <asp:Label ID="Label40" runat="server" Text="页数"></asp:Label>
                            </td>
                            <td class="auto-style49">
                                <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style41">
                                <asp:Label ID="Label41" runat="server" Text="备注"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtnote" runat="server" Width="139px"></asp:TextBox>
                            </td>
                            <td class="auto-style63">
                                <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" />
                            </td>
                            <td class="auto-style24">
                                <asp:Button ID="btclear" runat="server" OnClick="btclear_Click" style="height: 21px" Text="清空" />
                            </td>
                        </tr>
                    </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [book_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [binding_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
    </form>
</body>
</html>

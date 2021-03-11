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
            width: 600px;
        }
        .auto-style18 {
            width: 288px;
            text-align: left;
            height: 27px;
        }
        .auto-style20 {
            width: 288px;
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
            height: 27px;
        }
        .auto-style24 {
            height: 23px;
            width: 79px;
            text-align: left;
        }
        .auto-style29 {
            height: 26px;
            text-align: right;
            width: 480px;
        }
        .auto-style32 {
            height: 26px;
            text-align: left;
            width: 270px;
        }
        .auto-style33 {
            width: 220px;
            text-align: left;
        }
        .auto-style36 {
            height: 23px;
            text-align: left;
            width: 55px;
        }
        .auto-style37 {
            width: 55px;
            height: 27px;
        }
        .auto-style40 {
            width: 389px;
            text-align: right;
            height: 31px;
        }
        .auto-style38 {
            width: 55px;
            height: 31px;
        }
        .auto-style44 {
            width: 72px;
            height: 31px;
        }
        .auto-style48 {
            width: 480px;
            height: 23px;
            text-align: right;
        }
        .auto-style58 {
            height: 26px;
            text-align: left;
            width: 288px;
        }
        .auto-style63 {
            height: 23px;
            text-align: center;
            width: 72px;
        }
        .auto-style64 {
            width: 72px;
            height: 27px;
        }
        .auto-style65 {
            width: 274px;
            text-align: right;
            height: 23px;
        }
        .auto-style66 {
            width: 274px;
            text-align: right;
        }
        .auto-style68 {
            width: 389px;
            text-align: right;
            height: 27px;
        }
        .auto-style70 {
            height: 23px;
            text-align: right;
            width: 320px;
        }
        .auto-style73 {
            width: 480px;
            text-align: right;
            height: 27px;
        }
        .auto-style74 {
            width: 480px;
            text-align: right;
            height: 23px;
        }
        .auto-style75 {
            width: 274px;
            text-align: right;
            height: 27px;
        }
        .auto-style77 {
            height: 23px;
            text-align: left;
            width: 220px;
        }
        .auto-style78 {
            text-align: left;
        }
        .auto-style79 {
            height: 23px;
            text-align: left;
            width: 389px;
        }
        .auto-style80 {
            height: 23px;
            text-align: right;
            width: 389px;
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
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/dataQueryAndModify.aspx" Text="资料统计" Value="资料统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/statistics/paperstatistics.aspx" Text="论文统计" Value="论文统计"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <StaticMenuItemStyle Font-Size="Large" HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#507CD1" />
        </asp:Menu>
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
                            <td class="auto-style48">
                                <asp:Label ID="Label25" runat="server" Text="二维码编码"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtQR" runat="server" style="text-align: left"></asp:TextBox>
                                <asp:Button ID="btscan" runat="server" Text="扫描" />
                            </td>
                            <td class="auto-style70">
                    <asp:Label ID="Label21" runat="server" Text="图书类别"></asp:Label>
                            </td>
                            <td class="auto-style33">
                    <asp:DropDownList ID="bt" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="btname" DataValueField="btname">
                    </asp:DropDownList>
                            </td>
                            <td class="auto-style79">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label26" runat="server" Text="书名"></asp:Label>
                            </td>
                            <td class="auto-style18">
                                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style75">
                    <asp:Label ID="Label22" runat="server" Text="专业"></asp:Label>
                            </td>
                            <td class="auto-style78">
                    <asp:DropDownList ID="major1" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                            </td>
                            <td class="auto-style68">
                                </td>
                            <td class="auto-style37">
                                </td>
                            <td class="auto-style64"></td>
                            <td class="auto-style23"></td>
                        </tr>
                        <tr>
                            <td class="auto-style29">
                                <asp:Label ID="Label28" runat="server" Text="出版社"></asp:Label>
                            </td>
                            <td class="auto-style58">
                                <asp:TextBox ID="txtpub" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style66">
                                <asp:Label ID="Label29" runat="server" Text="图书语种"></asp:Label>
                            </td>
                            <td class="auto-style33">
                                <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource4" DataTextField="lname" DataValueField="lname">
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
                            <td class="auto-style74">
                                <asp:Label ID="Label31" runat="server" Text="编者"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style65">
                                <asp:Label ID="Label32" runat="server" Text="装订类型"></asp:Label>
                            </td>
                            <td class="auto-style33">
                                <asp:DropDownList ID="bindingtype" runat="server" DataSourceID="SqlDataSource3" DataTextField="bitname" DataValueField="bitname">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style80">
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
                            <td class="auto-style74">
                                <asp:Label ID="Label34" runat="server" Text="出版日期"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtpubdt" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style65">
                                <asp:Label ID="Label27" runat="server" Text="是否有光盘"></asp:Label>
                            </td>
                            <td class="auto-style77">
                                <asp:DropDownList ID="CD" runat="server" Height="30px" style="text-align: left" Width="63px">
                                    <asp:ListItem Value="有">有</asp:ListItem>
                                    <asp:ListItem Value="无">无</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style80">
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
                            <td class="auto-style74">
                                <asp:Label ID="Label36" runat="server" Text="书号"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtbooknumber" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style65">
                                <asp:Label ID="Label37" runat="server" style="text-align: right" Text="定价"></asp:Label>
                            </td>
                            <td class="auto-style77">
                                <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style80">
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
                            <td class="auto-style74">
                                <asp:Label ID="Label39" runat="server" Text="开本"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style65">
                                <asp:Label ID="Label40" runat="server" Text="页数"></asp:Label>
                            </td>
                            <td class="auto-style77">
                                <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style80">
                                <asp:Label ID="Label41" runat="server" Text="备注"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtnote" runat="server" Width="139px"></asp:TextBox>
                            </td>
                            <td class="auto-style63">
                                <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" />
                            </td>
                            <td class="auto-style24">
                                <asp:Button ID="btclear" runat="server" OnClick="btclear_Click" style="height: 21px; text-align: center;" Text="清空" />
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

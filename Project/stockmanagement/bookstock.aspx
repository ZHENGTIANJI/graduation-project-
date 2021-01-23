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
        .auto-style3 {
            height: 20px;
        }
        .auto-style11 {
            width: 471px;
            text-align: left;
        }
        .auto-style12 {
            height: 20px;
            width: 491px;
        }
        .auto-style13 {
            width: 491px;
        }
        .auto-style14 {
            width: 81px;
            text-align: right;
        }
        .auto-style15 {
            width: 81px;
            height: 23px;
        }
        .auto-style17 {
            height: 23px;
            text-align: left;
            width: 110px;
        }
        .auto-style18 {
            width: 110px;
        }
        .auto-style19 {
            width: 81px;
            text-align: right;
            height: 23px;
        }
        .auto-style20 {
            width: 110px;
            height: 23px;
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
        .auto-style27 {
            height: 23px;
            text-align: left;
            width: 71px;
        }
        .auto-style28 {
            width: 71px;
        }
        .auto-style29 {
            height: 26px;
            text-align: left;
        }
        .auto-style30 {
            height: 26px;
            text-align: right;
            width: 98px;
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
            width: 270px;
        }
        .auto-style34 {
            height: 20px;
            width: 471px;
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
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width: 100%; height: 234px;">
            <tr>
                <td class="auto-style12">
                    <asp:Label ID="Label1" runat="server" Text="图书类别选择："></asp:Label>
                    <asp:DropDownList ID="DropDownList1" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style34">
                    <asp:Label ID="Label2" runat="server" Text="专业选择："></asp:Label>
                    <asp:DropDownList ID="DropDownList2" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3"></td>
            </tr>
            <tr>
                <td class="auto-style13">
                    <asp:Label ID="Label3" runat="server" Text="图书基本信息"></asp:Label>
                    <table style="width: 100%; height: 190px;">
                        <tr>
                            <td class="auto-style15">
                                <asp:Label ID="Label4" runat="server" Text="二维码编码"></asp:Label>
                            </td>
                            <td class="auto-style17">
                                <asp:TextBox ID="TextBox1" runat="server" style="text-align: left"></asp:TextBox>
                            </td>
                            <td class="auto-style27"></td>
                            <td class="auto-style22">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:Label ID="Label5" runat="server" Text="书名"></asp:Label>
                            </td>
                            <td class="auto-style18">
                                <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style28">&nbsp;</td>
                            <td class="auto-style23">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:Label ID="Label6" runat="server" Text="出版社"></asp:Label>
                            </td>
                            <td class="auto-style18">
                                <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style28">&nbsp;</td>
                            <td class="auto-style23">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label7" runat="server" Text="编者"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style26">
                                <asp:Label ID="Label12" runat="server" Text="装订类型"></asp:Label>
                            </td>
                            <td class="auto-style24">
                                <asp:DropDownList ID="DropDownList3" runat="server" Height="31px" style="text-align: left" Width="107px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label8" runat="server" Text="出版日期"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style26">
                                <asp:Label ID="Label11" runat="server" Text="页数"></asp:Label>
                            </td>
                            <td class="auto-style24">
                                <asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label9" runat="server" Text="书号"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style26">
                                <asp:Label ID="Label10" runat="server" style="text-align: right" Text="定价"></asp:Label>
                            </td>
                            <td class="auto-style24">
                                <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="TextBox9" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style26">
                                <asp:Label ID="Label14" runat="server" Text="图书语种"></asp:Label>
                            </td>
                            <td class="auto-style24">
                                <asp:DropDownList ID="DropDownList4" runat="server" Height="16px" Width="107px">
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </td>
                <td class="auto-style11">
                    <br />
                    <table align="right" style="width: 98%;">
                        <tr>
                            <td class="auto-style30">&nbsp;</td>
                            <td class="auto-style32">&nbsp;</td>
                            <td class="auto-style29">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style30">&nbsp;</td>
                            <td class="auto-style32">&nbsp;</td>
                            <td class="auto-style29">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style30">
                                <asp:Label ID="Label15" runat="server" Text="是否有光盘"></asp:Label>
                            </td>
                            <td class="auto-style32">
                                <asp:DropDownList ID="DropDownList5" runat="server" Height="279px" style="text-align: left" Width="63px">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style29"></td>
                        </tr>
                        <tr>
                            <td class="auto-style31">
                                <asp:Label ID="Label16" runat="server" Text="赠书老师姓名"></asp:Label>
                            </td>
                            <td class="auto-style33">
                                <asp:TextBox ID="TextBox10" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style31">
                                <asp:Label ID="Label17" runat="server" Text="入库日期"></asp:Label>
                            </td>
                            <td class="auto-style33">
                                <asp:TextBox ID="TextBox11" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style31">
                                <asp:Label ID="Label18" runat="server" Text="分类号"></asp:Label>
                            </td>
                            <td class="auto-style33">
                                <asp:TextBox ID="TextBox12" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style31">
                                <asp:Label ID="Label19" runat="server" Text="存放位置"></asp:Label>
                            </td>
                            <td class="auto-style33">
                                <asp:TextBox ID="TextBox13" runat="server"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style31">
                                <asp:Label ID="Label20" runat="server" Text="备注"></asp:Label>
                            </td>
                            <td class="auto-style33">
                                <asp:TextBox ID="TextBox15" runat="server" Width="289px"></asp:TextBox>
                            </td>
                            <td>&nbsp;</td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
                <td>
                    <asp:Button ID="Button1" runat="server" Height="31px" Text="保存" Width="47px" />
&nbsp;&nbsp;
                    <asp:Button ID="Button2" runat="server" Height="31px" style="margin-right: 0px" Text="清空" Width="46px" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

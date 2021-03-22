﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookstock.aspx.cs" Inherits="bookstock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
            height: 55px;
        }

li {
  float: left;
}

li a, .dropbtn {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}

.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
  display: block;
}
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
            text-align: left;
        }
        .auto-style40 {
            width: 392px;
            text-align: right;
            height: 31px;
        }
        .auto-style38 {
            width: 55px;
            height: 31px;
            text-align: left;
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
            width: 392px;
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
            width: 392px;
        }
        .auto-style80 {
            height: 23px;
            text-align: right;
            width: 392px;
        }
    </style>
</head>
<body>
    <ul>
  <li><a href="../main_manager.aspx">首页</a></li>
  <li class="dropdown">
      <a href="javascript:void(0)" class="dropbtn">入库管理</a>
      <div class="dropdown-content">
      <a href="bookstock.aspx">图书入库</a>
      <a href="datastock.aspx">资料入库</a>
      <a href="journalstock.aspx">期刊入库</a>
      <a href="paperstock.aspx">论文入库</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">资料查改</a>
    <div class="dropdown-content">
      <a href="../QueryAndModify/bookQueryAndModify.aspx">图书查改</a>
      <a href="../QueryAndModify/journalQueryAndModify.aspx">期刊查改</a>
      <a href="../QueryAndModify/dataQueryAndModify.aspx">资料查改</a>
      <a href="../QueryAndModify/paperQueryAndModify.aspx">论文查改</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">统计分析</a>
    <div class="dropdown-content">
      <a href="../statistics/bookstatistics.aspx">图书统计</a>
      <a href="../statistics/journalstatistics.aspx">期刊统计</a>
      <a href="../statistics/datastatistics.aspx">资料统计</a>
      <a href="../statistics/paperstatistics.aspx">论文统计</a>
    </div>
  </li>
    <li><a href="../delete.aspx">剔旧</a></li>
</ul>
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
                            <td class="auto-style48">
                                <asp:Label ID="Label25" runat="server" Text="二维码编码"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtQR" runat="server" style="text-align: left"></asp:TextBox>
                            </td>
                            <td class="auto-style70">
                                &nbsp;</td>
                            <td class="auto-style33">
                                &nbsp;</td>
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
                    <asp:Label ID="Label21" runat="server" Text="图书类别"></asp:Label>
                                </td>
                            <td class="auto-style37">
                    <asp:DropDownList ID="bt" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="btname" DataValueField="btname">
                    </asp:DropDownList>
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
                                <asp:Label ID="Label32" runat="server" Text="装订类型"></asp:Label>
                            </td>
                            <td class="auto-style38">
                                <asp:DropDownList ID="bindingtype" runat="server" DataSourceID="SqlDataSource3" DataTextField="bitname" DataValueField="bitname">
                                </asp:DropDownList>
                            </td>
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
                                <asp:Label ID="Label34" runat="server" Text="出版日期"></asp:Label>
                            </td>
                            <td class="auto-style33">
                    <asp:TextBox ID="pub_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label42" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="pub_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label43" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="pub_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label44" runat="server" Text="日"></asp:Label>
                            </td>
                            <td class="auto-style80">
                                <asp:Label ID="Label27" runat="server" Text="是否有光盘"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:DropDownList ID="CD" runat="server" Height="30px" style="text-align: left" Width="63px">
                                    <asp:ListItem Value="有">有</asp:ListItem>
                                    <asp:ListItem Value="无">无</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style63">
                                &nbsp;</td>
                            <td class="auto-style22">
                            </td>
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
                                <asp:Label ID="Label30" runat="server" Text="赠书老师姓名"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtteacher" runat="server"></asp:TextBox>
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
                                &nbsp;</td>
                            <td class="auto-style20">
                                &nbsp;</td>
                            <td class="auto-style65">
                                &nbsp;</td>
                            <td class="auto-style77">
                                &nbsp;</td>
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

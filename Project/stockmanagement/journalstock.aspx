<%@ Page Language="C#" AutoEventWireup="true" CodeFile="journalstock.aspx.cs" Inherits="stockmanagement_journalstock" %>

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
        .auto-style3 {
            height: 20px;
            width: 105px;
        }
        .auto-style17 {
            width: 89px;
        }
        .auto-style18 {
            width: 322px;
            text-align: left;
        }
        .auto-style21 {
            width: 29px;
            text-align: left;
        }
        .auto-style23 {
            width: 210px;
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
            height: 20px;
            text-align: right;
        }
        .auto-style33 {
            text-align: right;
        }
        .auto-style34 {
            height: 20px;
            width: 210px;
        }
        .auto-style38 {
            height: 20px;
            width: 283px;
            text-align: right;
        }
        .auto-style39 {
            width: 283px;
            text-align: right;
        }
        .auto-style44 {
            width: 94px;
            text-align: right;
        }
        .auto-style47 {
            height: 20px;
            width: 176px;
        }
        .auto-style48 {
            width: 176px;
        }
        .auto-style49 {
            height: 20px;
            width: 187px;
        }
        .auto-style50 {
            width: 187px;
        }
        .auto-style51 {
            width: 105px;
            text-align: center;
        }
        .auto-style52 {
            text-align: center;
        }
        .auto-style53 {
            width: 373px;
        }
        .auto-style54 {
            height: 20px;
            width: 264px;
            text-align: right;
        }
        .auto-style55 {
            width: 264px;
            text-align: right;
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
                <td class="auto-style53">&nbsp;</td>
                <td class="auto-style52">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style53">&nbsp;</td>
                <td class="auto-style52">
                    <h1 style="width: 451px; text-align: center;">
                        <asp:Label ID="Label18" runat="server" Text="学院资料室期刊入库管理"></asp:Label>
                    </h1>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style53">&nbsp;</td>
                <td class="auto-style52">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <table style="width:100%;">
            <tr>
                <td class="auto-style31">
                    <asp:Label ID="Label3" runat="server" Text="期刊类别"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:DropDownList ID="jt" runat="server" DataSourceID="SqlDataSource1" DataTextField="jtname" DataValueField="jtname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style44">
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
                <td class="auto-style38">
                    <asp:Label ID="Label1" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style34">
                    <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style54">
                    <asp:Label ID="Label2" runat="server" Text="期刊名称"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style27">
                    <asp:Label ID="Label11" runat="server" Text="出版日期"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:TextBox ID="pub_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label28" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="pub_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label29" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="pub_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label30" runat="server" Text="日"></asp:Label>
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
                <td class="auto-style39">
                    <asp:Label ID="Label6" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtcn" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style55">
                    <asp:Label ID="Label5" runat="server" Text="出版社名称"></asp:Label>
                </td>
                <td class="auto-style50">
                    <asp:TextBox ID="txtoffname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style28">
                    <asp:Label ID="Label9" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style48">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style31">
                    <asp:Label ID="Label21" runat="server" Text="期刊语种"></asp:Label>
                </td>
                <td class="auto-style51">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource3" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style33">
                    &nbsp;</td>
                <td class="auto-style39">
                    <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style55">
                    <asp:Label ID="Label15" runat="server" Text="价格"></asp:Label>
                </td>
                <td class="auto-style50">
                    <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style28">
                    <asp:Label ID="Label16" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style48">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style31">
                    <asp:Label ID="Label12" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style51">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style33">
                    &nbsp;</td>
                <td class="auto-style39">
                    <asp:Label ID="Label23" runat="server" Text="出版社地址"></asp:Label>
                </td>
                <td class="auto-style23">
                    <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style55">
                    &nbsp;</td>
                <td class="auto-style50">
                    &nbsp;</td>
                <td class="auto-style28">
                    <asp:Label ID="Label8" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style48">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style31">
                    <asp:Label ID="Label24" runat="server" Text="检索机构"></asp:Label>
                </td>
                <td class="auto-style51">
                    <asp:DropDownList ID="organ" runat="server" DataSourceID="SqlDataSource5" DataTextField="organname" DataValueField="organname">
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style33">
                    &nbsp;</td>
                <td class="auto-style39">
                    &nbsp;</td>
                <td class="auto-style23">
                    &nbsp;</td>
                <td class="auto-style55">
                    &nbsp;</td>
                <td class="auto-style50">
                    &nbsp;</td>
                <td class="auto-style28">
                    &nbsp;</td>
                <td class="auto-style48">
                    &nbsp;</td>
                <td class="auto-style31">&nbsp;</td>
                <td class="auto-style51">
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" />
                    </td>
                <td>
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

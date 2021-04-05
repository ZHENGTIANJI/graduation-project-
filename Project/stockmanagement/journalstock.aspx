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
ri{
    float:right;
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
}        .table-a table{border-bottom:1px solid black;border-top:1px solid black;}
         .table-b table{border-bottom:1px solid black;}
         .table-c table{border-top:1px solid black;}
        .auto-style56 {
            height: 24px;
        }
        .auto-style75 {
            width: 691px;
        }
        .auto-style76 {
            height: 24px;
            width: 691px;
        }
        .auto-style77 {
            width: 99px;
        }
        .auto-style78 {
            height: 24px;
            width: 99px;
        }
        .auto-style87 {
            text-align: left;
            width: 270px;
        }
        .auto-style88 {
            text-align: left;
            width: 200px;
        }
        .auto-style89 {
            text-align: right;
            width: 104px;
        }
        .auto-style92 {
            width: 250px;
            text-align: right;
        }
        .auto-style93 {
            width: 90px;
            text-align: right;
        }
        .auto-style99 {
            text-align: left;
            width: 177px;
        }
        .auto-style101 {
            width: 250px;
            text-align: right;
            height: 27px;
        }
        .auto-style102 {
            text-align: left;
            width: 177px;
            height: 27px;
        }
        .auto-style103 {
            text-align: right;
            width: 104px;
            height: 27px;
        }
        .auto-style104 {
            text-align: left;
            width: 200px;
            height: 27px;
        }
        .auto-style105 {
            width: 90px;
            text-align: right;
            height: 27px;
        }
        .auto-style106 {
            text-align: left;
            width: 270px;
            height: 27px;
        }
    </style>
</head>
<body>
     <ul>
         <ri><asp:Label ID="user" runat="server" ForeColor="White" Font-Size="Medium"></asp:Label></ri>
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
   <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">剔旧管理</a>
    <div class="dropdown-content">
      <a href="../delete/bookdelete.aspx">图书剔旧</a>
      <a href="../delete/journaldelete.aspx">期刊剔旧</a>
      <a href="../delete/datadelete.aspx">资料剔旧</a>
      <a href="../delete/paperdelete.aspx">论文剔旧</a>
    </div>
  </li>
</ul>
    <form id="form1" runat="server">
        <div>
              <table style="width:100%;">
            <tr>
                <td style="text-align: center">
                    <h1>
                        <asp:Label ID="Label18" runat="server" Text="期刊入库管理"></asp:Label>
                    </h1>
                </td>
            </tr>
            </table>
        </div>
        <div class="table-a">
                    <table style="width:100%;">
            <tr>
                <td class="auto-style92">
                    <asp:Label ID="Label3" runat="server" Text="期刊类别"></asp:Label>
                </td>
                <td class="auto-style99">
                    <asp:DropDownList ID="jt" runat="server" DataSourceID="SqlDataSource1" DataTextField="jtname" DataValueField="jtname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style89">
                    <asp:Label ID="Label17" runat="server" Text="出版周期"></asp:Label>
                </td>
                <td class="auto-style88">
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
                <td class="auto-style93">
                    <asp:Label ID="Label19" runat="server" Text="年第"></asp:Label>
                </td>
                <td class="auto-style87">
                    <asp:TextBox ID="txtpn" runat="server" Width="20px"></asp:TextBox>
                    <asp:Label ID="Label20" runat="server" Text="期"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style92">
                    <asp:Label ID="Label12" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style99">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style89">
                    <asp:Label ID="Label22" runat="server" Text="期刊等级"></asp:Label>
                </td>
                <td class="auto-style88">
                    <asp:DropDownList ID="grade" runat="server" DataSourceID="SqlDataSource4" DataTextField="gradename" DataValueField="gradename">
                    </asp:DropDownList>
                </td>
                <td class="auto-style93">
                    <asp:Label ID="Label24" runat="server" Text="检索机构"></asp:Label>
                </td>
                <td class="auto-style87">
                    <asp:DropDownList ID="organ" runat="server" DataSourceID="SqlDataSource5" DataTextField="organname" DataValueField="organname">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style92">
                    <asp:Label ID="Label1" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style99">
                    <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style89">
                    <asp:Label ID="Label2" runat="server" Text="期刊名称"></asp:Label>
                </td>
                <td class="auto-style88">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style93">
                    <asp:Label ID="Label21" runat="server" Text="期刊语种"></asp:Label>
                </td>
                <td class="auto-style87">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource3" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style101">
                    <asp:Label ID="Label6" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style102">
                    <asp:TextBox ID="txtcn" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style103">
                    <asp:Label ID="Label5" runat="server" Text="出版社名称"></asp:Label>
                </td>
                <td class="auto-style104">
                    <asp:TextBox ID="txtoffname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style105">
                    <asp:Label ID="Label11" runat="server" Text="出版日期"></asp:Label>
                </td>
                <td class="auto-style106">
                    <asp:TextBox ID="pub_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label28" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="pub_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label29" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="pub_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label30" runat="server" Text="日"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style101">
                    <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style102">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style103">
                    <asp:Label ID="Label15" runat="server" Text="价格"></asp:Label>
                </td>
                <td class="auto-style104">
                    <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style105">
                    <asp:Label ID="Label9" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style106">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style92">
                    <asp:Label ID="Label23" runat="server" Text="出版社地址"></asp:Label>
                </td>
                <td class="auto-style99">
                    <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style89">
                    <asp:Label ID="Label16" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style88">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style93">
                    <asp:Label ID="Label8" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style87">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
            </tr>
        </table>
        </div>



        <table style="width:100%;">
            <tr>
                <td class="auto-style75">&nbsp;</td>
                <td class="auto-style77">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style76"></td>
                <td class="auto-style78">
                    <asp:Button ID="btclear" runat="server" OnClick="btclear_Click" Text="清空" Width="80px" />
                </td>
                <td class="auto-style56">
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" Width="80px" />
                    </td>
            </tr>
            <tr>
                <td class="auto-style75">&nbsp;</td>
                <td class="auto-style77">&nbsp;</td>
                <td>&nbsp;</td>
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

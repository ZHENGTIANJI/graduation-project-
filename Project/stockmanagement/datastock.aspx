<%@ Page Language="C#" AutoEventWireup="true" CodeFile="datastock.aspx.cs" Inherits="stockmanagement_datastock" %>

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
        .table-a table{border-bottom:1px solid black;border-top:1px solid black;}
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
        .auto-style2 {
            text-align: right;
            width: 370px;
        }
        .auto-style4 {
            width: 370px;
        }
        .auto-style5 {
            width: 195px;
        }
        .auto-style8 {
            text-align: right;
            width: 100px;
        }
        .auto-style10 {
            width: 199px;
        }
        .auto-style11 {
            text-align: right;
            width: 101px;
        }
        .auto-style12 {
            width: 101px;
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
        <h1 style="text-align: center">  
          <asp:Label ID="Label14" runat="server" Text="资料入库管理"></asp:Label>
        </h1>
        <div class="table-a">
             <table style="width:100%;">
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label12" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource3" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label3" runat="server" Text="资料类别"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="dt" runat="server" DataSourceID="SqlDataSource1" DataTextField="dtname" DataValueField="dtname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="Label10" runat="server" Text="语言种类"></asp:Label>
                </td>
                <td>
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource2" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label2" runat="server" Text="资料名称"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="Label11" runat="server" Text="编著日期"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="write_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label28" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="write_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label29" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="write_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label30" runat="server" Text="日"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label4" runat="server" Text="编著单位"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtunit" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="Label9" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label6" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtcn" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style11">
                    <asp:Label ID="Label5" runat="server" Text="作者"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style8">
                    <asp:Label ID="Label16" runat="server" Text="页数"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style8">
                    <asp:Label ID="Label8" runat="server" Text="备注"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
            </tr>
            </table>
        </div>
       
             <table style="width:100%;">
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style12" style="text-align: center">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style12" style="text-align: left">
                    <asp:Button ID="btclear" runat="server" OnClick="btclear_Click" Text="清空" Width="80px" />
                </td>
                <td>
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" Width="80px" />
                    </td>
            </tr>
        </table>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [data_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
    </form>
</body>
</html>

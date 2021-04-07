<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookstock.aspx.cs" Inherits="bookstock" %>

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
.table-a table{border-bottom:1px solid black;border-top:1px solid black;}
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
        .auto-style33 {
            width: 173px;
            text-align: left;
        }
        .auto-style70 {
            height: 23px;
            text-align: right;
            width: 224px;
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
            width: 224px;
            text-align: right;
            height: 27px;
        }
        .auto-style81 {
            width: 100px;
        }
        .auto-style82 {
            width: 671px;
        }
        .auto-style83 {
            width: 160px;
        }
        .auto-style84 {
            width: 671px;
            height: 31px;
        }
        .auto-style85 {
            width: 100px;
            height: 31px;
            text-align: left;
        }
        .auto-style86 {
            width: 160px;
            height: 31px;
            text-align: left;
        }
        .auto-style87 {
            height: 31px;
        }
        .auto-style90 {
            height: 23px;
            text-align: left;
            width: 232px;
        }
        .auto-style92 {
            width: 232px;
            text-align: left;
            height: 27px;
        }
        .auto-style104 {
            width: 186px;
            text-align: left;
            height: 27px;
        }
        .auto-style106 {
            height: 23px;
            text-align: left;
            width: 186px;
        }
        .auto-style110 {
            width: 173px;
            text-align: left;
            height: 27px;
        }
        .auto-style111 {
            height: 23px;
            text-align: left;
            width: 173px;
        }
        .auto-style112 {
            width: 280px;
            text-align: right;
            height: 27px;
        }
        .auto-style113 {
            height: 23px;
            text-align: right;
            width: 280px;
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
                    <h1>
                    <asp:Label ID="矿业学院资料室图书入库管理" runat="server" style="text-align: center; font-size: xx-large" Text="图书入库管理"></asp:Label>
                    </h1>
        <div class="table-a" style="background-color:ButtonFace">
            <table style="width: 100%; height: 190px;">
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label25" runat="server" Text="二维码编码"></asp:Label>
                            </td>
                            <td class="auto-style104">
                                <asp:TextBox ID="txtQR" runat="server" style="text-align: left"></asp:TextBox>
                            </td>
                            <td class="auto-style75">
                    <asp:Label ID="Label21" runat="server" Text="图书类别"></asp:Label>
                                </td>
                            <td class="auto-style110">
                    <asp:DropDownList ID="bt" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="btname" DataValueField="btname">
                    </asp:DropDownList>
                                </td>
                            <td class="auto-style112"></td>
                            <td class="auto-style92"></td>
                            <td class="auto-style92"></td>
                        </tr>
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label26" runat="server" Text="书名"></asp:Label>
                            </td>
                            <td class="auto-style104">
                                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style75">
                    <asp:Label ID="Label22" runat="server" Text="专业"></asp:Label>
                            </td>
                            <td class="auto-style33">
                    <asp:DropDownList ID="major1" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                            </td>
                            <td class="auto-style112">
                                <asp:Label ID="Label32" runat="server" Text="装订类型"></asp:Label>
                                </td>
                            <td class="auto-style92">
                                <asp:DropDownList ID="bindingtype" runat="server" DataSourceID="SqlDataSource3" DataTextField="bitname" DataValueField="bitname">
                                </asp:DropDownList>
                                </td>
                            <td class="auto-style92">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label28" runat="server" Text="出版社"></asp:Label>
                            </td>
                            <td class="auto-style104">
                                <asp:TextBox ID="txtpub" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style75">
                                <asp:Label ID="Label29" runat="server" Text="图书语种"></asp:Label>
                            </td>
                            <td class="auto-style110">
                                <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource4" DataTextField="lname" DataValueField="lname">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style112">
                                <asp:Label ID="Label27" runat="server" Text="是否有光盘"></asp:Label>
                            </td>
                            <td class="auto-style92">
                                <asp:DropDownList ID="CD" runat="server" style="text-align: left" >
                                    <asp:ListItem Value="有">有</asp:ListItem>
                                    <asp:ListItem Value="无">无</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style92">
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label31" runat="server" Text="编者"></asp:Label>
                            </td>
                            <td class="auto-style104">
                                <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style75">
                                <asp:Label ID="Label34" runat="server" Text="出版日期"></asp:Label>
                            </td>
                            <td class="auto-style110">
                    <asp:TextBox ID="pub_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label42" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="pub_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label43" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="pub_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label44" runat="server" Text="日"></asp:Label>
                            </td>
                            <td class="auto-style112">
                                <asp:Label ID="Label30" runat="server" Text="赠书老师姓名"></asp:Label>
                            </td>
                            <td class="auto-style92">
                                <asp:TextBox ID="txtteacher" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style92">
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label36" runat="server" Text="书号"></asp:Label>
                            </td>
                            <td class="auto-style104">
                                <asp:TextBox ID="txtbooknumber" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style75">
                                <asp:Label ID="Label37" runat="server" style="text-align: right" Text="定价"></asp:Label>
                            </td>
                            <td class="auto-style110">
                                <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style112">
                                <asp:Label ID="Label38" runat="server" Text="存放位置"></asp:Label>
                            </td>
                            <td class="auto-style92">
                                <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style92">
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style74">
                                <asp:Label ID="Label39" runat="server" Text="开本"></asp:Label>
                            </td>
                            <td class="auto-style106">
                                <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style70">
                                <asp:Label ID="Label40" runat="server" Text="页数"></asp:Label>
                            </td>
                            <td class="auto-style111">
                                <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style113">
                                <asp:Label ID="Label41" runat="server" Text="备注"></asp:Label>
                            </td>
                            <td class="auto-style90">
                                <asp:TextBox ID="txtnote" runat="server" ></asp:TextBox>
                            </td>
                            <td class="auto-style90">
                                &nbsp;</td>
                        </tr>
                        </table>
        </div>            
        
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style82">&nbsp;</td>
                            <td class="auto-style81">&nbsp;</td>
                            <td class="auto-style83">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style84"></td>
                            <td class="auto-style85">
                                <asp:Button ID="btclear" runat="server" OnClick="btclear_Click" style="text-align: center;" Text="清空" Width="80px" />
                            </td>
                            <td class="auto-style86">
                                <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" Width="80px" />
                            </td>
                            <td class="auto-style87"></td>
                        </tr>
                        <tr>
                            <td class="auto-style82">&nbsp;</td>
                            <td class="auto-style81">&nbsp;</td>
                            <td class="auto-style83">&nbsp;</td>
                        </tr>
                    </table>
        
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [book_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [binding_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
    </form>
</body>
</html>

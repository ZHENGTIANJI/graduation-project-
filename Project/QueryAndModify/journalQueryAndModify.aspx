<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="journalQueryAndModify.aspx.cs" Inherits="QueryAndModify_journalQueryAndModify" %>

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
        .hidden { display:none;}
        .auto-style2 {
            width: 150px;
            text-align: left;
        }
        .auto-style4 {
            width: 100px;
            text-align: left;
        }
        .auto-style8 {
            width: 160px;
        }
        .auto-style12 {
            width: 101px;
        }
        .auto-style15 {
            width: 80px;
            text-align: left;
        }
        .auto-style17 {
            width: 87px;
        }
        .auto-style20 {
            width: 94px;
            text-align: right;
        }
        .auto-style21 {
            width: 94px;
            height: 25px;
        }
        .auto-style22 {
            width: 80px;
            }
        .auto-style23 {
            width: 86px;
            text-align: right;
        }
        .auto-style24 {
            width: 82px;
            text-align: right;
        }
        .auto-style25 {
            width: 160px;
            height: 25px;
        }
        .auto-style29 {
            width: 87px;
            height: 25px;
        }
        .auto-style30 {
            width: 101px;
            height: 25px;
        }
        .auto-style31 {
            width: 100px;
            height: 25px;
            text-align: right;
        }
        .auto-style32 {
            width: 100px;
            text-align: right;
        }
        .auto-style33 {
            width: 101px;
            text-align: left;
        }
    </style>
</head>
<body>
    <ul>
  <li><a href="../main_manager.aspx">首页</a></li>
  <li class="dropdown">
      <a href="javascript:void(0)" class="dropbtn">入库管理</a>
      <div class="dropdown-content">
      <a href="../stockmanagement/bookstock.aspx">图书入库</a>
      <a href="../stockmanagement/datastock.aspx">资料入库</a>
      <a href="../stockmanagement/journalstock.aspx">期刊入库</a>
      <a href="../stockmanagement/paperstock.aspx">论文入库</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">资料查改</a>
    <div class="dropdown-content">
      <a href="bookQueryAndModify.aspx">图书查改</a>
      <a href="journalQueryAndModify.aspx">期刊查改</a>
      <a href="dataQueryAndModify.aspx">资料查改</a>
      <a href="paperQueryAndModify.aspx">论文查改</a>
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
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style22">
                    <asp:Label ID="Label1" runat="server" Text="期刊名称" style="text-align: right"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="journalname" runat="server" style="text-align: left"></asp:TextBox>
                </td>
                <td class="auto-style23">
                    <asp:Label ID="Label2" runat="server" Text="期刊类型" style="text-align: right"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="jt" runat="server" style="text-align: left">
                    </asp:DropDownList>
                </td>
                <td class="auto-style24">
                    <asp:Label ID="Label3" runat="server" Text="专业类型" style="text-align: right"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="mt" runat="server" style="text-align: left">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="query" runat="server" OnClick="query_Click" Text="查询" />
                </td>
            </tr>
            <tr>
                <td class="auto-style22">
                    <asp:Button ID="export" runat="server" OnClick="export_Click1" Text="导出excel" />
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="margin-top: 0px" OnRowDeleting="GridView1_RowDeleting" AllowPaging="true" PageSize="10" onpageindexchanging="GridViewHistory_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="期刊名称" SortExpression="name" />
                <asp:BoundField DataField="jtname" HeaderText="期刊类型" SortExpression="jtname" />
                <asp:BoundField DataField="gradename" HeaderText="期刊等级" SortExpression="gradename" />
                <asp:BoundField DataField="mname" HeaderText="专业" SortExpression="mname" />
                <asp:BoundField DataField="QR_code" HeaderText="二维码编码" SortExpression="QR_code" />
                <asp:BoundField DataField="publish_dt" HeaderText="出版日期" SortExpression="publish_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="stock_dt" HeaderText="入库日期" SortExpression="stock_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="period_type" HeaderText="期刊周期" SortExpression="period_type" />
                <asp:BoundField DataField="office_name" HeaderText="杂志社名称" SortExpression="office_name" />
                <asp:BoundField DataField="lname" HeaderText="期刊语种" SortExpression="lname" />
                <asp:BoundField DataField="class_number" HeaderText="分类号" SortExpression="class_number" />
                <asp:BoundField DataField="period_number" HeaderText="周期数" SortExpression="period_number" />
                <asp:BoundField DataField="status" HeaderText="库存状况" SortExpression="status" />
                <asp:BoundField DataField="organname" HeaderText="检索机构" SortExpression="organname" />
                <asp:BoundField DataField="location" HeaderText="存放位置" SortExpression="location" />
                <asp:BoundField DataField="number" HeaderText="数量" SortExpression="number" />
                <asp:BoundField DataField="address" HeaderText="杂志社地址" SortExpression="address" />
                <asp:BoundField DataField="number_of_page" HeaderText="页数" />
                <asp:BoundField DataField="format" HeaderText="开本" />
                <asp:BoundField DataField="note" HeaderText="备注" SortExpression="note" />
                <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" >
                    <HeaderStyle CssClass="hidden" />
                    <ItemStyle  CssClass="hidden" />
                    <FooterStyle CssClass="hidden" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="编辑"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerTemplate>
                <asp:LinkButton ID="lb_firstpage" runat="server" onclick="lb_firstpage_Click">首页</asp:LinkButton>
                <asp:LinkButton ID="lb_previouspage" runat="server"
                onclick="lb_previouspage_Click">上一页</asp:LinkButton>
                <asp:LinkButton ID="lb_nextpage" runat="server" onclick="lb_nextpage_Click">下一页</asp:LinkButton>
                <asp:LinkButton ID="lb_lastpage" runat="server" onclick="lb_lastpage_Click">尾页</asp:LinkButton>
                第<asp:Label ID="lbl_nowpage" runat="server" Text="<%#GridView1.PageIndex+1 %>" ForeColor="#db530f"></asp:Label>页/共<asp:Label
                ID="lbl_totalpage" runat="server" Text="<%#GridView1.PageCount %>" ForeColor="#db530f"></asp:Label>页
</PagerTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [journal_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [journal]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [journal_grade]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [organization]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource7" runat="server"></asp:SqlDataSource>
        <table style="width:100%;">
            <tr>
                <td class="auto-style21">
                    </td>
                <td class="auto-style25">
                    </td>
                <td class="auto-style31">
                    </td>
                <td class="auto-style15">
                    </td>
                <td class="auto-style31">
                    </td>
                <td class="auto-style30">
                    </td>
                <td class="auto-style29">
                    </td>
                <td class="auto-style29">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label4" runat="server" Text="期刊名称"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtname" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label5" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtQR" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label24" runat="server" Text="年第"></asp:Label>
                </td>
                <td class="auto-style33">
                    <asp:TextBox ID="txtperiod" runat="server" Width="21px"></asp:TextBox>
                    <asp:Label ID="Label26" runat="server" Text="期"></asp:Label>
                </td>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style17">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label9" runat="server" Text="杂志社名称"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtoffname" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label6" runat="server" Text="期刊类型"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="journaltype" runat="server" DataSourceID="SqlDataSource1" DataTextField="jtname" DataValueField="jtname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label25" runat="server" Text="检索机构"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:DropDownList ID="organ" runat="server" DataSourceID="SqlDataSource6" DataTextField="organname" DataValueField="organname">
                        <asp:ListItem>SCI</asp:ListItem>
                        <asp:ListItem>EI</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label10" runat="server" Text="入库日期"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="stock_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label45" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="stock_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label46" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="stock_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label47" runat="server" Text="日"></asp:Label>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label7" runat="server" Text="期刊语言"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource5" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label27" runat="server" Text="期刊周期"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:DropDownList ID="periodtype" runat="server">
                        <asp:ListItem>日刊</asp:ListItem>
                        <asp:ListItem>周刊</asp:ListItem>
                        <asp:ListItem>半月刊</asp:ListItem>
                        <asp:ListItem>月刊</asp:ListItem>
                        <asp:ListItem>双月刊</asp:ListItem>
                        <asp:ListItem>季刊</asp:ListItem>
                        <asp:ListItem>半年刊</asp:ListItem>
                        <asp:ListItem>年刊</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style17">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label11" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label8" runat="server" Text="专业类型"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label16" runat="server" Text="库存状况"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:DropDownList ID="status" runat="server">
                        <asp:ListItem>库存</asp:ListItem>
                        <asp:ListItem>借出</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style17">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label21" runat="server" Text="出版日期"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="pub_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label42" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="pub_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label43" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="pub_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label44" runat="server" Text="日"></asp:Label>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label22" runat="server" Text="期刊等级"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="grade" runat="server" DataSourceID="SqlDataSource4" DataTextField="gradename" DataValueField="gradename">
                    </asp:DropDownList>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label23" runat="server" Text="杂志社地址"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label19" runat="server" Text="库存数量"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtnumber" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label14" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtnumberofpage" runat="server" Width="151px"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label18" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style17">
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" />
                </td>
                <td class="auto-style17">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label13" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtcn" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    <asp:Label runat="server" Text="开本" ID="Label20"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtformat" runat="server" Width="150px"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style17">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>

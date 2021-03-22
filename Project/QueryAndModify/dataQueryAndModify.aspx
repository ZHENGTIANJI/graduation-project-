﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="dataQueryAndModify.aspx.cs" Inherits="QueryAndModify_dataQueryAndModify" %>

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
        .auto-style1 {
            width: 143px;
        }
        .auto-style2 {
            width: 65px;
        }
        .auto-style3 {
            width: 69px;
        }
        .auto-style4 {
            width: 70px;
        }
        .auto-style5 {
            width: 75px;
        }
        .auto-style6 {
            width: 148px;
        }
        .auto-style8 {
            width: 156px;
        }
        .auto-style11 {
            width: 168px;
            text-align: right;
        }
        .auto-style12 {
            width: 149px;
        }
        .auto-style14 {
            width: 141px;
        }
        .auto-style15 {
            width: 169px;
            text-align: left;
        }
        .auto-style16 {
            width: 192px;
            height: 24px;
        }
        .auto-style17 {
            width: 154px;
            height: 24px;
        }
        .auto-style18 {
            width: 154px;
            text-align: right;
        }
        .auto-style19 {
            width: 192px;
            text-align: right;
        }
        .auto-style21 {
            width: 48px;
            text-align: right;
        }
        .auto-style22 {
            width: 156px;
            height: 24px;
        }
        .auto-style23 {
            width: 169px;
            text-align: left;
            height: 24px;
        }
        .auto-style24 {
            width: 154px;
            text-align: left;
            height: 24px;
        }
        .auto-style25 {
            width: 168px;
            text-align: right;
            height: 24px;
        }
        .auto-style26 {
            width: 149px;
            height: 24px;
        }
        .auto-style27 {
            width: 48px;
            text-align: right;
            height: 24px;
        }
        .auto-style28 {
            width: 141px;
            height: 24px;
        }
        .auto-style29 {
            height: 24px;
        }
        .auto-style30 {
            width: 154px;
            text-align: right;
            height: 27px;
        }
        .auto-style31 {
            width: 156px;
            height: 27px;
        }
        .auto-style32 {
            width: 192px;
            text-align: right;
            height: 27px;
        }
        .auto-style33 {
            width: 169px;
            text-align: left;
            height: 27px;
        }
        .auto-style35 {
            width: 168px;
            text-align: right;
            height: 27px;
        }
        .auto-style36 {
            width: 149px;
            height: 27px;
        }
        .auto-style37 {
            width: 48px;
            text-align: right;
            height: 27px;
        }
        .auto-style38 {
            width: 141px;
            height: 27px;
        }
        .auto-style39 {
            height: 27px;
        }
        .auto-style40 {
            width: 168px;
        }
        .auto-style41 {
            width: 149px;
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
    <li><a href="../delete.aspx">剔旧</a></li>
</ul>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="资料名称"></asp:Label>
                </td>
                <td class="auto-style1">
                    <asp:TextBox ID="dataname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="资料类型"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="datatype" runat="server" DataSourceID="SqlDataSource1" DataTextField="dtname" DataValueField="dtname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style4">
                    <asp:Label ID="Label3" runat="server" Text="专业类型"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="majortype" runat="server" DataSourceID="SqlDataSource3" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="query" runat="server" OnClick="query_Click" Text="查询" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="margin-top: 0px" OnRowDeleting="GridView1_RowDeleting" AllowPaging="true" PageSize="10" onpageindexchanging="GridViewHistory_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="资料名称" SortExpression="name" />
                <asp:BoundField DataField="dtname" HeaderText="资料类型名称" />
                <asp:BoundField DataField="QR_code" HeaderText="二维码" SortExpression="QR_code" />
                <asp:BoundField DataField="unit" HeaderText="编著单位" SortExpression="unit" />
                <asp:BoundField DataField="stock_dt" HeaderText="入库日期" SortExpression="stock_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="location" HeaderText="存放位置" SortExpression="location" />
                <asp:BoundField DataField="number" HeaderText="库存数量" SortExpression="number" />
                <asp:BoundField DataField="class_number" HeaderText="分类号" SortExpression="class_number" />
                <asp:BoundField DataField="lname" HeaderText="资料语种" SortExpression="language" />
                <asp:BoundField DataField="compile_dt" HeaderText="编著日期" SortExpression="compile_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="format" HeaderText="开本" SortExpression="format" />
                <asp:BoundField DataField="number_of_page" HeaderText="页数" SortExpression="number_of_page" />
                <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
                <asp:BoundField DataField="mname" HeaderText="专业类型" SortExpression="major_id" />
                <asp:BoundField DataField="status" HeaderText="库存状况" SortExpression="status" />
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [data_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
        <table style="width:111%;">
            <tr>
                <td class="auto-style17">
                    </td>
                <td class="auto-style22">
                    </td>
                <td class="auto-style16">
                    </td>
                <td class="auto-style23">
                    </td>
                <td class="auto-style24">
                    </td>
                <td class="auto-style25">
                    </td>
                <td class="auto-style26">
                    </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="Label4" runat="server" Text="资料名称"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label5" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="Label12" runat="server" Text="编著日期"></asp:Label>
                </td>
                <td class="auto-style40">
                    <asp:TextBox ID="write_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label42" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="write_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label43" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="write_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label44" runat="server" Text="日"></asp:Label>
                </td>
                <td class="auto-style41">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="Label9" runat="server" Text="编著单位"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtunit" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label6" runat="server" Text="资料类型"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="dt" runat="server" DataSourceID="SqlDataSource1" DataTextField="dtname" DataValueField="dtname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="Label13" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtcn" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style18">
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
                <td class="auto-style19">
                    <asp:Label ID="Label7" runat="server" Text="资料语言"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource4" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style18">
                    <asp:Label runat="server" Text="开本" ID="Label20"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style12">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style30">
                    <asp:Label ID="Label11" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style31">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style32">
                    <asp:Label ID="Label8" runat="server" Text="专业类型"></asp:Label>
                </td>
                <td class="auto-style33">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource3" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style30">
                    <asp:Label ID="Label14" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style35">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style36">
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="Label19" runat="server" Text="库存数量"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label16" runat="server" Text="库存状况"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="status" runat="server">
                        <asp:ListItem>库存</asp:ListItem>
                        <asp:ListItem>借出</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="Label18" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style41">
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" />
                </td>
            </tr>
            <tr>
                <td class="auto-style18">
                    <asp:Label ID="Label15" runat="server" Text="作者"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    &nbsp;</td>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>

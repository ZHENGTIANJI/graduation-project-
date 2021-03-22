<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paperstock.aspx.cs" Inherits="QueryAndModify_paperQueryAndModify" %>

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
        }
        .auto-style4 {
            width: 100px;
        }
        .auto-style5 {
            width: 74px;
        }
        .auto-style46 {
            width: 80px;
        }
        .auto-style61 {
            width: 80px;
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
                <td class="auto-style46">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style61">
                    <asp:Label ID="Label1" runat="server" Text="论文名称"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="papername" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style61">
                    <asp:Label ID="Label56" runat="server" Text="论文类型"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="papertype" runat="server" DataSourceID="SqlDataSource1" DataTextField="ptname" DataValueField="ptname" Height="18px">
                        <asp:ListItem Value="全部"></asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style61">
                    <asp:Label ID="Label3" runat="server" Text="专业类型"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="majortype" runat="server" DataSourceID="SqlDataSource4" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="query" runat="server" OnClick="query_Click" Text="查询" />
                </td>
            </tr>
            <tr>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [paper_type]"></asp:SqlDataSource>

        <asp:GridView ID="GridView1" runat="server" ShowCellToolTip=" True"  AutoGenerateColumns="False" style="margin-top: 0px" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" onpageindexchanging="GridViewHistory_PageIndexChanging">
            <Columns>
                <asp:TemplateField HeaderText="二维码编码" SortExpression="QR_code">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("QR_code") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtQR" runat="server" Width="90px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="name" HeaderText="论文名称" SortExpression="name" />
                <asp:BoundField DataField="ptname" HeaderText="论文类型" SortExpression="ptname" />
                <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
                <asp:BoundField DataField="xuezhi" HeaderText="学制" SortExpression="xuezhi" />
                <asp:BoundField DataField="mname" HeaderText="专业类型" SortExpression="mname" />
                <asp:BoundField DataField="direction" HeaderText="研究方向" SortExpression="direction" />
                <asp:BoundField DataField="stock_dt" HeaderText="入库日期" SortExpression="stock_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:TemplateField HeaderText="存放位置" SortExpression="location">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("location") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtlocation" runat="server" Width="50px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="status" HeaderText="库存状况" SortExpression="status" />
                <asp:BoundField DataField="adviser" HeaderText="指导老师" SortExpression="adviser" />
                <asp:BoundField DataField="zhicheng" HeaderText="职称" SortExpression="zhicheng" />
                <asp:BoundField DataField="dabian_dt" HeaderText="答辩日期" SortExpression="dabian_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:TemplateField HeaderText="分类号" SortExpression="class_number">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("class_number") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtcn" runat="server" Width="50px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="shenhe" HeaderText="审核状态" SortExpression="shenhe" />
                <asp:BoundField DataField="write_dt" HeaderText="编著时间" SortExpression="write_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="lname" HeaderText="语言" SortExpression="lname" />
                <asp:BoundField DataField="format" HeaderText="开本" SortExpression="format" />
                <asp:BoundField DataField="number_of_page" HeaderText="页数" SortExpression="number_of_page" />
                <asp:BoundField DataField="number" HeaderText="库存数目" SortExpression="number" />
                <asp:BoundField DataField="note" HeaderText="备注" SortExpression="note" />
                <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" >
                    <HeaderStyle CssClass="hidden" />
                    <ItemStyle  CssClass="hidden" />
                    <FooterStyle CssClass="hidden" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="审核"></asp:LinkButton>
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
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
    </form>
</body>
</html>

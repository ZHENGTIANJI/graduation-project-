<%@ Page Language="C#" AutoEventWireup="true" CodeFile="datadelete.aspx.cs" Inherits="delete_datadelete" %>

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
        .table-a table{border-bottom:1px solid black;border-top:1px solid black;}
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
        .auto-style1 {
            height: 24px;
        }
        .auto-style2 {
            height: 24px;
            width: 181px;
        }
        .auto-style3 {
            width: 181px;
        }
        .auto-style4 {
            height: 24px;
            width: 80px;
        }
        .auto-style5 {
            width: 80px;
        }
        .hidden { display:none;}
        }
        .hidden { display:none;}
        .auto-style2 {
            width: 80px;
            height: 24px;
            text-align: right;
        }
        .auto-style4 {
            height: 24px;
            width: 180px;
            text-align: left;
        }
        .auto-style3 {
            height: 24px;
        }
        </style>
</head>
<body>
    <ul>
        <ri><asp:Label ID="user" runat="server" ForeColor="White" Font-Size="Medium"></asp:Label></ri>
  <li><a href="/main_manager.aspx">首页</a></li>
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
      <a href="bookdelete.aspx">图书剔旧</a>
      <a href="journaldelete.aspx">期刊剔旧</a>
      <a href="datadelete.aspx">资料剔旧</a>
      <a href="paperdelete.aspx">论文剔旧</a>
    </div>
  </li>
</ul>
    <form id="form1" runat="server">
        <div class="table-a">
            <table style="width:100%;">
            <tr>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style4">
                    &nbsp;</td>
                <td class="auto-style3">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Text="入库日期"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label2" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="month" runat="server" Width="20px"></asp:TextBox>
                    <asp:Label ID="yue" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="day" runat="server" Width="20px"></asp:TextBox>
                    <asp:Label ID="Label4" runat="server" Text="日"></asp:Label>
                </td>
                <td class="auto-style3">
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="查询" Width="60px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3"></td>
            </tr>
        </table>
        </div>
        
        <div style="margin:0px auto;height:20px;text-align:center;"></div>
        <div style="margin:0px auto;height:300px;text-align:center;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="margin-top: 0px" OnRowDeleting="GridView1_RowDeleting" AllowPaging="true" PageSize="10" onpageindexchanging="GridViewHistory_PageIndexChanging" Width="100%" >
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
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="剔旧" OnClientClick="return confirm('确定要剔旧该资料吗?')"></asp:LinkButton>
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
            </div>
        <div style="margin:0px auto;height:20px;text-align:center;"></div>
        <div class="table-a">
            <table style="width:100%;">
            <tr>
                <td>
                    <h2 style="text-align: center">
                        <asp:Label ID="Label5" runat="server" Text="历史剔旧记录"></asp:Label>
                    </h2>
                </td>
            </tr>
                    </table>
        </div>
        <div style="margin:0px auto;text-align:center;">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" style="margin-top: 0px" AllowPaging="True" PageSize="10" onpageindexchanging="GridViewHistory_PageIndexChanging2" Width="100%">
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
            </Columns>
            <PagerTemplate>
                <asp:LinkButton ID="lb_firstpage2" runat="server" onclick="lb_firstpage_Click2">首页</asp:LinkButton>
                <asp:LinkButton ID="lb_previouspage2" runat="server"
                onclick="lb_previouspage_Click2">上一页</asp:LinkButton>
                <asp:LinkButton ID="lb_nextpage2" runat="server" onclick="lb_nextpage_Click2">下一页</asp:LinkButton>
                <asp:LinkButton ID="lb_lastpage2" runat="server" onclick="lb_lastpage_Click2">尾页</asp:LinkButton>
                第<asp:Label ID="lbl_nowpage2" runat="server" Text="<%#GridView2.PageIndex+1 %>" ForeColor="#db530f"></asp:Label>页/共<asp:Label
                ID="lbl_totalpage2" runat="server" Text="<%#GridView2.PageCount %>" ForeColor="#db530f"></asp:Label>页
</PagerTemplate>
        </asp:GridView>
</div>
        </form>
</body>
</html>

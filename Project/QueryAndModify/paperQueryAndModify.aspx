<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="paperQueryAndModify.aspx.cs" Inherits="QueryAndModify_paperQueryAndModify" %>

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
.table-b table{border-top:1px solid black;}
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
        .auto-style39 {
            width: 81px;
            text-align: right;
        }
        .auto-style40 {
            height: 20px;
            width: 81px;
            text-align: right;
        }
        .auto-style41 {
            width: 141px;
        }
        .auto-style42 {
            height: 20px;
            width: 141px;
        }
        .auto-style46 {
            width: 80px;
        }
        .auto-style47 {
            height: 20px;
            width: 80px;
        }
        .auto-style48 {
            width: 191px;
        }
        .auto-style49 {
            height: 20px;
            width: 191px;
        }
        .auto-style62 {
            width: 120px;
            text-align: right;
        }
        .auto-style63 {
            height: 20px;
            width: 120px;
            text-align: right;
        }
        .auto-style64 {
            width: 94px;
            text-align: right;
        }
        .auto-style65 {
            height: 20px;
            width: 94px;
            text-align: right;
        }
        .auto-style66 {
            width: 100px;
            text-align: right;
        }
        .auto-style67 {
            height: 20px;
            width: 100px;
            text-align: right;
        }
        .auto-style68 {
            width: 176px;
        }
        .auto-style69 {
            height: 20px;
            width: 176px;
        }
        .auto-style70 {
            width: 80px;
            text-align: right;
        }
        .auto-style71 {
            width: 50px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <ul>
        <ri><asp:LinkButton ID="home" runat="server" ForeColor="White" Font-Size="Medium" OnClick="home_Click">退出系统</asp:LinkButton></ri>
        <ri>&nbsp;</ri>
        <ri><asp:Label ID="user" runat="server" ForeColor="White" Font-Size="Medium"></asp:Label></ri>
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
  <li><a href="../basicdata/basicdata.aspx">基础数据</a></li>
</ul>
    
        <div class="table-a" style="background-color:ButtonFace">
        <table style="width:100%;">
            <tr>
                <td class="auto-style70">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style70">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style71">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style70">
                    <asp:Label ID="Label1" runat="server" Text="论文名称"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="papername" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style70">
                    <asp:Label ID="Label56" runat="server" Text="论文类型"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="papertype" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style71">
                    <asp:Label ID="Label3" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="majortype" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="query" runat="server" OnClick="query_Click" Text="查询" Width="70px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style70">
                    
                </td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style70">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style71">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
            </div>
        <div style=" margin:0px auto; height:30px;"><asp:Button ID="export" runat="server" OnClick="export_Click1" Text="导出excel" /></div>
        <div style="margin:0px auto;height:320px;text-align:center;font-size:smaller;overflow-y: scroll;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="margin-top: 0px" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" onpageindexchanging="GridViewHistory_PageIndexChanging" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="name" HeaderText="论文名称" SortExpression="name" />
                <asp:BoundField DataField="ptname" HeaderText="论文类型" SortExpression="ptname" />
                <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
                <asp:BoundField DataField="xuezhi" HeaderText="学制" SortExpression="xuezhi" />
                <asp:BoundField DataField="mname" HeaderText="专业类型" SortExpression="mname" />
                <asp:BoundField DataField="direction" HeaderText="研究方向" SortExpression="direction" />
                <asp:BoundField DataField="stock_dt" HeaderText="入库日期" SortExpression="stock_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="QR_code" HeaderText="二维码编码" SortExpression="QR_code" />
                <asp:BoundField DataField="location" HeaderText="存放位置" SortExpression="location" />
                <asp:BoundField DataField="status" HeaderText="库存状况" SortExpression="status" />
                <asp:BoundField DataField="adviser" HeaderText="指导老师" SortExpression="adviser" />
                <asp:BoundField DataField="zhicheng" HeaderText="职称" SortExpression="zhicheng" />
                <asp:BoundField DataField="dabian_dt" HeaderText="答辩日期" SortExpression="dabian_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="class_number" HeaderText="分类号" SortExpression="class_number" />
                <asp:BoundField DataField="shenhe" HeaderText="审核状态" SortExpression="shenhe" />
                <asp:BoundField DataField="write_dt" HeaderText="编著时间" SortExpression="write_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="lname" HeaderText="语言" SortExpression="lname" />
                <asp:BoundField DataField="format" HeaderText="开本" SortExpression="format" />
                <asp:BoundField DataField="number_of_page" HeaderText="页数" SortExpression="number_of_page" />
                <asp:BoundField DataField="note" HeaderText="备注" SortExpression="note" />
                <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" >
                    <HeaderStyle CssClass="hidden" />
                    <ItemStyle  CssClass="hidden" />
                    <FooterStyle CssClass="hidden" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="PDF">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click1">pdf</asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="编辑"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EditRowStyle BackColor="#999999" />
            <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#5D7B9D" ForeColor="White" HorizontalAlign="Center" />
            <PagerTemplate>
                <asp:LinkButton ID="lb_firstpage" runat="server" onclick="lb_firstpage_Click">首页</asp:LinkButton>
                <asp:LinkButton ID="lb_previouspage" runat="server"
                onclick="lb_previouspage_Click">上一页</asp:LinkButton>
                <asp:LinkButton ID="lb_nextpage" runat="server" onclick="lb_nextpage_Click">下一页</asp:LinkButton>
                <asp:LinkButton ID="lb_lastpage" runat="server" onclick="lb_lastpage_Click">尾页</asp:LinkButton>
                第<asp:Label ID="lbl_nowpage" runat="server" Text="<%#GridView1.PageIndex+1 %>" ForeColor="#db530f"></asp:Label>页/共<asp:Label
                ID="lbl_totalpage" runat="server" Text="<%#GridView1.PageCount %>" ForeColor="#db530f"></asp:Label>页
</PagerTemplate>
            <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#E9E7E2" />
            <SortedAscendingHeaderStyle BackColor="#506C8C" />
            <SortedDescendingCellStyle BackColor="#FFFDF8" />
            <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
        </asp:GridView>
            </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [paper_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
        <div class="table-a">
            <table style="width:100%;">
          
            <tr>
                <td class="auto-style62">
                    <asp:Label ID="Label37" runat="server" Text="论文名称"></asp:Label>
                </td>
                <td class="auto-style41">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style64">
                    <asp:Label ID="Label55" runat="server" Text="论文类型"></asp:Label>
                </td>
                <td class="auto-style46">
                    <asp:DropDownList ID="pt" runat="server" DataSourceID="SqlDataSource1" DataTextField="ptname" DataValueField="ptname" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style66">
                    <asp:Label ID="Label46" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style48">
                    <asp:TextBox ID="txtcn" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style39">
                    <asp:Label ID="Label52" runat="server" Text="指导教师"></asp:Label>
                </td>
                <td class="auto-style68">
                    <asp:TextBox ID="txtadviser" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style63">
                    <asp:Label ID="Label38" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style65">
                    <asp:Label ID="Label43" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:DropDownList ID="mj" runat="server" DataSourceID="SqlDataSource4" DataTextField="mname" DataValueField="mname" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style67">
                    <asp:Label ID="Label47" runat="server" Text="编著日期"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="write_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label42" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="write_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label63" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="write_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label64" runat="server" Text="日"></asp:Label>
                </td>
                <td class="auto-style40">
                    <asp:Label ID="Label53" runat="server" Text="职称"></asp:Label>
                </td>
                <td class="auto-style69">
                    <asp:DropDownList ID="zhicheng" runat="server">
                        <asp:ListItem>讲师</asp:ListItem>
                        <asp:ListItem>副教授</asp:ListItem>
                        <asp:ListItem>教授</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style63">
                    <asp:Label ID="Label39" runat="server" Text="作者"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style65">
                    <asp:Label ID="Label44" runat="server" Text="语言种类"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource3" DataTextField="lname" DataValueField="lname" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style67">
                    <asp:Label ID="Label48" runat="server" Text="入库日期"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="stock_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label60" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="stock_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label61" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="stock_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label62" runat="server" Text="日"></asp:Label>
                </td>
                <td class="auto-style40">
                    <asp:Label ID="Label54" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style69">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style63">
                    <asp:Label ID="Label40" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style65">
                    <asp:Label ID="Label45" runat="server" Text="学制"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:DropDownList ID="xuezhi" runat="server" AutoPostBack="True">
                        <asp:ListItem>二年制</asp:ListItem>
                        <asp:ListItem>三年制</asp:ListItem>
                        <asp:ListItem>四年制</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style67">
                    <asp:Label ID="Label49" runat="server" Text="答辩日期"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="db_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label65" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="db_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label66" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="db_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label67" runat="server" Text="日"></asp:Label>
                </td>
                <td class="auto-style40">&nbsp;</td>
                <td class="auto-style69">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style63">
                    <asp:Label ID="Label41" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style65">
                    <asp:Label ID="Label57" runat="server" Text="库存状况"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:DropDownList ID="status" runat="server">
                        <asp:ListItem>库存</asp:ListItem>
                        <asp:ListItem>借出</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style67">
                    <asp:Label ID="Label50" runat="server" Text="研究方向"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="txtdirection" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style40">&nbsp;</td>
                <td class="auto-style69">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style63">
                    <asp:Label ID="Label51" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style65">
                    <asp:Label ID="Label58" runat="server" Text="库存数目"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style67">
                    <asp:Label ID="Label59" runat="server" Text="审核状态"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:DropDownList ID="shenhe" runat="server">
                        <asp:ListItem>待审核</asp:ListItem>
                        <asp:ListItem>已审核</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style40">&nbsp;</td>
                <td class="auto-style69">
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" Width="80px" />
                </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>

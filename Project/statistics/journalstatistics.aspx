<%@ Page Language="C#" AutoEventWireup="true" CodeFile="journalstatistics.aspx.cs" Inherits="统计分析_journalstatistics" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 152px;
        }
        ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
            height: 55px;
        }
ri{
    float:right;
}
li {
  float: left;
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
        .auto-style3 {
            width: 116px;
            text-align: right;
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
      <a href="bookstatistics.aspx">图书统计</a>
      <a href="journalstatistics.aspx">期刊统计</a>
      <a href="datastatistics.aspx">资料统计</a>
      <a href="paperstatistics.aspx">论文统计</a>
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
        <div class="table-a">
            <table style="width:100%;">
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="期刊总数目:"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>
       
        <div style=" margin:0px auto; height:20px;"></div>
        <div style="float:left;height:600px;width:25%;">
        <div style="margin:0px auto; height:300px;">
                         <asp:Chart ID="Chart1" runat="server">
                        <Series>
                            <asp:Series ChartType="Pie" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
        </div>
        <div style="margin:0px auto; height:300px;">
        <div style="float:left;width:25%; height: 300px;"></div>
           <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
               <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="jtname" HeaderText="期刊类型名称" />
                <asp:BoundField DataField="number" HeaderText="数目" />
            </Columns>
               <FooterStyle BackColor="#CCCCCC" />
               <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
               <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
               <SortedAscendingCellStyle BackColor="#F1F1F1" />
               <SortedAscendingHeaderStyle BackColor="#808080" />
               <SortedDescendingCellStyle BackColor="#CAC9C9" />
               <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
                    
        </div>
        </div>
        <div style="float:left;height:600px;width:25%;">
            <div style="margin:0px auto; height:300px;">
            <asp:Chart ID="Chart2" runat="server">
                        <Series>
                            <asp:Series ChartType="Pie" Name="Series1">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            <div style="margin:0px auto;  height:300px;">
                <div style="float:left;width:25%; height: 300px;"></div>
      <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="Solid" BorderWidth="1px" CellPadding="3" ForeColor="Black" GridLines="Vertical">
            <AlternatingRowStyle BackColor="#CCCCCC" />
            <Columns>
                <asp:BoundField DataField="mname" HeaderText="专业名称" />
                <asp:BoundField DataField="number" HeaderText="数目" />
            </Columns>
            <FooterStyle BackColor="#CCCCCC" />
            <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
            <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#808080" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#383838" />
        </asp:GridView>
            </div>
                    </div>
        <div style="float:left;width:10%;height:600px;">
            <div style="border:1px solid;float:left;height:600px;"></div>
            <div style="float:left;width:10%; height: 300px;"></div>
            按年份统计
                 <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
                     <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                <Columns>
                    <asp:BoundField DataField="year" HeaderText="年份" />
                    <asp:BoundField DataField="s_number" HeaderText="入库数目" />
                </Columns>
                     <EditRowStyle BackColor="#999999" />
                     <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                     <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                     <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
                     <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                     <SortedAscendingCellStyle BackColor="#E9E7E2" />
                     <SortedAscendingHeaderStyle BackColor="#506C8C" />
                     <SortedDescendingCellStyle BackColor="#FFFDF8" />
                     <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
            </asp:GridView>
        </div>
        <div style="float:left;width:40%;height:500px;">
            <asp:Chart ID="Chart3" runat="server" Width="500px">
                <Series>
                    <asp:Series Name="Series1" ChartType="Line"></asp:Series>
                </Series>
                <ChartAreas>
                    <asp:ChartArea Name="ChartArea1"></asp:ChartArea>
                </ChartAreas>
            </asp:Chart>
        </div>
    </form>
</body>
</html>

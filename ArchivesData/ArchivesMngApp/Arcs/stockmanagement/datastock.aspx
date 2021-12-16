﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="datastock.aspx.cs" Inherits="stockmanagement_datastock" %>

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
        .hidden { display:none;}
        </style>
</head>
<body>
    <form id="form1" runat="server">
    
        <h1 style="text-align: center">  
          <asp:Label ID="Label14" runat="server" Text="资料入库管理"></asp:Label>
        </h1>
        <div class="table-a" style="background-color:ButtonFace">
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
            <tr>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style12">&nbsp;</td>
                <td class="auto-style12" style="text-align: left">
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [data_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <div style="margin:0px auto;height:320px;text-align:center;font-size:small;overflow-y: scroll; ">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="margin-top: 0px"  AllowPaging="True" onpageindexchanging="GridViewHistory_PageIndexChanging" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
    </form>
</body>
</html>
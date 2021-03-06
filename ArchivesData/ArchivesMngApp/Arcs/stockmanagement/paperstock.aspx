﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paperstock.aspx.cs" Inherits="QueryAndModify_paperQueryAndModify" %>

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
}
        .hidden { display:none;}
        .auto-style2 {
            width: 150px;
        }
        .auto-style4 {
            width: 100px;
        }
        .auto-style46 {
            width: 80px;
        }
        .auto-style61 {
            width: 80px;
            text-align: right;
        }
        .table-a table{border-bottom:1px solid black;border-top:1px solid black;}
        .auto-style62 {
            width: 110px;
        }
    </style>
</head>
<body>

        <form id="form1" runat="server">
           
    
        <div class="table-a" style="background-color:ButtonFace">
                    <table style="width:100%;">
            <tr>
                <td class="auto-style46">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style62">&nbsp;</td>
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
                <td class="auto-style62">
                    <asp:DropDownList ID="majortype" runat="server" DataSourceID="SqlDataSource4" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="query" runat="server" OnClick="query_Click" Text="查询" Width="70px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style61">&nbsp;</td>
                <td class="auto-style62">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>


        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [paper_type]"></asp:SqlDataSource>
        <div style=" margin:0px auto; height:50px; ">
        </div>
        <div style="margin:0px auto;height:360px;text-align:center;font-size:smaller;overflow-y: scroll;">
        <asp:GridView ID="GridView1" runat="server" ShowCellToolTip=" True"  AutoGenerateColumns="False" style="margin-top: 0px" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" onpageindexchanging="GridViewHistory_PageIndexChanging" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
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
                <asp:TemplateField HeaderText="存放位置" SortExpression="location">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("location") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:TextBox ID="txtlocation" runat="server" Width="50px"></asp:TextBox>
                    </ItemTemplate>
                </asp:TemplateField>
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
                <asp:BoundField DataField="note" HeaderText="备注" SortExpression="note" />
                <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id" >
                    <HeaderStyle CssClass="hidden" />
                    <ItemStyle  CssClass="hidden" />
                    <FooterStyle CssClass="hidden" />
                </asp:BoundField>
                <asp:TemplateField HeaderText="PDF" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Select" OnClick="LinkButton2_Click" Text="pdf"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="审核"></asp:LinkButton>
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
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
    </form>
</body>
</html>

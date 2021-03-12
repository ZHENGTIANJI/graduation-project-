﻿<%@ Page Language="C#" AutoEventWireup="true" CodeFile="journalQueryAndModify.aspx.cs" Inherits="QueryAndModify_journalQueryAndModify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
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
            width: 149px;
        }
        .auto-style10 {
            width: 224px;
            text-align: left;
        }
        .auto-style12 {
            width: 150px;
        }
        .auto-style14 {
            width: 141px;
        }
        .auto-style15 {
            width: 101px;
            text-align: left;
        }
        .auto-style16 {
            width: 81px;
        }
        .auto-style17 {
            width: 87px;
        }
        .auto-style18 {
            width: 106px;
        }
        .auto-style19 {
            width: 106px;
            text-align: right;
        }
        .auto-style20 {
            width: 94px;
            text-align: right;
        }
        .auto-style21 {
            width: 94px;
        }
        .auto-style22 {
            width: 80px;
            text-align: right;
        }
        .auto-style23 {
            width: 86px;
            text-align: right;
        }
        .auto-style24 {
            width: 82px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
    
        <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px">
            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <DynamicSelectedStyle BackColor="#507CD1" />
            <Items>
                <asp:MenuItem Text="入库管理" Value="入库管理">
                    <asp:MenuItem NavigateUrl="~/stockmanagement/bookstock.aspx" Text="图书入库" Value="图书入库"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/journalstock.aspx" Text="期刊入库" Value="期刊入库"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/datastock.aspx" Text="资料入库" Value="资料入库"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/paperstock.aspx" Text="论文入库" Value="论文入库"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="信息查改" Value="信息查改">
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/bookQueryAndModify.aspx" Text="图书查改" Value="图书查改"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/journalQueryAndModify.aspx" Text="期刊查改" Value="期刊查改"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/dataQueryAndModify.aspx" Text="资料查改" Value="资料查改"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/paperQueryAndModify.aspx" Text="论文查改" Value="论文查改"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="剔旧" Value="剔旧">
                    <asp:MenuItem NavigateUrl="~/delete.aspx" Text="图书剔旧" Value="图书剔旧"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="统计分析" Value="统计分析">
                    <asp:MenuItem NavigateUrl="~/statistics/bookstatistics.aspx" Text="图书统计" Value="图书统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/statistics/journalstatistics.aspx" Text="期刊统计" Value="期刊统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/statistics/datastatistics.aspx" Text="资料统计" Value="资料统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/statistics/paperstatistics.aspx" Text="论文统计" Value="论文统计"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <StaticMenuItemStyle Font-Size="Large" HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#507CD1" />
        </asp:Menu>
    
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
                    <asp:DropDownList ID="jt" runat="server" DataSourceID="SqlDataSource1" DataTextField="jtname" DataValueField="jtname" style="text-align: left">
                    </asp:DropDownList>
                </td>
                <td class="auto-style24">
                    <asp:Label ID="Label3" runat="server" Text="专业类型" style="text-align: right"></asp:Label>
                </td>
                <td class="auto-style15">
                    <asp:DropDownList ID="mt" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname" style="text-align: left">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="query" runat="server" OnClick="query_Click" Text="查询" />
                </td>
            </tr>
            <tr>
                <td class="auto-style22">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style23">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style24">&nbsp;</td>
                <td class="auto-style15">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
        <div style="overflow-y: scroll; width: 2000px">
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
            </div>
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
                    &nbsp;</td>
                <td class="auto-style8">
                    &nbsp;</td>
                <td class="auto-style18">
                    &nbsp;</td>
                <td class="auto-style10">
                    &nbsp;</td>
                <td class="auto-style16">
                    &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style14">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label4" runat="server" Text="期刊名称"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label5" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                    <asp:Button ID="Button1" runat="server" Text="扫描" />
                </td>
                <td class="auto-style16">
                    &nbsp;</td>
                <td class="auto-style12">
                    <asp:Label ID="Label24" runat="server" Text="年第"></asp:Label>
                    <asp:TextBox ID="txtperiod" runat="server" Width="21px"></asp:TextBox>
                    <asp:Label ID="Label26" runat="server" Text="期"></asp:Label>
                </td>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style14">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label9" runat="server" Text="杂志社名称"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtoffname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label6" runat="server" Text="期刊类型"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="journaltype" runat="server" DataSourceID="SqlDataSource1" DataTextField="jtname" DataValueField="jtname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label13" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtcn" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label10" runat="server" Text="入库日期"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtstockdt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label7" runat="server" Text="期刊语言"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource5" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style16">
                    <asp:Label runat="server" Text="开本" ID="Label20"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style17">
                    <asp:Label ID="Label25" runat="server" Text="检索机构"></asp:Label>
                </td>
                <td class="auto-style14">
                    <asp:DropDownList ID="organ" runat="server" DataSourceID="SqlDataSource6" DataTextField="organname" DataValueField="organname">
                        <asp:ListItem>SCI</asp:ListItem>
                        <asp:ListItem>EI</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label11" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label8" runat="server" Text="专业类型"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label14" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style17">
                    <asp:Label ID="Label27" runat="server" Text="期刊周期"></asp:Label>
                </td>
                <td class="auto-style14">
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
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label21" runat="server" Text="出版日期"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtpubdt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label22" runat="server" Text="期刊等级"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="grade" runat="server" DataSourceID="SqlDataSource4" DataTextField="gradename" DataValueField="gradename">
                    </asp:DropDownList>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label23" runat="server" Text="杂志社地址"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtaddress" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style20">
                    <asp:Label ID="Label19" runat="server" Text="库存数量"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label16" runat="server" Text="库存状况"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="status" runat="server">
                        <asp:ListItem>库存</asp:ListItem>
                        <asp:ListItem>借出</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label18" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style12">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style17">&nbsp;</td>
                <td class="auto-style14">&nbsp;</td>
                <td>
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" />
                </td>
            </tr>
        </table>
    </form>
</body>
</html>

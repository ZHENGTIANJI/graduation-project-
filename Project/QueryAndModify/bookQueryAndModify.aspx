<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookQueryAndModify.aspx.cs" Inherits="QueryAndModify_bookQueryAndModify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .hidden { display:none;}
        .auto-style1 {
            height: 20px;
        }
        .auto-style2 {
            height: 20px;
            width: 66px;
        }
        .auto-style3 {
            width: 66px;
        }
        .auto-style4 {
            height: 20px;
            width: 147px;
        }
        .auto-style5 {
            width: 147px;
        }
        .auto-style6 {
            height: 20px;
            width: 71px;
        }
        .auto-style7 {
            width: 71px;
        }
        .auto-style10 {
            height: 20px;
            width: 43px;
        }
        .auto-style11 {
            width: 43px;
        }
        .auto-style22 {
            height: 23px;
            text-align: left;
            width: 79px;
        }
        .auto-style14 {
            width: 122px;
            text-align: right;
        }
        .auto-style18 {
            width: 256px;
        }
        .auto-style23 {
            width: 79px;
        }
        .auto-style19 {
            width: 122px;
            text-align: right;
            height: 23px;
        }
        .auto-style20 {
            width: 256px;
            height: 23px;
        }
        .auto-style24 {
            height: 23px;
            width: 79px;
            text-align: left;
        }
        .auto-style29 {
            width: 122px;
            text-align: right;
            height: 31px;
        }
        .auto-style30 {
            width: 256px;
            height: 31px;
        }
        .auto-style32 {
            width: 79px;
            height: 31px;
        }
        .auto-style33 {
            height: 23px;
            text-align: right;
            width: 120px;
        }
        .auto-style36 {
            height: 23px;
            text-align: left;
            width: 28px;
        }
        .auto-style37 {
            width: 28px;
        }
        .auto-style38 {
            width: 28px;
            height: 31px;
        }
        .auto-style39 {
            width: 120px;
            text-align: right;
        }
        .auto-style40 {
            width: 120px;
            text-align: right;
            height: 31px;
        }
        .auto-style42 {
            height: 23px;
            text-align: left;
            width: 30px;
        }
        .auto-style44 {
            width: 30px;
            height: 31px;
        }
        .auto-style45 {
            width: 30px;
        }
        .auto-style46 {
            width: 132px;
            text-align: right;
            height: 23px;
        }
        .auto-style47 {
            width: 132px;
            text-align: right;
        }
        .auto-style48 {
            width: 132px;
            text-align: right;
            height: 31px;
        }
        .auto-style49 {
            height: 20px;
            width: 47px;
        }
        .auto-style50 {
            width: 47px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
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
                    <asp:MenuItem NavigateUrl="~/stockmanagement/datastock.aspx" Text="资料统计" Value="资料统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/statistics/paperstatistics.aspx" Text="论文统计" Value="论文统计"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <StaticMenuItemStyle Font-Size="Large" HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#507CD1" />
        </asp:Menu>
        <table style="width:100%;">
            <tr>
                <td class="auto-style2"></td>
                <td class="auto-style4"></td>
                <td class="auto-style2"></td>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style49">&nbsp;</td>
                <td class="auto-style10">&nbsp;</td>
                <td class="auto-style1">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style3">
                    <asp:Label ID="Label1" runat="server" Text="图书名称"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="bookname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="Label2" runat="server" Text="图书类别"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:DropDownList ID="booktype" runat="server" DataSourceID="SqlDataSource2" DataTextField="btname" DataValueField="btname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style50">
                    <asp:Label ID="Label3" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource3" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="query" runat="server" Text="查询" OnClick="query_Click" />
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style50">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <div style="overflow-y: scroll; width: 2000px">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" style="margin-top: 0px" OnRowDeleting="GridView1_RowDeleting" AllowPaging="true" PageSize="5" onpageindexchanging="GridViewHistory_PageIndexChanging">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="图书名称" SortExpression="name" />
                <asp:BoundField DataField="btname" HeaderText="图书类型" SortExpression="btname" />
                <asp:BoundField DataField="book_number" HeaderText="书号" SortExpression="book_number" />
                <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
                <asp:BoundField DataField="stock_dt" HeaderText="入库时间" SortExpression="stock_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="format" HeaderText="开本" SortExpression="format" />
                <asp:BoundField DataField="number_of_page" HeaderText="页数" SortExpression="number_of_page" />
                <asp:BoundField DataField="location" HeaderText="存放位置" SortExpression="location" />
                <asp:BoundField DataField="CD" HeaderText="有无CD" SortExpression="CD" />
                <asp:BoundField DataField="status" HeaderText="库存状态" SortExpression="status" />
                <asp:BoundField DataField="teacher" HeaderText="赠书教师" SortExpression="teacher" />
                <asp:BoundField DataField="number" HeaderText="库存数目" SortExpression="number" />
                <asp:BoundField DataField="mname" HeaderText="专业" SortExpression="mname" />
                <asp:BoundField DataField="QR_code" HeaderText="二维码" SortExpression="QR_code" />
                <asp:BoundField DataField="lname" HeaderText="图书语种" SortExpression="lname" />
                <asp:BoundField DataField="publisher" HeaderText="出版社" SortExpression="publisher" />
                <asp:BoundField DataField="publish_dt" HeaderText="出版日期" SortExpression="publish_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="price" HeaderText="价格" SortExpression="price" />
                <asp:BoundField DataField="bitname" HeaderText="装订类型" SortExpression="bitname" />
                <asp:BoundField DataField="note" HeaderText="备注" SortExpression="note" />
                <asp:BoundField DataField="id" HeaderText="ID" SortExpression="id">
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
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT [number_of_page], [book_number], [CD], [format], [location], [stock_dt], [teacher], [number], [name], [btname], [mname], [QR_code], [publisher], [publish_dt], [author], [price], [status], [note], [lname], [bitname] FROM [book]
left join book_type on book.book_type_id=book_type.btid
left join major on book.major_type_id=major.mid
left join language on book.language=language.lid
left join binding_type on book.binding_type_id=binding_type.bitid
"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [book_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [binding_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
        <br />
                    <table style="width: 100%; height: 190px;">
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label4" runat="server" Text="二维码编码"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtQR" runat="server" style="text-align: left"></asp:TextBox>
                                <asp:Button ID="Button1" runat="server" Text="扫描" />
                            </td>
                            <td class="auto-style46">
                    <asp:Label ID="Label21" runat="server" Text="图书类别"></asp:Label>
                            </td>
                            <td class="auto-style22">
                    <asp:DropDownList ID="bt" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="btname" DataValueField="btname">
                    </asp:DropDownList>
                            </td>
                            <td class="auto-style33">
                                <asp:Label ID="Label24" runat="server" Text="数目"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style42">&nbsp;</td>
                            <td class="auto-style22">&nbsp;</td>
                            <td class="auto-style22">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style14">
                                <asp:Label ID="Label5" runat="server" Text="书名"></asp:Label>
                            </td>
                            <td class="auto-style18">
                                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style47">
                    <asp:Label ID="Label22" runat="server" Text="专业"></asp:Label>
                            </td>
                            <td class="auto-style22">
                    <asp:DropDownList ID="major1" runat="server" DataSourceID="SqlDataSource3" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                            </td>
                            <td class="auto-style39">
                                <asp:Label ID="Label15" runat="server" Text="是否有光盘"></asp:Label>
                            </td>
                            <td class="auto-style37">
                                <asp:DropDownList ID="CD" runat="server" style="text-align: left" Width="50px">
                                    <asp:ListItem Value="有">有</asp:ListItem>
                                    <asp:ListItem Value="无">无</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style45">&nbsp;</td>
                            <td class="auto-style23">&nbsp;</td>
                            <td class="auto-style23">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style29">
                                <asp:Label ID="Label6" runat="server" Text="出版社"></asp:Label>
                            </td>
                            <td class="auto-style30">
                                <asp:TextBox ID="txtpub" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style48">
                                <asp:Label ID="Label14" runat="server" Text="图书语种"></asp:Label>
                            </td>
                            <td class="auto-style22">
                                <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource5" DataTextField="lname" DataValueField="lname">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style40">
                                <asp:Label ID="Label16" runat="server" Text="赠书老师姓名"></asp:Label>
                            </td>
                            <td class="auto-style38">
                                <asp:TextBox ID="txtteacher" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style44">&nbsp;</td>
                            <td class="auto-style32">&nbsp;</td>
                            <td class="auto-style32"></td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label7" runat="server" Text="编者"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style46">
                                <asp:Label ID="Label12" runat="server" Text="装订类型"></asp:Label>
                            </td>
                            <td class="auto-style22">
                                <asp:DropDownList ID="bindingtype" runat="server" DataSourceID="SqlDataSource4" DataTextField="bitname" DataValueField="bitname">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style33">
                                <asp:Label ID="Label17" runat="server" Text="入库日期"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtstockdt" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style42">
                                &nbsp;</td>
                            <td class="auto-style22">
                            </td>
                            <td class="auto-style22">
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label8" runat="server" Text="出版日期"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtpubdt" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style46">
                                <asp:Label ID="Label23" runat="server" Text="库存状况"></asp:Label>
                            </td>
                            <td class="auto-style24">
                                <asp:DropDownList ID="status" runat="server">
                                    <asp:ListItem>库存</asp:ListItem>
                                    <asp:ListItem>借出</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style33">
                                <asp:Label ID="Label18" runat="server" Text="分类号"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtclassnumber" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style42">
                                &nbsp;</td>
                            <td class="auto-style24">
                                &nbsp;</td>
                            <td class="auto-style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label9" runat="server" Text="书号"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtbooknumber" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style46">
                                <asp:Label ID="Label10" runat="server" style="text-align: right" Text="定价"></asp:Label>
                            </td>
                            <td class="auto-style24">
                                <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style33">
                                <asp:Label ID="Label19" runat="server" Text="存放位置"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style42">
                                &nbsp;</td>
                            <td class="auto-style24">
                                &nbsp;</td>
                            <td class="auto-style24">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style46">
                                <asp:Label ID="Label11" runat="server" Text="页数"></asp:Label>
                            </td>
                            <td class="auto-style24">
                                <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style33">
                                <asp:Label ID="Label20" runat="server" Text="备注"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtnote" runat="server" ></asp:TextBox>
                            </td>
                            <td class="auto-style42">
                                <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" />
                            </td>
                            <td class="auto-style24">
                                &nbsp;</td>
                            <td class="auto-style24">
                                &nbsp;</td>
                        </tr>
                    </table>
    </form>
</body>
</html>

<%@ Page Language="C#" EnableEventValidation="false" AutoEventWireup="true" CodeFile="bookQueryAndModify.aspx.cs" Inherits="QueryAndModify_bookQueryAndModify" %>

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
        .auto-style1 {
            height: 20px;
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
        .auto-style23 {
            width: 79px;
            height: 23px;
        }
        .auto-style19 {
            width: 122px;
            text-align: right;
            height: 23px;
        }
        .auto-style20 {
            width: 190px;
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
            width: 190px;
            height: 31px;
        }
        .auto-style32 {
            width: 79px;
            height: 31px;
        }
        .auto-style36 {
            height: 23px;
            text-align: left;
            width: 175px;
        }
        .auto-style37 {
            width: 175px;
            height: 23px;
        }
        .auto-style38 {
            width: 175px;
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
        .auto-style54 {
            height: 23px;
            text-align: left;
            width: 185px;
        }
        .auto-style55 {
            height: 23px;
            text-align: left;
            width: 80px;
        }
        .auto-style56 {
            width: 80px;
            height: 23px;
        }
        .auto-style57 {
            width: 80px;
            height: 31px;
        }
        .auto-style60 {
            width: 110px;
            text-align: right;
            height: 23px;
        }
        .auto-style61 {
            width: 110px;
            text-align: right;
            height: 31px;
        }
        .auto-style62 {
            height: 20px;
            width: 80px;
        }
        .auto-style63 {
            width: 80px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div class="table-a" style="background-color:ButtonFace">
        <table style="width:100%; height: 45px;">
            <tr>
                <td class="auto-style62"></td>
                <td class="auto-style4"></td>
                <td class="auto-style62"></td>
                <td class="auto-style6"></td>
                <td class="auto-style49"></td>
                <td class="auto-style10"></td>
                <td class="auto-style1"></td>
            </tr>
            <tr>
                <td class="auto-style63">
                    <asp:Label ID="Label1" runat="server" Text="图书名称"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="bookname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style63">
                    <asp:Label ID="Label2" runat="server" Text="图书类别"></asp:Label>
                </td>
                <td class="auto-style7">
                    <asp:DropDownList ID="booktype" runat="server">
                    </asp:DropDownList>
                </td>
                <td class="auto-style50">
                    <asp:Label ID="Label3" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:DropDownList ID="major" runat="server">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="query" runat="server" Text="查询" OnClick="query_Click" Width="70px" />
                </td>
            </tr>
            <tr>
                <td class="auto-style63">
                    
                </td>
                <td class="auto-style5">&nbsp;</td>
                <td class="auto-style63">&nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style50">&nbsp;</td>
                <td class="auto-style11">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    </div>
    <div style=" margin:0px auto; height:30px;">
        <asp:Button ID="export" runat="server" OnClick="export_Click1" Text="导出excel" />
    </div>
    <div style="margin:0px auto;height:320px;text-align:center;font-size:small;overflow-y: scroll; ">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Style="margin-top: 0;table-layout:fixed" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True" OnPageIndexChanging="GridViewHistory_PageIndexChanging" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" >
                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />

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
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
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
                    <asp:LinkButton ID="lb_firstpage" runat="server" OnClick="lb_firstpage_Click">首页</asp:LinkButton>
                    <asp:LinkButton ID="lb_previouspage" runat="server"
                        OnClick="lb_previouspage_Click">上一页</asp:LinkButton>
                    <asp:LinkButton ID="lb_nextpage" runat="server" OnClick="lb_nextpage_Click">下一页</asp:LinkButton>
                    <asp:LinkButton ID="lb_lastpage" runat="server" OnClick="lb_lastpage_Click">尾页</asp:LinkButton>
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
            
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [binding_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [book_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [binding_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
        <div class="table-a" >
            <table style="width: 100%; height: 190px;">
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label4" runat="server" Text="二维码编码"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtQR" runat="server" style="text-align: left"></asp:TextBox>
                            </td>
                            <td class="auto-style60">
                    <asp:Label ID="Label21" runat="server" Text="图书类别"></asp:Label>
                            </td>
                            <td class="auto-style54">
                    <asp:DropDownList ID="bt" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="btname" DataValueField="btname">
                    </asp:DropDownList>
                            </td>
                            <td class="auto-style60">
                    <asp:Label ID="Label22" runat="server" Text="专业"></asp:Label>
                            </td>
                            <td class="auto-style36">
                    <asp:DropDownList ID="major1" runat="server" DataSourceID="SqlDataSource3" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                            </td>
                            <td class="auto-style55">&nbsp;</td>
                            <td class="auto-style22">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label5" runat="server" Text="书名"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style60">
                                <asp:Label ID="Label14" runat="server" Text="图书语种"></asp:Label>
                            </td>
                            <td class="auto-style54">
                                <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource5" DataTextField="lname" DataValueField="lname">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style60">
                                <asp:Label ID="Label15" runat="server" Text="是否有光盘"></asp:Label>
                            </td>
                            <td class="auto-style37">
                                <asp:DropDownList ID="CD" runat="server" style="text-align: left" Width="50px">
                                    <asp:ListItem Value="有">有</asp:ListItem>
                                    <asp:ListItem Value="无">无</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style56"></td>
                            <td class="auto-style23"></td>
                        </tr>
                        <tr>
                            <td class="auto-style29">
                                <asp:Label ID="Label6" runat="server" Text="出版社"></asp:Label>
                            </td>
                            <td class="auto-style30">
                                <div style="z-index: 0; visibility: visible; position: absolute;left:158px;top:499px; bottom: 377px;">
                                <asp:DropDownList ID="ddlModel" runat="server" Style="z-index: -1" Width="165px" Height="22px"
                                onchange="getModelTo(this)" OnSelectedIndexChanged="ddlModel_SelectedIndexChanged">
                                    </asp:DropDownList>
                            </div>
                        <asp:TextBox ID="txtpub" runat="server" Style="z-index: 0; position: absolute;left:158px;top:500px"
                             Width="138px" Height="17px" MaxLength="50"></asp:TextBox>
                        <script type="text/javascript">
                                function getModelTo(e) {
                                    document.getElementById("txtpub").value = e.options[e.selectedIndex].innerText;
                                    document.getElementById("txtpub").select();
                                 }
                        </script>
                            </td>
                            <td class="auto-style61">
                                <asp:Label ID="Label12" runat="server" Text="装订类型"></asp:Label>
                            </td>
                            <td class="auto-style54">
                                <asp:DropDownList ID="bindingtype" runat="server" DataSourceID="SqlDataSource4" DataTextField="bitname" DataValueField="bitname">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style61">
                                <asp:Label ID="Label24" runat="server" Text="数目"></asp:Label>
                            </td>
                            <td class="auto-style38">
                                <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style57">&nbsp;</td>
                            <td class="auto-style32">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label7" runat="server" Text="编者"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style60">
                                <asp:Label ID="Label23" runat="server" Text="库存状况"></asp:Label>
                            </td>
                            <td class="auto-style54">
                                <asp:DropDownList ID="status" runat="server">
                                    <asp:ListItem>库存</asp:ListItem>
                                    <asp:ListItem>预约</asp:ListItem>
                                    <asp:ListItem>借出</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style60">
                                <asp:Label ID="Label16" runat="server" Text="赠书老师姓名"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtteacher" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style55">
                                &nbsp;</td>
                            <td class="auto-style22">
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label8" runat="server" Text="出版日期"></asp:Label>
                            </td>
                            <td class="auto-style20">
                    <asp:TextBox ID="pub_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label42" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="pub_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label43" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="pub_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label44" runat="server" Text="日"></asp:Label>
                            </td>
                            <td class="auto-style60">
                                <asp:Label ID="Label17" runat="server" Text="入库日期"></asp:Label>
                            </td>
                            <td class="auto-style54">
                    <asp:TextBox ID="stock_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label45" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="stock_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label46" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="stock_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label47" runat="server" Text="日"></asp:Label>
                            </td>
                            <td class="auto-style60">
                                <asp:Label ID="Label19" runat="server" Text="存放位置"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style55">
                                </td>
                            <td class="auto-style22">
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style19">
                                <asp:Label ID="Label9" runat="server" Text="书号"></asp:Label>
                            </td>
                            <td class="auto-style20">
                                <asp:TextBox ID="txtbooknumber" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style60">
                                <asp:Label ID="Label10" runat="server" style="text-align: right" Text="定价"></asp:Label>
                            </td>
                            <td class="auto-style54">
                                <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style60">
                                <asp:Label ID="Label20" runat="server" Text="备注"></asp:Label>
                            </td>
                            <td class="auto-style36">
                                <asp:TextBox ID="txtnote" runat="server" ></asp:TextBox>
                            </td>
                            <td class="auto-style55">
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
                            <td class="auto-style60">
                                <asp:Label ID="Label11" runat="server" Text="页数"></asp:Label>
                            </td>
                            <td class="auto-style54">
                                <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style60">
                                &nbsp;</td>
                            <td class="auto-style36">
                                &nbsp;</td>
                            <td class="auto-style55">
                                <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" Width="80px" />
                            </td>
                            <td class="auto-style24">
                                &nbsp;</td>
                        </tr>
                    </table>
        </div>      
    </form>
</body>
</html>

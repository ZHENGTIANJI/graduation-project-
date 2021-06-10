<%@ Page Language="C#" AutoEventWireup="true" CodeFile="bookstock.aspx.cs" Inherits="bookstock" %>

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
.table-a table{border-bottom:1px solid black;border-top:1px solid black;}
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
        #form1 {
            text-align: center;
        }
        .auto-style33 {
            width: 173px;
            text-align: left;
        }
        .auto-style70 {
            height: 23px;
            text-align: right;
            width: 224px;
        }
        .auto-style73 {
            width: 480px;
            text-align: right;
            height: 27px;
        }
        .auto-style74 {
            width: 480px;
            text-align: right;
            height: 23px;
        }
        .auto-style75 {
            width: 224px;
            text-align: right;
            height: 27px;
        }
        .auto-style81 {
            width: 100px;
        }
        .auto-style82 {
            width: 671px;
        }
        .auto-style83 {
            width: 160px;
        }
        .auto-style84 {
            width: 671px;
            height: 31px;
        }
        .auto-style85 {
            width: 100px;
            height: 31px;
            text-align: left;
        }
        .auto-style86 {
            width: 160px;
            height: 31px;
            text-align: left;
        }
        .auto-style87 {
            height: 31px;
        }
        .auto-style90 {
            height: 23px;
            text-align: left;
            width: 232px;
        }
        .auto-style92 {
            width: 232px;
            text-align: left;
            height: 27px;
        }
        .auto-style104 {
            width: 186px;
            text-align: left;
            height: 27px;
        }
        .auto-style106 {
            height: 23px;
            text-align: left;
            width: 186px;
        }
        .auto-style110 {
            width: 173px;
            text-align: left;
            height: 27px;
        }
        .auto-style111 {
            height: 23px;
            text-align: left;
            width: 173px;
        }
        .auto-style112 {
            width: 280px;
            text-align: right;
            height: 27px;
        }
        .auto-style113 {
            height: 23px;
            text-align: right;
            width: 280px;
        }
        .hidden { display:none;}
        </style>
</head>
<body>
        <form id="form1" runat="server">

                    <h1>
                    <asp:Label ID="矿业学院资料室图书入库管理" runat="server" style="text-align: center; font-size: xx-large" Text="图书入库管理"></asp:Label>
                    </h1>
        <div class="table-a" style="background-color:ButtonFace">
            <table style="width: 100%; height: 190px;">
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label25" runat="server" Text="二维码编码"></asp:Label>
                            </td>
                            <td class="auto-style104">
                                <asp:TextBox ID="txtQR" runat="server" style="text-align: left"></asp:TextBox>
                            </td>
                            <td class="auto-style75">
                    <asp:Label ID="Label21" runat="server" Text="图书类别"></asp:Label>
                                </td>
                            <td class="auto-style110">
                    <asp:DropDownList ID="bt" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="btname" DataValueField="btname">
                    </asp:DropDownList>
                                </td>
                            <td class="auto-style112"></td>
                            <td class="auto-style92"></td>
                            <td class="auto-style92"></td>
                        </tr>
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label26" runat="server" Text="书名"></asp:Label>
                            </td>
                            <td class="auto-style104">
                                <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style75">
                    <asp:Label ID="Label22" runat="server" Text="专业"></asp:Label>
                            </td>
                            <td class="auto-style33">
                    <asp:DropDownList ID="major1" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                            </td>
                            <td class="auto-style112">
                                <asp:Label ID="Label32" runat="server" Text="装订类型"></asp:Label>
                                </td>
                            <td class="auto-style92">
                                <asp:DropDownList ID="bindingtype" runat="server" DataSourceID="SqlDataSource3" DataTextField="bitname" DataValueField="bitname">
                                </asp:DropDownList>
                                </td>
                            <td class="auto-style92">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label28" runat="server" Text="出版社"></asp:Label>
                            </td>
                            <td class="auto-style104">
                                <div style="z-index: 0; visibility: visible; position: absolute;left:288px;top:155px">
                                    <asp:DropDownList ID="DropDownList1" runat="server" Style="z-index: -1" Width="165px" Height="22px"
                                onchange="getModelTo1(this)"></asp:DropDownList>
                            </div>
                                <asp:TextBox ID="txtpub" runat="server" Style="z-index: 0; position: absolute;left:285px;top:156px"
                            Font-Size="9pt" Width="138px" Height="17px" MaxLength="50"></asp:TextBox>
                        <script type="text/javascript">
                                function getModelTo1(e) {
                                    document.getElementById("txtpub").value = e.options[e.selectedIndex].innerText;
                                    document.getElementById("txtpub").select();
                                 }
                        </script>
                            </td>
                            <td class="auto-style75">
                                <asp:Label ID="Label29" runat="server" Text="图书语种"></asp:Label>
                            </td>
                            <td class="auto-style110">
                                <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource4" DataTextField="lname" DataValueField="lname">
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style112">
                                <asp:Label ID="Label27" runat="server" Text="是否有光盘"></asp:Label>
                            </td>
                            <td class="auto-style92">
                                <asp:DropDownList ID="CD" runat="server" style="text-align: left" >
                                    <asp:ListItem Value="有">有</asp:ListItem>
                                    <asp:ListItem Value="无">无</asp:ListItem>
                                </asp:DropDownList>
                            </td>
                            <td class="auto-style92">
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label31" runat="server" Text="编者"></asp:Label>
                            </td>
                            <td class="auto-style104">
                                <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style75">
                                <asp:Label ID="Label34" runat="server" Text="出版日期"></asp:Label>
                            </td>
                            <td class="auto-style110">
                    <asp:TextBox ID="pub_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label42" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="pub_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label43" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="pub_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label44" runat="server" Text="日"></asp:Label>
                            </td>
                            <td class="auto-style112">
                                <asp:Label ID="Label30" runat="server" Text="赠书老师姓名"></asp:Label>
                            </td>
                            <td class="auto-style92">
                                <asp:TextBox ID="txtteacher" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style92">
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style73">
                                <asp:Label ID="Label36" runat="server" Text="书号"></asp:Label>
                            </td>
                            <td class="auto-style104">
                                <asp:TextBox ID="txtbooknumber" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style75">
                                <asp:Label ID="Label37" runat="server" style="text-align: right" Text="定价"></asp:Label>
                            </td>
                            <td class="auto-style110">
                                <asp:TextBox ID="txtprice" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style112">
                                <asp:Label ID="Label38" runat="server" Text="存放位置"></asp:Label>
                            </td>
                            <td class="auto-style92">
                                <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style92">
                                </td>
                        </tr>
                        <tr>
                            <td class="auto-style74">
                                <asp:Label ID="Label39" runat="server" Text="开本"></asp:Label>
                            </td>
                            <td class="auto-style106">
                                <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style70">
                                <asp:Label ID="Label40" runat="server" Text="页数"></asp:Label>
                            </td>
                            <td class="auto-style111">
                                <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                            </td>
                            <td class="auto-style113">
                                <asp:Label ID="Label41" runat="server" Text="备注"></asp:Label>
                            </td>
                            <td class="auto-style90">
                                <asp:TextBox ID="txtnote" runat="server" ></asp:TextBox>
                            </td>
                            <td class="auto-style90">
                                &nbsp;</td>
                        </tr>
                        </table>
        </div>            
        <div>
                    <table style="width:100%;">
                        <tr>
                            <td class="auto-style82">&nbsp;</td>
                            <td class="auto-style81">&nbsp;</td>
                            <td class="auto-style83">&nbsp;</td>
                        </tr>
                        <tr>
                            <td class="auto-style84"></td>
                            <td class="auto-style85">
                                <asp:Button ID="btclear" runat="server" OnClick="btclear_Click" style="text-align: center;" Text="清空" Width="80px" />
                            </td>
                            <td class="auto-style86">
                                <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" Width="80px" />
                            </td>
                            <td class="auto-style87"></td>
                        </tr>
                        <tr>
                            <td class="auto-style82">&nbsp;</td>
                            <td class="auto-style81">&nbsp;</td>
                            <td class="auto-style83">&nbsp;</td>
                        </tr>
                    </table>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [book_type]"></asp:SqlDataSource>
        <div style="margin:0px auto;height:320px;text-align:center;font-size:small;overflow-y: scroll; ">

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" Style="margin-top: 0;" AllowPaging="True" OnPageIndexChanging="GridViewHistory_PageIndexChanging" Width="100%" CellPadding="4" ForeColor="#333333" GridLines="None" >
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
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [binding_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
    </div>

                    </form>           
</body>
</html>

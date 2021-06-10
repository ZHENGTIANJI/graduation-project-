<%@ Page Language="C#" AutoEventWireup="true" CodeFile="basicdata.aspx.cs" Inherits="basicdata_basicdata" %>

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
    .hidden { display:none;}
ri{
    float:right;
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
.table-a table{border-bottom:1px solid black;border-top:1px solid black;}
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
    </style>
</head>
<body>
    <form id="form1" runat="server">
    
    <div>
        <div style=" margin:0px auto; height:20px;"></div>
        <div style=" margin:0px auto; height:250px;">
            <hr />
        <div style="float:left;height:250px;width:25%;">
            <div style="float:left;height:250px;width:30%;"></div>
            <div style="float:left;height:250px;width:50%;overflow:auto;font-size:small">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="btid" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView1_RowDeleting" >
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="btid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="btid" >
                <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                <asp:BoundField DataField="btname" HeaderText="图书类别名称" SortExpression="btname" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('确定要删除该图书类别吗?')" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
            </div>
        <div style="float:left;height:250px;width:25%;">
            <div style="float:left;height:250px;width:30%;"></div>
            <div style="float:left;height:250px;width:50%;overflow:auto;font-size:small">
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="dtid" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView2_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="dtid" HeaderText="ID" ReadOnly="True" SortExpression="dtid" >
                <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                <asp:BoundField DataField="dtname" HeaderText="资料类别名称" SortExpression="dtname" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('确定要删除该资料类别吗?')" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
        
        </div>
    <div style="float:left;height:250px;width:25%;">
        <div style="float:left;height:250px;width:30%;"></div>
            <div style="float:left;height:250px;width:50%;overflow:auto;font-size:small">
        <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="jtid" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView3_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="jtid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="jtid" >
                    <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                <asp:BoundField DataField="jtname" HeaderText="期刊类别名称" SortExpression="jtname" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('确定要删除该期刊类别吗?')" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
        </div>
        <div style="float:left;height:250px;width:20%;">
            <div style="float:left;height:250px;width:30%;"></div>
            <div style="float:left;height:250px;width:50%;overflow:auto;font-size:small">
        <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" DataKeyNames="ptid" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView4_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="ptid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="ptid" >
                    <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                <asp:BoundField DataField="ptname" HeaderText="论文类别名称" SortExpression="ptname" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('确定要删除该论文吗?')" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
            </div>
            </div>
        <div style=" margin:0px auto; height:20px;"></div>
        <div style=" margin:0px auto; height:55px;">
            <div style="float:left;height:50px;width:25%;">
                <div style="float:left;height:50px;width:20%;"></div>
                <asp:TextBox ID="txtbtname" runat="server"></asp:TextBox>
        <asp:Button ID="btbook" runat="server" OnClick="btbook_Click" Text="添加" />
                </div>
            <div style="float:left;height:50px;width:25%;">
                <div style="float:left;height:50px;width:20%;"></div>
            <asp:TextBox ID="txtdtname" runat="server"></asp:TextBox>
        <asp:Button ID="btdata" runat="server" OnClick="btdata_Click" Text="添加" />
                </div>
            <div style="float:left;height:50px;width:25%;">
                <div style="float:left;height:50px;width:20%;"></div>
                <asp:TextBox ID="txtjtname" runat="server"></asp:TextBox>
        <asp:Button ID="btjournal" runat="server" OnClick="btjournal_Click" Text="添加" />
                </div>
            <div style="float:left;height:50px;width:24%;">
                <div style="float:left;height:50px;width:20%;"></div>
                <asp:TextBox ID="txtptname" runat="server"></asp:TextBox>
        <asp:Button ID="btpaper" runat="server" OnClick="btpaper_Click" Text="添加" />
                </div>
        </div>
        <div style=" margin:0px auto; height:20px;">
            <hr />
        </div>
        <div style=" margin:0px auto; height:200px;">
        <div style="float:left;height:200px;width:25%;">
            <div style="float:left;height:250px;width:30%;"></div>
            <div style="float:left;height:250px;width:50%;overflow:auto;font-size:small">
        <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" DataKeyNames="bitid" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView5_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="bitid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="bitid" >
                    <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                <asp:BoundField DataField="bitname" HeaderText="装订类型名称" SortExpression="bitname" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('确定要添加该装订类别吗?')" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
            </div>
            <div style="float:left;height:200px;width:25%;">
                <div style="float:left;height:250px;width:30%;"></div>
            <div style="float:left;height:250px;width:50%;overflow:auto;font-size:small">
        <asp:GridView ID="GridView6" runat="server" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView6_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="gid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="gid" >
                    <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                <asp:BoundField DataField="gradename" HeaderText="期刊等级" SortExpression="gradename" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('确定要添加该期刊等级吗?')" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
                </div>
            <div style="float:left;height:200px;width:25%;">
                <div style="float:left;height:250px;width:30%;"></div>
            <div style="float:left;height:250px;width:50%;overflow:auto;font-size:small">
        <asp:GridView ID="GridView7" runat="server" AutoGenerateColumns="False" DataKeyNames="organid" CellPadding="4" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView7_RowDeleting">
            <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
            <Columns>
                <asp:BoundField DataField="organid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="organid" >
                    <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                <asp:BoundField DataField="organname" HeaderText="检索机构" SortExpression="organname" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('确定要添加该检索机构吗?')" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
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
                </div>
            <div style="float:left;height:200px;width:24%;">
                <div style="float:left;height:250px;width:30%;"></div>
                <div style="float:left;height:250px;width:50%;overflow:auto;font-size:small">
                    <asp:GridView ID="GridView8" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="lid" ForeColor="#333333" GridLines="None" OnRowDeleting="GridView8_RowDeleting">
                        <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                        <Columns>
                            <asp:BoundField DataField="lid" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="lid" >
                                <HeaderStyle CssClass="hidden" />
                        <ItemStyle CssClass="hidden" />
                        <FooterStyle CssClass="hidden" />
                    </asp:BoundField>
                            <asp:BoundField DataField="lname" HeaderText="语种" SortExpression="lname" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('确定要添加语种吗?')" Text="删除"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
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
            </div>
            
            </div>
        <div style=" margin:0px auto; height:100px;">
             <div style="float:left;height:100px;width:25%;">
                 <div style="float:left;height:100px;width:20%;"></div>
                 <asp:TextBox ID="txtbitname" runat="server"></asp:TextBox>
        <asp:Button ID="btbinding" runat="server" OnClick="btbinding_Click" Text="添加" />
             </div>
            <div style="float:left;height:100px;width:25%;">
                <div style="float:left;height:100px;width:20%;"></div>
                <asp:TextBox ID="txtgrade" runat="server"></asp:TextBox>
        <asp:Button ID="btgrade" runat="server" OnClick="btgrade_Click" Text="添加"  />
            </div>
            <div style="float:left;height:100px;width:25%;">
                <div style="float:left;height:100px;width:20%;"></div>
                <asp:TextBox ID="txtorgan" runat="server"></asp:TextBox>
        <asp:Button ID="btorgan" runat="server" OnClick="btorgan_Click" Text="添加" />
            </div>
            <div style="float:left;height:100px;width:24%;">
                <div style="float:left;height:100px;width:20%;"></div>
                <asp:TextBox ID="txtlname" runat="server"></asp:TextBox>
                <asp:Button ID="btlanguage" runat="server" Text="添加" OnClick="btlanguage_Click" />
                </div>
            </div>
        </div>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="office.aspx.cs" Inherits="managers_BaseData_office" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style>
        .nav {
            height: 40px;
            background-color: rgb(231, 231, 231);
            font-size: 16px;
            padding-left: 0px;
            margin: 0 auto;
        }

        li {
            float: left;
            list-style: none;
        }

        .link {
            text-decoration: none;
            color: black;
            display: inline-block;
            line-height: 40px;
            padding: 0 30px;
        }

       .link:hover{
            background-color: white;
        }
    </style>
    <link rel="stylesheet" href="../btn_textbox.css" />
    <link rel="stylesheet" href="../mGrid.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul class="nav">
                <li class="btnn1">
                    <asp:LinkButton ID="lkbc" runat="server" OnClick="lkbc_Click" CssClass="link">学院</asp:LinkButton>
                </li>
                <li class="btnn2">
                    <asp:LinkButton ID="lkbm" runat="server" OnClick="lkbm_Click" CssClass="link">专业</asp:LinkButton>
                </li>
            </ul>
        </div>
        <br />
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div>
                    <br />
                    <div style="width: 18%; margin: 0 auto;">
                        学院：<asp:TextBox ID="txtn" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                    <br />
                    <div style="width: 68px; margin-left: 50%; position: relative; left: -34px;">
                        <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="增加" CssClass="btedit ant-btn-primary" />
                    </div>
                </div>
                <br/>
                <asp:GridView ID="GridView1" runat="server" Width="50%" Style="text-align: center" align="center" AutoGenerateColumns="False" DataKeyNames="cid" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                    <Columns>
                        <asp:BoundField DataField="cid" HeaderText="编号" ReadOnly="True" SortExpression="cid" />
                        <asp:BoundField DataField="cn" HeaderText="学院" SortExpression="cn" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("cid") %>' CommandName="Delete1" OnClientClick="return window.confirm(&quot;确认要删除吗？&quot;)" Text="删除"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div>
                    <br />
                    <div style="width: 18%; margin: 0 auto;">
                        专业：<asp:TextBox ID="txtn1" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                    <br />
                    <div style="width: 18%; margin: 0 auto;">
                        学院：<asp:DropDownList ID="dpc" runat="server" DataSourceID="SqlDataSource1" DataTextField="cn" DataValueField="cid" CssClass="input">
                        </asp:DropDownList>
                    </div>
                    <br />
                    <div style="width: 68px; margin-left: 50%; position: relative; left: -34px;">
                        <asp:Button ID="btok1" runat="server" OnClick="btok1_Click" Text="增加" Style="text-align: center" CssClass="btedit ant-btn-primary" />
                    </div>
                </div>
                <br/>
                <asp:GridView ID="GridView2" runat="server" align="center" Width="50%" AutoGenerateColumns="False" DataKeyNames="mid" DataSourceID="SqlDataSource2" Style="text-align: center" OnRowCommand="GridView2_RowCommand" AllowPaging="True" PageSize="10" OnPageIndexChanging="GridView2_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                    <Columns>
                        <asp:BoundField DataField="mid" HeaderText="编号" ReadOnly="True" SortExpression="mid" />
                        <asp:BoundField DataField="mname" HeaderText="专业" SortExpression="mname" />
                        <asp:BoundField DataField="cn" HeaderText="学院" ReadOnly="True" SortExpression="cn" />
                        <asp:CommandField ShowEditButton="True" />
                        <asp:TemplateField ShowHeader="False">
                            <ItemTemplate>
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("mid") %>' CommandName="Delete2" OnClientClick="return window.confirm(&quot;确认要删除吗？&quot;)" Text="删除"></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </asp:View>
        </asp:MultiView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" InsertCommand="insert campus(cid,cn) values(@cid,@cn)" SelectCommand="SELECT * FROM [campus]" UpdateCommand="update campus set cn=@cn where cid=@cid">
            <InsertParameters>
                <asp:Parameter Name="cid" />
                <asp:Parameter Name="cn" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="cn" />
                <asp:Parameter Name="cid" />
            </UpdateParameters>
        </asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select major.mid,cn,mname from major left join campus on campus.cid=major.cid" UpdateCommand="update major set mname=@mname where mid=@mid" InsertCommand="insert major(mid,mname,cid) values(@mid,@mname,@cid)">
            <InsertParameters>
                <asp:Parameter Name="mid" />
                <asp:Parameter Name="mname" />
                <asp:Parameter Name="cid" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="mname" />
                <asp:Parameter Name="mid" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

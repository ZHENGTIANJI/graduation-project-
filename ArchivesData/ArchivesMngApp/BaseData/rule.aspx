<%@ Page Language="C#" AutoEventWireup="true" CodeFile="rule.aspx.cs" Inherits="managers_BaseData_rule" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style4 {
            text-align: center;
        }

        .auto-style12 {
            text-align: center;
        }

        .auto-style13 {
            height: 24px;
            text-align: center;
        }
    </style>
    <link rel="stylesheet" href="../btn_textbox.css" />
    <link rel="stylesheet" href="../mGrid.css" />
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;margin:0 auto;">
            <tr>
                <td class="auto-style12">用户类别：<asp:TextBox ID="txtuty" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style13">借书上限：<asp:TextBox ID="txtnum" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">预留天数：<asp:TextBox ID="txtrdays" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">借阅天数：<asp:TextBox ID="txtbdays" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">续借次数：<asp:TextBox ID="txtrenew_times" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style12">续借天数：<asp:TextBox ID="txtrenew_days" runat="server" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style4">
                    <asp:Button ID="btadd" runat="server" Text="增加" OnClick="btadd_Click" CssClass="btedit ant-btn-primary" />
                </td>
            </tr>
            </table>
    <div>  
                    <asp:GridView ID="GridView1" runat="server" align="center" width="50%" AutoGenerateColumns="False" DataKeyNames="utid" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand1" OnRowUpdating="GridView1_RowUpdating" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
                        <Columns>
                            <asp:BoundField DataField="utid" HeaderText="类型编号" ReadOnly="True" SortExpression="utid" />
                            <asp:TemplateField HeaderText="用户类别" SortExpression="user_class">
                                <EditItemTemplate>
                                    <asp:Label ID="lbuty" runat="server" Text='<%# Eval("user_class") %>'></asp:Label>
                                </EditItemTemplate>
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("user_class") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="number_limit" HeaderText="借书上限" SortExpression="number_limit" />
                            <asp:BoundField DataField="reserve_days" HeaderText="预留天数" SortExpression="reserve_days" />
                            <asp:BoundField DataField="borrow_days" HeaderText="借阅天数" SortExpression="borrow_days" />
                            <asp:BoundField DataField="renew_times" HeaderText="续借次数" SortExpression="renew_times" />
                            <asp:BoundField DataField="renew_days" HeaderText="续借期限" SortExpression="renew_days" />
                            <asp:CommandField ShowEditButton="True" />
                            <asp:TemplateField ShowHeader="False">
                                <ItemTemplate>
                                    <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("utid") %>' CommandName="Delete2" OnClientClick="return window.confirm(&quot;确认要删除吗？&quot;)" Text="删除"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
    </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select  *  from user_class" InsertCommand="insert user_class(utid,user_class,number_limit,reserve_days,borrow_days,renew_times,renew_days) values(@utid,@user_class,@number_limit,@reserve_days,@borrow_days,@renew_times,@renew_days)" UpdateCommand="update user_class set user_class=@user_class,number_limit=@number_limit,reserve_days=@reserve_days,borrow_days=@borrow_days,renew_times=@renew_times,renew_days=@renew_days where utid=@utid">
            <InsertParameters>
                <asp:Parameter Name="utid" />
                <asp:Parameter Name="user_class" />
                <asp:Parameter Name="number_limit" />
                <asp:Parameter Name="reserve_days" />
                <asp:Parameter Name="borrow_days" />
                <asp:Parameter Name="renew_times" />
                <asp:Parameter Name="renew_days" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="user_class" />
                <asp:Parameter Name="number_limit" />
                <asp:Parameter Name="reserve_days" />
                <asp:Parameter Name="borrow_days" />
                <asp:Parameter Name="utid" />
                <asp:Parameter Name="renew_times" />
                <asp:Parameter Name="renew_days" />
            </UpdateParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

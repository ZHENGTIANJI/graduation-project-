<%@ Page Language="C#" AutoEventWireup="true" CodeFile="renew.aspx.cs" Inherits="renew" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="mGrid.css"/>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <br />
        <br />
    
        <br />
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" align="center" style="text-align: center; margin-top: 0px"  AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" PageSize="10">
            <Columns>
                <asp:TemplateField HeaderText="编号" SortExpression="id">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%#  Container.DataItemIndex+1%>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Container.DataItemIndex+1 %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="QR_code" HeaderText="条形码编码" ReadOnly="True" SortExpression="QR_code" />
                <asp:BoundField DataField="name" HeaderText="题名" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="name1" HeaderText="资源类型" ReadOnly="True" SortExpression="name1" />
                <asp:BoundField DataField="borrow_dt" HeaderText="借阅时间" ReadOnly="True" SortExpression="borrow_dt" DataFormatString="{0:yyyy-MM-dd}"/>
                <asp:BoundField DataField="deadline" HeaderText="截止时间" ReadOnly="True" SortExpression="deadline"  DataFormatString="{0:yyyy-MM-dd}"/>
                <asp:BoundField DataField="renew_times" HeaderText="续借次数" ReadOnly="True" SortExpression="renew_times" />
                <asp:TemplateField ShowHeader="False" HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="btrenew" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id") %>' Text="续借" OnClick="btrenew_Click" OnClientClick="return window.confirm(&quot;是否确定续借？&quot;)" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <EmptyDataTemplate>
                暂无数据！
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select ' ' id,' ' QR_code,' ' name,' ' name,' ' borrow_dt, ' ' return_dt,' ' is_return,' ' deadline,' ' renew_times"></asp:SqlDataSource>
    </form>
</body>
</html>

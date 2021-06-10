<%@ Page Language="C#" AutoEventWireup="true" CodeFile="shenhe.aspx.cs" Inherits="managers_user_manage_shenhe" EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
        }
        .auto-style2 {
            text-align: left;
        }
    </style>
    <link rel="stylesheet" href="../btn_textbox.css" />
    <link rel="stylesheet" href="../mGrid.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width:100%;">
            <tr>
                <td class="auto-style1" style="text-align: center">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style2">筛选：<asp:DropDownList ID="dpcond" runat="server" AutoPostBack="True" OnSelectedIndexChanged="dpcond_SelectedIndexChanged" CssClass="input">
                    <asp:ListItem Value="0">全部</asp:ListItem>
                    <asp:ListItem Value="1">已审核</asp:ListItem>
                    <asp:ListItem Value="2">未审核</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
        </table>
    
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" align="center" OnRowDataBound=" GridView1_RowDataBound1" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="账号" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="psw" HeaderText="密码" SortExpression="psw" />
                <asp:BoundField DataField="user_class" HeaderText="用户类别" SortExpression="user_class" />
                <asp:BoundField DataField="name" HeaderText="姓名" SortExpression="name" />
                <asp:BoundField DataField="sex" HeaderText="性别" SortExpression="sex" />
                <asp:BoundField DataField="cn" HeaderText="学院" SortExpression="cn" />
                <asp:BoundField DataField="mname" HeaderText="专业" SortExpression="mname" />
                <asp:BoundField DataField="grade" HeaderText="年级" SortExpression="grade" />
                <asp:BoundField DataField="class" HeaderText="班级" SortExpression="class" />
                <asp:BoundField DataField="telephone" HeaderText="电话" SortExpression="telephone" />
                <asp:BoundField DataField="email" HeaderText="邮箱" SortExpression="email" />
                <asp:BoundField DataField="shenhe" HeaderText="审核状态" ReadOnly="True" SortExpression="shenhe" />
                <asp:TemplateField ShowHeader="False" HeaderText="操作">
                    <ItemTemplate>
                        <asp:LinkButton ID="btshenhe" runat="server" CausesValidation="false" CommandName="Update" Text="审核" CommandArgument='<%# Eval("id") %>' OnClick="btshenhe_Click" Width="65px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select id,psw,user_class.user_class,name,sex,cn,mname,grade,class,telephone,email,shenhe from users left join major on major.mid=users.major left join campus on campus.cid=major.cid left join user_class on user_class.utid=users.user_class order by shenhe"></asp:SqlDataSource>
    </form>
</body>
</html>

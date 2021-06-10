<%@ Page Language="C#" AutoEventWireup="true" CodeFile="edit.aspx.cs" Inherits="managers_user_manage_edit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            height: 24px;
        }

        .auto-style2 {
            text-align: center;
        }
    </style>
    <link rel="stylesheet" href="../btn_textbox.css" />
    <link rel="stylesheet" href="../mGrid.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        &nbsp;<table style="width:70%;margin:0 auto;">
            <tr>
                <td class="auto-style1">账号：<asp:TextBox ID="txtid" runat="server" CssClass="input"></asp:TextBox>
                </td>
                <td class="auto-style1">姓名：<asp:TextBox ID="txtn" runat="server" CssClass="input"></asp:TextBox>
                </td>
                <td class="auto-style1">用户类别：<asp:DropDownList ID="dputy" runat="server" DataSourceID="SqlDataSource2" DataTextField="user_class" DataValueField="utid" CssClass="input">
                    </asp:DropDownList>
                </td>
                <td class="auto-style1">单位：<asp:DropDownList ID="dpc" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3" DataTextField="cn" DataValueField="cid" CssClass="input">
                    </asp:DropDownList>
                    <asp:DropDownList ID="dpm" runat="server" DataSourceID="SqlDataSource4" DataTextField="mname" DataValueField="mid">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style2" colspan="4">
                    <asp:Button ID="btfind" runat="server" OnClick="btfind_Click" Text="查询" CssClass="btedit ant-btn-primary"/>
&nbsp; <asp:Button ID="btinsert" runat="server" OnClick="btinsert_Click" Text="增加" CssClass="btedit ant-btn-primary"  />
    
    &nbsp;
        <asp:Button ID="btPrint" runat="server" OnClick="btPrint_Click" Text="打印" CssClass="btedit ant-btn-primary" />
    
                </td>
            </tr>
        </table>
    
    &nbsp;
            
    </div>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" DataSourceID="SqlDataSource1" OnRowCommand="GridView1_RowCommand" align="center" AllowPaging="True"  GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" PageSize="10">
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
                <asp:TemplateField ShowHeader="False">
                    <EditItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update" Text="更新"></asp:LinkButton>
                        &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel" Text="取消"></asp:LinkButton>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id") %>' CommandName="Edit2" Text="编辑"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id") %>' CommandName="Delete2" OnClientClick="return window.confirm(&quot;确认要删除吗？&quot;)" Text="删除"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select id,psw,user_class.user_class,name,sex,cn,mname,grade,class,telephone,email from users left join major on major.mid=users.major left join campus on campus.cid=major.cid left join user_class on user_class.utid=users.user_class  where shenhe=1"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT [utid], [user_class] FROM [user_class] union select '0','请选择'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT cid,cn FROM [campus] union select '0','请选择'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT [mid], [mname] FROM [major] WHERE ([cid] = @cid) union select '0','请选择'">
            <SelectParameters>
                <asp:ControlParameter ControlID="dpc" Name="cid" PropertyName="SelectedValue" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>
    </form>
</body>
</html>

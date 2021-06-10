<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FindReaderBorrow.aspx.cs" Inherits="find_FindReaderBorrow"  Debug="true"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 376px;
        }

        .btfind{
            background-color: teal;
            border:none;
            outline:none;
            cursor:pointer;
            color:white;
            width:50px;
            height:23px;
            font-size:13px;
            border-radius:2px;
        }
        .auto-style2 {
            width: 376px;
            height: 28px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../mGrid.css" />
    <link rel="stylesheet" type="text/css" href="../btn_textbox.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div style="width: 100%; text-align:center;">
            <div style="width:378px;margin:0 auto;display: inline-block;vertical-align:top;">
            <table style="display:inline-block;text-align:left;">
                <tr>
                    <td class="auto-style1">借书人姓名：<asp:TextBox ID="txtn" runat="server" CssClass="input"></asp:TextBox>
                        <asp:Button ID="btselect" runat="server" OnClick="btselect_Click" Text="查询" CssClass="btfind"/>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">借书人账号：<asp:TextBox ID="txtid" runat="server" Enabled="False" CssClass="input"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1">未还书数量：<asp:TextBox ID="txtunreturn" runat="server" Enabled="False" CssClass="input"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">超期书数量：<asp:TextBox ID="txtovertime" runat="server" Enabled="False" CssClass="input"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style1" style="padding-left: 30%;">
                        <asp:Button ID="btprint" runat="server" OnClick="btprint_Click" Text="打印" CssClass="ant-btn-primary btedit" />
                    </td>
                </tr>
            </table>
                </div>
            &nbsp;&nbsp;&nbsp;
            <div style="width:420px;display:inline-block;">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" Style="text-align: center;" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="5" >
                <Columns>
                    <asp:BoundField DataField="id" HeaderText="账号" ReadOnly="True" SortExpression="id"/>
                    <asp:BoundField DataField="name" HeaderText="姓名" ReadOnly="True" SortExpression="name" />
                    <asp:BoundField DataField="user_class" HeaderText="用户类别" ReadOnly="True" SortExpression="user_class" />
                    <asp:BoundField DataField="cn" HeaderText="学院" ReadOnly="True" SortExpression="cn" />
                    <asp:BoundField DataField="mname" HeaderText="专业" ReadOnly="True" SortExpression="mname" />
                    <asp:TemplateField ShowHeader="False" HeaderText="操作">
                        <ItemTemplate>
                            <asp:LinkButton ID="Button1" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id") %>' OnClick="Button1_Click" Text="选择" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                 <EmptyDataRowStyle BackColor="LightBlue" ForeColor="Red"/>
                <EmptyDataTemplate>
                    暂无数据！
                </EmptyDataTemplate>
            </asp:GridView>
                </div>
        </div>
        <hr />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" align="center" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
            <Columns>
                <asp:BoundField DataField="id" HeaderText="编号" ReadOnly="True" SortExpression="id" />
                <asp:BoundField DataField="name" HeaderText="书名" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="QR_code" HeaderText="条形码编码" ReadOnly="True" SortExpression="QR_code" />
                <asp:BoundField DataField="is_return" HeaderText="是否归还" ReadOnly="True" SortExpression="is_return" />
                <asp:BoundField DataField="borrower_id" HeaderText="借阅者账号" ReadOnly="True" SortExpression="borrower_id" />
                <asp:BoundField DataField="name1" HeaderText="借阅者姓名" ReadOnly="True" SortExpression="name1" />
                <asp:BoundField DataField="borrow_dt" HeaderText="借阅时间" ReadOnly="True" SortExpression="borrow_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="deadline" HeaderText="截止时间" ReadOnly="True" SortExpression="deadline" DataFormatString="{0:yyyy-MM-dd}" />
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select '' id,'' name,'' QR_code,'' is_return,'' borrower_id,'' name,'' borrow_dt,'' deadline
"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select '' id,'' name,'' user_class,'' cn,'' mname"></asp:SqlDataSource>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="borrow.aspx.cs" Inherits="managers_borrow_borrow" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
        }
        .auto-style3 {
            width: 123px;
        }
        #form1 {
            text-align: left;
        }
        .auto-style4 {
            width: 354px;
        }

        .btfind {
            background-color: teal;
            border: none;
            outline: none;
            cursor: pointer;
            color: white;
            width: 50px;
            height: 23px;
            font-size: 13px;
            border-radius: 2px;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../mGrid.css" />
    <link rel="stylesheet" type="text/css" href="../btn_textbox.css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <table style="width: 71%; margin: 0 auto;">
            <tr>
                <td class="auto-style3">用户姓名：</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtn" runat="server" CssClass="input"></asp:TextBox>
                    <asp:Button ID="btfindp" runat="server" OnClick="btfindp_Click" Text="查询" ValidationGroup="2" CssClass="btfind"/>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtn" ErrorMessage="未填写！" ValidationGroup="2"></asp:RequiredFieldValidator>
                </td>
                <td class="auto-style2" rowspan="5" style="vertical-align:top;">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" Style="text-align: center" AllowPaging="True" OnPageIndexChanging="GridView2_PageIndexChanging" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="账号" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="name" HeaderText="姓名" ReadOnly="True" SortExpression="name" />
                            <asp:BoundField DataField="user_class" HeaderText="用户类别" ReadOnly="True" SortExpression="user_class" />
                            <asp:BoundField DataField="cn" HeaderText="学院" ReadOnly="True" SortExpression="cn" />
                            <asp:BoundField DataField="mname" HeaderText="专业" ReadOnly="True" SortExpression="mname" />
                            <asp:TemplateField ShowHeader="False" HeaderText="操作">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btselect" runat="server" CausesValidation="False" CommandArgument='<%# Eval("id") %>' OnClick="btselect_Click" Text="选择" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">用户账号：</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtid" runat="server" Enabled="False" CssClass="input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="txtid" ErrorMessage="请先选择借书人！" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">条形码编号：</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtbid" runat="server" CssClass="input"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="txtbid" ErrorMessage="不能为空！" ValidationGroup="1"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">借书日期：</td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtdate" runat="server" Enabled="False" CssClass="input"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">
                    <asp:Button ID="btok" runat="server" Text="借阅" OnClick="btok_Click" ValidationGroup="1" CssClass="btedit ant-btn-primary"/>
                </td>
            </tr>
        </table>
    
    </div>
        <hr />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [borrow_type]"></asp:SqlDataSource>
        <table style="width: 100%;">
            <tr>
                <td style="text-align: center">
                    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowDataBound="GridView1_RowDataBound" align="center" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="序号" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="name" HeaderText="借阅者姓名" ReadOnly="True" SortExpression="name" />
                            <asp:BoundField DataField="borrow_dt" HeaderText="借阅时间" ReadOnly="True" SortExpression="borrow_dt" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="QR_code" HeaderText="条形码编码" ReadOnly="True" SortExpression="QR_code" />
                            <asp:BoundField DataField="bn" HeaderText="书名" ReadOnly="True" SortExpression="bn" />
                            <asp:BoundField DataField="btn" HeaderText="资源类型" ReadOnly="True" SortExpression="btn" />
                            <asp:BoundField DataField="deadline" HeaderText="截止时间" ReadOnly="True" SortExpression="deadline" DataFormatString="{0:yyyy-MM-dd}" />
                        </Columns>
                    </asp:GridView>
                    <br />
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" AllowPaging="True" OnPageIndexChanging="GridView3_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" OnRowDataBound="GridView3_RowDataBound" align="center">
                        <Columns>
                            <asp:BoundField DataField="id" HeaderText="序号" ReadOnly="True" SortExpression="id" />
                            <asp:BoundField DataField="name" HeaderText="预约者姓名" ReadOnly="True" SortExpression="name" />
                            <asp:BoundField DataField="reserve_time" HeaderText="预约时间" ReadOnly="True" SortExpression="reserve_time" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="QR_code" HeaderText="条形码编码" ReadOnly="True" SortExpression="QR_code" />
                            <asp:BoundField DataField="bn" HeaderText="书名" ReadOnly="True" SortExpression="bn" />
                            <asp:BoundField DataField="btn" HeaderText="资源类型" ReadOnly="True" SortExpression="btn" />
                            <asp:BoundField DataField="deadline" HeaderText="截止时间" ReadOnly="True" SortExpression="deadline" DataFormatString="{0:yyyy-MM-dd}" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <br />
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select 0 id,'' name,'' borrow_dt,'' QR_code,'' bn,'' btn,'' deadline"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select '' id,'' name,'' user_class,'' cn,'' mname"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select '' id,'' name,'' reserve_time,'' QR_code,'' bn,'' btn,'' deadline"></asp:SqlDataSource>
    </form>
</body>
</html>

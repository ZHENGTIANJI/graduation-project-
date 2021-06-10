<%@ Page Language="C#" AutoEventWireup="true" CodeFile="borrowww.aspx.cs" Inherits="borrowww"  EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .nav {
            height: 40px;
            background-color: rgb(231, 231, 231);
            font-size: 16px;
            padding-left: 10px;
            margin:0 auto;
        }
        li {
            float: left;
            list-style: none;
            line-height: 40px;
            padding: 0 10px;
        }
    </style>
    <link rel="stylesheet" href="btn_textbox.css"/>
    <link rel="stylesheet" href="mGrid.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul class="nav">
                <li>
                    <asp:RadioButton ID="rbc" runat="server" AutoPostBack="True" Checked="True" GroupName="1" Text="当前借阅" />
                </li>
                <li>
                    <asp:RadioButton ID="rbh" runat="server" AutoPostBack="True" GroupName="1" Text="历史借阅" />

                </li>
            </ul>
        </div>
        <div style="margin:10px 0px 0px 20px;">
            <asp:Button ID="btselect" runat="server" OnClick="btselect_Click" Text="导出" Style="margin-left: 0px" CssClass="btedit ant-btn-primary" />
        </div>
        <br />
        <asp:GridView ID="GridView1" runat="server" align="center" AllowPaging="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowDataBound="GridView1_RowDataBound" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt">
            <Columns>
                <asp:BoundField DataField="row_id" HeaderText="序号" ReadOnly="True" SortExpression="row_id" />
                <asp:BoundField DataField="QR_code" HeaderText="条形码编码" ReadOnly="True" SortExpression="QR_code" />
                <asp:BoundField DataField="name" HeaderText="题名" ReadOnly="True" SortExpression="name" />
                <asp:BoundField DataField="name1" HeaderText="资源类型" ReadOnly="True" SortExpression="name1" />
                <asp:BoundField DataField="borrow_dt" HeaderText="借阅时间" ReadOnly="True" SortExpression="borrow_dt" DataFormatString="{0:yyyy-MM-dd}"/>
                <asp:BoundField DataField="return_dt" HeaderText="归还时间" ReadOnly="True" SortExpression="return_dt" DataFormatString="{0:yyyy-MM-dd}"/>
                <asp:BoundField DataField="is_return" HeaderText="是否归还" ReadOnly="True" SortExpression="is_return" />
                <asp:BoundField DataField="deadline" HeaderText="截止时间" ReadOnly="True" SortExpression="deadline" DataFormatString="{0:yyyy-MM-dd}"/>
            </Columns>
            <EmptyDataTemplate>
                暂无数据！
            </EmptyDataTemplate>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT '' row_id,'' QR_code, '' name,'' name,'' borrow_dt,  '' return_dt,''  is_return, '' deadline"></asp:SqlDataSource>
    </form>
</body>
</html>

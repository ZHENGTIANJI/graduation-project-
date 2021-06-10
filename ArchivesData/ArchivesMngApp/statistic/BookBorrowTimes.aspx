<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookBorrowTimes.aspx.cs" Inherits="managers_statistic_BookBorrowTimes" %>

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

       .link:hover {
            background-color: white;
        }
    </style>
    <link rel="stylesheet" type="text/css" href="../mGrid.css" />
    <link rel="stylesheet" type="text/css" href="../btn_textbox.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <ul class="nav">
                <li>
                    <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="link">各资源累计借阅次数统计</asp:LinkButton>
                </li>
                <li>
                    <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click" CssClass="link">各类资源借阅次数统计</asp:LinkButton>
                </li>
            </ul>
        </div>
        <br/>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="View1" runat="server">
                <div style="width: 306px; margin: 0 auto;">
                    <div style="width: 306px;">
                        <div style="width: 120px; display: inline-block;">资源类型：</div>
                        <asp:DropDownList ID="dpbty" runat="server" CssClass="input" DataSourceID="SqlDataSource3" DataTextField="name" DataValueField="id">
                        </asp:DropDownList>
                    </div>

                    <div style="width: 306px;">
                        <div style="width: 120px; display: inline-block;">资源关键字：</div>
                        <asp:TextBox ID="txtbn" runat="server" CssClass="input"></asp:TextBox>
                    </div>
                    <div style="width: 306px;">
                        <div style="width: 120px; display: inline-block;">借阅时间：</div>
                        <asp:TextBox ID="txts" runat="server" CssClass="input" Width="70px"></asp:TextBox>
                        -<asp:TextBox ID="txte" runat="server" CssClass="input" Width="70px"></asp:TextBox>
                    </div>
                    <br />
                    <div style="width: 306px; text-align: center;">
                        <asp:Button ID="btselect" runat="server" OnClick="btselect_Click" Text="筛选" CssClass="btedit ant-btn-primary" />
                        &nbsp;&nbsp;&nbsp;
                                        <asp:Button ID="btprint" runat="server" OnClick="btprint_Click" Text="打印" CssClass="btedit ant-btn-primary" />
                    </div>
                </div>
                <br />
                <div style="text-align: center;"><strong style="text-align: center">各资源借阅次数统计</strong></div>
                <asp:GridView ID="GridView1" runat="server" align="center" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="50%">
                    <Columns>
                        <asp:BoundField DataField="QR_code" HeaderText="编号" SortExpression="QR_code" />
                        <asp:BoundField DataField="QR_code" HeaderText="二维码编码" ReadOnly="True" SortExpression="QR_code" />
                        <asp:BoundField DataField="name" HeaderText="书名" ReadOnly="True" SortExpression="name" />
                        <asp:BoundField DataField="num" HeaderText="借阅次数" ReadOnly="True" SortExpression="num" />
                    </Columns>
                </asp:GridView>
            </asp:View>
            <asp:View ID="View2" runat="server">
                <div style="width: 306px; margin: 0 auto;">
                    <div style="width: 306px;">
                        <div style="width: 120px; display: inline-block;">借阅时间：</div>
                        <asp:TextBox ID="txts1" runat="server" Width="70px" CssClass="input"></asp:TextBox>
                        -<asp:TextBox ID="txte1" runat="server" Width="70px" CssClass="input"></asp:TextBox>
                    </div>
                    <br />
                    <div style="width: 306px; text-align: center;">
                        <asp:Button ID="btselect1" runat="server" OnClick="btselect1_Click" Text="筛选" CssClass="btedit ant-btn-primary" />
                        &nbsp;&nbsp;&nbsp;
                            <asp:Button ID="btprint2" runat="server" OnClick="btprint2_Click" Text="打印" CssClass="btedit ant-btn-primary" />
                    </div>
                </div>
                <br />
                <div style="text-align: center;"><strong style="text-align: center">各类资源借阅次数统计</strong></div>
                <asp:GridView ID="GridView2" runat="server" align="center" AutoGenerateColumns="False" DataSourceID="SqlDataSource2" OnRowDataBound="GridView2_RowDataBound" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" Width="50%">
                    <Columns>
                        <asp:BoundField DataField="name" HeaderText="编号" SortExpression="name" />
                        <asp:BoundField DataField="name" HeaderText="资源类型" ReadOnly="True" SortExpression="name" />
                        <asp:BoundField DataField="num" HeaderText="借阅次数" ReadOnly="True" SortExpression="num" />
                    </Columns>
                </asp:GridView>
                <div style="width: 300px; height: 300px; margin: 0 auto;">
                    <asp:Chart ID="Chart1" runat="server" DataSourceID="SqlDataSource2">
                        <Series>
                            <asp:Series ChartType="Pie" Name="Series1" XValueMember="name" YValueMembers="num">
                            </asp:Series>
                        </Series>
                        <ChartAreas>
                            <asp:ChartArea Name="ChartArea1">
                            </asp:ChartArea>
                        </ChartAreas>
                    </asp:Chart>
                </div>
            </asp:View>
        </asp:MultiView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select '' QR_code,'' name,0 num"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select '' name,0 num"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [borrow_type] union select 0,'全部'"></asp:SqlDataSource>
    </form>
</body>
</html>

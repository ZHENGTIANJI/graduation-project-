<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reservee.aspx.cs" Inherits="users_reservee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 1163px;
        }

        .auto-style15 {
            width: 977px;
        }

        .auto-style16 {
            height: 24px;
            width: 977px;
            text-align: left;
        }

        .auto-style19 {
            text-align: center;
        }

        .auto-style26 {
            height: 27px;
            width: 977px;
            text-align: left;
        }

        .plusbtn {
            border: none;
            outline: none;
            width: 22px;
            height: 22px;
            border-radius: 50%;
            color: white;
            font-size: 15px;
            background-color: #1890ff;
            cursor: pointer;
        }
    </style>
    <link rel="stylesheet" href="btn_textbox.css" />
    <link rel="stylesheet" href="mGrid.css" />
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Panel ID="Panel1" runat="server" Width="485px" Style="margin: 0 auto;">
                <div class="auto-style19">
                    <table>
                        <tr style="height: auto">
                            <td style="width: 103.5px; text-align: right">
                                <asp:DropDownList ID="dpcond" runat="server" Style="width: 103.5px" CssClass="input">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:TextBox ID="txtn" runat="server" CssClass="input"></asp:TextBox>
                                <asp:DropDownList ID="dpmatch" runat="server" CssClass="input">
                                </asp:DropDownList>
                            </td>
                            <td>
                                <asp:Button ID="btplus" runat="server" Text="+" OnClick="btplus_Click" CssClass="plusbtn" />
                            </td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Visible="False" Width="485px" Style="margin: 0 auto;">
                <div class="auto-style19">
                    <table>
                        <tr style="height: auto">
                            <td style="text-align: right; width: 103.5px">
                                <asp:DropDownList ID="dpconnect" runat="server" Width="47.509px" CssClass="input">
                                </asp:DropDownList>
                                <asp:DropDownList ID="dpcond0" runat="server" Style="text-align: left" Width="52px" CssClass="input">
                                </asp:DropDownList></td>
                            <td>
                                <asp:TextBox ID="txtn0" runat="server" CssClass="input"></asp:TextBox>
                                <asp:DropDownList ID="dpmatch0" runat="server" CssClass="input">
                                </asp:DropDownList></td>
                            <td>
                                <asp:Button ID="btplus0" runat="server" Text="+" OnClick="btplus0_Click" CssClass="plusbtn" />
                                <asp:Button ID="btminus1" runat="server" Text="-" OnClick="btminus1_Click" CssClass="plusbtn" /></td>
                        </tr>
                    </table>
                </div>
            </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" Visible="False" Style="text-align: center; margin: 0 auto;" Width="485px">
                <table>
                    <tr style="height: auto">
                        <td style="text-align: right; width: 103.5px">
                            <asp:DropDownList ID="dpconnect0" runat="server" Width="47.509px" CssClass="input">
                            </asp:DropDownList>
                            <asp:DropDownList ID="dpcond1" runat="server" Width="52px" CssClass="input">
                            </asp:DropDownList></td>
                        <td>
                            <asp:TextBox ID="txtn1" runat="server" CssClass="input"></asp:TextBox>
                            <asp:DropDownList ID="dpmatch1" runat="server" CssClass="input">
                            </asp:DropDownList></td>
                        <td>
                            <asp:Button ID="btplus1" runat="server" Text="+" OnClick="btplus1_Click" CssClass="plusbtn" />
                            <asp:Button ID="btminus2" runat="server" Text="-" OnClick="btminus2_Click" CssClass="plusbtn" /></td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel4" runat="server" Visible="False" Style="text-align: center; margin: 0 auto;" Width="485px">
                <table>
                    <tr style="height: auto">
                        <td style="text-align: right; width: 103.5px">
                            <asp:DropDownList ID="dpconnect1" runat="server" Width="47.509px " CssClass="input">
                            </asp:DropDownList>
                            <asp:DropDownList ID="dpcond2" runat="server" Width="52px" CssClass="input">
                            </asp:DropDownList></td>
                        <td>
                            <asp:TextBox ID="txtn2" runat="server" CssClass="input"></asp:TextBox>
                            <asp:DropDownList ID="dpmatch2" runat="server" CssClass="input">
                            </asp:DropDownList></td>
                        <td>
                            <asp:Button ID="btplus2" runat="server" Text="+" OnClick="btplus2_Click" CssClass="plusbtn" />
                            <asp:Button ID="btminus3" runat="server" Text="-" OnClick="btminus3_Click" CssClass="plusbtn" /></td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel5" runat="server" Visible="False" Style="text-align: center; margin: 0 auto;" Width="485px">
                <table>
                    <tr style="height: auto">
                        <td style="text-align: right; width: 103.5px">
                            <asp:DropDownList ID="dpconnect2" runat="server" Width="47.509px" CssClass="input">
                            </asp:DropDownList>
                            <asp:DropDownList ID="dpcond3" runat="server" Width="52px" CssClass="input">
                            </asp:DropDownList></td>
                        <td>
                            <asp:TextBox ID="txtn3" runat="server" CssClass="input"></asp:TextBox>
                            <asp:DropDownList ID="dpmatch3" runat="server" CssClass="input">
                            </asp:DropDownList></td>
                        <td>
                            <asp:Button ID="btplus3" runat="server" Text="+" OnClick="btplus3_Click" CssClass="plusbtn" />
                            <asp:Button ID="btminus4" runat="server" Text="-" OnClick="btminus4_Click" CssClass="plusbtn" /></td>
                    </tr>
                </table>
            </asp:Panel>
            <asp:Panel ID="Panel6" runat="server" Visible="False" Style="text-align: center; margin: 0 auto;" Width="485px">
                <table>
                    <tr>
                        <td style="text-align: right; width: 103.5px">
                            <asp:DropDownList ID="dpconnect3" runat="server" Width="47.509px" CssClass="input">
                            </asp:DropDownList>
                            <asp:DropDownList ID="dpcond4" runat="server" Width="52px" CssClass="input">
                            </asp:DropDownList></td>
                        <td>
                            <asp:TextBox ID="txtn4" runat="server" CssClass="input"></asp:TextBox>
                            <asp:DropDownList ID="dpmatch4" runat="server" CssClass="input">
                            </asp:DropDownList></td>
                        <td>
                            <asp:Button ID="btminus5" runat="server" Text="-" OnClick="btminus5_Click" CssClass="plusbtn" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <table class="auto-style2" style="width: 485px; margin: 0 auto;">
                <tr>
                    <td class="auto-style26">资源类型：<asp:DropDownList ID="dpbty" runat="server" DataSourceID="SqlDataSource1" DataTextField="name" DataValueField="id" CssClass="input">
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style26">专业类型：<asp:DropDownList ID="dpmty" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mid" CssClass="input">
                    </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style26">出版时间：<asp:TextBox ID="txts" runat="server" Width="90px" CssClass="input"></asp:TextBox>
                        -<asp:TextBox ID="txte" runat="server" Width="90px" CssClass="input"></asp:TextBox>
                        &nbsp;<asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style16">
                        <div style="margin-left: 150px;">
                            <asp:Button ID="btfind" runat="server" Text="检索" OnClick="btfind_Click" CssClass="btedit ant-btn-primary" />
                        </div>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style15">&nbsp;</td>
                </tr>
            </table>

            <br />
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select * from borrow_type union select 0,'全部'"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="SELECT * FROM [major] union  select '0','全部','0'"></asp:SqlDataSource>
        <table style="width: 100%;">
            <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" align="center" Style="text-align: center" AutoGenerateColumns="False" DataSourceID="SqlDataSource3" OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" OnPageIndexChanging="GridView1_PageIndexChanging" GridLines="None" CssClass="mGrid" PagerStyle-CssClass="pgr" AlternatingRowStyle-CssClass="alt" PageSize="10">
                        <Columns>
                            <asp:BoundField DataField="QR_code" HeaderText="条形码编号" ReadOnly="True" SortExpression="QR_code" />
                            <asp:BoundField DataField="name" HeaderText="篇名" ReadOnly="True" SortExpression="name" />
                            <asp:BoundField DataField="type" HeaderText="资源类型" ReadOnly="True" SortExpression="type" />
                            <asp:BoundField DataField="mname" HeaderText="专业类型" ReadOnly="True" SortExpression="mname" />
                            <asp:BoundField DataField="publisher" HeaderText="出版机构" ReadOnly="True" SortExpression="publisher" />
                            <asp:BoundField DataField="author" HeaderText="作者" ReadOnly="True" SortExpression="author" />
                            <asp:BoundField DataField="publish_dt" HeaderText="出版时间" ReadOnly="True" SortExpression="publish_dt" DataFormatString="{0:yyyy-MM-dd}" />
                            <asp:BoundField DataField="lname" HeaderText="语种" ReadOnly="True" SortExpression="lname" />
                            <asp:BoundField DataField="number" HeaderText="库存量" ReadOnly="True" SortExpression="number" />
                            <asp:BoundField DataField="location" HeaderText="位置" ReadOnly="True" SortExpression="location" />
                            <asp:BoundField DataField="status" HeaderText="状态" ReadOnly="True" SortExpression="status" />
                            <asp:TemplateField ShowHeader="False" HeaderText="操作">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btreserve" runat="server" CausesValidation="False" CommandArgument='<%# Eval("QR_code") %>' OnClick="btreserve_Click" Text="预约" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:dtcnn %>" SelectCommand="select '' QR_code,'' name,'' type,'' mname,'' publisher,'' author,'' publish_dt,'' lname,'' number,'' location,'' status"></asp:SqlDataSource>
    </form>
</body>
</html>

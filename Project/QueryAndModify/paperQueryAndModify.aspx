<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paperQueryAndModify.aspx.cs" Inherits="QueryAndModify_paperQueryAndModify" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 64px;
        }
        .auto-style2 {
            width: 150px;
        }
        .auto-style3 {
            width: 70px;
        }
        .auto-style4 {
            width: 100px;
        }
        .auto-style5 {
            width: 74px;
        }
        .auto-style6 {
            height: 20px;
        }
        .auto-style39 {
            width: 81px;
        }
        .auto-style40 {
            height: 20px;
            width: 81px;
        }
        .auto-style41 {
            width: 141px;
        }
        .auto-style42 {
            height: 20px;
            width: 141px;
        }
        .auto-style44 {
            height: 20px;
            width: 65px;
        }
        .auto-style45 {
            width: 65px;
        }
        .auto-style46 {
            width: 80px;
        }
        .auto-style47 {
            height: 20px;
            width: 80px;
        }
        .auto-style48 {
            width: 145px;
        }
        .auto-style49 {
            height: 20px;
            width: 145px;
        }
        .auto-style51 {
            height: 20px;
            width: 68px;
        }
        .auto-style52 {
            width: 68px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style1">
                    <asp:Label ID="Label1" runat="server" Text="论文名称"></asp:Label>
                </td>
                <td class="auto-style2">
                    <asp:TextBox ID="papername" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="Label56" runat="server" Text="论文类型"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="papertype" runat="server" DataSourceID="SqlDataSource1" DataTextField="ptname" DataValueField="ptname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style3">
                    <asp:Label ID="Label3" runat="server" Text="专业类型"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:DropDownList ID="majortype" runat="server" DataSourceID="SqlDataSource4" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td>
                    <asp:Button ID="query" runat="server" OnClick="query_Click" Text="查询" />
                </td>
            </tr>
            <tr>
                <td class="auto-style1">&nbsp;</td>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style4">&nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
                <td class="auto-style5">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="id" OnRowDeleting="GridView1_RowDeleting">
            <Columns>
                <asp:BoundField DataField="name" HeaderText="论文名称" SortExpression="name" />
                <asp:BoundField DataField="ptname" HeaderText="论文类型" SortExpression="ptname" />
                <asp:BoundField DataField="author" HeaderText="作者" SortExpression="author" />
                <asp:BoundField DataField="xuezhi" HeaderText="学制" SortExpression="xuezhi" />
                <asp:BoundField DataField="mname" HeaderText="专业类型" SortExpression="mname" />
                <asp:BoundField DataField="direction" HeaderText="研究方向" SortExpression="direction" />
                <asp:BoundField DataField="stock_dt" HeaderText="入库日期" SortExpression="stock_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="QR_code" HeaderText="二维码编码" SortExpression="QR_code" />
                <asp:BoundField DataField="location" HeaderText="存放位置" SortExpression="location" />
                <asp:BoundField DataField="status" HeaderText="库存状况" SortExpression="status" />
                <asp:BoundField DataField="adviser" HeaderText="指导老师" SortExpression="adviser" />
                <asp:BoundField DataField="zhicheng" HeaderText="职称" SortExpression="zhicheng" />
                <asp:BoundField DataField="dabian_dt" HeaderText="答辩日期" SortExpression="dabian_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="class_number" HeaderText="分类号" SortExpression="class_number" />
                <asp:BoundField DataField="shenhe" HeaderText="审核状态" SortExpression="shenhe" />
                <asp:BoundField DataField="write_dt" HeaderText="编著时间" SortExpression="write_dt" DataFormatString="{0:yyyy-MM-dd}" />
                <asp:BoundField DataField="lname" HeaderText="语言" SortExpression="lname" />
                <asp:BoundField DataField="format" HeaderText="开本" SortExpression="format" />
                <asp:BoundField DataField="number_of_page" HeaderText="页数" SortExpression="number_of_page" />
                <asp:BoundField DataField="number" HeaderText="库存数目" SortExpression="number" />
                <asp:BoundField DataField="note" HeaderText="备注" SortExpression="note" />
                <asp:BoundField DataField="id" HeaderText="ID" InsertVisible="False" ReadOnly="True" SortExpression="id" />
                <asp:TemplateField HeaderText="操作" ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" Text="编辑"></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [paper_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
        <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td class="auto-style39">
                    <asp:Label ID="Label37" runat="server" Text="论文名称"></asp:Label>
                </td>
                <td class="auto-style41">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="Label55" runat="server" Text="论文类型"></asp:Label>
                </td>
                <td class="auto-style46">
                    <asp:DropDownList ID="pt" runat="server" DataSourceID="SqlDataSource1" DataTextField="ptname" DataValueField="ptname" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style45">
                    <asp:Label ID="Label46" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style48">
                    <asp:TextBox ID="txtcn" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style52">
                    <asp:Label ID="Label52" runat="server" Text="指导教师"></asp:Label>
                </td>
                <td>
                    <asp:TextBox ID="txtadviser" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style40">
                    <asp:Label ID="Label38" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:Label ID="Label43" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:DropDownList ID="mj" runat="server" DataSourceID="SqlDataSource4" DataTextField="mname" DataValueField="mname" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style44">
                    <asp:Label ID="Label47" runat="server" Text="编著日期"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="txtwritedt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style51">
                    <asp:Label ID="Label53" runat="server" Text="职称"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:DropDownList ID="zhicheng" runat="server">
                        <asp:ListItem>讲师</asp:ListItem>
                        <asp:ListItem>副教授</asp:ListItem>
                        <asp:ListItem>教授</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style40">
                    <asp:Label ID="Label39" runat="server" Text="作者"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:Label ID="Label44" runat="server" Text="语言种类"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource3" DataTextField="lname" DataValueField="lname" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
                <td class="auto-style44">
                    <asp:Label ID="Label48" runat="server" Text="入库日期"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="txtstockdt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style51">
                    <asp:Label ID="Label54" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style6">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style40">
                    <asp:Label ID="Label40" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:Label ID="Label45" runat="server" Text="学制"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:DropDownList ID="xuezhi" runat="server" AutoPostBack="True">
                        <asp:ListItem>二年制</asp:ListItem>
                        <asp:ListItem>三年制</asp:ListItem>
                        <asp:ListItem>四年制</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style44">
                    <asp:Label ID="Label49" runat="server" Text="答辩日期"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="txtdabiandt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style51">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style6">&nbsp;</td>
                <td class="auto-style40">
                    <asp:Label ID="Label41" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:Label ID="Label51" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:Label ID="Label50" runat="server" Text="研究方向"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:TextBox ID="txtdirection" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style51">&nbsp;</td>
                <td class="auto-style6">
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" style="height: 21px" Text="保存" />
                </td>
            </tr>
            <tr>
                <td class="auto-style6"></td>
                <td class="auto-style40">
                    <asp:Label ID="Label57" runat="server" Text="库存状况"></asp:Label>
                </td>
                <td class="auto-style42">
                    <asp:DropDownList ID="status" runat="server">
                        <asp:ListItem>库存</asp:ListItem>
                        <asp:ListItem>借出</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style44">
                    <asp:Label ID="Label58" runat="server" Text="库存数目"></asp:Label>
                </td>
                <td class="auto-style47">
                    <asp:TextBox ID="txtnumber" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style44">
                    <asp:Label ID="Label59" runat="server" Text="审核状态"></asp:Label>
                </td>
                <td class="auto-style49">
                    <asp:DropDownList ID="shenhe" runat="server">
                        <asp:ListItem>待审核</asp:ListItem>
                        <asp:ListItem>已审核</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style51">&nbsp;</td>
                <td class="auto-style6">&nbsp;</td>
            </tr>
        </table>
    </form>
</body>
</html>

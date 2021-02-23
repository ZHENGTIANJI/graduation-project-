<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main_manager.aspx.cs" Inherits="首页" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
        <asp:Menu ID="Menu1" runat="server" BackColor="#B5C7DE" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#284E98" StaticSubMenuIndent="10px">
            <DynamicHoverStyle BackColor="#284E98" ForeColor="White" />
            <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
            <DynamicMenuStyle BackColor="#B5C7DE" />
            <DynamicSelectedStyle BackColor="#507CD1" />
            <Items>
                <asp:MenuItem Text="入库管理" Value="入库管理">
                    <asp:MenuItem NavigateUrl="~/stockmanagement/bookstock.aspx" Text="图书入库" Value="图书入库"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/journalstock.aspx" Text="期刊入库" Value="期刊入库"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/datastock.aspx" Text="资料入库" Value="资料入库"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/paperstock.aspx" Text="论文入库" Value="论文入库"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="信息查改" Value="信息查改">
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/bookQueryAndModify.aspx" Text="图书查改" Value="图书查改"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/journalQueryAndModify.aspx" Text="期刊查改" Value="期刊查改"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/dataQueryAndModify.aspx" Text="资料查改" Value="资料查改"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/QueryAndModify/paperQueryAndModify.aspx" Text="论文查改" Value="论文查改"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="剔旧" Value="剔旧">
                    <asp:MenuItem NavigateUrl="~/delete.aspx" Text="图书剔旧" Value="图书剔旧"></asp:MenuItem>
                </asp:MenuItem>
                <asp:MenuItem Text="统计分析" Value="统计分析">
                    <asp:MenuItem NavigateUrl="~/statistics/bookstatistics.aspx" Text="图书统计" Value="图书统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/statistics/journalstatistics.aspx" Text="期刊统计" Value="期刊统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/stockmanagement/datastock.aspx" Text="资料统计" Value="资料统计"></asp:MenuItem>
                    <asp:MenuItem NavigateUrl="~/statistics/paperstatistics.aspx" Text="论文统计" Value="论文统计"></asp:MenuItem>
                </asp:MenuItem>
            </Items>
            <StaticHoverStyle BackColor="#284E98" ForeColor="White" />
            <StaticMenuItemStyle Font-Size="Large" HorizontalPadding="5px" VerticalPadding="2px" />
            <StaticSelectedStyle BackColor="#507CD1" />
        </asp:Menu>
    </form>
</body>
</html>

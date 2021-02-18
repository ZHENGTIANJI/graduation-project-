<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paperstock.aspx.cs" Inherits="stockmanagement_paperstock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style2 {
            width: 80px;
            height: 20px;
            text-align: right;
        }
        .auto-style6 {
            width: 64px;
            height: 20px;
        }
        .auto-style8 {
            height: 20px;
            width: 140px;
        }
        .auto-style10 {
            height: 20px;
            width: 135px;
        }
        .auto-style12 {
            width: 60px;
            height: 20px;
        }
        .auto-style3 {
            height: 20px;
        }
        .auto-style1 {
            width: 80px;
            text-align: right;
        }
        .auto-style7 {
            width: 64px;
            text-align: left;
        }
        .auto-style9 {
            width: 140px;
        }
        .auto-style11 {
            width: 135px;
        }
        .auto-style13 {
            width: 60px;
        }
        .auto-style14 {
            width: 260px;
            height: 20px;
        }
        .auto-style15 {
            width: 260px;
        }
        .auto-style16 {
            height: 20px;
            width: 222px;
        }
        .auto-style17 {
            width: 222px;
        }
        .auto-style18 {
            width: 64px;
            height: 20px;
            text-align: right;
        }
        .auto-style19 {
            width: 64px;
            text-align: right;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <table style="width:100%;">
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>
                    <h1 style="text-align: center">
                        <asp:Label ID="Label17" runat="server" Text="学院资料室论文入库管理"></asp:Label>
                    </h1>
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
    <div>
    
    </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style14">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label41" runat="server" Text="二维码编码"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtQR" runat="server"></asp:TextBox>
                    <asp:Button ID="scan" runat="server" OnClick="scan_Click" Text="扫描" />
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label3" runat="server" Text="论文类别"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:DropDownList ID="papertype" runat="server" DataSourceID="SqlDataSource1" DataTextField="ptname" DataValueField="ptname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="Label12" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label37" runat="server" Text="论文名称"></asp:Label>
                </td>
                <td class="auto-style16">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    <asp:Label ID="Label11" runat="server" Text="编著日期"></asp:Label>
                </td>
                <td class="auto-style8">
                    <asp:TextBox ID="txtwritedt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="Label10" runat="server" Text="学制"></asp:Label>
                </td>
                <td class="auto-style10">
                    <asp:DropDownList ID="xuezhi" runat="server">
                        <asp:ListItem>四年制</asp:ListItem>
                        <asp:ListItem>三年制</asp:ListItem>
                        <asp:ListItem>二年制</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
                <td class="auto-style12">
                    &nbsp;</td>
                <td class="auto-style3">&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label16" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label7" runat="server" Text="入库日期"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtstockdt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label9" runat="server" Text="存放位置"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtlocation" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label5" runat="server" Text="作者"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtauthor" runat="server" style="margin-right: 3px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label6" runat="server" Text="答辩日期"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtdabiandt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label38" runat="server" Text="指导教师"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtadviser" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style13">
                    &nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtformat" runat="server" Width="140px"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label15" runat="server" Text="研究方向"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:TextBox ID="txtdirection" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label39" runat="server" Text="职称"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:DropDownList ID="zhicheng" runat="server">
                        <asp:ListItem>讲师</asp:ListItem>
                        <asp:ListItem>副教授</asp:ListItem>
                        <asp:ListItem>教授</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style7">&nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label42" runat="server" Text="分类号"></asp:Label>
                </td>
                <td class="auto-style17">
                    <asp:TextBox ID="txtcn" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Label ID="Label40" runat="server" Text="语言种类"></asp:Label>
                </td>
                <td class="auto-style9">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource3" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label8" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style11">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    <asp:Button ID="btok" runat="server" OnClick="btok_Click" Text="保存" />
                </td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    &nbsp;</td>
                <td class="auto-style17">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style9">
                    &nbsp;</td>
                <td class="auto-style19">
                    &nbsp;</td>
                <td class="auto-style11">
                    &nbsp;</td>
                <td class="auto-style7">
                    &nbsp;</td>
                <td class="auto-style13">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [paper_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
    </form>
</body>
</html>

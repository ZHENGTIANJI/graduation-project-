<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paperupload.aspx.cs" Inherits="stockmanagement_paperupload" %>

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
        .auto-style4 {
            height: 20px;
            width: 115px;
        }
        .auto-style6 {
            width: 64px;
            height: 20px;
        }
        .auto-style1 {
            width: 80px;
            text-align: right;
        }
        .auto-style5 {
            width: 115px;
        }
        .auto-style7 {
            width: 64px;
        }
        .auto-style14 {
            width: 158px;
            height: 20px;
        }
        .auto-style15 {
            width: 158px;
        }
        .auto-style16 {
            width: 87px;
            text-align: right;
        }
        .auto-style17 {
            width: 87px;
            height: 20px;
            text-align: right;
        }
        .auto-style18 {
            width: 85px;
            height: 20px;
            text-align: right;
        }
        .auto-style19 {
            width: 85px;
            text-align: right;
        }
        .auto-style20 {
            width: 191px;
            height: 20px;
        }
        .auto-style21 {
            width: 191px;
        }

        .auto-style22 {
            height: 46px;
        }
        .auto-style23 {
            width: 309px;
        }
        .auto-style24 {
            height: 20px;
            width: 100px;
        }
        .auto-style25 {
            width: 100px;
        }
        .table-a table{border-bottom:1px solid black;border-top:1px solid black;}
        .table-b table td{border:1px solid black}
        .table-d table{ background:black} 
.table-d table td{ background:#FFF}
        .table-c table{border-right:1px solid #F00;border-bottom:1px solid #F00} 
.table-c table td{border-left:1px solid #F00;border-top:1px solid #F00}
                ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
            height: 80px;
        }
                li {
  float: left;
}
                ri {
  float: right;
}
        .auto-style26 {
            font-size: xx-large;
            color:white;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <ul>
            <div style="float:left; width:20%; height:100px; "></div>
            <div style="float:left; width:60%; height:200px; ">
                <div style=" margin:0px auto; height:20px; "></div>
            <li>
                <span class="auto-style26">矿业学院档案管理系统</span>
            </li>
            </div>
            <div style="float:left; width:20%; height:100px; ">
                <ri>
                <asp:Label ID="Label100" runat="server" ForeColor="White" Font-Size="Medium"></asp:Label>
            </ri>
            </div>

            
            
        </ul>
            
        <table style="width:100%;">
            <tr>
                <td class="auto-style22" style="text-align: center">
                    <h1>
                        <asp:Label ID="Label21" runat="server" Text="论文上传"></asp:Label>
                    </h1>
                </td>
            </tr>
        </table>
        <div class="table-a">
                    <table style="width:100%;" border="0" >
            <tr>
                <td class="auto-style14">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label3" runat="server" Text="论文类别"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:DropDownList ID="papertype" runat="server" DataSourceID="SqlDataSource1" DataTextField="ptname" DataValueField="ptname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style17">
                    <asp:Label ID="Label12" runat="server" Text="专业"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:DropDownList ID="major" runat="server" DataSourceID="SqlDataSource2" DataTextField="mname" DataValueField="mname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="Label17" runat="server" Text="语言种类"></asp:Label>
                </td>
                <td class="auto-style24">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource3" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style14">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label20" runat="server" Text="论文名称"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style17">
                    <asp:Label ID="Label11" runat="server" Text="编著日期"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:TextBox ID="write_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label25" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="write_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label26" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="write_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label27" runat="server" Text="日"></asp:Label>
                </td>
                <td class="auto-style18">
                    <asp:Label ID="Label10" runat="server" Text="学制"></asp:Label>
                </td>
                <td class="auto-style24">
                    <asp:DropDownList ID="xuezhi" runat="server">
                        <asp:ListItem>四年制</asp:ListItem>
                        <asp:ListItem>三年制</asp:ListItem>
                        <asp:ListItem>二年制</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label4" runat="server" Text="编著单位"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txt" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label6" runat="server" Text="答辩日期"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="db_year" runat="server" Width="40px"></asp:TextBox>
                    <asp:Label ID="Label28" runat="server" Text="年"></asp:Label>
                    <asp:TextBox ID="db_month" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label29" runat="server" Text="月"></asp:Label>
                    <asp:TextBox ID="db_day" runat="server" Width="16px"></asp:TextBox>
                    <asp:Label ID="Label30" runat="server" Text="日"></asp:Label>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label18" runat="server" Text="指导教师"></asp:Label>
                </td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtadviser" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label5" runat="server" Text="作者"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtauthor" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label15" runat="server" Text="研究方向"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtdirection" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label19" runat="server" Text="职称"></asp:Label>
                </td>
                <td class="auto-style25">
                    <asp:DropDownList ID="zhicheng" runat="server">
                        <asp:ListItem>讲师</asp:ListItem>
                        <asp:ListItem>副教授</asp:ListItem>
                        <asp:ListItem>教授</asp:ListItem>
                    </asp:DropDownList>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style1">
                    <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style16">
                    <asp:Label ID="Label16" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label8" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            </table>
        </div>
        <table style="width:100%;">
            <tr>
                <td class="auto-style23">
                    &nbsp;</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" />
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style23">&nbsp;</td>
                <td style="text-align: center">
                    <asp:Button ID="upload" runat="server" OnClick="upload_Click" Text="提交" OnClientClick="return confirm('只允许提交一次，确定提交吗?')" Height="27px" Width="104px"/>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        <br />
        <br />
        <br />
        <br />
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [paper_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
    </form>
</body>
</html>

<%@ Page Language="C#" AutoEventWireup="true" CodeFile="paperupload.aspx.cs" Inherits="首页" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style>
        ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
  overflow: hidden;
  background-color: #333;
            height: 55px;
        }
 .banner {
	overflow: hidden;
	height: 200px;
	background: url(/Arcs/imgs/上传.png) no-repeat;
	background-size: 100% 200px;
}
 .table-a table{border-bottom:1px solid black;border-top:1px solid black;}
li {
  float: left;
}

li a, .dropbtn {
  display: inline-block;
  color: white;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
}

li a:hover, .dropdown:hover .dropbtn {
  background-color: red;
}

li.dropdown {
  display: inline-block;
}

.dropdown-content {
  display: none;
  position: absolute;
  background-color: #f9f9f9;
  min-width: 160px;
  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.2);
  z-index: 1;
}

.dropdown-content a {
  color: black;
  padding: 12px 16px;
  text-decoration: none;
  display: block;
  text-align: left;
}
ri{
    float:right;
}
.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
  display: block;
}
        .auto-style1 {
            font-size: xx-large;
        }
        .auto-style2 {
            text-align: right;
        }
        .auto-style15 {
            text-align: right;
        }
        .auto-style18 {
            text-align: right;
        }
        .auto-style19 {
            text-align: right;
        }
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
    
    <div style=" margin:0px auto; width:100%;">
    <div style=" float:left; width:15%; height:700px;background-color:ButtonFace"></div>
        <div style=" float:left; width:70%; height:300px;">
        <div class="banner">

        </div>
        <div style=" margin:0px auto;width:100%; height:20px;">
        </div>
        <div style=" margin:0px auto;width:100%; height:150px;">
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
                <td class="auto-style2">
                    <asp:Label ID="Label17" runat="server" Text="语言种类"></asp:Label>
                </td>
                <td class="auto-style20">
                    <asp:DropDownList ID="language" runat="server" DataSourceID="SqlDataSource3" DataTextField="lname" DataValueField="lname">
                    </asp:DropDownList>
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
                <td class="auto-style14">
                    &nbsp;</td>
                <td class="auto-style2">
                    <asp:Label ID="Label20" runat="server" Text="论文名称"></asp:Label>
                </td>
                <td class="auto-style4">
                    <asp:TextBox ID="txtname" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
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
                    <asp:Label ID="Label18" runat="server" Text="指导教师"></asp:Label>
                </td>
                <td class="auto-style24">
                    <asp:TextBox ID="txtadviser" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style6">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style15">
                    <asp:Label ID="Label15" runat="server" Text="研究方向"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtdirection" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
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
                <td class="auto-style15">
                    <asp:Label ID="Label13" runat="server" Text="开本"></asp:Label>
                </td>
                <td class="auto-style5">
                    <asp:TextBox ID="txtformat" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label16" runat="server" Text="页数"></asp:Label>
                </td>
                <td class="auto-style21">
                    <asp:TextBox ID="txtnumberofpage" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style19">
                    <asp:Label ID="Label31" runat="server" Text="备注"></asp:Label>
                </td>
                <td class="auto-style25">
                    <asp:TextBox ID="txtnote" runat="server"></asp:TextBox>
                </td>
                <td class="auto-style7">
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style15">
                    &nbsp;</td>
                <td class="auto-style5">
                    &nbsp;</td>
                <td class="auto-style2">
                    &nbsp;</td>
                <td class="auto-style21">
                    &nbsp;</td>
                <td class="auto-style19">
                    &nbsp;</td>
                <td class="auto-style25">
                    &nbsp;</td>
                <td class="auto-style7">&nbsp;</td>
            </tr>
            </table>
        </div>
        </div>
            <div style="margin:auto 0px;height:30px">
                &nbsp;&nbsp;<asp:FileUpload ID="FileUpload1" runat="server" />
                <asp:LinkButton ID="LinkButton1" runat="server" Font-Size="Medium" ForeColor="Black" OnClick="LinkButton1_Click"></asp:LinkButton>
            </div>
            <div style="margin:auto 0px;height:30px;font-size:small">
                &nbsp;&nbsp;<asp:Label ID="Label1" runat="server" Text="只允许上传PDF(限制50MB以内)"></asp:Label>
                </div>
        <div style=" margin:0px auto; width:100%; height:30px;">
            <table style="width:100%;">
            <tr>
                <td class="auto-style23">
                    &nbsp;</td>
                <td>
                    
                </td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td class="auto-style23">&nbsp;</td>
                <td style="text-align: center">
                    <asp:Button ID="upload" runat="server" OnClick="upload_Click" Text="上传" OnClientClick="return confirm('只允许提交一次，确定提交吗?')" Height="27px" Width="104px"/>
                </td>
                <td>&nbsp;</td>
            </tr>
        </table>
        </div>
           </div> 
        <div style=" float:right; width:15%;height:700px;background-color:ButtonFace"></div>

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [paper_type]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [major]"></asp:SqlDataSource>
        <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:档案室信息管理系统ConnectionString %>" SelectCommand="SELECT * FROM [language]"></asp:SqlDataSource>
        </div>
        
 </form>

</body>
</html>

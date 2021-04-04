<%@ Page Language="C#" AutoEventWireup="true" CodeFile="main_manager.aspx.cs" Inherits="首页" %>

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
	height: 320px;
	background: url(/imgs/图书馆.jfif) no-repeat;
	background-size: 100% 320px;
}
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
    </style>
</head>
<body>
    
    <form id="form1" runat="server">
    
    <div style=" margin:0px auto;width:100%; height:20px;background-color:aliceblue">
        <div style=" float:right; width:10%; height:20px;">      
             <asp:Label ID="user" runat="server" Font-Size="Medium"></asp:Label></div>
    </div>
    <div style=" margin:0px auto; height:100px;background-color:white">
        <div style=" float:left; width:10%;height:100px;"></div>
        <div style=" float:left; width:20%;height:100px;">
            <img width="125" height="98" src="imgs/CUMT.jpg" />
            <img width="100" height="100" src="imgs/\矿院.png" />
        </div>
        <div style=" float:right; width:70%;height:70px;">
            <h1 class="auto-style1">矿业学院档案管理系统</h1>
        </div> 
    </div>
        <div style=" margin:0px auto; height:20px;"></div>
    <div style=" margin:0px auto; width:100%;">
    <div style=" float:left; width:15%; height:700px;background-color:ButtonFace"></div>
        <div style=" float:left; width:70%; height:300px;">
                <div style=" margin:0px auto; height:55px;">
   <ul>
  <li><a href="/main_manager.aspx">首页</a></li>
  <li class="dropdown">
      <a href="javascript:void(0)" class="dropbtn">入库管理</a>
      <div class="dropdown-content">
      <a href="stockmanagement/bookstock.aspx">图书入库</a>
      <a href="stockmanagement/datastock.aspx">资料入库</a>
      <a href="stockmanagement/journalstock.aspx">期刊入库</a>
      <a href="stockmanagement/paperstock.aspx">论文入库</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">资料查改</a>
    <div class="dropdown-content">
      <a href="QueryAndModify/bookQueryAndModify.aspx">图书查改</a>
      <a href="QueryAndModify/journalQueryAndModify.aspx">期刊查改</a>
      <a href="QueryAndModify/dataQueryAndModify.aspx">资料查改</a>
      <a href="QueryAndModify/paperQueryAndModify.aspx">论文查改</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">统计分析</a>
    <div class="dropdown-content">
      <a href="statistics/bookstatistics.aspx">图书统计</a>
      <a href="statistics/journalstatistics.aspx">期刊统计</a>
      <a href="statistics/datastatistics.aspx">资料统计</a>
      <a href="statistics/paperstatistics.aspx">论文统计</a>
    </div>
  </li>
  <li class="dropdown">
    <a href="javascript:void(0)" class="dropbtn">剔旧管理</a>
    <div class="dropdown-content">
      <a href="delete/bookdelete.aspx">图书剔旧</a>
      <a href="delete/journaldelete.aspx">期刊剔旧</a>
      <a href="delete/datadelete.aspx">资料剔旧</a>
      <a href="delete/paperdelete.aspx">论文剔旧</a>
    </div>
  </li>
</ul>
</div>
            <div class="banner">

</div>
        <div style=" margin:0px auto;width:100%; height:20px;"></div>
        <div style=" margin:0px auto;width:100%; height:130px;">
            <div style=" margin:0px auto;width:100%; height:30px;background-color:whitesmoke">
                常用功能
            </div>
            
            <div style=" float:left; width:25%; height:100px;">
                <div style=" float:left; width:35%; height:100px;"></div>
                <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/imgs/入库.png" OnClick="ImageButton1_Click1"/>

            </div>
            <div style=" float:left; width:25%; height:100px; ">
                <div style=" float:left; width:35%; height:100px;"></div>
                <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="~/imgs/搜索.png" OnClick="ImageButton2_Click1"/>
            </div>
            <div style=" float:left; width:25%; height:100px; ">
                <div style=" float:left; width:35%; height:100px;"></div>
                <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="~/imgs/删除.png" OnClick="ImageButton3_Click1"/>
            </div>
            <div style=" float:left; width:25%; height:100px; ">
                <div style=" float:left; width:35%; height:100px;"></div>
                <asp:ImageButton ID="ImageButton4" runat="server" ImageUrl="~/imgs/统计.png" OnClick="ImageButton4_Click"/>
            </div>
        </div>
        <div style=" float:left; width:25%; height:20px;">
                <div style=" float:left; width:40%; height:20px;"></div>
            论文入库
            </div>
            <div style=" float:left; width:25%; height:20px; ">
                <div style=" float:left; width:40%; height:20px;"></div>
                论文查改
            </div>
            <div style=" float:left; width:25%; height:20px; ">
                <div style=" float:left; width:40%; height:20px;"></div>
                资料剔旧
            </div>
            <div style=" float:left; width:25%; height:20px; ">
                <div style=" float:left; width:40%; height:20px;"></div>
                图书统计
            </div>
        </div>

        <div style=" float:right; width:15%;height:700px;background-color:ButtonFace"></div>
    </div>

        


<p></p>

    </form>

</body>
</html>

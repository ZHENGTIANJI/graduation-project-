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

.dropdown-content a:hover {background-color: #f1f1f1;}

.dropdown:hover .dropdown-content {
  display: block;
}
</style>
</head>
<body>
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
    <li><a href="/delete.aspx">剔旧</a></li>
</ul>

<h1>矿业学院档案室信息管理系统</h1>

<p></p>

</body>
</html>
